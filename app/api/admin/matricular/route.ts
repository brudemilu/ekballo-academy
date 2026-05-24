import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";
import { enviarPush } from "@/lib/push";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Admin matricula/desmatricula aluno em curso. Se matricular,
// dispara push notification pro aluno.
export async function POST(req: NextRequest) {
  // 1) Admin only
  if (!MOCK) {
    const u = await createServerClient();
    const { data: { user } } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: profile } = await u.from("profiles").select("is_admin").eq("id", user.id).single();
    if (!profile?.is_admin) return NextResponse.json({ erro: "acesso negado" }, { status: 403 });
  }

  let body: { alunoId?: string; cursoId?: string; acao?: "matricular" | "desmatricular" };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }
  const { alunoId, cursoId, acao } = body;
  if (!alunoId || !cursoId || (acao !== "matricular" && acao !== "desmatricular")) {
    return NextResponse.json({ erro: "alunoId, cursoId e acao válidos obrigatórios" }, { status: 400 });
  }

  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  if (acao === "desmatricular") {
    const { error } = await admin
      .from("matriculas")
      .delete()
      .eq("aluno_id", alunoId)
      .eq("curso_id", cursoId);
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
    return NextResponse.json({ ok: true });
  }

  // Matricular
  const { error } = await admin
    .from("matriculas")
    .upsert({ aluno_id: alunoId, curso_id: cursoId }, { onConflict: "aluno_id,curso_id" });
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });

  // Resolve título do curso e slug pra montar URL útil
  const { data: curso } = await admin
    .from("cursos")
    .select("titulo, slug, external_path")
    .eq("id", cursoId)
    .single();
  const tituloCurso = curso?.titulo || "Curso";
  const url = curso?.external_path || (curso?.slug ? `/cursos/${curso.slug}` : "/dashboard");

  const push = await enviarPush([alunoId], {
    title: "✨ Curso liberado",
    body: `Você foi matriculado em "${tituloCurso}". Toque pra começar.`,
    url,
    tag: `matricula-${cursoId}`,
  });

  return NextResponse.json({ ok: true, push });
}
