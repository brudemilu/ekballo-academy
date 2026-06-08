// Baixa o áudio (descriptografado) do Evolution e transcreve via Cloudflare
// Whisper. Tudo com as credenciais já configuradas (EVOLUTION_* + CLOUDFLARE_*).

const CF_BASE = "https://api.cloudflare.com/client/v4/accounts";

/** Baixa a mídia descriptografada via /message/downloadimage. Retorna base64. */
export async function baixarAudioBase64(message: unknown): Promise<string | null> {
  const base = (process.env.EVOLUTION_BASE_URL || "").replace(/\/+$/, "");
  const token = process.env.EVOLUTION_INSTANCE_TOKEN;
  if (!base || !token) return null;
  try {
    const res = await fetch(`${base}/message/downloadimage`, {
      method: "POST",
      headers: { "Content-Type": "application/json", apikey: token },
      body: JSON.stringify({ message }),
    });
    if (!res.ok) {
      console.log("[audio] download HTTP", res.status, (await res.text()).slice(0, 200));
      return null;
    }
    const json = await res.json().catch(() => null);
    const d = (json && typeof json === "object" && "data" in json ? (json as Record<string, unknown>).data : json) as
      | Record<string, unknown>
      | string
      | null;
    console.log("[audio] download keys:", JSON.stringify(d && typeof d === "object" ? Object.keys(d) : typeof d));
    let b64: unknown =
      typeof d === "string"
        ? d
        : (d?.base64 ?? d?.Base64 ?? d?.media ?? d?.Media ?? d?.data ?? (json as Record<string, unknown>)?.base64);
    if (!b64 || typeof b64 !== "string") return null;
    return b64.replace(/^data:[^,]+,/, ""); // tira prefixo data: se vier
  } catch (e) {
    console.log("[audio] download erro:", e instanceof Error ? e.message : e);
    return null;
  }
}

/** Transcreve um áudio (base64) com Cloudflare Whisper. */
export async function transcreverAudio(base64: string): Promise<string> {
  const accountId = process.env.CLOUDFLARE_ACCOUNT_ID;
  const apiToken = process.env.CLOUDFLARE_API_TOKEN;
  if (!accountId || !apiToken) throw new Error("Cloudflare não configurado");
  const res = await fetch(`${CF_BASE}/${accountId}/ai/run/@cf/openai/whisper-large-v3-turbo`, {
    method: "POST",
    headers: { Authorization: `Bearer ${apiToken}`, "Content-Type": "application/json" },
    body: JSON.stringify({ audio: base64 }),
  });
  if (!res.ok) throw new Error(`Whisper ${res.status}: ${(await res.text()).slice(0, 200)}`);
  const json = await res.json();
  const r = json?.result || {};
  const texto = r.text || r.transcription || "";
  return typeof texto === "string" ? texto.trim() : "";
}
