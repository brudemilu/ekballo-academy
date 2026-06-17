import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { createHmac } from "crypto";

// POST /api/recuperar-senha/confirmar
// Body: { identificador: string, codigo: string, senha: string }
//
// Valida o código de 6 dígitos enviado no WhatsApp e, se bater, troca a senha
// (via service_role) e confirma o e-mail — assim o aluno consegue logar mesmo
// se nunca tinha confirmado o e-mail no cadastro.

export const runtime = "nodejs";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const INTERNAL_SECRET = process.env.INTERNAL_SECRET!;

const MAX_TENTATIVAS = 5;

function hashCodigo(codigo: string) {
  return createHmac("sha256", INTERNAL_SECRET).update(codigo).digest("hex");
}

function soDigitos(s: string) {
  return (s || "").replace(/\D+/g, "");
}

export async function POST(req: NextRequest) {
  let body: { identificador?: string; codigo?: string; senha?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }

  const identificador = (body.identificador || "").trim();
  const codigo = soDigitos(body.codigo || "");
  const senha = body.senha || "";

  if (!identificador || codigo.length !== 6) {
    return NextResponse.json(
      { erro: "Informe o código de 6 dígitos que enviamos no WhatsApp." },
      { status: 400 }
    );
  }
  if (senha.length < 6) {
    return NextResponse.json(
      { erro: "A senha precisa ter pelo menos 6 caracteres." },
      { status: 400 }
    );
  }

  if (MOCK) {
    return NextResponse.json({ ok: true, mock: true });
  }

  const admin = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  // 1) Acha o perfil (mesmo critério da solicitação).
  let perfil: { id: string; telefone: string | null } | null = null;
  if (identificador.includes("@")) {
    const { data } = await admin
      .from("profiles")
      .select("id, telefone")
      .ilike("email", identificador)
      .maybeSingle();
    perfil = data;
  } else {
    const sufixo = soDigitos(identificador).slice(-10);
    const { data } = await admin
      .from("profiles")
      .select("id, telefone")
      .not("telefone", "is", null);
    perfil =
      (data || []).find((p) => soDigitos(p.telefone || "").endsWith(sufixo)) ||
      null;
  }

  const erroGenerico = NextResponse.json(
    { erro: "Código inválido ou expirado. Peça um novo." },
    { status: 400 }
  );
  if (!perfil) return erroGenerico;

  // 2) Pega o código vigente (não usado, não expirado) mais recente.
  const agora = new Date();
  const { data: registro } = await admin
    .from("recuperacao_senha")
    .select("id, codigo_hash, tentativas")
    .eq("profile_id", perfil.id)
    .is("usado_em", null)
    .gte("expira_em", agora.toISOString())
    .order("criado_em", { ascending: false })
    .limit(1)
    .maybeSingle();

  if (!registro) return erroGenerico;

  // 3) Excesso de tentativas => invalida e força pedir novo código.
  if (registro.tentativas >= MAX_TENTATIVAS) {
    await admin
      .from("recuperacao_senha")
      .update({ usado_em: agora.toISOString() })
      .eq("id", registro.id);
    return NextResponse.json(
      { erro: "Muitas tentativas. Peça um novo código." },
      { status: 429 }
    );
  }

  // 4) Confere o código.
  if (registro.codigo_hash !== hashCodigo(codigo)) {
    await admin
      .from("recuperacao_senha")
      .update({ tentativas: registro.tentativas + 1 })
      .eq("id", registro.id);
    return NextResponse.json(
      { erro: "Código incorreto. Confira e tente de novo." },
      { status: 400 }
    );
  }

  // 5) Troca a senha e confirma o e-mail (desbloqueia login de conta não confirmada).
  const { error: updErr } = await admin.auth.admin.updateUserById(perfil.id, {
    password: senha,
    email_confirm: true,
  });
  if (updErr) {
    console.error("recuperar-senha/confirmar: falha ao trocar senha", updErr);
    return NextResponse.json(
      { erro: "Não foi possível salvar a nova senha. Tente de novo." },
      { status: 500 }
    );
  }

  // 6) Marca o código como usado.
  await admin
    .from("recuperacao_senha")
    .update({ usado_em: agora.toISOString() })
    .eq("id", registro.id);

  return NextResponse.json({ ok: true });
}
