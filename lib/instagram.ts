/**
 * Núcleo do gerador de carrossel de Instagram (admin).
 *
 *  - gerarFundoLivre(prompt): gera um fundo cinematográfico por IA (Cloudflare
 *    FLUX.2, já em 4:5) com prompt LIVRE — objetos, símbolos, cenas que conversam com o
 *    texto (diferente de lib/imagen.ts, que é travado em "só paisagem").
 *  - gerarCarrosselIA(conteudo): usa o modelo de TEXTO da Cloudflare (Llama)
 *    pra quebrar qualquer conteúdo em slides + sugerir prompt de imagem,
 *    palavra-chave, modo de destaque, cor e legenda.
 *
 * Tudo via as mesmas credenciais CLOUDFLARE_ACCOUNT_ID / CLOUDFLARE_API_TOKEN.
 */

import type { FonteKey, RealceModo } from "@/lib/instagram-render";
import { lerJSONdaIA } from "@/lib/json-ia";
import { chamarLLMLendo } from "@/lib/llm";

const CF_BASE = "https://api.cloudflare.com/client/v4/accounts";

export type SlideIA = {
  /** Texto do slide (PT-BR, curto). A palavra mais forte vem entre {chaves}. */
  texto: string;
  /** Prompt de imagem (inglês) que representa visualmente o slide. */
  prompt: string;
  /** Modo de destaque sugerido. */
  modo: RealceModo;
  /** Cor de destaque (hex) que combina com a imagem. */
  cor: string;
};

export type CarrosselIA = {
  slides: SlideIA[];
  legenda: string;
};

function creds() {
  return {
    accountId: process.env.CLOUDFLARE_ACCOUNT_ID,
    apiToken: process.env.CLOUDFLARE_API_TOKEN,
  };
}

// ----------------------------------------------------------------------------
// Imagem — Flux com prompt livre + estilo devocional
// ----------------------------------------------------------------------------
const ESTILO_DEVOCIONAL = [
  "cinematic devotional photography",
  "dramatic chiaroscuro lighting, warm tones, deep shadows",
  "shallow depth of field, atmospheric, reverent and contemplative mood",
  "high detail, photorealistic, 35mm film grain",
  "generous dark negative space for typography",
  "no text, no letters, no watermark, no distorted faces, no deformed hands",
].join(", ");

// O estilo dos modelos novos (issue #211), tirado das referências do Bruno:
// foto de reportagem dentro da igreja, escura, com gente de verdade — não a
// paisagem contemplativa de banco de imagem.
const ESTILO_DOCUMENTAL = [
  "candid documentary photograph, photojournalism, shot on 35mm film",
  "dark moody low-key lighting, deep blacks, single warm practical light, subtle teal shadows",
  "shallow depth of field, slightly underexposed, natural skin texture, visible film grain",
  "people seen from behind, in profile or as silhouettes, hands and small details in close-up",
  "authentic unposed moment, muted desaturated colors, large dark empty area for typography",
  "no text, no letters, no watermark, no logo, no illustration, no cgi look, no distorted faces, no deformed hands, no extra fingers",
].join(", ");

// Desenho a traço para o modelo "gravura" (issue #248): não é foto. O fundo
// branco liso é o que deixa a ilustração se fundir com o papel do slide.
const ESTILO_GRAVURA = [
  "black ink line art illustration, vintage engraving style, fine cross-hatching, hand-drawn pen sketch",
  "monochrome black lines only, plain off-white paper background, no shading in the background",
  "single centered subject in the lower half, wide empty white space at the top, figure seen from behind",
  "no text, no letters, no watermark, no frame, no color, no photograph, no gray wash",
].join(", ");

export type EstiloFoto = "devocional" | "documental" | "gravura";

// Formato nativo do post (4:5). O FLUX.2 exige múltiplos de 16; a sobra de
// 8 px em cada eixo some no `objectFit: cover` do canvas 1080×1350.
export type FormatoImagem = "feed" | "story" | "quadrado";

// Os dois lados precisam ser múltiplos de 16 (exigência do FLUX.2).
const DIMENSOES: Record<FormatoImagem, { w: number; h: number }> = {
  feed: { w: 1088, h: 1360 }, // 4:5
  story: { w: 1024, h: 1824 }, // 9:16
  quadrado: { w: 1024, h: 1024 },
};

// Em ordem de preferência. Quem manda aqui é a cota grátis da Workers AI
// (10.000 neurons/dia), medida em out/2026 no tamanho do post (issue #189):
//   klein-4b ≈ 156 neurons  → ~60 imagens/dia, fotográfico, espaço para o título
//   klein-9b ≈ 1.450 neurons → ~6 imagens/dia, um degrau acima
//   dev      ≈ milhares      → 1 ou 2 por dia; fica de fora
// O 9b entra de reserva para o caso de o 4b estar fora do ar. Trocar sem
// deploy: IMAGE_MODELOS_FUNDO="modelo-a,modelo-b".
const MODELOS_FUNDO_PADRAO = ["flux-2-klein-4b", "flux-2-klein-9b"];

function modelosFundo(): string[] {
  const lista = (process.env.IMAGE_MODELOS_FUNDO || "")
    .split(",")
    .map((m) => m.trim())
    .filter(Boolean);
  return lista.length ? lista : MODELOS_FUNDO_PADRAO;
}

/** FLUX.2 na Workers AI: corpo multipart, já no tamanho do post. */
async function fundoFlux2(
  modelo: string,
  prompt: string,
  seed: number | undefined,
  formato: FormatoImagem,
  accountId: string,
  apiToken: string,
): Promise<string | null> {
  const form = new FormData();
  form.set("prompt", prompt);
  form.set("width", String(DIMENSOES[formato].w));
  form.set("height", String(DIMENSOES[formato].h));
  if (seed !== undefined) form.set("seed", String(seed));
  const res = await fetch(
    `${CF_BASE}/${accountId}/ai/run/@cf/black-forest-labs/${modelo}`,
    {
      method: "POST",
      headers: { Authorization: `Bearer ${apiToken}` },
      body: form,
      signal: AbortSignal.timeout(50_000),
    },
  );
  if (!res.ok) {
    // Sem isto a falha é muda: o post cai na foto de banco e ninguém sabe por quê.
    const motivo = (await res.text().catch(() => "")).slice(0, 200);
    console.warn(`[imagem] ${modelo} respondeu ${res.status}: ${motivo}`);
    return null;
  }
  const corpo = await res.json();
  const b64 = corpo?.result?.image;
  if (typeof b64 !== "string" || !b64) {
    console.warn(
      `[imagem] ${modelo} sem imagem na resposta:`,
      JSON.stringify(corpo).slice(0, 200),
    );
    return null;
  }
  return b64;
}

/**
 * Último recurso: o schnell antigo (1024×1024, 8 passos). NÃO recebe seed —
 * a API passou a recusar o campo ("/seed not allowed"), e era por isso que a
 * geração por IA falhava sempre em produção e o post caía na foto de reserva.
 */
async function fundoSchnell(
  prompt: string,
  accountId: string,
  apiToken: string,
): Promise<string | null> {
  const res = await fetch(
    `${CF_BASE}/${accountId}/ai/run/@cf/black-forest-labs/flux-1-schnell`,
    {
      method: "POST",
      headers: {
        Authorization: `Bearer ${apiToken}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ prompt, steps: 8 }),
      signal: AbortSignal.timeout(30_000),
    },
  );
  if (!res.ok) return null;
  const b64 = (await res.json())?.result?.image;
  return typeof b64 === "string" && b64 ? b64 : null;
}

/**
 * Gera uma imagem a partir de um prompt JÁ COMPLETO (com o estilo), no formato
 * pedido. Devolve uma data URL, ou null se nenhum modelo conseguiu (cota do
 * dia esgotada, serviço fora do ar).
 */
export async function gerarImagem(
  promptCompleto: string,
  opcoes: { seed?: number; formato?: FormatoImagem } = {},
): Promise<string | null> {
  const { accountId, apiToken } = creds();
  if (!accountId || !apiToken || !promptCompleto.trim()) return null;
  const formato = opcoes.formato ?? "feed";
  const semente =
    typeof opcoes.seed === "number" && Number.isFinite(opcoes.seed)
      ? Math.abs(Math.trunc(opcoes.seed))
      : undefined;

  for (const modelo of modelosFundo()) {
    try {
      const b64 = await fundoFlux2(
        modelo,
        promptCompleto,
        semente,
        formato,
        accountId,
        apiToken,
      );
      if (b64) return `data:image/jpeg;base64,${b64}`;
    } catch (e) {
      // timeout ou rede: tenta o próximo modelo
      console.warn("[imagem] falhou em", modelo, e instanceof Error ? e.message : e);
    }
  }
  try {
    // O schnell só sabe fazer quadrado; quem mostra corta para o formato.
    const b64 = await fundoSchnell(promptCompleto, accountId, apiToken);
    return b64 ? `data:image/jpeg;base64,${b64}` : null;
  } catch {
    return null;
  }
}

/** Fundo de slide: o prompt do slide + o estilo devocional da casa. */
export function gerarFundoLivre(
  prompt: string,
  seed?: number,
  formato: FormatoImagem = "feed",
  estilo: EstiloFoto = "devocional",
): Promise<string | null> {
  if (!prompt.trim()) return Promise.resolve(null);
  const acabamento =
    estilo === "documental"
      ? ESTILO_DOCUMENTAL
      : estilo === "gravura"
        ? ESTILO_GRAVURA
        : ESTILO_DEVOCIONAL;
  return gerarImagem(`${prompt.trim()}. ${acabamento}`, { seed, formato });
}

// ----------------------------------------------------------------------------
// Texto — quebra de conteúdo em slides via Llama
// ----------------------------------------------------------------------------
const MODOS_VALIDOS: RealceModo[] = ["circulo", "grifo", "marca", "dourado", "nenhum"];

/** O pedido padrão (reorganizar o conteúdo colado), para quem precisa acrescentar algo a ele. */
export function systemCarrosselPadrao(tipo: "carrossel" | "unico"): string {
  return buildSystemPrompt(tipo);
}

function buildSystemPrompt(tipo: "carrossel" | "unico"): string {
  const quantidade =
    tipo === "unico"
      ? "Gere EXATAMENTE 1 slide — a frase mais impactante que resume a mensagem inteira."
      : "Use quantos slides o CONTEÚDO pedir, SEM forçar número fixo: conteúdo curto = 1 a 3 slides; conteúdo longo = mais slides (até ~8). Uma ideia por slide. O 1º é um gancho forte; o último é um fecho/chamada.";
  return `Você é um designer de posts de Instagram para um ministério cristão (Ekballo).
Recebe um conteúdo em português (trecho de mensagem, frase de livro, reflexão, versículo) e o transforma em post.

Regras:
- FIDELIDADE (mais importante): use APENAS as ideias, o tema e as palavras do conteúdo que o usuário enviou. NUNCA invente frases, versículos, temas ou teologia que NÃO estão no texto dele. Você reorganiza e resume o que ele escreveu — não adiciona conteúdo novo.
- ${quantidade}
- "texto": frase MUITO curta (3 a 7 palavras no máximo), em PT-BR, fiel ao conteúdo. NUNCA copie a frase inteira — resuma. SEMPRE envolva a ÚNICA palavra mais forte entre chaves {}, ex: "ESSA {nova} estação".
- "prompt": descrição EM INGLÊS de uma foto cinematográfica que representa visualmente o sentido do slide (objetos, símbolos, cenas, luz). Sem texto na imagem, sem rostos. Ex: "a single burning torch in darkness".
- "modo": como destacar a palavra: "circulo", "grifo", "marca" ou "dourado". Varie entre os slides.
- "cor": cor hex (#rrggbb) que combine com a imagem do slide MAS contraste o suficiente pra ler.
- "legenda": escreva em PT-BR de forma PESSOAL e calorosa, como quem compartilha algo do coração com amigos (pode usar primeira pessoa). Traga um tom de ESPERANÇA e fé que acolhe e convida o leitor — nunca soe como anúncio ou propaganda. Comece tocando o coração, não com clichê. Termine com 3 a 5 hashtags relevantes.

Responda SOMENTE com JSON válido, sem comentários, neste formato:
{"slides":[{"texto":"...","prompt":"...","modo":"...","cor":"#rrggbb"}],"legenda":"..."}`;
}

function extrairJSON(txt: string): unknown {
  return lerJSONdaIA(
    txt,
    "a IA não devolveu o post em um formato que eu consiga ler — tente de novo",
  );
}

function normalizarCor(c: unknown): string {
  const v = typeof c === "string" ? c.trim() : "";
  if (/^#[0-9a-fA-F]{6}$/.test(v)) return v;
  if (/^[0-9a-fA-F]{6}$/.test(v)) return `#${v}`;
  return "#C9A961";
}

export async function gerarCarrosselIA(
  conteudo: string,
  tipo: "carrossel" | "unico" = "carrossel",
  /** Troca o pedido padrão (reorganizar o conteúdo) por outro — ex.: escrever a partir de uma ideia. */
  system?: string,
): Promise<CarrosselIA> {
  // Corrente de provedores em lib/llm.ts (Gemini → Groq → Cloudflare).
  // A leitura acontece dentro de `chamarLLMLendo`: resposta fora do formato
  // (comum nos modelos de reserva) ganha uma segunda tentativa.
  return chamarLLMLendo(
    system ?? buildSystemPrompt(tipo),
    conteudo.trim(),
    system ? 2000 : 1200,
    (texto) => lerCarrossel(texto, tipo),
  );
}

function lerCarrossel(texto: string, tipo: "carrossel" | "unico"): CarrosselIA {
  const parsed = extrairJSON(texto) as { slides?: unknown[]; legenda?: unknown };
  const slidesRaw = Array.isArray(parsed.slides) ? parsed.slides : [];
  const slides: SlideIA[] = slidesRaw
    .map((s) => {
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
    .filter((s) => s.texto);

  if (!slides.length) throw new Error("o modelo não devolveu slides válidos");

  return {
    slides: tipo === "unico" ? slides.slice(0, 1) : slides,
    legenda: typeof parsed.legenda === "string" ? parsed.legenda.trim() : "",
  };
}

// Fonte padrão e helpers de UI compartilhados
export const FONTE_PADRAO: FonteKey = "anton";
