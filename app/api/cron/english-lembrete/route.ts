import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { enviarPush } from "@/lib/push";

// =============================================================
// EKBALLO ENGLISH · Lembrete diário da prática
//
// O produto promete rotina diária e sequência (streak). Sequência
// sem chamada de volta é sequência que quebra — por isso este cron.
//
// A regra importante é NÃO mandar push pra todo mundo todo dia:
// isso vira ruído e o aluno desliga a notificação, aí perdemos o
// canal pra sempre. Manda só pra quem a mensagem faz sentido:
//
//   • sequência em risco — praticou ontem e ainda não praticou hoje.
//     É a mensagem mais valiosa: tem algo concreto a perder.
//   • sumiu — praticou algum dia, mas faz de 3 a 14 dias que não
//     volta. Depois de 14 dias o push não traz ninguém de volta;
//     para de insistir pra não virar spam.
//   • nunca começou — tem conta, nunca fez lição. Só uma vez por
//     semana (segunda), pra ser convite e não cobrança.
//
// Quem já praticou hoje não recebe nada. Nunca.
//
//   GET /api/cron/english-lembrete?secret=<AGENDA_SYNC_SECRET>
//   GET /api/cron/english-lembrete?dry=1   (só relata, não envia)
// =============================================================

export const runtime = "nodejs";

const TZ = "America/Sao_Paulo";
const DIAS_SUMIU_MIN = 3;
const DIAS_SUMIU_MAX = 14;

function diaEmSaoPaulo(): string {
  return new Date().toLocaleDateString("en-CA", { timeZone: TZ });
}

function somaDias(dia: string, delta: number): string {
  const d = new Date(`${dia}T12:00:00Z`);
  d.setUTCDate(d.getUTCDate() + delta);
  return d.toISOString().slice(0, 10);
}

function diasEntre(de: string, ate: string): number {
  const a = new Date(`${de}T12:00:00Z`).getTime();
  const b = new Date(`${ate}T12:00:00Z`).getTime();
  return Math.round((b - a) / 86_400_000);
}

/** Segunda-feira em São Paulo? (dia do convite a quem nunca começou) */
function ehSegunda(): boolean {
  const dia = new Date().toLocaleDateString("en-US", { timeZone: TZ, weekday: "short" });
  return dia.startsWith("Mon");
}

function autorizado(req: NextRequest): boolean {
  const esperado = (process.env.AGENDA_SYNC_SECRET || "").trim();
  const cron = (process.env.CRON_SECRET || "").trim();
  const auth = req.headers.get("authorization") || "";
  const q = (req.nextUrl.searchParams.get("secret") || "").trim();
  if (cron && auth === `Bearer ${cron}`) return true;
  return Boolean(esperado) && q === esperado;
}

export async function GET(req: NextRequest) {
  if (!autorizado(req)) {
    return NextResponse.json({ erro: "não autorizado" }, { status: 401 });
  }
  const dry = req.nextUrl.searchParams.get("dry") === "1";

  const admin = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { persistSession: false } },
  );

  const hoje = diaEmSaoPaulo();
  const ontem = somaDias(hoje, -1);

  const { data: streaks } = await admin
    .from("english_streak")
    .select("aluno_id, dias_seguidos, ultimo_dia");

  const linhas = (streaks || []) as {
    aluno_id: string; dias_seguidos: number; ultimo_dia: string | null;
  }[];

  const emRisco: string[] = [];   // praticou ontem, ainda não hoje
  const sumiram: string[] = [];   // 3 a 14 dias parado
  const jaFezHoje = new Set<string>();

  for (const s of linhas) {
    if (!s.ultimo_dia) continue;
    if (s.ultimo_dia === hoje) { jaFezHoje.add(s.aluno_id); continue; }
    if (s.ultimo_dia === ontem) { emRisco.push(s.aluno_id); continue; }
    const parado = diasEntre(s.ultimo_dia, hoje);
    if (parado >= DIAS_SUMIU_MIN && parado <= DIAS_SUMIU_MAX) sumiram.push(s.aluno_id);
  }

  // Quem nunca começou: tem perfil de aluno e nenhuma linha de streak.
  let nuncaComecaram: string[] = [];
  if (ehSegunda()) {
    const { data: alunos } = await admin
      .from("profiles")
      .select("id")
      .eq("is_admin", false);
    const comStreak = new Set(linhas.map((s) => s.aluno_id));
    nuncaComecaram = ((alunos || []) as { id: string }[])
      .map((a) => a.id)
      .filter((id) => !comStreak.has(id));
  }

  // Mensagem por grupo. A do streak em risco cita o número: o que
  // segura a rotina é ver o que se tem a perder, não o convite genérico.
  const sequenciaPorAluno = new Map(linhas.map((s) => [s.aluno_id, s.dias_seguidos]));

  const grupos: { ids: string[]; titulo: (id: string) => string; corpo: string; tag: string }[] = [
    {
      ids: emRisco,
      titulo: (id) => {
        const n = sequenciaPorAluno.get(id) || 0;
        return n > 1 ? `Sua sequência de ${n} dias está em jogo 🔥` : "Mantenha a sequência 🔥";
      },
      corpo: "Cinco minutos de inglês hoje e ela continua de pé.",
      tag: "english-streak-risco",
    },
    {
      ids: sumiram,
      titulo: () => "Seu inglês está esperando 🗣️",
      corpo: "Uma lição curta é o bastante para voltar ao ritmo.",
      tag: "english-volta",
    },
    {
      ids: nuncaComecaram,
      titulo: () => "Comece seu inglês hoje 🗣️",
      corpo: "A primeira lição do Ekballo English leva poucos minutos.",
      tag: "english-convite",
    },
  ];

  const relatorio: Record<string, number> = {};
  let enviados = 0;

  for (const grupo of grupos) {
    relatorio[grupo.tag] = grupo.ids.length;
    if (dry || grupo.ids.length === 0) continue;

    // Título é personalizado por aluno (cita a sequência), então
    // agrupa por título pra não fazer um envio por pessoa à toa.
    const porTitulo = new Map<string, string[]>();
    for (const id of grupo.ids) {
      const t = grupo.titulo(id);
      porTitulo.set(t, [...(porTitulo.get(t) || []), id]);
    }
    for (const [titulo, ids] of porTitulo) {
      const r = await enviarPush(ids, {
        title: titulo,
        body: grupo.corpo,
        url: "/english/jornada",
        tag: grupo.tag,
      });
      enviados += r.enviados;
    }
  }

  return NextResponse.json({
    ok: true,
    dry,
    dia: hoje,
    jaPraticaramHoje: jaFezHoje.size,
    alvos: relatorio,
    enviados,
  });
}
