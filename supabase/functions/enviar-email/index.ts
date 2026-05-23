// Edge Function: enviar-email
// Aceita dois modos no body:
//   A) { chave, destinatario, variaveis } → busca template em email_templates
//   B) { assunto, html, text?, destinatario } → manda direto sem template (broadcast)
//
// Autenticada via header `x-internal-secret` (compartilhado entre postgres triggers
// e esta função). Não verifica JWT porque é chamada pelos triggers e pela API route
// /api/admin/enviar-mensagem.
//
// Sem dependência externa — só fetch nativo. Acessa email_templates via PostgREST
// e dispara via Brevo HTTP API.

type ModoTemplate = {
  chave: string;
  destinatario: string;
  variaveis?: Record<string, string>;
};

type ModoRaw = {
  assunto: string;
  html: string;
  text?: string;
  destinatario: string;
};

type Payload = ModoTemplate | ModoRaw;

const BREVO_API_KEY = Deno.env.get("BREVO_API_KEY")!;
const BREVO_SENDER_EMAIL = Deno.env.get("BREVO_SENDER_EMAIL")!;
const BREVO_SENDER_NAME = Deno.env.get("BREVO_SENDER_NAME") ?? "Ekballo Academy";
const INTERNAL_SECRET = Deno.env.get("INTERNAL_SECRET")!;
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

function substituirVariaveis(texto: string, vars: Record<string, string>): string {
  let out = texto;
  for (const [key, val] of Object.entries(vars)) {
    const pattern = new RegExp(`\\{\\{\\s*${key}\\s*\\}\\}`, "g");
    out = out.replace(pattern, val ?? "");
  }
  return out;
}

async function buscarTemplate(chave: string): Promise<
  { assunto: string; corpo_html: string; corpo_texto: string | null; ativo: boolean } | null
> {
  const url = `${SUPABASE_URL}/rest/v1/email_templates?chave=eq.${encodeURIComponent(
    chave
  )}&select=assunto,corpo_html,corpo_texto,ativo`;
  const resp = await fetch(url, {
    headers: {
      apikey: SUPABASE_SERVICE_ROLE_KEY,
      Authorization: `Bearer ${SUPABASE_SERVICE_ROLE_KEY}`,
      Accept: "application/json",
    },
  });
  if (!resp.ok) return null;
  const rows = await resp.json();
  return rows[0] ?? null;
}

async function enviarViaBrevo(
  destinatario: string,
  assunto: string,
  html: string,
  text?: string
): Promise<{ ok: boolean; messageId?: string; status: number; body: unknown }> {
  const resp = await fetch("https://api.brevo.com/v3/smtp/email", {
    method: "POST",
    headers: {
      "api-key": BREVO_API_KEY,
      "Content-Type": "application/json",
      accept: "application/json",
    },
    body: JSON.stringify({
      sender: { name: BREVO_SENDER_NAME, email: BREVO_SENDER_EMAIL },
      to: [{ email: destinatario }],
      subject: assunto,
      htmlContent: html,
      ...(text ? { textContent: text } : {}),
    }),
  });
  const body = await resp.json().catch(() => ({}));
  return {
    ok: resp.ok,
    status: resp.status,
    body,
    messageId: (body as { messageId?: string }).messageId,
  };
}

Deno.serve(async (req) => {
  if (req.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  // Auth: header compartilhado com triggers postgres + API route
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

  const { destinatario } = payload as { destinatario: string };
  if (!destinatario) {
    return new Response(
      JSON.stringify({ erro: "destinatario obrigatório" }),
      { status: 400, headers: { "Content-Type": "application/json" } }
    );
  }

  let assunto: string;
  let html: string;
  let text: string | undefined;

  // Modo A: template
  if ("chave" in payload && payload.chave) {
    const variaveis = payload.variaveis ?? {};
    const template = await buscarTemplate(payload.chave);
    if (!template) {
      return new Response(
        JSON.stringify({ erro: "template não encontrado", chave: payload.chave }),
        { status: 404, headers: { "Content-Type": "application/json" } }
      );
    }
    if (!template.ativo) {
      return new Response(
        JSON.stringify({ status: "skipped", motivo: "template desativado" }),
        { status: 200, headers: { "Content-Type": "application/json" } }
      );
    }
    assunto = substituirVariaveis(template.assunto, variaveis);
    html = substituirVariaveis(template.corpo_html, variaveis);
    text = template.corpo_texto
      ? substituirVariaveis(template.corpo_texto, variaveis)
      : undefined;
  }
  // Modo B: raw
  else if ("assunto" in payload && "html" in payload && payload.assunto && payload.html) {
    assunto = payload.assunto;
    html = payload.html;
    text = payload.text;
  } else {
    return new Response(
      JSON.stringify({
        erro:
          "passe 'chave' (modo template) ou 'assunto' + 'html' (modo raw)",
      }),
      { status: 400, headers: { "Content-Type": "application/json" } }
    );
  }

  const result = await enviarViaBrevo(destinatario, assunto, html, text);
  if (!result.ok) {
    console.error("Brevo error", result.status, result.body);
    return new Response(
      JSON.stringify({
        erro: "falha no envio",
        brevo_status: result.status,
        brevo_body: result.body,
      }),
      { status: 502, headers: { "Content-Type": "application/json" } }
    );
  }

  return new Response(
    JSON.stringify({
      status: "enviado",
      destinatario,
      message_id: result.messageId,
    }),
    { status: 200, headers: { "Content-Type": "application/json" } }
  );
});
