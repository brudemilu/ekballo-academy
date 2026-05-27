/**
 * Helper para gerar imagens de fundo via dois backends possíveis:
 *
 *   - "pollinations" (DEFAULT)
 *       100% grátis, sem chave, sem limite. Usa Flux Schnell via
 *       https://image.pollinations.ai. Retornamos a URL diretamente — o
 *       Satori (ImageResponse) faz fetch ao renderizar.
 *
 *   - "gemini"
 *       Google AI Studio (Imagen 4 ou Gemini Image). Precisa GEMINI_API_KEY
 *       e BILLING ATIVO no projeto (atualmente o free tier de imagem está
 *       zerado). Melhor qualidade fotográfica.
 *
 * Edge-runtime compatível.
 *
 * Trocar backend: defina IMAGE_BACKEND=gemini no .env.local + Vercel.
 */

const API_BASE = "https://generativelanguage.googleapis.com/v1beta";

export type AspectRatio = "1:1" | "4:5" | "9:16" | "16:9" | "3:4";

const ESTILO_CINEMATOGRAFICO = [
  "cinematic photography, ultra detailed, 35mm film aesthetic",
  "soft volumetric god rays, warm golden hour light",
  "deep atmospheric depth, moody and reverent mood",
  "rich shadows with delicate highlights, painterly quality",
  "subtle film grain, refined color grading with warm amber and deep navy tones",
  "centered composition with generous negative space in the middle for typography overlay",
  "no text, no letters, no watermarks, no logos, no people staring at camera",
  "sacred, contemplative, biblical atmosphere",
].join(", ");

function buildPrompt(tema: string, aspect: AspectRatio): string {
  return `${tema.trim()}. ${ESTILO_CINEMATOGRAFICO}. Aspect ratio ${aspect}.`;
}

function dimensoesPorAspect(aspect: AspectRatio): { w: number; h: number } {
  switch (aspect) {
    case "9:16":
      return { w: 1024, h: 1820 };
    case "16:9":
      return { w: 1820, h: 1024 };
    case "4:5":
      return { w: 1024, h: 1280 };
    case "3:4":
      return { w: 1024, h: 1365 };
    case "1:1":
    default:
      return { w: 1024, h: 1024 };
  }
}

type GerarParams = {
  tema: string;
  aspect: AspectRatio;
  /** Sobrescreve o modelo do env (só usado quando backend=gemini). */
  model?: string;
};

export type GerarResult = {
  /** URL ou data URL que pode ser passada direto pro <img src> no Satori. */
  src: string;
  /** "pollinations" | "gemini" — qual backend serviu. */
  backend: string;
};

// ----------------------------------------------------------------------------
// Backend 1: Pollinations.ai (grátis, sem chave)
// ----------------------------------------------------------------------------
function gerarPollinations({ tema, aspect }: GerarParams): GerarResult {
  const { w, h } = dimensoesPorAspect(aspect);
  const prompt = buildPrompt(tema, aspect);
  const params = new URLSearchParams({
    width: String(w),
    height: String(h),
    model: "flux",
    nologo: "true",
    enhance: "true",
    private: "true",
  });
  const src = `https://image.pollinations.ai/prompt/${encodeURIComponent(prompt)}?${params.toString()}`;
  return { src, backend: "pollinations" };
}

// ----------------------------------------------------------------------------
// Backend 2: Google Imagen / Gemini (precisa GEMINI_API_KEY + billing)
// ----------------------------------------------------------------------------
async function callImagenPredict(
  apiKey: string,
  model: string,
  prompt: string,
  aspectRatio: AspectRatio,
): Promise<{ dataUrl: string }> {
  const url = `${API_BASE}/models/${model}:predict?key=${apiKey}`;
  const res = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      instances: [{ prompt }],
      parameters: {
        sampleCount: 1,
        aspectRatio,
        personGeneration: "allow_adult",
      },
    }),
  });
  if (!res.ok) throw new Error(`Imagen API ${res.status}: ${(await res.text()).slice(0, 300)}`);
  const json = await res.json();
  const pred = json.predictions?.[0];
  if (!pred?.bytesBase64Encoded) throw new Error("Imagen: resposta sem imagem");
  return {
    dataUrl: `data:${pred.mimeType || "image/png"};base64,${pred.bytesBase64Encoded}`,
  };
}

async function callGeminiImage(
  apiKey: string,
  model: string,
  prompt: string,
): Promise<{ dataUrl: string }> {
  const url = `${API_BASE}/models/${model}:generateContent?key=${apiKey}`;
  const res = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      contents: [{ parts: [{ text: prompt }] }],
      generationConfig: { responseModalities: ["IMAGE", "TEXT"] },
    }),
  });
  if (!res.ok) throw new Error(`Gemini API ${res.status}: ${(await res.text()).slice(0, 300)}`);
  const json = await res.json();
  const parts = json.candidates?.[0]?.content?.parts || [];
  const imgPart = parts.find((p: { inlineData?: { data?: string } }) => p.inlineData?.data);
  if (!imgPart) throw new Error("Gemini: resposta sem imagem");
  return {
    dataUrl: `data:${imgPart.inlineData.mimeType || "image/png"};base64,${imgPart.inlineData.data}`,
  };
}

async function gerarGemini(params: GerarParams): Promise<GerarResult | null> {
  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey) return null;
  const model = params.model || process.env.GEMINI_IMAGE_MODEL || "imagen-4.0-generate-001";
  const prompt = buildPrompt(params.tema, params.aspect);
  const isImagen = /^imagen-/i.test(model);
  const r = isImagen
    ? await callImagenPredict(apiKey, model, prompt, params.aspect)
    : await callGeminiImage(apiKey, model, prompt);
  return { src: r.dataUrl, backend: "gemini" };
}

// ----------------------------------------------------------------------------
// Dispatch público
// ----------------------------------------------------------------------------

/**
 * Gera um fundo cinematográfico via backend configurado.
 * Retorna null se nada conseguir gerar (a route cai em fallback de gradiente).
 */
export async function gerarFundoCinematografico(
  params: GerarParams,
): Promise<GerarResult | null> {
  const backend = (process.env.IMAGE_BACKEND || "pollinations").toLowerCase();
  if (backend === "gemini") return gerarGemini(params);
  // Default e qualquer valor desconhecido: pollinations.
  return gerarPollinations(params);
}

/**
 * Mesma coisa, mas nunca lança — retorna null em qualquer erro.
 * Pollinations não chama API no servidor (Satori faz o fetch), então em
 * tese nunca lança aqui; o erro só apareceria se o Satori não conseguisse
 * baixar a imagem ao renderizar (aí cai no fallback do template).
 */
export async function gerarFundoSafe(params: GerarParams): Promise<GerarResult | null> {
  try {
    return await gerarFundoCinematografico(params);
  } catch (err) {
    console.error("[imagen] erro:", err instanceof Error ? err.message : err);
    return null;
  }
}
