// =============================================================
// EKBALLO ACADEMY · Busca na Bíblia (por palavra ou por referência)
//
// Duas formas de procurar, no mesmo campo — porque é assim que a pessoa
// pensa: às vezes lembra a referência ("jo 3:16"), às vezes só a frase.
// O que decide é o formato do que foi digitado.
// =============================================================

import { createClient } from "@/lib/supabase/server";
import { isMockMode } from "@/lib/mock-data";
import {
  listLivros,
  getVersiculos,
  getCapitulo,
  VERSAO_PADRAO,
  type BibliaLivro,
} from "@/lib/biblia";

export type AchadoBiblia = {
  livro_id: number;
  livro_nome: string;
  livro_abrev: string;
  capitulo: number;
  versiculo: number;
  texto: string;
};

export type ResultadoBusca = {
  tipo: "referencia" | "texto" | "vazio";
  versao: string;
  achados: AchadoBiblia[];
  /** Referência já formatada, quando a busca foi por referência. */
  referencia?: string;
};

// Tira acento e caixa para comparar "João" com "joao".
function normalizar(txt: string): string {
  return txt
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/\./g, "")
    .replace(/\s+/g, " ")
    .trim();
}

// "1co 13:4-7" → { livro: "1co", capitulo: 13, de: 4, ate: 7 }
// Aceita "jo3:16", "salmos 23", "1 João 4:8", "gn 1.1".
const RE_REFERENCIA =
  /^\s*(\d\s*)?([a-zà-úA-ZÀ-Ú][a-zà-úA-ZÀ-Ú\s.]*?)\s*(\d{1,3})(?:\s*[:.,]\s*(\d{1,3})(?:\s*[-–]\s*(\d{1,3}))?)?\s*$/;

export type Referencia = {
  livro: BibliaLivro;
  capitulo: number;
  de?: number;
  ate?: number;
};

/**
 * Tenta ler o termo como referência bíblica. Devolve null quando o texto não
 * tem cara de referência (aí a busca vira full-text).
 */
export function lerReferencia(termo: string, livros: BibliaLivro[]): Referencia | null {
  const m = RE_REFERENCIA.exec(termo);
  if (!m) return null;

  const prefixo = (m[1] || "").trim();
  const nomeBruto = normalizar(`${prefixo} ${m[2]}`);
  const capitulo = Number(m[3]);
  const de = m[4] ? Number(m[4]) : undefined;
  const ate = m[5] ? Number(m[5]) : undefined;
  if (!nomeBruto || !Number.isFinite(capitulo) || capitulo < 1) return null;

  // Casa por abreviação exata, nome exato e, por último, começo do nome —
  // nessa ordem, senão "jo" acharia "Jonas" antes de "João".
  const alvo = nomeBruto;
  const porAbrev = livros.find((l) => normalizar(l.abrev) === alvo);
  const porNome = livros.find((l) => normalizar(l.nome) === alvo);
  const porInicio = livros
    .filter((l) => normalizar(l.nome).startsWith(alvo))
    .sort((a, b) => a.nome.length - b.nome.length)[0];

  const livro = porAbrev ?? porNome ?? porInicio;
  if (!livro) return null;
  if (livro.capitulos_total && capitulo > livro.capitulos_total) return null;

  return { livro, capitulo, de, ate };
}

/** Formata "João 3:16" / "Salmos 23" / "1 Coríntios 13:4-7". */
export function formatarReferencia(ref: Referencia): string {
  const base = `${ref.livro.nome} ${ref.capitulo}`;
  if (!ref.de) return base;
  return ref.ate && ref.ate > ref.de
    ? `${base}:${ref.de}-${ref.ate}`
    : `${base}:${ref.de}`;
}

// No modo demonstração o banco tem só três capítulos; a busca textual varre
// esses mesmos capítulos para a tela continuar navegável em dev.
const CAPITULOS_MOCK: [number, number][] = [
  [1, 1],   // Gênesis 1
  [19, 23], // Salmos 23
  [45, 1],  // Romanos 1
];

async function buscarTextoMock(termo: string, versao: string): Promise<AchadoBiblia[]> {
  const livros = await listLivros();
  const alvo = normalizar(termo);
  const achados: AchadoBiblia[] = [];
  for (const [livroId, cap] of CAPITULOS_MOCK) {
    try {
      const versiculos = await getCapitulo(livroId, cap, versao);
      const livro = livros.find((l) => l.id === livroId);
      for (const v of versiculos) {
        if (!normalizar(v.texto).includes(alvo)) continue;
        achados.push({
          livro_id: v.livro_id,
          livro_nome: livro?.nome ?? `Livro ${v.livro_id}`,
          livro_abrev: livro?.abrev ?? "",
          capitulo: v.capitulo,
          versiculo: v.versiculo,
          texto: v.texto,
        });
      }
    } catch {
      // capítulo ausente no mock: ignora
    }
  }
  return achados.slice(0, 40);
}

/**
 * Busca principal. Primeiro tenta ler o termo como referência; não sendo,
 * cai na busca full-text (função `buscar_biblia`, migration 232).
 */
export async function buscarNaBiblia(
  termo: string,
  versao: string = VERSAO_PADRAO,
  limite = 40,
): Promise<ResultadoBusca> {
  const limpo = termo.trim();
  if (limpo.length < 2) return { tipo: "vazio", versao, achados: [] };

  const livros = await listLivros();

  // ---- 1) Referência ("jo 3:16", "salmos 23") ----
  const ref = lerReferencia(limpo, livros);
  if (ref) {
    const achados: AchadoBiblia[] = [];
    if (ref.de) {
      const ate = ref.ate && ref.ate >= ref.de ? Math.min(ref.ate, ref.de + 30) : ref.de;
      const alvos = [];
      for (let v = ref.de; v <= ate; v++) {
        alvos.push({ livro_id: ref.livro.id, capitulo: ref.capitulo, versiculo: v });
      }
      const versiculos = await getVersiculos(alvos, versao);
      achados.push(
        ...versiculos.map((v) => ({
          livro_id: v.livro_id,
          livro_nome: ref.livro.nome,
          livro_abrev: ref.livro.abrev,
          capitulo: v.capitulo,
          versiculo: v.versiculo,
          texto: v.texto,
        })),
      );
    } else {
      // Referência só com capítulo: devolve o capítulo inteiro (limitado).
      const versiculos = await getCapitulo(ref.livro.id, ref.capitulo, versao);
      achados.push(
        ...versiculos.slice(0, limite).map((v) => ({
          livro_id: v.livro_id,
          livro_nome: ref.livro.nome,
          livro_abrev: ref.livro.abrev,
          capitulo: v.capitulo,
          versiculo: v.versiculo,
          texto: v.texto,
        })),
      );
    }

    if (achados.length > 0) {
      return {
        tipo: "referencia",
        versao,
        achados,
        referencia: formatarReferencia(ref),
      };
    }
    // Referência sem resultado (versão não tem o trecho): tenta como texto.
  }

  // ---- 2) Palavra ou frase ----
  if (isMockMode()) {
    return { tipo: "texto", versao, achados: await buscarTextoMock(limpo, versao) };
  }

  const supabase = await createClient();
  const { data, error } = await supabase.rpc("buscar_biblia", {
    termo: limpo,
    p_versao: versao,
    limite,
  });
  if (error) {
    console.error("[biblia-busca] buscar_biblia:", error.message);
    return { tipo: "texto", versao, achados: [] };
  }
  return { tipo: "texto", versao, achados: (data || []) as AchadoBiblia[] };
}
