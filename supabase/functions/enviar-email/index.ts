// Edge Function: enviar-email
// Recebe { chave, destinatario, variaveis } e dispara o template via Brevo.
// Autenticada via header `x-internal-secret` (compartilhado entre postgres triggers
// e esta função). Não verifica JWT porque é chamada pelos próprios triggers.
//
// Sem dependência externa — só fetch nativo. Acessa a tabela email_templates via
// PostgREST (SUPABASE_URL + service_role) e o Brevo via API REST.

type Payload = {
  chave: string;
  destinatario: string;
  variaveis?: Record<string, string>;
};

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

Deno.serve(async (req) => {
  if (req.method !== "POST") {
    return new Response("Method not allowed", { status: 405 });
  }

  // Auth: header compartilhado com triggers postgres
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

  const { chave, destinatario, variaveis = {} } = payload;
  if (!chave || !destinatario) {
    return new Response(
      JSON.stringify({ erro: "chave e destinatario são obrigatórios" }),
      { status: 400, headers: { "Content-Type": "application/json" } }
    );
  }

  const template = await buscarTemplate(chave);
  if (!template) {
    return new Response(
      JSON.stringify({ erro: "template não encontrado", chave }),
      { status: 404, headers: { "Content-Type": "application/json" } }
    );
  }

  if (!template.ativo) {
    return new Response(
      JSON.stringify({ status: "skipped", motivo: "template desativado" }),
      { status: 200, headers: { "Content-Type": "application/json" } }
    );
  }

  const assunto = substituirVariaveis(template.assunto, variaveis);
  const html = substituirVariaveis(template.corpo_html, variaveis);
  const text = template.corpo_texto
    ? substituirVariaveis(template.corpo_texto, variaveis)
    : undefined;

  // Dispara via Brevo
  const brevoResp = await fetch("https://api.brevo.com/v3/smtp/email", {
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

  const brevoBody = await brevoResp.json().catch(() => ({}));
  if (!brevoResp.ok) {
    console.error("Brevo error", brevoResp.status, brevoBody);
    return new Response(
      JSON.stringify({
        erro: "falha no envio",
        brevo_status: brevoResp.status,
        brevo_body: brevoBody,
      }),
      { status: 502, headers: { "Content-Type": "application/json" } }
    );
  }

  return new Response(
    JSON.stringify({
      status: "enviado",
      chave,
      destinatario,
      message_id: brevoBody.messageId,
    }),
    { status: 200, headers: { "Content-Type": "application/json" } }
  );
});
