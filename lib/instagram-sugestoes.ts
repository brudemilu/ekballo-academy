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
import { chamarLLM } from "@/lib/llm";

const MODOS_VALIDOS: RealceModo[] = ["circulo", "grifo", "marca", "dourado", "nenhum"];

export type Pilar = "curiosidade" | "postura" | "reflexao" | "versiculo";

export type SugestaoPost = {
  /** Pilar de conteúdo da sugestão. */
  pilar: Pilar;
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

function systemPrompt(n: number): string {
  return `Você é o estrategista de conteúdo do Instagram de um ministério cristão chamado Ekballo.
Sua função é SUGERIR ${n} ideias de postagem (carrossel) a partir da análise do perfil do usuário.

DOIS OBJETIVOS, NESTA ORDEM:
1) ABENÇOAR quem lê — edificar, encorajar, consolar, despertar fé e esperança. Pense: "que palavra de Deus essa pessoa precisa ouvir hoje?". Nunca autopromoção ou vaidade.
2) ENGAJAR com honestidade — o gancho prende; a LEGENDA convida a interagir (comentar, marcar alguém, salvar, compartilhar). Sem clickbait.

PILARES DE CONTEÚDO — distribua as ${n} sugestões entre estes pilares (VARIE, não repita o mesmo pilar em todas). Cada sugestão declara seu "pilar":
  - "curiosidade": curiosidade bíblica/histórica, "você sabia?", fato sobre um personagem, lugar, palavra original (hebraico/grego) ou costume da Bíblia — algo que prende e ensina.
  - "postura": postura/atitude em Cristo no dia a dia (perdão, humildade, coragem, integridade, fé na prática, descanso, gratidão).
  - "reflexao": mensagem de encorajamento, fé, esperança e bênção (o coração do perfil).
  - "versiculo": um versículo forte como peça central, com uma aplicação curta pra vida.

VOZ (padrão Ekballo): pessoal, calorosa, VIVA — "forte e ao mesmo tempo limpa". PT-BR. Cristã, bíblica e fiel. Use as legendas de melhor desempenho (no contexto) como referência de TOM e TEMA.

QUANTOS SLIDES — você DECIDE o tamanho pela mensagem, com intenção; NÃO force número nem encha de slides:
  - Se a ideia se resolve numa ÚNICA frase/imagem de impacto (um versículo curto, uma frase que não precisa de desdobramento), use 1 slide (imagem única). NÃO transforme em carrossel só por transformar.
  - Se ela se desdobra em etapas, use de 2 a 5 slides.
  - VARIE os formatos entre as ${n} sugestões: misture imagem única E carrossel conforme cada ideia pedir — não faça todas do mesmo tamanho.
Quando houver 2+ slides, eles formam UMA ÚNICA mensagem contínua e ENCADEADA: ao deslizar, cada slide CONTINUA o anterior, como uma frase que se desdobra — NÃO são frases soltas independentes. Exemplo do encadeamento certo:
  "ESSA {nova} estação" -> "não será construída por {estratégias} humanas" -> "será sustentada pela {glória} de Deus" -> "Deus levanta {discípulos} inflamados"
O 1º slide é o gancho; o último é o ápice/promessa da mensagem — NUNCA um slide de "compartilhe/salve/marque/comente" (CTA fica SÓ na legenda).

Para CADA sugestão devolva:
- "pilar": um de "curiosidade" | "postura" | "reflexao" | "versiculo".
- "tema": assunto em poucas palavras.
- "gancho": 1ª frase, curta e forte.
- "legenda": PT-BR calorosa e viva; abre tocando o coração ou despertando curiosidade, entrega o conteúdo, fecha com UM convite à interação. 3 a 5 hashtags no fim.
- "ideiaVisual": 1 frase sobre a estética do carrossel.
- "porque": 1 frase: por que vale a pena E por que tende a engajar.
- "roteiro": de 1 a 5 slides (você escolhe o número pela regra acima). Com 2+, eles formam UMA mensagem contínua e coerente (cada texto conecta com o anterior e o seguinte). Cada slide:
    - "texto": fragmento curto (3 a 7 palavras), PT-BR, encadeado. Marque entre {chaves} UMA palavra FORTE (substantivo, verbo ou adjetivo de peso) — NUNCA preposição, artigo ou conectivo (de, da, do, o, a, ao, à, e, que, em, com). Opcional: você pode envolver UMA expressão curta de fecho entre ((parênteses duplos)) — ela vira caligrafia manuscrita (use no máximo uma vez, no último slide, ex.: "todo ((mundo.))").
    - "prompt": em INGLÊS — descreva uma FOTO REAL FORTE e marcante que representa o sentido do slide (será usada pra BUSCAR a foto num banco). O que importa é o IMPACTO e a EMOÇÃO da cena, NÃO a cor: NÃO force sempre dourado/pôr do sol — VARIE cenário, luz e tom conforme a mensagem (mountains, ocean waves, storm clouds, forest, desert, open road, starry sky, fire, city at night, rays of light through trees, cliffs, rain, snow...). Use 2 a 5 palavras-chave fortes (ex.: "stormy mountain peak", "vast starry night sky", "ocean waves crashing on rocks"). PESSOAS só DE COSTAS / em silhueta / multidão por trás / distantes — NUNCA rosto em close, selfie, retrato ou mãos em destaque.
    - "modo": "dourado" (recomendado), "grifo", "marca" ou "circulo" (varie pouco; o dourado é o padrão do template).
    - "cor": hex (#rrggbb) — pode mandar "#C0892B" (o template usa dourado fixo, mas mantenha o campo).

Responda SOMENTE com JSON válido, neste formato EXATO:
{"sugestoes":[{"pilar":"reflexao","tema":"...","gancho":"...","legenda":"...","ideiaVisual":"...","porque":"...","roteiro":[{"texto":"...","prompt":"...","modo":"dourado","cor":"#C0892B"}]}]}`;
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

// Rede de segurança das imagens. O Flux distorce ROSTO/MÃO em close, mas faz
// muito bem gente DE COSTAS / silhueta / multidão (o herói do template). Então:
//  - close-up de rosto/mão/selfie/retrato → troca por um fundo seguro;
//  - pessoa/multidão sem qualificador seguro → ANEXA "de costas, silhueta";
//  - resto passa.
const FUNDOS_SEGUROS = [
  "a crowd seen from behind facing a glowing city skyline at golden sunrise, warm backlight, film grain",
  "golden dawn breaking over distant mountains, atmospheric, cinematic",
  "warm rays of light piercing through clouds over an open road at sunrise",
  "a calm lake reflecting a golden sunset, serene, cinematic",
  "silhouettes of people from behind raising hands toward a bright golden sky",
  "a single burning torch glowing in soft darkness, warm light",
];
// close-up / rosto / mão / selfie → distorce, melhor trocar.
const HARD_RE = /\b(close-?up|selfie|portrait|facial|eyes|mouth|teeth|smiling face|a face|the face|hands? holding|fingers)\b/i;
// menção a pessoas que o Flux faz bem SE de costas/silhueta.
const PESSOA_RE = /\b(person|people|man|men|woman|women|child|children|kid|boy|girl|crowd|figure|figures|worshipper|worshippers|congregation|believer|believers)\b/i;
// qualificadores que tornam a pessoa segura (sem rosto nítido).
const SEGURO_RE = /\b(behind|back view|backs?|silhouette|silhouettes|distant|faceless|from afar|aerial|from above)\b/i;

function sanitizarPromptImagem(prompt: string, i: number): string {
  if (!prompt) return FUNDOS_SEGUROS[i % FUNDOS_SEGUROS.length];
  if (HARD_RE.test(prompt)) return FUNDOS_SEGUROS[i % FUNDOS_SEGUROS.length];
  if (PESSOA_RE.test(prompt) && !SEGURO_RE.test(prompt)) {
    return `${prompt}, people seen from behind, silhouettes, faces not visible`;
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
  // Groq (sem teto) → Cloudflare (reserva). Mesmo modelo Llama 3.3 70B.
  const texto = await chamarLLM(systemPrompt(n), contextoPerfil(resumo), 2800);
  const parsed = extrairJSON(texto) as { sugestoes?: unknown[] };
  const lista = Array.isArray(parsed.sugestoes) ? parsed.sugestoes : [];

  const PILARES_VALIDOS: Pilar[] = ["curiosidade", "postura", "reflexao", "versiculo"];
  const sugestoes: SugestaoPost[] = lista
    .map((s): SugestaoPost => {
      const o = (s || {}) as Record<string, unknown>;
      const pilar = typeof o.pilar === "string" && PILARES_VALIDOS.includes(o.pilar as Pilar) ? (o.pilar as Pilar) : "reflexao";
      return {
        pilar,
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
