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
Sua função é SUGERIR ${n} ideias de postagem (carrossel) a partir da análise do perfil do usuário.

DOIS OBJETIVOS, NESTA ORDEM:
1) ABENÇOAR quem lê — edificar, encorajar, consolar, despertar fé e esperança. Pense: "que palavra de Deus essa pessoa precisa ouvir hoje?". Nunca autopromoção ou vaidade.
2) ENGAJAR com honestidade — o gancho prende; a LEGENDA convida a interagir (comentar, marcar alguém, salvar, compartilhar). Sem clickbait.

VOZ (padrão Ekballo): pessoal, calorosa, "viva e forte ao mesmo tempo limpa". PT-BR. Cristã, bíblica e fiel. Use as legendas de melhor desempenho (no contexto) como referência de TOM e TEMA.

QUANTOS SLIDES — você DECIDE o tamanho pela mensagem, com intenção; NÃO force número nem encha de slides:
  - Se a ideia se resolve numa ÚNICA frase/imagem de impacto (um versículo curto, uma frase que não precisa de desdobramento), use 1 slide (imagem única). NÃO transforme em carrossel só por transformar.
  - Se ela se desdobra em etapas, use de 2 a 5 slides.
  - VARIE os formatos entre as ${n} sugestões: misture imagem única E carrossel conforme cada ideia pedir — não faça todas do mesmo tamanho.
Quando houver 2+ slides, eles formam UMA ÚNICA mensagem contínua e ENCADEADA: ao deslizar, cada slide CONTINUA o anterior, como uma frase que se desdobra — NÃO são frases soltas independentes. Exemplo do encadeamento certo:
  "ESSA {nova} estação" -> "não será construída por {estratégias} humanas" -> "será sustentada pela {glória} de Deus" -> "Deus levanta {discípulos} inflamados"
O 1º slide é o gancho; o último é o ápice/promessa da mensagem — NUNCA um slide de "compartilhe/salve/marque/comente" (CTA fica SÓ na legenda).

Para CADA sugestão devolva:
- "tema": assunto em poucas palavras.
- "gancho": 1ª frase, curta e forte.
- "legenda": PT-BR calorosa; abre tocando o coração, entrega a bênção, fecha com UM convite à interação. 3 a 5 hashtags no fim.
- "ideiaVisual": 1 frase sobre a estética do carrossel.
- "porque": 1 frase: por que abençoa E por que tende a engajar.
- "roteiro": de 1 a 5 slides (você escolhe o número pela regra acima). Com 2+, eles formam UMA mensagem contínua e coerente (cada texto conecta com o anterior e o seguinte). Cada slide:
    - "texto": fragmento curto (3 a 7 palavras), PT-BR, encadeado. Marque entre {chaves} UMA palavra FORTE (substantivo, verbo ou adjetivo de peso) — NUNCA preposição, artigo ou conectivo (de, da, do, o, a, ao, à, e, que, em, com). Se o fragmento não tiver palavra forte, não marque nada.
    - "prompt": foto cinematográfica devocional EM INGLÊS — APENAS símbolos, natureza, objetos e luz (ex.: a single burning torch in darkness, golden dawn over mountains, light breaking through storm clouds, an open empty road at sunrise). PROIBIDO: pessoas, rostos, mãos, corpos, celulares, telas, letras/texto. (O gerador distorce rostos e mãos — não use.)
    - "modo": "circulo", "grifo", "marca" ou "dourado" (varie).
    - "cor": hex (#rrggbb) quente/dourada que combine com a imagem e contraste pra ler.

Responda SOMENTE com JSON válido, neste formato EXATO:
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

// Rede de segurança: o Flux distorce rostos/mãos. Se o modelo escapar e colocar
// pessoa/rosto/mão/celular no prompt de imagem, troca por um fundo simbólico
// seguro e on-brand (devocional). Mantém o post bonito mesmo quando a IA fura.
const FUNDOS_SEGUROS = [
  "a single burning torch in darkness",
  "golden dawn breaking over distant mountains",
  "light piercing through dark storm clouds",
  "an open empty road at sunrise, misty",
  "a calm lake reflecting a warm sunset",
  "rays of light falling into a deep forest",
];
const PESSOA_RE =
  /\b(person|people|man|men|woman|women|child|children|kid|boy|girl|face|faces|hand|hands|arm|arms|body|bodies|portrait|figure|silhouette|crowd|phone|smartphone|screen|selfie)\b/i;

function sanitizarPromptImagem(prompt: string, i: number): string {
  if (!prompt || PESSOA_RE.test(prompt)) {
    return FUNDOS_SEGUROS[i % FUNDOS_SEGUROS.length];
  }
  return prompt;
}

function normalizarRoteiro(raw: unknown): SlideIA[] {
  const arr = Array.isArray(raw) ? raw : [];
  return arr
    .map((s, i): SlideIA => {
      const o = (s || {}) as Record<string, unknown>;
      const modo =
        typeof o.modo === "string" && MODOS_VALIDOS.includes(o.modo as RealceModo)
          ? (o.modo as RealceModo)
          : "circulo";
      const promptBruto = typeof o.prompt === "string" ? o.prompt.trim() : "";
      return {
        texto: typeof o.texto === "string" ? o.texto.trim() : "",
        prompt: sanitizarPromptImagem(promptBruto, i),
        modo,
        cor: normalizarCor(o.cor),
      };
    })
    .filter((s) => s.texto)
    .slice(0, 5);
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
