/**
 * Helper para gerar imagens de fundo via backends possíveis:
 *
 *   - "cloudflare" (DEFAULT)
 *       Cloudflare Workers AI (FLUX.1 schnell). Grátis até 10k neurons/dia
 *       (~100 imagens), sem cartão. Precisa CLOUDFLARE_ACCOUNT_ID +
 *       CLOUDFLARE_API_TOKEN. A imagem volta como data URL embutida (base64),
 *       então o Satori não faz fetch externo — render resiliente.
 *
 *   - "pollinations"
 *       Era grátis sem chave via https://image.pollinations.ai, mas em 2026 o
 *       acesso anônimo foi descontinuado (endpoint legado responde 402 paywall
 *       x402). Mantido só por compatibilidade — não funciona mais sem chave.
 *
 *   - "gemini"
 *       Google AI Studio (Imagen 4 ou Gemini Image). Precisa GEMINI_API_KEY
 *       e BILLING ATIVO no projeto (o free tier de imagem foi zerado).
 *       Melhor qualidade fotográfica.
 *
 * Edge-runtime compatível.
 *
 * Trocar backend: defina IMAGE_BACKEND no .env.local + Vercel.
 */

const API_BASE = "https://generativelanguage.googleapis.com/v1beta";

export type AspectRatio = "1:1" | "4:5" | "9:16" | "16:9" | "3:4";

// Estilo fotográfico moderno. Só paisagem/natureza/luz/textura — NUNCA
// pessoas, rostos ou figuras religiosas. O Flux (Pollinations) não tem campo
// negative_prompt separado, então as exclusões vão embutidas no texto.
const ESTILO_MODERNO = [
  "modern cinematic landscape photography, ultra detailed, high resolution, 35mm",
  "natural scenery only — vast skies, mountains, ocean, fields, forests, deserts, rivers, clouds, mist, light",
  "soft volumetric god rays, warm golden hour or serene blue hour light",
  "deep atmospheric depth, contemplative and reverent mood",
  "clean modern color grading, gentle film grain, elegant minimalism",
  "wide minimalist composition with generous empty negative space for typography overlay",
].join(", ");

// Exclusões fortes — repetidas pra o Flux levar a sério.
const EXCLUSOES = [
  "no people",
  "no person",
  "no human",
  "no human figure",
  "no face",
  "no faces",
  "no portrait",
  "no hands",
  "no crowd",
  "no jesus",
  "no christ figure",
  "no crucifix",
  "no crucifixion",
  "no cross with a body",
  "no religious statue",
  "no saints",
  "no text",
  "no letters",
  "no words",
  "no watermark",
  "no logo",
].join(", ");

function buildPrompt(tema: string, aspect: AspectRatio): string {
  return `${tema.trim()}. ${ESTILO_MODERNO}. ${EXCLUSOES}. Aspect ratio ${aspect}.`;
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
  /** Seed pra variar a foto de forma determinística (ex.: dia do ano, nº capítulo). */
  seed?: number;
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
function gerarPollinations({ tema, aspect, seed }: GerarParams): GerarResult {
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
  if (typeof seed === "number" && Number.isFinite(seed)) {
    params.set("seed", String(Math.abs(Math.trunc(seed))));
  }
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
// Backend 3: Cloudflare Workers AI — FLUX.1 schnell (grátis, 10k neurons/dia)
// ----------------------------------------------------------------------------
// flux-1-schnell devolve JPEG em base64 DENTRO de um JSON e gera sempre
// 1024×1024 (não aceita width/height). O recorte pro formato final (1:1 feed
// ou 9:16 story) é feito pelo objectFit:cover do <img> no template. Como
// retornamos uma data URL embutida, o Satori não faz fetch externo — se a
// chamada falhar, gerarFundoSafe captura e cai no gradiente (nunca quebra a
// imagem inteira). Precisa CLOUDFLARE_ACCOUNT_ID + CLOUDFLARE_API_TOKEN
// (token com permissão Workers AI).
async function gerarCloudflare(
  params: GerarParams,
): Promise<GerarResult | null> {
  const accountId = process.env.CLOUDFLARE_ACCOUNT_ID;
  const apiToken = process.env.CLOUDFLARE_API_TOKEN;
  if (!accountId || !apiToken) return null;

  const model = params.model || "@cf/black-forest-labs/flux-1-schnell";
  const prompt = buildPrompt(params.tema, params.aspect);
  const seed =
    typeof params.seed === "number" && Number.isFinite(params.seed)
      ? Math.abs(Math.trunc(params.seed))
      : undefined;

  const url = `https://api.cloudflare.com/client/v4/accounts/${accountId}/ai/run/${model}`;
  const res = await fetch(url, {
    method: "POST",
    headers: {
      Authorization: `Bearer ${apiToken}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      prompt,
      steps: 8, // máx do schnell; melhor qualidade ainda dentro do free tier
      ...(seed !== undefined ? { seed } : {}),
    }),
  });
  if (!res.ok) {
    throw new Error(
      `Cloudflare AI ${res.status}: ${(await res.text()).slice(0, 300)}`,
    );
  }
  const json = await res.json();
  const b64 = json?.result?.image;
  if (!json?.success || !b64) {
    throw new Error(
      "Cloudflare AI: resposta sem imagem — " +
        JSON.stringify(json?.errors || json).slice(0, 300),
    );
  }
  return { src: `data:image/jpeg;base64,${b64}`, backend: "cloudflare" };
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
  const backend = (process.env.IMAGE_BACKEND || "cloudflare").toLowerCase();
  if (backend === "pollinations") return gerarPollinations(params);
  if (backend === "gemini") return gerarGemini(params);
  // Default e qualquer valor desconhecido: cloudflare.
  return gerarCloudflare(params);
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
