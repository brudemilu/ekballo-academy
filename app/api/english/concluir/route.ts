import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

// =============================================================
// EKBALLO ENGLISH · Conclusão de lição
//
// Único lugar que grava progresso, streak e conquista. Chamado
// pelo player quando o aluno termina a lição.
//
// O "dia" do streak é o dia civil em São Paulo, não UTC — senão
// quem pratica às 22h perde a sequência na virada do fuso.
// =============================================================

const TZ = "America/Sao_Paulo";

function diaEmSaoPaulo(): string {
  // en-CA formata como YYYY-MM-DD
  return new Date().toLocaleDateString("en-CA", { timeZone: TZ });
}

function diaAnterior(dia: string): string {
  // Ancora ao meio-dia UTC pra não escorregar de dia em nenhum fuso.
  const d = new Date(`${dia}T12:00:00Z`);
  d.setUTCDate(d.getUTCDate() - 1);
  return d.toISOString().slice(0, 10);
}

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
  const hoje = diaEmSaoPaulo();
  const { data: streakAtual } = await supabase
    .from("english_streak")
    .select("dias_seguidos, recorde, ultimo_dia, total_licoes")
    .eq("aluno_id", user.id)
    .maybeSingle();

  let diasSeguidos: number;
  if (streakAtual?.ultimo_dia === hoje) {
    diasSeguidos = streakAtual.dias_seguidos || 1;      // já praticou hoje: mantém
  } else if (streakAtual?.ultimo_dia === diaAnterior(hoje)) {
    diasSeguidos = (streakAtual.dias_seguidos || 0) + 1; // praticou ontem: soma
  } else {
    diasSeguidos = 1;                                    // quebrou (ou é o primeiro dia)
  }

  const streak = {
    aluno_id: user.id,
    dias_seguidos: diasSeguidos,
    recorde: Math.max(streakAtual?.recorde ?? 0, diasSeguidos),
    ultimo_dia: hoje,
    total_licoes: (streakAtual?.total_licoes ?? 0) + 1,
    atualizado_em: new Date().toISOString(),
  };
  await supabase.from("english_streak").upsert(streak, { onConflict: "aluno_id" });

  // ---------- conquistas ----------
  const candidatas: string[] = [];
  if (primeiraVez) candidatas.push("primeira-licao");
  if (total > 0 && acertos === total) candidatas.push("licao-perfeita");
  if (diasSeguidos >= 3) candidatas.push("streak-3");
  if (diasSeguidos >= 7) candidatas.push("streak-7");
  if (diasSeguidos >= 30) candidatas.push("streak-30");

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
