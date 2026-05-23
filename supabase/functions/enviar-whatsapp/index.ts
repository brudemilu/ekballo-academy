// Edge Function: enviar-whatsapp
// Dispara mensagem de texto via Z-API (https://z-api.io).
//
// Body (POST):
//   { destinatario: "5511999998888", mensagem: "Olá, ..." }
//
// destinatario: string de dígitos com country code, sem "+". Aceita também
// formato com 11 dígitos (BR) e prepende "55" automaticamente. Aceita
// também com "+" e caracteres de formatação — sanitiza antes de enviar.
//
// Autenticada via header `x-internal-secret` (compartilhado com a API route
// /api/admin/enviar-mensagem). Não verifica JWT porque é chamada server-to-server.
//
// Env vars (configurar via Supabase Edge Function secrets):
//   ZAPI_INSTANCE_ID, ZAPI_TOKEN, ZAPI_CLIENT_TOKEN, INTERNAL_SECRET

const ZAPI_INSTANCE_ID = Deno.env.get("ZAPI_INSTANCE_ID")!;
const ZAPI_TOKEN = Deno.env.get("ZAPI_TOKEN")!;
const ZAPI_CLIENT_TOKEN = Deno.env.get("ZAPI_CLIENT_TOKEN")!;
const INTERNAL_SECRET = Deno.env.get("INTERNAL_SECRET")!;

type Payload = {
  destinatario: string;
  mensagem: string;
};

// Sanitiza pra dígitos puros e prepende "55" (Brasil) se faltar
function normalizePhone(input: string): string | null {
  const digits = (input || "").replace(/\D+/g, "");
  if (digits.length === 10 || digits.length === 11) return `55${digits}`;
  if (digits.length === 12 || digits.length === 13) {
    if (digits.startsWith("55")) return digits;
  }
  return null;
}

async function enviarViaZApi(
  phone: string,
  message: string
): Promise<{ ok: boolean; messageId?: string; status: number; body: unknown }> {
  const url = `https://api.z-api.io/instances/${ZAPI_INSTANCE_ID}/token/${ZAPI_TOKEN}/send-text`;
  const resp = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Client-Token": ZAPI_CLIENT_TOKEN,
    },
    body: JSON.stringify({ phone, message }),
  });
  const body = await resp.json().catch(() => ({}));
  return {
    ok: resp.ok,
    status: resp.status,
    body,
    messageId:
      (body as { messageId?: string; id?: string; zaapId?: string }).messageId ||
      (body as { id?: string }).id ||
      (body as { zaapId?: string }).zaapId,
  };
}

Deno.serve(async (req) => {
  if (req.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  const headerSecret = req.headers.get("x-internal-secret");
  if (!headerSecret || headerSecret !== INTERNAL_SECRET) {
    return new Response(JSON.stringify({ erro: "unauthorized" }), {
      status: 401,
      headers: { "Content-Type": "application/json" },
    });
  }

  let payload: Payload;
  try {
    payload = await req.json();
  } catch {
    return new Response(JSON.stringify({ erro: "body inválido" }), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }

  const phone = normalizePhone(payload.destinatario || "");
  if (!phone) {
    return new Response(
      JSON.stringify({ erro: "telefone inválido", destinatario: payload.destinatario }),
      { status: 400, headers: { "Content-Type": "application/json" } }
    );
  }

  const mensagem = (payload.mensagem || "").trim();
  if (!mensagem) {
    return new Response(JSON.stringify({ erro: "mensagem obrigatória" }), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }

  const result = await enviarViaZApi(phone, mensagem);
  if (!result.ok) {
    console.error("Z-API error", result.status, result.body);
    return new Response(
      JSON.stringify({
        erro: "falha no envio",
        zapi_status: result.status,
        zapi_body: result.body,
      }),
      { status: 502, headers: { "Content-Type": "application/json" } }
    );
  }

  return new Response(
    JSON.stringify({
      status: "enviado",
      destinatario: phone,
      message_id: result.messageId,
    }),
    { status: 200, headers: { "Content-Type": "application/json" } }
  );
});
