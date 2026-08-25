import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";

// Master solicita a geração do áudio de leitura de um livro (curso).
//   POST { cursoId, acao?: "gerar" | "cancelar" }
// "gerar"   -> marca como pendente (o worker /api/cron/gerar-audio-tick gera).
// "cancelar"-> volta pra 'nenhum' (não apaga o que já foi gerado).

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export async function POST(req: NextRequest) {
  if (!MOCK) {
    const u = await createServerClient();
    const { data: { user } } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: profile } = await u.from("profiles").select("is_admin").eq("id", user.id).single();
    if (!profile?.is_admin) return NextResponse.json({ erro: "acesso negado" }, { status: 403 });
  }

  const body = await req.json().catch(() => ({}));
  const cursoId = String(body.cursoId || "").trim();
  const acao = body.acao === "cancelar" ? "cancelar" : "gerar";
  if (!cursoId) return NextResponse.json({ erro: "cursoId obrigatório" }, { status: 400 });
  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });

  if (acao === "cancelar") {
    await admin
      .from("cursos")
      .update({ audio_status: "nenhum", audio_falhas: 0, audio_lock_ate: null })
      .eq("id", cursoId);
    return NextResponse.json({ ok: true, status: "nenhum" });
  }

  const { count: total } = await admin
    .from("aulas")
    .select("id", { count: "exact", head: true })
    .eq("curso_id", cursoId);
  const { count: feitas } = await admin
    .from("aulas")
    .select("id", { count: "exact", head: true })
    .eq("curso_id", cursoId)
    .not("audio_leitura_url", "is", null);

  const { error } = await admin
    .from("cursos")
    .update({
      audio_status: "pendente",
      audio_total: total ?? 0,
      audio_progresso: feitas ?? 0,
      audio_pedido_em: new Date().toISOString(),
      // ZERAR é essencial: o worker desiste do livro em MAX_FALHAS falhas
      // seguidas. Sem zerar, um livro que já errou antes voltava com o contador
      // estourado e morria na primeira falha do novo pedido — pro master parecia
      // que "clicar em gerar áudio não faz nada". (bug corrigido 24/08/2026)
      audio_falhas: 0,
      audio_lock_ate: null,
    })
    .eq("id", cursoId);
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });

  return NextResponse.json({ ok: true, status: "pendente", total: total ?? 0, progresso: feitas ?? 0 });
}
