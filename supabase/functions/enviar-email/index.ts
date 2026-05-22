// Edge Function: enviar-email
// Recebe { chave, destinatario, variaveis } e dispara o template via Resend.
// Autenticada via header `x-internal-secret` (compartilhado entre postgres triggers
// e esta função). Não verifica JWT porque é chamada pelos próprios triggers.
//
// Sem dependência externa — só fetch nativo. Acessa a tabela email_templates via
// PostgREST (SUPABASE_URL + service_role) e o Resend via API REST.

type Payload = {
  chave: string;
  destinatario: string;
  variaveis?: Record<string, string>;
};

const RESEND_API_KEY = Deno.env.get("RESEND_API_KEY")!;
const FROM_EMAIL = Deno.env.get("FROM_EMAIL") ?? "onboarding@resend.dev";
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

  const resendResp = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: {
      Authorization: `Bearer ${RESEND_API_KEY}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      from: FROM_EMAIL,
      to: [destinatario],
      subject: assunto,
      html,
      ...(text ? { text } : {}),
    }),
  });

  const resendBody = await resendResp.json().catch(() => ({}));
  if (!resendResp.ok) {
    console.error("Resend error", resendResp.status, resendBody);
    return new Response(
      JSON.stringify({
        erro: "falha no envio",
        resend_status: resendResp.status,
        resend_body: resendBody,
      }),
      { status: 502, headers: { "Content-Type": "application/json" } }
    );
  }

  return new Response(
    JSON.stringify({
      status: "enviado",
      chave,
      destinatario,
      resend_id: resendBody.id,
    }),
    { status: 200, headers: { "Content-Type": "application/json" } }
  );
});
