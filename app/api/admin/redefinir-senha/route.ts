import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Admin define uma senha nova para um discípulo — o que antes só dava pra
// fazer por SQL no banco. A senha NUNCA é registrada em log; só volta na
// resposta pra quem pediu, pra ele repassar à pessoa.
export async function POST(req: NextRequest) {
  let souMaster = MOCK;
  if (!MOCK) {
    const u = await createServerClient();
    const {
      data: { user },
    } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: profile } = await u
      .from("profiles")
      .select("is_admin, papel")
      .eq("id", user.id)
      .single();
    if (!profile?.is_admin) {
      return NextResponse.json({ erro: "acesso negado" }, { status: 403 });
    }
    souMaster = profile.papel === "master" || (!!profile.is_admin && !profile.papel);
  }

  let body: { alunoId?: string; senha?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }

  const alunoId = (body.alunoId || "").trim();
  const senha = body.senha || "";
  if (!alunoId) return NextResponse.json({ erro: "alunoId obrigatório" }, { status: 400 });
  if (senha.length < 6) {
    return NextResponse.json(
      { erro: "A senha precisa ter pelo menos 6 caracteres." },
      { status: 400 },
    );
  }

  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  // Só o master mexe na senha de outro admin — senão um coordenador poderia
  // tomar a conta de quem está acima dele.
  const { data: alvo } = await admin
    .from("profiles")
    .select("is_admin, nome")
    .eq("id", alunoId)
    .single();
  if (!alvo) return NextResponse.json({ erro: "discípulo não encontrado" }, { status: 404 });
  if (alvo.is_admin && !souMaster) {
    return NextResponse.json(
      { erro: "Só o master pode redefinir a senha de outro administrador." },
      { status: 403 },
    );
  }

  const { error } = await admin.auth.admin.updateUserById(alunoId, { password: senha });
  if (error) {
    return NextResponse.json({ erro: error.message }, { status: 500 });
  }

  return NextResponse.json({ ok: true });
}
