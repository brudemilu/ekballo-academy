import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";
import { enviarPush } from "@/lib/push";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Admin posta/atualiza devolutiva pastoral em uma resposta.
// Body: { respostaId, texto }
// Após salvar, dispara push pro aluno (se inscrito).
export async function POST(req: NextRequest) {
  // 1) Admin only
  if (!MOCK) {
    const u = await createServerClient();
    const { data: { user } } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: profile } = await u.from("profiles").select("is_admin").eq("id", user.id).single();
    if (!profile?.is_admin) return NextResponse.json({ erro: "acesso negado" }, { status: 403 });
  }

  let body: { respostaId?: string; texto?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }
  const { respostaId } = body;
  const texto = (body.texto || "").trim();
  if (!respostaId) {
    return NextResponse.json({ erro: "respostaId obrigatório" }, { status: 400 });
  }

  if (MOCK) {
    return NextResponse.json({ ok: true, mock: true });
  }

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  // 2) Atualiza resposta
  const novo = {
    comentario_lider: texto || null,
    comentario_lider_em: texto ? new Date().toISOString() : null,
  };
  const { data: respostaRow, error: updErr } = await admin
    .from("respostas")
    .update(novo)
    .eq("id", respostaId)
    .select("aluno_id, atividade_id")
    .single();
  if (updErr || !respostaRow) {
    return NextResponse.json({ erro: updErr?.message || "falha no update" }, { status: 500 });
  }

  // Se texto vazio (limpando devolutiva), não dispara push
  if (!texto) return NextResponse.json({ ok: true, push: { enviados: 0 } });

  // 3) Resolve curso + aula pra montar URL útil
  const { data: atividade } = await admin
    .from("atividades")
    .select("aula_id, aula:aulas(id, curso_id, curso:cursos(slug, titulo), titulo)")
    .eq("id", respostaRow.atividade_id)
    .single();
  type AtividadeJoin = {
    aula?: {
      id?: string;
      curso?: { slug?: string; titulo?: string };
      titulo?: string;
    };
  };
  const atv = atividade as AtividadeJoin | null;
  const slugCurso = atv?.aula?.curso?.slug;
  const tituloCurso = atv?.aula?.curso?.titulo;
  const aulaId = atv?.aula?.id;
  const url =
    slugCurso && aulaId
      ? `/cursos/${slugCurso}/aulas/${aulaId}`
      : "/dashboard";

  // 4) Dispara push pro aluno
  const push = await enviarPush([respostaRow.aluno_id], {
    title: "Devolutiva recebida 📝",
    body: tituloCurso
      ? `Sua reflexão em "${tituloCurso}" recebeu uma devolutiva pastoral.`
      : "Você recebeu uma devolutiva pastoral. Toque pra ler.",
    url,
    tag: `devolutiva-${respostaId}`,
  });

  return NextResponse.json({ ok: true, push });
}
