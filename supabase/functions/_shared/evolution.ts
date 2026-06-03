// Helpers compartilhados das edge functions de WhatsApp (Evolution GO).
//
// Modelo de auth da Evolution GO: o header `apikey` recebe o TOKEN DA INSTÂNCIA
// (a Global API Key só serve pra gerenciar instâncias). Veja `enviar-whatsapp-evolution`.

export const EVOLUTION_BASE_URL = (Deno.env.get("EVOLUTION_BASE_URL") || "").replace(/\/+$/, "");
export const EVOLUTION_INSTANCE_TOKEN = Deno.env.get("EVOLUTION_INSTANCE_TOKEN") || "";

// Resolve o destinatário pro formato que a Evolution espera.
//   - JID (contém "@", ex.: "12036...@g.us" de grupo ou "...@s.whatsapp.net"):
//     usa como está, sem formatar.
//   - Número de telefone: sanitiza pra dígitos e prepende "55" (Brasil) se faltar;
//     deixa o whatsmeow resolver como JID (formatJid: true).
// Retorna null se for um número inválido.
export function resolverDestino(
  input: string
): { number: string; formatJid: boolean; isGrupo: boolean } | null {
  const raw = (input || "").trim();
  if (raw.includes("@")) {
    return { number: raw, formatJid: false, isGrupo: raw.includes("@g.us") };
  }
  const digits = raw.replace(/\D+/g, "");
  let number: string | null = null;
  if (digits.length === 10 || digits.length === 11) number = `55${digits}`;
  else if ((digits.length === 12 || digits.length === 13) && digits.startsWith("55")) number = digits;
  if (!number) return null;
  return { number, formatJid: true, isGrupo: false };
}

// Faz uma chamada autenticada na instância (header apikey = token da instância).
export async function evolutionFetch(
  path: string,
  init?: RequestInit
): Promise<{ ok: boolean; status: number; body: unknown }> {
  const resp = await fetch(`${EVOLUTION_BASE_URL}${path}`, {
    ...init,
    headers: {
      "Content-Type": "application/json",
      apikey: EVOLUTION_INSTANCE_TOKEN,
      ...(init?.headers || {}),
    },
  });
  const body = await resp.json().catch(() => ({}));
  return { ok: resp.ok, status: resp.status, body };
}

// Confere se o segredo server-to-server bate. Retorna Response de erro ou null.
export function checarSegredo(req: Request): Response | null {
  const INTERNAL_SECRET = Deno.env.get("INTERNAL_SECRET") || "";
  const headerSecret = req.headers.get("x-internal-secret");
  if (!headerSecret || headerSecret !== INTERNAL_SECRET) {
    return new Response(JSON.stringify({ erro: "unauthorized" }), {
      status: 401,
      headers: { "Content-Type": "application/json" },
    });
  }
  return null;
}

// Extrai um message id de respostas variadas do Evolution GO.
export function extrairMessageId(body: unknown): string | undefined {
  const b = (body || {}) as Record<string, unknown>;
  const data = (b.data || {}) as Record<string, unknown>;
  const pick = (o: Record<string, unknown>, k: string) =>
    typeof o[k] === "string" ? (o[k] as string) : undefined;
  return pick(data, "id") || pick(data, "ID") || pick(data, "key") || pick(b, "id");
}

export const jsonResponse = (body: unknown, status = 200) =>
  new Response(JSON.stringify(body), {
    status,
    headers: { "Content-Type": "application/json" },
  });
