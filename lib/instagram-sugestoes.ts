/**
 * O "cérebro" que SUGERE postagens a partir da análise do perfil.
 *
 * Lê o resumo determinístico (lib/instagram-insights.ts) + as legendas que mais
 * engajaram e pede ao modelo (Cloudflare Llama 3.3 70B — o mesmo de
 * lib/instagram.ts) N ideias de post com DOIS objetivos, nesta ordem:
 *   1) ABENÇOAR/edificar quem lê (propósito primário, não autopromoção);
 *   2) gerar engajamento honesto (gancho forte + convite real à interação).
 *
 * Cada sugestão já vem com o `roteiro` no formato SlideIA — pronto pra cair no
 * editor (components/GeradorInstagram.tsx) sem rechamar a IA.
 */
import type { SlideIA } from "@/lib/instagram";
import type { PerfilResumo } from "@/lib/instagram-insights";
import type { RealceModo } from "@/lib/instagram-render";

const CF_BASE = "https://api.cloudflare.com/client/v4/accounts";
const MODOS_VALIDOS: RealceModo[] = ["circulo", "grifo", "marca", "dourado", "nenhum"];

export type SugestaoPost = {
  /** Tema curto da postagem. */
  tema: string;
  /** Primeira frase, pensada pra prender. */
  gancho: string;
  /** Legenda pronta (PT-BR), calorosa, com convite à interação + hashtags. */
  legenda: string;
  /** Slides já no formato do editor (texto com {chave}, prompt, modo, cor). */
  roteiro: SlideIA[];
  /** Direção da imagem/estética do carrossel. */
  ideiaVisual: string;
  /** Melhor dia/horário (vem do resumo determinístico, preenchido na rota). */
  melhorHorario: string;
  /** Por que abençoa E por que tende a engajar. */
  porque: string;
};

function creds() {
  return {
    accountId: process.env.CLOUDFLARE_ACCOUNT_ID,
    apiToken: process.env.CLOUDFLARE_API_TOKEN,
  };
}

function systemPrompt(n: number): string {
  return `Você é o estrategista de conteúdo do Instagram de um ministério cristão chamado Ekballo.
Sua função é SUGERIR ${n} ideias de postagem a partir da análise do perfil do usuário.

DOIS OBJETIVOS, NESTA ORDEM DE PRIORIDADE:
1) ABENÇOAR quem lê — o propósito primário é edificar, encorajar, consolar, despertar fé e esperança em quem vê o post. NUNCA é autopromoção, venda ou vaidade. Pense: "que palavra de Deus essa pessoa precisa ouvir hoje?".
2) ENGAJAR com honestidade — a 1ª linha (gancho) tem que prender; a legenda convida a uma interação REAL (comentar uma palavra, marcar alguém que precisa ouvir isso, salvar pra reler, compartilhar). NADA de clickbait vazio, promessa falsa ou sensacionalismo. Engajamento que serve à bênção, não o contrário.

VOZ E ESTÉTICA (padrão Ekballo): tom pessoal e caloroso, "vivo e forte ao mesmo tempo limpo" — fé que acolhe e convida, nunca anúncio. Português do Brasil. Cristão, bíblico e fiel; pode citar/aludir a versículos verdadeiros, mas com leveza.

FIDELIDADE À VOZ DO PERFIL: use as legendas de melhor desempenho (que vão no contexto) como referência do TOM e dos TEMAS que já ressoam com esse público. Sugira na mesma pegada — não invente uma persona diferente.

Para CADA sugestão, devolva:
- "tema": o assunto em poucas palavras.
- "gancho": a 1ª frase do post/legenda, feita pra prender (curta e forte).
- "legenda": PT-BR, pessoal e calorosa; abre tocando o coração (sem clichê), entrega a bênção, e fecha com UM convite claro à interação. Termine com 3 a 5 hashtags relevantes.
- "ideiaVisual": 1 frase descrevendo a estética/foto do carrossel.
- "porque": 1 frase dizendo por que isso abençoa E por que tende a engajar nesse perfil.
- "roteiro": array de slides do carrossel (1 a 6). O 1º slide é o gancho visual; o último é um fecho/convite. Cada slide:
    - "texto": frase MUITO curta (3 a 7 palavras), PT-BR, com a ÚNICA palavra mais forte entre {chaves}. Ex: "ESSA {nova} estação".
    - "prompt": descrição EM INGLÊS de uma foto cinematográfica, devocional, dramática, que representa o sentido do slide (objetos, símbolos, luz). Sem texto na imagem, sem rostos.
    - "modo": destaque da palavra-chave — "circulo", "grifo", "marca" ou "dourado". Varie entre os slides.
    - "cor": cor hex (#rrggbb) quente/dourada que combine com a imagem mas contraste pra ler.

Responda SOMENTE com JSON válido, sem comentários, neste formato EXATO:
{"sugestoes":[{"tema":"...","gancho":"...","legenda":"...","ideiaVisual":"...","porque":"...","roteiro":[{"texto":"...","prompt":"...","modo":"circulo","cor":"#C9A961"}]}]}`;
}

function contextoPerfil(resumo: PerfilResumo): string {
  const linhas: string[] = [];
  linhas.push(`Posts analisados: ${resumo.totalPosts}.`);
  linhas.push(`Engajamento médio (curtidas+comentários por post): ${resumo.engajamentoMedio}.`);
  linhas.push(`Melhor dia/horário pra postar: ${resumo.melhorHorario}.`);
  linhas.push(`Formato que mais engaja: ${resumo.formatoTop}.`);
  if (resumo.topPosts.length) {
    linhas.push("");
    linhas.push("Legendas que MAIS engajaram (use como referência de tom e tema):");
    resumo.topPosts.forEach((p, i) => {
      const cap = (p.caption || "(sem legenda)").replace(/\s+/g, " ").trim().slice(0, 280);
      linhas.push(`${i + 1}. [${p.likes}❤ ${p.comments}💬] ${cap}`);
    });
  }
  return linhas.join("\n");
}

function extrairJSON(txt: string): unknown {
  const semFence = txt.replace(/```json/gi, "").replace(/```/g, "");
  const ini = semFence.indexOf("{");
  const fim = semFence.lastIndexOf("}");
  if (ini === -1 || fim === -1 || fim < ini) throw new Error("sem JSON na resposta");
  return JSON.parse(semFence.slice(ini, fim + 1));
}

function normalizarCor(c: unknown): string {
  const v = typeof c === "string" ? c.trim() : "";
  if (/^#[0-9a-fA-F]{6}$/.test(v)) return v;
  if (/^[0-9a-fA-F]{6}$/.test(v)) return `#${v}`;
  return "#C9A961";
}

function normalizarRoteiro(raw: unknown): SlideIA[] {
  const arr = Array.isArray(raw) ? raw : [];
  return arr
    .map((s): SlideIA => {
      const o = (s || {}) as Record<string, unknown>;
      const modo =
        typeof o.modo === "string" && MODOS_VALIDOS.includes(o.modo as RealceModo)
          ? (o.modo as RealceModo)
          : "circulo";
      return {
        texto: typeof o.texto === "string" ? o.texto.trim() : "",
        prompt: typeof o.prompt === "string" ? o.prompt.trim() : "",
        modo,
        cor: normalizarCor(o.cor),
      };
    })
    .filter((s) => s.texto)
    .slice(0, 6);
}

/**
 * Gera N sugestões de post a partir do resumo do perfil. `melhorHorario` é
 * preenchido pela rota com o valor determinístico do resumo (não pelo modelo).
 */
export async function gerarSugestoes(resumo: PerfilResumo, n = 3): Promise<SugestaoPost[]> {
  const { accountId, apiToken } = creds();
  if (!accountId || !apiToken) throw new Error("Cloudflare não configurado");

  const res = await fetch(
    `${CF_BASE}/${accountId}/ai/run/@cf/meta/llama-3.3-70b-instruct-fp8-fast`,
    {
      method: "POST",
      headers: { Authorization: `Bearer ${apiToken}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        messages: [
          { role: "system", content: systemPrompt(n) },
          { role: "user", content: contextoPerfil(resumo) },
        ],
        max_tokens: 2600,
      }),
    },
  );
  if (!res.ok) {
    throw new Error(`Cloudflare texto ${res.status}: ${(await res.text()).slice(0, 200)}`);
  }
  const json = await res.json();
  const raw = json?.result?.response;
  // A Cloudflare passou a devolver `response` já como objeto JSON quando a
  // saída é JSON (antes vinha string). Aceita os dois casos.
  let parsed: { sugestoes?: unknown[] };
  if (raw && typeof raw === "object") {
    parsed = raw as { sugestoes?: unknown[] };
  } else if (typeof raw === "string") {
    parsed = extrairJSON(raw) as { sugestoes?: unknown[] };
  } else {
    throw new Error("resposta inesperada do modelo");
  }
  const lista = Array.isArray(parsed.sugestoes) ? parsed.sugestoes : [];

  const sugestoes: SugestaoPost[] = lista
    .map((s): SugestaoPost => {
      const o = (s || {}) as Record<string, unknown>;
      return {
        tema: typeof o.tema === "string" ? o.tema.trim() : "",
        gancho: typeof o.gancho === "string" ? o.gancho.trim() : "",
        legenda: typeof o.legenda === "string" ? o.legenda.trim() : "",
        ideiaVisual: typeof o.ideiaVisual === "string" ? o.ideiaVisual.trim() : "",
        porque: typeof o.porque === "string" ? o.porque.trim() : "",
        roteiro: normalizarRoteiro(o.roteiro),
        melhorHorario: resumo.melhorHorario,
      };
    })
    .filter((s) => s.tema && s.roteiro.length);

  if (!sugestoes.length) throw new Error("o modelo não devolveu sugestões válidas");
  return sugestoes;
}
