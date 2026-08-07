// =============================================================
// EKBALLO ENGLISH · Registro de prática (streak)
//
// Extraído de /api/english/concluir quando a revisão passou a
// existir. Concluir lição e revisar são práticas do dia igualmente
// válidas, e duas implementações do mesmo streak divergem cedo ou
// tarde — sobretudo numa regra cheia de canto como esta.
//
// O "dia" é o dia civil em São Paulo, não UTC: quem pratica às 22h
// não pode perder a sequência na virada do fuso.
// =============================================================

import type { SupabaseClient } from "@supabase/supabase-js";

const TZ = "America/Sao_Paulo";

/** Dia civil em São Paulo no formato YYYY-MM-DD (en-CA já entrega assim). */
export function diaEmSaoPaulo(): string {
  return new Date().toLocaleDateString("en-CA", { timeZone: TZ });
}

/** Dia anterior. Ancora ao meio-dia UTC pra não escorregar em fuso nenhum. */
export function diaAnterior(dia: string): string {
  const d = new Date(`${dia}T12:00:00Z`);
  d.setUTCDate(d.getUTCDate() - 1);
  return d.toISOString().slice(0, 10);
}

export type Streak = {
  dias_seguidos: number;
  recorde: number;
  total_licoes: number;
  /** true quando esta foi a primeira prática do dia (só então o streak anda) */
  primeiraDoDia: boolean;
};

/**
 * Marca que o aluno praticou hoje e devolve o streak atualizado.
 * Praticar de novo no mesmo dia não move a sequência — nem para cima
 * (senão bastaria refazer a mesma lição cinco vezes) nem para baixo.
 */
export async function registrarPratica(
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  supabase: SupabaseClient<any, any, any>,
  alunoId: string,
): Promise<Streak> {
  const hoje = diaEmSaoPaulo();

  const { data: atual } = await supabase
    .from("english_streak")
    .select("dias_seguidos, recorde, ultimo_dia, total_licoes")
    .eq("aluno_id", alunoId)
    .maybeSingle();

  const primeiraDoDia = atual?.ultimo_dia !== hoje;

  let diasSeguidos: number;
  if (!primeiraDoDia) {
    diasSeguidos = atual?.dias_seguidos || 1;          // já praticou hoje
  } else if (atual?.ultimo_dia === diaAnterior(hoje)) {
    diasSeguidos = (atual.dias_seguidos || 0) + 1;     // praticou ontem
  } else {
    diasSeguidos = 1;                                   // quebrou ou é o primeiro
  }

  const streak = {
    aluno_id: alunoId,
    dias_seguidos: diasSeguidos,
    recorde: Math.max(atual?.recorde ?? 0, diasSeguidos),
    ultimo_dia: hoje,
    total_licoes: (atual?.total_licoes ?? 0) + 1,
    atualizado_em: new Date().toISOString(),
  };
  await supabase.from("english_streak").upsert(streak, { onConflict: "aluno_id" });

  return {
    dias_seguidos: streak.dias_seguidos,
    recorde: streak.recorde,
    total_licoes: streak.total_licoes,
    primeiraDoDia,
  };
}
