import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { createHmac, randomInt } from "crypto";

// POST /api/recuperar-senha
// Body: { identificador: string }  // e-mail OU telefone (WhatsApp) cadastrado
//
// Gera um código de 6 dígitos, guarda o HASH em `recuperacao_senha` e envia
// o código no WhatsApp do perfil (canal Evolution GO). Nunca usa e-mail.
//
// Resposta SEMPRE genérica (200) pra não revelar se a conta existe.

export const runtime = "nodejs";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const INTERNAL_SECRET = process.env.INTERNAL_SECRET!;
const FUNCTIONS_BASE = SUPABASE_URL?.replace(
  ".supabase.co",
  ".functions.supabase.co"
);
const EDGE_WHATSAPP_URL = `${FUNCTIONS_BASE}/enviar-whatsapp-evolution`;

const RESPOSTA_GENERICA = {
  ok: true,
  mensagem:
    "Se houver uma conta com WhatsApp cadastrado, enviamos um código por lá.",
};

function hashCodigo(codigo: string) {
  return createHmac("sha256", INTERNAL_SECRET).update(codigo).digest("hex");
}

function soDigitos(s: string) {
  return (s || "").replace(/\D+/g, "");
}

export async function POST(req: NextRequest) {
  let body: { identificador?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }

  const identificador = (body.identificador || "").trim();
  if (!identificador) {
    return NextResponse.json(
      { erro: "Informe seu e-mail ou WhatsApp." },
      { status: 400 }
    );
  }

  // Modo demo: finge sucesso, não toca em nada.
  if (MOCK) {
    return NextResponse.json({ ...RESPOSTA_GENERICA, mock: true });
  }

  const admin = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  // 1) Acha o perfil por e-mail ou por telefone (dígitos).
  let perfil: { id: string; nome: string | null; telefone: string | null } | null =
    null;
  if (identificador.includes("@")) {
    const { data } = await admin
      .from("profiles")
      .select("id, nome, telefone")
      .ilike("email", identificador)
      .maybeSingle();
    perfil = data;
  } else {
    const alvo = soDigitos(identificador);
    if (alvo.length >= 10) {
      // Compara só os últimos 10/11 dígitos pra tolerar DDI/variações de cadastro.
      const sufixo = alvo.slice(-11);
      const { data } = await admin
        .from("profiles")
        .select("id, nome, telefone")
        .not("telefone", "is", null);
      perfil =
        (data || []).find((p) => {
          const d = soDigitos(p.telefone || "");
          return d.endsWith(sufixo.slice(-10)) && d.length >= 10;
        }) || null;
    }
  }

  // 2) Sem perfil ou sem telefone => resposta genérica (sem vazar nada).
  const telefone = soDigitos(perfil?.telefone || "");
  if (!perfil || telefone.length < 10) {
    return NextResponse.json(RESPOSTA_GENERICA);
  }

  // 3) Anti-flood: se já existe código não usado criado há < 45s, não reenvia.
  const agora = new Date();
  const { data: recente } = await admin
    .from("recuperacao_senha")
    .select("criado_em")
    .eq("profile_id", perfil.id)
    .is("usado_em", null)
    .gte("expira_em", agora.toISOString())
    .order("criado_em", { ascending: false })
    .limit(1)
    .maybeSingle();
  if (recente) {
    const idadeMs = agora.getTime() - new Date(recente.criado_em).getTime();
    if (idadeMs < 45_000) {
      return NextResponse.json(RESPOSTA_GENERICA);
    }
  }

  // 4) Invalida códigos anteriores não usados e cria um novo.
  await admin
    .from("recuperacao_senha")
    .update({ usado_em: agora.toISOString() })
    .eq("profile_id", perfil.id)
    .is("usado_em", null);

  const codigo = String(randomInt(0, 1_000_000)).padStart(6, "0");
  const expiraEm = new Date(agora.getTime() + 10 * 60_000); // 10 minutos

  const { error: insErr } = await admin.from("recuperacao_senha").insert({
    profile_id: perfil.id,
    codigo_hash: hashCodigo(codigo),
    expira_em: expiraEm.toISOString(),
  });
  if (insErr) {
    console.error("recuperar-senha: falha ao gravar código", insErr);
    return NextResponse.json(
      { erro: "Não foi possível gerar o código agora. Tente de novo." },
      { status: 500 }
    );
  }

  // 5) Envia o código no WhatsApp (edge Evolution GO).
  const primeiroNome = (perfil.nome || "").trim().split(/\s+/)[0] || "";
  const saudacao = primeiroNome ? `Oi, ${primeiroNome}! ` : "";
  const mensagem =
    `*Ekballo — recuperação de senha*\n\n` +
    `${saudacao}Seu código para criar uma nova senha é:\n\n` +
    `*${codigo}*\n\n` +
    `Ele vale por 10 minutos. Se não foi você que pediu, é só ignorar esta mensagem.`;

  try {
    const resp = await fetch(EDGE_WHATSAPP_URL, {
      method: "POST",
      headers: {
        "x-internal-secret": INTERNAL_SECRET,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ destinatario: telefone, mensagem }),
    });
    if (!resp.ok) {
      const detalhe = await resp.json().catch(() => ({}));
      console.error("recuperar-senha: falha no envio WhatsApp", resp.status, detalhe);
      return NextResponse.json(
        { erro: "Não foi possível enviar o código no WhatsApp agora. Tente de novo em instantes." },
        { status: 502 }
      );
    }
  } catch (e) {
    console.error("recuperar-senha: erro ao chamar edge WhatsApp", e);
    return NextResponse.json(
      { erro: "Não foi possível enviar o código no WhatsApp agora. Tente de novo em instantes." },
      { status: 502 }
    );
  }

  return NextResponse.json(RESPOSTA_GENERICA);
}
