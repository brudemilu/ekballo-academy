// Helpers compartilhados das edge functions de WhatsApp.
//
// GATEWAY: Evolution API v2 (`evoapicloud/evolution-api`), rodando no próprio
// box em https://evolution.escoladodiscipuloimw.com.br.
//
// Antes usávamos a Evolution GO em evogo.7iegroup.com.br, de terceiro. Ela
// quebrou em ago/2026 de um jeito que não dava pra consertar de fora: aceitava
// gravar configuração na instância, mas nunca subia o cliente do WhatsApp —
// sem QR, sem código de pareamento, e sem endpoint de start. Como o box já
// rodava um Evolution v2 saudável, migramos pra ele: some a dependência de
// infraestrutura de terceiro, que era a fragilidade de fundo.
//
// DIFERENÇAS QUE IMPORTAM entre a GO e a v2:
//   • a rota carrega o NOME da instância: /message/sendText/{instancia}
//   • `apikey` é a chave global do servidor (ou a apikey da instância)
//   • não existe /instance/qr: o QR e o código de pareamento vêm na resposta
//     de GET /instance/connect/{instancia}
//   • áudio tem endpoint próprio (sendWhatsAppAudio), não cabe no sendMedia
//
// Env vars (Supabase Edge Function secrets):
//   EVOLUTION_BASE_URL       ex: https://evolution.escoladodiscipuloimw.com.br
//   EVOLUTION_APIKEY         chave da API (aceita EVOLUTION_INSTANCE_TOKEN como
//                            nome antigo, pra não quebrar quem ainda tem o velho)
//   EVOLUTION_INSTANCE_NAME  nome da instância (default "ekballo")
//   INTERNAL_SECRET          segredo compartilhado server-to-server

export const EVOLUTION_BASE_URL = (Deno.env.get("EVOLUTION_BASE_URL") || "").replace(/\/+$/, "");

export const EVOLUTION_APIKEY =
  Deno.env.get("EVOLUTION_APIKEY") || Deno.env.get("EVOLUTION_INSTANCE_TOKEN") || "";

export const EVOLUTION_INSTANCE = Deno.env.get("EVOLUTION_INSTANCE_NAME") || "ekballo";

/** Monta o caminho com o nome da instância no fim, como a v2 exige. */
export const rota = (prefixo: string) => `${prefixo}/${EVOLUTION_INSTANCE}`;

/**
 * Resolve o destinatário pro formato que a v2 espera no campo `number`.
 *   - JID de grupo ("...@g.us"): vai inteiro, é assim que a v2 identifica grupo.
 *   - JID de usuário ("...@s.whatsapp.net"): reduz aos dígitos; a v2 resolve.
 *   - Telefone: sanitiza e prepende "55" quando vier sem o código do país.
 * Retorna null se o número for inválido.
 */
export function resolverDestino(
  input: string,
): { number: string; isGrupo: boolean } | null {
  const raw = (input || "").trim();

  if (raw.includes("@g.us")) return { number: raw, isGrupo: true };

  const digits = raw.replace(/\D+/g, "");
  let number: string | null = null;
  if (digits.length === 10 || digits.length === 11) number = `55${digits}`;
  else if ((digits.length === 12 || digits.length === 13) && digits.startsWith("55")) number = digits;
  if (!number) return null;

  return { number, isGrupo: false };
}

/** Chamada autenticada na Evolution v2. `path` já vem no formato da v2. */
export async function evolutionFetch(
  path: string,
  init?: RequestInit,
): Promise<{ ok: boolean; status: number; body: unknown }> {
  const resp = await fetch(`${EVOLUTION_BASE_URL}${path}`, {
    ...init,
    headers: {
      "Content-Type": "application/json",
      apikey: EVOLUTION_APIKEY,
      ...(init?.headers || {}),
    },
  });
  const body = await resp.json().catch(() => ({}));
  return { ok: resp.ok, status: resp.status, body };
}

/** Confere se o segredo server-to-server bate. Retorna Response de erro ou null. */
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

/** Extrai o id da mensagem. Na v2 vem em `key.id`; os demais são defensivos. */
export function extrairMessageId(body: unknown): string | undefined {
  const b = (body || {}) as Record<string, unknown>;
  const key = (b.key || {}) as Record<string, unknown>;
  if (typeof key.id === "string") return key.id;
  const data = (b.data || {}) as Record<string, unknown>;
  const dataKey = (data.key || {}) as Record<string, unknown>;
  if (typeof dataKey.id === "string") return dataKey.id;
  if (typeof data.id === "string") return data.id;
  if (typeof b.id === "string") return b.id;
  return undefined;
}

export const jsonResponse = (body: unknown, status = 200) =>
  new Response(JSON.stringify(body), {
    status,
    headers: { "Content-Type": "application/json" },
  });
