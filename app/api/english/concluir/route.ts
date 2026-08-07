import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { registrarPratica } from "@/lib/english-pratica";

// =============================================================
// EKBALLO ENGLISH · Conclusão de lição
//
// Único lugar que grava progresso, streak e conquista. Chamado
// pelo player quando o aluno termina a lição.
//
// O "dia" do streak é o dia civil em São Paulo, não UTC — senão
// quem pratica às 22h perde a sequência na virada do fuso.
// =============================================================

export async function POST(req: NextRequest) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  const body = await req.json().catch(() => null);
  const licaoId = typeof body?.licaoId === "string" ? body.licaoId : null;
  const acertos = Number.isFinite(body?.acertos) ? Math.max(0, Math.trunc(body.acertos)) : null;
  const total = Number.isFinite(body?.total) ? Math.max(0, Math.trunc(body.total)) : null;

  if (!licaoId || acertos === null || total === null || acertos > total) {
    return NextResponse.json({ erro: "licaoId, acertos e total obrigatórios" }, { status: 400 });
  }

  // A lição precisa existir e estar publicada (evita gravar progresso fantasma).
  const { data: licao } = await supabase
    .from("english_licoes")
    .select("id, modulo_id, publicado")
    .eq("id", licaoId)
    .single();
  if (!licao?.publicado) {
    return NextResponse.json({ erro: "lição não encontrada" }, { status: 404 });
  }

  // ---------- progresso ----------
  const { data: anterior } = await supabase
    .from("english_progresso")
    .select("acertos, total, vezes")
    .eq("aluno_id", user.id)
    .eq("licao_id", licaoId)
    .maybeSingle();

  const primeiraVez = !anterior;

  await supabase.from("english_progresso").upsert(
    {
      aluno_id: user.id,
      licao_id: licaoId,
      // guarda o melhor desempenho, não o último
      acertos: Math.max(anterior?.acertos ?? 0, acertos),
      total: Math.max(anterior?.total ?? 0, total),
      vezes: (anterior?.vezes ?? 0) + 1,
      concluido_em: new Date().toISOString(),
    },
    { onConflict: "aluno_id,licao_id" },
  );

  // ---------- streak ----------
  const streak = await registrarPratica(supabase, user.id);

  // ---------- conquistas ----------
  const candidatas: string[] = [];
  if (primeiraVez) candidatas.push("primeira-licao");
  if (total > 0 && acertos === total) candidatas.push("licao-perfeita");
  if (streak.dias_seguidos >= 3) candidatas.push("streak-3");
  if (streak.dias_seguidos >= 7) candidatas.push("streak-7");
  if (streak.dias_seguidos >= 30) candidatas.push("streak-30");

  // Módulo inteiro concluído?
  const { data: irmas } = await supabase
    .from("english_licoes")
    .select("id")
    .eq("modulo_id", licao.modulo_id)
    .eq("publicado", true);
  const idsDoModulo = ((irmas || []) as { id: string }[]).map((l) => l.id);

  if (idsDoModulo.length) {
    const { data: feitas } = await supabase
      .from("english_progresso")
      .select("licao_id")
      .eq("aluno_id", user.id)
      .in("licao_id", idsDoModulo);
    if ((feitas || []).length >= idsDoModulo.length) {
      const { data: modulo } = await supabase
        .from("english_modulos")
        .select("numero")
        .eq("id", licao.modulo_id)
        .single();
      if (modulo?.numero) candidatas.push(`modulo-${modulo.numero}`);
    }
  }

  let novas: string[] = [];
  if (candidatas.length) {
    const { data: jaTem } = await supabase
      .from("english_conquistas")
      .select("chave")
      .eq("aluno_id", user.id)
      .in("chave", candidatas);
    const conhecidas = new Set(((jaTem || []) as { chave: string }[]).map((c) => c.chave));
    novas = candidatas.filter((c) => !conhecidas.has(c));

    if (novas.length) {
      await supabase
        .from("english_conquistas")
        .upsert(
          novas.map((chave) => ({ aluno_id: user.id, chave })),
          { onConflict: "aluno_id,chave", ignoreDuplicates: true },
        );
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
