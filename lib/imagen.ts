/**
 * Helper para gerar imagens de fundo via Google AI Studio (Gemini / Imagen API).
 *
 * Edge-runtime compatível — só usa fetch.
 *
 * Uso típico (dentro de uma route que retorna ImageResponse):
 *   const bgDataUrl = await gerarFundoCinematografico({
 *     tema: "amanhecer sobre montanhas",
 *     aspect: "1:1",
 *   });
 *   // bgDataUrl é null se GEMINI_API_KEY não estiver definido
 *   // (a route deve cair em fallback de gradiente)
 *
 * Chave grátis: https://aistudio.google.com/apikey
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

type GerarParams = {
  tema: string;
  aspect: AspectRatio;
  /** Sobrescreve o modelo do env. */
  model?: string;
};

type GerarResult = {
  dataUrl: string;
  mime: string;
};

// Imagen REST (:predict) — Imagen 3 / Imagen 4
async function callImagenPredict(
  apiKey: string,
  model: string,
  prompt: string,
  aspectRatio: AspectRatio,
): Promise<GerarResult> {
  const url = `${API_BASE}/models/${model}:predict?key=${apiKey}`;
  const body = {
    instances: [{ prompt }],
    parameters: {
      sampleCount: 1,
      aspectRatio,
      personGeneration: "allow_adult",
    },
  };
  const res = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
  if (!res.ok) {
    const txt = await res.text();
    throw new Error(`Imagen API ${res.status}: ${txt.slice(0, 300)}`);
  }
  const json = await res.json();
  const pred = json.predictions?.[0];
  if (!pred?.bytesBase64Encoded) {
    throw new Error("Imagen API: resposta sem imagem");
  }
  const mime = pred.mimeType || "image/png";
  return { dataUrl: `data:${mime};base64,${pred.bytesBase64Encoded}`, mime };
}

// Gemini multimodal (:generateContent) — Nano Banana / Gemini 2.5 Flash Image
async function callGeminiImage(
  apiKey: string,
  model: string,
  prompt: string,
): Promise<GerarResult> {
  const url = `${API_BASE}/models/${model}:generateContent?key=${apiKey}`;
  const body = {
    contents: [{ parts: [{ text: prompt }] }],
    generationConfig: { responseModalities: ["IMAGE", "TEXT"] },
  };
  const res = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });
  if (!res.ok) {
    const txt = await res.text();
    throw new Error(`Gemini API ${res.status}: ${txt.slice(0, 300)}`);
  }
  const json = await res.json();
  const parts = json.candidates?.[0]?.content?.parts || [];
  const imgPart = parts.find((p: { inlineData?: { data?: string } }) => p.inlineData?.data);
  if (!imgPart) throw new Error("Gemini API: resposta sem imagem");
  const mime = imgPart.inlineData.mimeType || "image/png";
  return { dataUrl: `data:${mime};base64,${imgPart.inlineData.data}`, mime };
}

/**
 * Gera um fundo cinematográfico via Imagen ou Gemini Image.
 * Retorna null se a chave não estiver configurada (a route deve usar fallback).
 * Pode lançar erro se a chave estiver configurada mas a chamada falhar.
 */
export async function gerarFundoCinematografico(
  params: GerarParams,
): Promise<GerarResult | null> {
  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey) return null;

  const model =
    params.model ||
    process.env.GEMINI_IMAGE_MODEL ||
    "gemini-2.5-flash-image-preview";
  const prompt = buildPrompt(params.tema, params.aspect);

  const isImagen = /^imagen-/i.test(model);
  return isImagen
    ? await callImagenPredict(apiKey, model, prompt, params.aspect)
    : await callGeminiImage(apiKey, model, prompt);
}

/**
 * Mesma coisa que gerarFundoCinematografico, mas nunca lança:
 * retorna null em qualquer erro. Útil pra rotas que devem cair em fallback.
 */
export async function gerarFundoSafe(params: GerarParams): Promise<GerarResult | null> {
  try {
    return await gerarFundoCinematografico(params);
  } catch (err) {
    console.error("[imagen] erro:", err instanceof Error ? err.message : err);
    return null;
  }
}
