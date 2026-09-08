import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { enviarPush } from "@/lib/push";

export async function POST(req: NextRequest) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  const body = await req.json().catch(() => null);
  if (!body?.titulo || !body?.mensagem) {
    return NextResponse.json({ erro: "titulo e mensagem obrigatórios" }, { status: 400 });
  }

  const { data: perfil } = await supabase.from("profiles").select("is_admin").eq("id", user.id).single();
  if (!perfil?.is_admin) {
    return NextResponse.json({ erro: "somente admin" }, { status: 403 });
  }

  // Só quem tem o English liberado — mandar push de um curso que a
  // pessoa não enxerga é ruído puro.
  const { data: alunos } = await supabase
    .from("profiles")
    .select("id")
    .eq("is_admin", false)
    .eq("english_liberado", true);
  const alunoIds = (alunos || []).map((a: { id: string }) => a.id);

  const resultado = await enviarPush(alunoIds, {
    title: body.titulo,
    body: body.mensagem,
    url: "/english/jornada",
    tag: "ekballo-english-reminder",
  });

  return NextResponse.json({ ok: true, ...resultado });
}
