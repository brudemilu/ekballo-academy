/**
 * Geração de TEXTO por LLM com fallback de provedor.
 *
 *   1) GROQ (se GROQ_API_KEY) — Llama 3.3 70B, grátis, rápido, SEM o teto
 *      diário do Cloudflare. API compatível com OpenAI + JSON mode.
 *   2) Cloudflare Workers AI (reserva) — mesmo modelo, mas 10k neurons/dia.
 *
 * Retorna SEMPRE o texto JSON do modelo (string), pro chamador dar extrairJSON.
 * Mantém a mesma "voz": é o mesmo Llama 3.3 70B nos dois provedores.
 */

const GROQ_URL = "https://api.groq.com/openai/v1/chat/completions";
const CF_BASE = "https://api.cloudflare.com/client/v4/accounts";

async function viaGroq(system: string, user: string, maxTokens: number): Promise<string | null> {
  const key = process.env.GROQ_API_KEY;
  if (!key) return null;
  try {
    const res = await fetch(GROQ_URL, {
      method: "POST",
      headers: { Authorization: `Bearer ${key}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        model: "llama-3.3-70b-versatile",
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

async function viaCloudflare(system: string, user: string, maxTokens: number): Promise<string> {
  const accountId = process.env.CLOUDFLARE_ACCOUNT_ID;
  const apiToken = process.env.CLOUDFLARE_API_TOKEN;
  if (!accountId || !apiToken) throw new Error("Nenhum provedor de IA de texto configurado (Groq/Cloudflare).");
  const res = await fetch(`${CF_BASE}/${accountId}/ai/run/@cf/meta/llama-3.3-70b-instruct-fp8-fast`, {
    method: "POST",
    headers: { Authorization: `Bearer ${apiToken}`, "Content-Type": "application/json" },
    body: JSON.stringify({
      messages: [
        { role: "system", content: system },
        { role: "user", content: user },
      ],
      max_tokens: maxTokens,
    }),
  });
  if (!res.ok) throw new Error(`Cloudflare texto ${res.status}: ${(await res.text()).slice(0, 200)}`);
  const json = await res.json();
  const raw = json?.result?.response;
  // a Cloudflare pode devolver `response` como objeto JSON já parseado.
  if (raw && typeof raw === "object") return JSON.stringify(raw);
  if (typeof raw === "string") return raw;
  throw new Error("resposta inesperada do modelo");
}

/** Gera texto (JSON) via Groq, caindo pro Cloudflare se necessário. */
export async function chamarLLM(system: string, user: string, maxTokens = 2800): Promise<string> {
  const groq = await viaGroq(system, user, maxTokens);
  if (groq) return groq;
  return viaCloudflare(system, user, maxTokens);
}
