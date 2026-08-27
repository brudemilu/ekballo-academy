// =============================================================
// EKBALLO ACADEMY · Cliente da API externa de Bíblia (bolls.life)
// Usado pelas versões que NÃO estão populadas no banco local
// (NAA, NVT, NVI, ARA, ARC). A sigla externa fica em
// biblia_versoes.fonte_api_sigla.
//
// AVISO: bolls.life redistribui texto sem licença explícita das
// editoras. Decisão de risco assumida pelo dono do projeto.
// =============================================================

import type { BibliaVersiculo } from "@/lib/biblia";

const API_BASE = "https://bolls.life";

// Remove tags HTML (que bolls retorna no campo `text` — <sup>, <br>, <b>, etc)
// e entidades comuns. Preserva texto puro pra render no leitor + gerador OG.
function stripHtml(s: string): string {
  return s
    .replace(/<sup[^>]*>.*?<\/sup>/gi, "")
    .replace(/<i[^>]*>(.*?)<\/i>/gi, "$1")
    .replace(/<b[^>]*>(.*?)<\/b>/gi, "$1")
    .replace(/<em[^>]*>(.*?)<\/em>/gi, "$1")
    .replace(/<strong[^>]*>(.*?)<\/strong>/gi, "$1")
    .replace(/<br\s*\/?>/gi, " ")
    .replace(/<[^>]+>/g, "")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .replace(/\s+/g, " ")
    .trim();
}

type BollsVerse = {
  pk?: number;
  verse?: number;
  text?: string;
  comment?: string;
};

export async function fetchCapituloViaApi(
  siglaBolls: string,
  livroId: number,
  capitulo: number
): Promise<BibliaVersiculo[]> {
  const url = `${API_BASE}/get-text/${encodeURIComponent(siglaBolls)}/${livroId}/${capitulo}/`;
  const resp = await fetch(url, {
    // Cache em CDN do Vercel por 24h — biblia não muda, e isso reduz hit em bolls.
    next: { revalidate: 60 * 60 * 24 },
  });
  if (!resp.ok) {
    console.error(`bolls API erro ${resp.status}`, url);
    return [];
  }
  const data = (await resp.json()) as BollsVerse[];
  if (!Array.isArray(data)) return [];
  return data
    .map((v) => ({
      livro_id: livroId,
      capitulo,
      versiculo: v.verse ?? 0,
      texto: stripHtml(v.text || ""),
    }))
    .filter((v) => v.versiculo > 0 && v.texto.length > 0)
    .sort((a, b) => a.versiculo - b.versiculo);
}

// ---- Busca por palavra nas versões que não estão no banco ----
// A mesma fonte que serve os capítulos também procura texto
// (`/find/{sigla}/?search=`). Consulta sob demanda: nada do texto dessas
// traduções é copiado para o nosso banco — só a ACF (domínio público) mora
// aqui. É o mesmo padrão de uso já adotado pelo leitor.
type BollsAchado = {
  pk?: number;
  translation?: string;
  book?: number;
  chapter?: number;
  verse?: number;
  text?: string;
};

export async function buscarViaApi(
  siglaBolls: string,
  termo: string,
  limite = 40,
): Promise<{ livro_id: number; capitulo: number; versiculo: number; texto: string }[]> {
  const url = `${API_BASE}/find/${encodeURIComponent(siglaBolls)}/?search=${encodeURIComponent(termo)}`;
  try {
    const resp = await fetch(url, {
      // Mesma busca repetida (o discípulo digitando devagar) não precisa
      // bater na fonte toda vez.
      next: { revalidate: 60 * 60 * 6 },
      signal: AbortSignal.timeout(8000),
    });
    if (!resp.ok) {
      console.error(`bolls busca erro ${resp.status}`, url);
      return [];
    }
    const data = (await resp.json()) as BollsAchado[];
    if (!Array.isArray(data)) return [];
    return data
      .map((v) => ({
        livro_id: v.book ?? 0,
        capitulo: v.chapter ?? 0,
        versiculo: v.verse ?? 0,
        texto: stripHtml(v.text || ""),
      }))
      .filter((v) => v.livro_id > 0 && v.capitulo > 0 && v.versiculo > 0 && v.texto)
      .slice(0, limite);
  } catch (e) {
    // Fonte fora do ar ou lenta: a busca devolve vazio, não derruba a página.
    console.error("bolls busca falhou:", (e as Error).message);
    return [];
  }
}
