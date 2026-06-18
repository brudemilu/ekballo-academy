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

  // Matricular. Só notifica quando a matrícula é NOVA (evita avisar de novo
  // se o admin reabrir/reenviar numa matrícula que já existia).
  const { data: jaExistia } = await admin
    .from("matriculas")
    .select("aluno_id")
    .eq("aluno_id", alunoId)
    .eq("curso_id", cursoId)
    .maybeSingle();

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
  const tituloCurso = curso?.titulo || "Temática";
  const url = curso?.external_path || (curso?.slug ? `/cursos/${curso.slug}` : "/dashboard");

  if (jaExistia) {
    return NextResponse.json({ ok: true, jaMatriculado: true });
  }

  // Curso aberto (Bíblia/Devocional/planos, external_path): auto-matrícula pra
  // todo cadastrado — não faz sentido avisar. Não dispara push nem WhatsApp.
  // Ver regra em lib/destinatarios.ts.
  if (curso?.external_path) {
    return NextResponse.json({ ok: true, curso_aberto: true, notificado: false });
  }

  // 1) Push in-app
  const push = await enviarPush([alunoId], {
    title: "✨ Temática liberada",
    body: `Você foi matriculado em "${tituloCurso}". Toque pra começar.`,
    url,
    tag: `matricula-${cursoId}`,
  });

  // 2) WhatsApp — entra na fila (sai ~1/min via pg_cron). Só se tiver telefone.
  let whatsapp: "enfileirado" | "sem-telefone" | "erro" = "sem-telefone";
  const { data: aluno } = await admin
    .from("profiles")
    .select("nome, telefone")
    .eq("id", alunoId)
    .single();
  const digits = (aluno?.telefone || "").replace(/\D+/g, "");
  if (digits.length >= 10) {
    const primeiroNome = (aluno?.nome || "").trim().split(/\s+/)[0] || "";
    const origin = new URL(req.url).origin;
    const link = url.startsWith("http") ? url : `${origin}${url}`;
    const saudacao = primeiroNome ? `Olá, ${primeiroNome}!` : "Olá!";
    const corpo =
      `${saudacao} 🌱 Você foi liberado(a) na temática *${tituloCurso}* na nossa ` +
      `Mesa de Discipulado. É só entrar e começar no seu ritmo: ${link}. Bons estudos!`;
    const { error: filaErr } = await admin
      .from("whatsapp_fila")
      .insert({ aluno_id: alunoId, telefone: digits, corpo });
    whatsapp = filaErr ? "erro" : "enfileirado";
    if (filaErr) console.error("falha ao enfileirar whatsapp da matrícula", filaErr);
  }

  return NextResponse.json({ ok: true, push, whatsapp });
}
