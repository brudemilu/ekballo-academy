/**
 * Geração de TEXTO por LLM, numa corrente de provedores: o primeiro que
 * responder ganha, e a falha de um passa a vez ao seguinte.
 *
 *   1) Gemini (GEMINI_API_KEY) — camada gratuita do AI Studio. É o melhor
 *      dos gratuitos em português e, principalmente, em FIDELIDADE à fonte:
 *      no teste de out/2026 (issue #189) foi o único que não acrescentou
 *      frase que não estava no texto de origem — o que num ministério é o
 *      critério que manda. Tenta os modelos em ordem (GEMINI_TEXT_MODELS):
 *      os mais novos vivem sobrecarregados (503) na camada gratuita.
 *   2) Groq (GROQ_API_KEY) — rápido e sem teto diário, mas inventa mais.
 *   3) Cloudflare Workers AI — último recurso (10k neurons/dia).
 *
 * Retorna SEMPRE o texto JSON do modelo (string), pro chamador dar extrairJSON.
 */

const GEMINI_BASE = "https://generativelanguage.googleapis.com/v1beta/models";
const GROQ_URL = "https://api.groq.com/openai/v1/chat/completions";
const CF_BASE = "https://api.cloudflare.com/client/v4/accounts";

const GEMINI_MODELOS_PADRAO = ["gemini-3.5-flash", "gemini-2.5-flash"];
// O llama-3.3-70b-versatile, usado até set/2026, saiu do catálogo do Groq: a
// chamada falhava calada e tudo caía no Cloudflare.
const GROQ_MODELO_PADRAO = "openai/gpt-oss-120b";

/** Lista de modelos Gemini a tentar, em ordem ("a, b" na env; padrão se vazia). */
export function modelosGemini(env: string | undefined): string[] {
  const lista = (env || "")
    .split(",")
    .map((m) => m.trim())
    .filter(Boolean);
  return lista.length ? lista : GEMINI_MODELOS_PADRAO;
}

/** Junta o texto das partes da resposta do Gemini; null se veio vazia/bloqueada. */
export function textoDoGemini(json: unknown): string | null {
  const partes = (
    json as { candidates?: { content?: { parts?: { text?: unknown }[] } }[] }
  )?.candidates?.[0]?.content?.parts;
  if (!Array.isArray(partes)) return null;
  const texto = partes
    .map((p) => (typeof p?.text === "string" ? p.text : ""))
    .join("")
    .trim();
  return texto || null;
}

async function viaGemini(
  system: string,
  user: string,
  maxTokens: number,
  timeoutMs: number,
): Promise<string | null> {
  const key = process.env.GEMINI_API_KEY;
  if (!key) return null;
  for (const modelo of modelosGemini(process.env.GEMINI_TEXT_MODELS)) {
    try {
      const res = await fetch(`${GEMINI_BASE}/${modelo}:generateContent`, {
        method: "POST",
        headers: { "x-goog-api-key": key, "Content-Type": "application/json" },
        body: JSON.stringify({
          systemInstruction: { parts: [{ text: system }] },
          contents: [{ role: "user", parts: [{ text: user }] }],
          generationConfig: {
            responseMimeType: "application/json",
            temperature: 0.8,
            // Os modelos 2.5+ gastam parte do teto "pensando"; a folga evita
            // JSON cortado no meio.
            maxOutputTokens: maxTokens + 2048,
          },
        }),
        signal: AbortSignal.timeout(timeoutMs),
      });
      if (!res.ok) continue; // 429 (cota) ou 503 (sobrecarga): tenta o próximo modelo
      const texto = textoDoGemini(await res.json());
      if (texto) return texto;
    } catch {
      // timeout ou rede: tenta o próximo
    }
  }
  return null;
}

async function viaGroq(
  system: string,
  user: string,
  maxTokens: number,
): Promise<string | null> {
  const key = process.env.GROQ_API_KEY;
  if (!key) return null;
  try {
    const res = await fetch(GROQ_URL, {
      method: "POST",
      headers: { Authorization: `Bearer ${key}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        model: process.env.GROQ_TEXT_MODEL?.trim() || GROQ_MODELO_PADRAO,
        messages: [
          { role: "system", content: system },
          { role: "user", content: user },
        ],
        max_tokens: maxTokens,
        temperature: 0.8,
        response_format: { type: "json_object" },
      }),
    });
    if (!res.ok) return null;
    const json = await res.json();
    const content = json?.choices?.[0]?.message?.content;
    return typeof content === "string" && content.trim() ? content : null;
  } catch {
    return null;
  }
}

async function viaCloudflare(
  system: string,
  user: string,
  maxTokens: number,
): Promise<string> {
  const accountId = process.env.CLOUDFLARE_ACCOUNT_ID;
  const apiToken = process.env.CLOUDFLARE_API_TOKEN;
  if (!accountId || !apiToken) {
    throw new Error(
      "Nenhum provedor de IA de texto respondeu (Gemini/Groq/Cloudflare).",
    );
  }
  const res = await fetch(
    `${CF_BASE}/${accountId}/ai/run/@cf/meta/llama-3.3-70b-instruct-fp8-fast`,
    {
      method: "POST",
      headers: {
        Authorization: `Bearer ${apiToken}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        messages: [
          { role: "system", content: system },
          { role: "user", content: user },
        ],
        max_tokens: maxTokens,
      }),
    },
  );
  if (!res.ok)
    throw new Error(
      `Cloudflare texto ${res.status}: ${(await res.text()).slice(0, 200)}`,
    );
  const json = await res.json();
  const raw = json?.result?.response;
  // a Cloudflare pode devolver `response` como objeto JSON já parseado.
  if (raw && typeof raw === "object") return JSON.stringify(raw);
  if (typeof raw === "string") return raw;
  throw new Error("resposta inesperada do modelo");
}

/**
 * Gera texto (JSON) pela corrente Gemini → Groq → Cloudflare. `timeoutMs` é o
 * limite de cada tentativa no Gemini; só pedidos longos (a transcrição de uma
 * pregação inteira) precisam subir o padrão.
 */
export async function chamarLLM(
  system: string,
  user: string,
  maxTokens = 2800,
  timeoutMs = 45_000,
): Promise<string> {
  const gemini = await viaGemini(system, user, maxTokens, timeoutMs);
  if (gemini) return gemini;
  const groq = await viaGroq(system, user, maxTokens);
  if (groq) return groq;
  return viaCloudflare(system, user, maxTokens);
}
