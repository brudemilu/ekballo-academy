import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { registrarPratica } from "@/lib/english-pratica";

// =============================================================
// EKBALLO ENGLISH · Fim da revisão do dia
//
// Registra a revisão e conta como prática do dia — quem revisa
// mantém a sequência. Se revisar não segurasse o streak, o aluno
// seria empurrado a avançar sempre, que é justamente o vício que a
// revisão existe para corrigir.
//
// NÃO mexe em `english_progresso`: revisão não conclui lição nem
// altera a nota registrada dela. O desempenho da revisão é outro
// dado, e vive em `english_revisoes`.
// =============================================================

export async function POST(req: NextRequest) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  const body = await req.json().catch(() => null);
  const acertos = Number.isFinite(body?.acertos) ? Math.max(0, Math.trunc(body.acertos)) : null;
  const total = Number.isFinite(body?.total) ? Math.max(0, Math.trunc(body.total)) : null;
  const exercicios = Array.isArray(body?.exercicios) ? body.exercicios.slice(0, 50) : [];

  if (acertos === null || total === null || acertos > total || total === 0) {
    return NextResponse.json({ erro: "acertos e total obrigatórios" }, { status: 400 });
  }

  await supabase.from("english_revisoes").insert({
    aluno_id: user.id,
    acertos,
    total,
    exercicios,
  });

  const streak = await registrarPratica(supabase, user.id);

  // Conquista própria da revisão: quem volta ao que já fez é quem de
  // fato aprende. Vale marcar a primeira vez.
  let novas: string[] = [];
  const { count } = await supabase
    .from("english_revisoes")
    .select("id", { count: "exact", head: true })
    .eq("aluno_id", user.id);

  if ((count ?? 0) <= 1) {
    const { data: jaTem } = await supabase
      .from("english_conquistas")
      .select("chave")
      .eq("aluno_id", user.id)
      .eq("chave", "primeira-revisao");
    if (!jaTem?.length) {
      await supabase
        .from("english_conquistas")
        .upsert(
          [{ aluno_id: user.id, chave: "primeira-revisao" }],
          { onConflict: "aluno_id,chave", ignoreDuplicates: true },
        );
      novas = ["primeira-revisao"];
    }
  }

  return NextResponse.json({
    ok: true,
    streak: {
      dias_seguidos: streak.dias_seguidos,
      recorde: streak.recorde,
      total_licoes: streak.total_licoes,
    },
    novasConquistas: novas,
  });
}
