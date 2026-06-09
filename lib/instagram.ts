/**
 * Núcleo do gerador de carrossel de Instagram (admin).
 *
 *  - gerarFundoLivre(prompt): gera um fundo cinematográfico por IA (Cloudflare
 *    Flux) com prompt LIVRE — objetos, símbolos, cenas que conversam com o
 *    texto (diferente de lib/imagen.ts, que é travado em "só paisagem").
 *  - gerarCarrosselIA(conteudo): usa o modelo de TEXTO da Cloudflare (Llama)
 *    pra quebrar qualquer conteúdo em slides + sugerir prompt de imagem,
 *    palavra-chave, modo de destaque, cor e legenda.
 *
 * Tudo via as mesmas credenciais CLOUDFLARE_ACCOUNT_ID / CLOUDFLARE_API_TOKEN.
 */
import type { FonteKey, RealceModo } from "@/lib/instagram-render";
import { chamarLLM } from "@/lib/llm";

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

export async function gerarFundoLivre(prompt: string, seed?: number): Promise<string | null> {
  const { accountId, apiToken } = creds();
  if (!accountId || !apiToken || !prompt.trim()) return null;
  try {
    const body: Record<string, unknown> = { prompt: `${prompt.trim()}. ${ESTILO_DEVOCIONAL}`, steps: 8 };
    if (typeof seed === "number" && Number.isFinite(seed)) body.seed = Math.abs(Math.trunc(seed));
    const res = await fetch(
      `${CF_BASE}/${accountId}/ai/run/@cf/black-forest-labs/flux-1-schnell`,
      {
        method: "POST",
        headers: { Authorization: `Bearer ${apiToken}`, "Content-Type": "application/json" },
        body: JSON.stringify(body),
      },
    );
    if (!res.ok) return null;
    const json = await res.json();
    const b64 = json?.result?.image;
    return b64 ? `data:image/jpeg;base64,${b64}` : null;
  } catch {
    return null;
  }
}

// ----------------------------------------------------------------------------
// Texto — quebra de conteúdo em slides via Llama
// ----------------------------------------------------------------------------
const MODOS_VALIDOS: RealceModo[] = ["circulo", "grifo", "marca", "dourado", "nenhum"];

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
  // remove cercas de código e pega o primeiro bloco {...}
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

export async function gerarCarrosselIA(
  conteudo: string,
  tipo: "carrossel" | "unico" = "carrossel",
): Promise<CarrosselIA> {
  // Groq (sem teto) → Cloudflare (reserva). Mesmo modelo Llama 3.3 70B.
  const texto = await chamarLLM(buildSystemPrompt(tipo), conteudo.trim(), 1200);
  const parsed = extrairJSON(texto) as { slides?: unknown[]; legenda?: unknown };
  const slidesRaw = Array.isArray(parsed.slides) ? parsed.slides : [];
  const slides: SlideIA[] = slidesRaw
    .map((s) => {
      const o = (s || {}) as Record<string, unknown>;
      const modo = typeof o.modo === "string" && MODOS_VALIDOS.includes(o.modo as RealceModo) ? (o.modo as RealceModo) : "circulo";
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
