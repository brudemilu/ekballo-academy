/**
 * Dicionário de leitura: significado + sinônimos da palavra que o discípulo
 * selecionou no texto da mesa.
 *
 * Não existe API de dicionário PT-BR gratuita e confiável o bastante (as boas
 * são pagas e as gratuitas não entendem o SENTIDO no contexto). Como a
 * plataforma já fala com um LLM grátis (Groq → Cloudflare, lib/llm.ts), o
 * verbete sai de lá: além da definição de dicionário, o modelo devolve o
 * sentido daquela palavra NAQUELE trecho — que é o que ajuda quem lê.
 *
 * Cache em memória do processo: a mesma palavra no mesmo parágrafo não gasta
 * uma segunda chamada (o discípulo costuma reabrir a mesma palavra).
 */

import { chamarLLM } from "./llm";
import type { Verbete } from "./dicionario-comum";

export { selecaoConsultavel, MAX_PALAVRAS, MAX_CARACTERES } from "./dicionario-comum";
export type { Verbete } from "./dicionario-comum";

// ---------- cache ----------

type Entrada = { verbete: Verbete; em: number };
const CACHE = new Map<string, Entrada>();
const CACHE_MAX = 500;
const CACHE_TTL = 1000 * 60 * 60 * 24 * 7; // 7 dias

function hash(s: string): string {
  let h = 5381;
  for (let i = 0; i < s.length; i++) h = ((h << 5) + h + s.charCodeAt(i)) | 0;
  return (h >>> 0).toString(36);
}

/**
 * Chave = palavra + trecho. O sentido depende do contexto, então cachear só
 * pela palavra devolveria a explicação de outra passagem.
 */
function chave(palavra: string, contexto: string): string {
  return `${palavra.trim().toLowerCase()}|${hash(contexto.trim().toLowerCase())}`;
}

function doCache(k: string): Verbete | null {
  const e = CACHE.get(k);
  if (!e) return null;
  if (Date.now() - e.em > CACHE_TTL) {
    CACHE.delete(k);
    return null;
  }
  return e.verbete;
}

function paraCache(k: string, verbete: Verbete) {
  if (CACHE.size >= CACHE_MAX) {
    // descarta o mais antigo (Map mantém ordem de inserção)
    const primeira = CACHE.keys().next();
    if (!primeira.done) CACHE.delete(primeira.value);
  }
  CACHE.set(k, { verbete, em: Date.now() });
}

// ---------- LLM ----------

const SYSTEM = `Você é um dicionário de português do Brasil dentro de um app de leitura cristã.
Recebe uma PALAVRA (ou expressão curta) e a FRASE do livro em que ela aparece.

Regras:
- "significado": definição de dicionário, 1 frase curta, linguagem simples, SEM repetir a própria palavra na definição.
- "sinonimos": de 2 a 5 palavras em português do Brasil que caibam no lugar dela. Lista vazia se não houver sinônimo natural.
- "classe": classe gramatical em português ("substantivo masculino", "verbo", "adjetivo", "expressão"…). String vazia se não der pra dizer.
- "no_texto": em 1 frase, o sentido que a palavra tem NAQUELA frase do livro. Só isso — não comente o livro, não pregue, não faça aplicação devocional.
- Se a palavra estiver flexionada, explique a forma do dicionário mas responda pelo sentido usado na frase.
- Nunca invente: se não conhecer a palavra, devolva significado "" e sinonimos [].

Responda SOMENTE com JSON válido, sem cercas de código, neste formato:
{"classe":"...","significado":"...","sinonimos":["...","..."],"no_texto":"..."}`;

function extrairJSON(txt: string): unknown {
  const semFence = txt.replace(/```json/gi, "").replace(/```/g, "");
  const ini = semFence.indexOf("{");
  const fim = semFence.lastIndexOf("}");
  if (ini === -1 || fim === -1 || fim < ini) throw new Error("sem JSON na resposta");
  return JSON.parse(semFence.slice(ini, fim + 1));
}

function textoLimpo(v: unknown, max: number): string {
  return typeof v === "string" ? v.trim().replace(/\s+/g, " ").slice(0, max) : "";
}

export async function consultarVerbete(palavraRaw: string, contextoRaw = ""): Promise<Verbete> {
  const palavra = palavraRaw.trim().replace(/\s+/g, " ");
  const contexto = contextoRaw.trim().replace(/\s+/g, " ").slice(0, 400);
  const k = chave(palavra, contexto);

  const cacheado = doCache(k);
  if (cacheado) return cacheado;

  const user = contexto
    ? `PALAVRA: ${palavra}\nFRASE DO LIVRO: ${contexto}`
    : `PALAVRA: ${palavra}\n(sem contexto: devolva "no_texto" vazio)`;

  const bruto = await chamarLLM(SYSTEM, user, 400);
  const p = extrairJSON(bruto) as {
    classe?: unknown;
    significado?: unknown;
    sinonimos?: unknown;
    no_texto?: unknown;
  };

  const sinonimos = (Array.isArray(p.sinonimos) ? p.sinonimos : [])
    .map((s) => textoLimpo(s, 40))
    .filter((s) => s && s.toLowerCase() !== palavra.toLowerCase())
    .slice(0, 5);

  const noTexto = textoLimpo(p.no_texto, 300);
  const verbete: Verbete = {
    palavra,
    classe: textoLimpo(p.classe, 40),
    significado: textoLimpo(p.significado, 300),
    sinonimos,
    noTexto: contexto && noTexto ? noTexto : null,
  };

  if (verbete.significado || verbete.sinonimos.length) paraCache(k, verbete);
  return verbete;
}
