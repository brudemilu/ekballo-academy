import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Admin edita o cadastro de um discípulo (nome, telefone, turma).
// E-mail e is_admin não são editáveis por aqui.
export async function POST(req: NextRequest) {
  // 1) Admin only
  if (!MOCK) {
    const u = await createServerClient();
    const { data: { user } } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: profile } = await u.from("profiles").select("is_admin").eq("id", user.id).single();
    if (!profile?.is_admin) return NextResponse.json({ erro: "acesso negado" }, { status: 403 });
  }

  let body: { alunoId?: string; nome?: string; telefone?: string; turma?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }

  const alunoId = body.alunoId;
  const nome = (body.nome || "").trim();
  if (!alunoId) return NextResponse.json({ erro: "alunoId obrigatório" }, { status: 400 });
  if (nome.length < 2) return NextResponse.json({ erro: "nome inválido" }, { status: 400 });

  // telefone e turma são opcionais; vazio vira null
  const telefone = body.telefone && body.telefone.trim() ? body.telefone.trim() : null;
  const turma = body.turma && body.turma.trim() ? body.turma.trim() : null;

  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  const { error } = await admin
    .from("profiles")
    .update({ nome, telefone, turma })
    .eq("id", alunoId);

  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  return NextResponse.json({ ok: true });
}
