import { createClient } from "@supabase/supabase-js";
import { type NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Admin libera o acesso de quem acabou de se cadastrar, com um toque.
//
// Rota própria, e não /api/admin/atualizar-aluno, porque aquela regrava a
// ficha inteira: exige nome e apaga telefone e turma quando não vêm no corpo.
// Aqui só existe um efeito possível — acesso_liberado = true.
export async function POST(req: NextRequest) {
  if (!MOCK) {
    const u = await createServerClient();
    const {
      data: { user },
    } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: profile } = await u
      .from("profiles")
      .select("is_admin")
      .eq("id", user.id)
      .single();
    if (!profile?.is_admin)
      return NextResponse.json({ erro: "acesso negado" }, { status: 403 });
  }

  let body: { alunoId?: unknown };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }
  const alunoId = typeof body.alunoId === "string" ? body.alunoId : "";
  if (!alunoId)
    return NextResponse.json({ erro: "alunoId obrigatório" }, { status: 400 });

  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });
  const { data, error } = await admin
    .from("profiles")
    .update({ acesso_liberado: true })
    .eq("id", alunoId)
    .select("id");
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  if (!data || data.length === 0)
    return NextResponse.json({ erro: "cadastro não encontrado" }, { status: 404 });
  return NextResponse.json({ ok: true });
}
