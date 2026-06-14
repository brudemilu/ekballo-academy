// Agenda unificada por dia (Google sincronizado/iCal + compromissos do painel
// e do WhatsApp) + formatação do lembrete. É a MESMA composição da página
// /admin/agenda. Usado pelo endpoint /api/agenda/resumo e pelo cron do lembrete
// (/api/cron/lembrete-agenda).

import { listGoogleSincronizados, listCompromissosManuais } from "@/lib/db";
import { lerAgendaGoogle, type AgendaEvento } from "@/lib/agenda";

export const FUSO_AGENDA = "America/Sao_Paulo"; // offset fixo -03:00 (sem horário de verão desde 2019)

/** "YYYY-MM-DD" do dia em São Paulo, deslocado por `offsetDias` (0=hoje, 1=amanhã). */
export function diaSP(offsetDias: number): string {
  const fmt = new Intl.DateTimeFormat("en-CA", {
    timeZone: FUSO_AGENDA,
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  });
  const hojeSP = fmt.format(new Date()); // ex.: "2026-06-13"
  // Meio-dia em SP evita virar de dia ao somar o offset.
  const base = new Date(`${hojeSP}T12:00:00-03:00`);
  base.setUTCDate(base.getUTCDate() + offsetDias);
  return fmt.format(base);
}

export type AgendaDoDia = {
  data: string; // YYYY-MM-DD (SP)
  de: string; // ISO/UTC
  ate: string; // ISO/UTC
  eventos: AgendaEvento[];
};

/**
 * Junta a agenda do dia inteiro (em horário de São Paulo) a partir das mesmas
 * fontes do site: Google sincronizado (todas as agendas) com fallback no iCal +
 * compromissos manuais/WhatsApp. Deduplica título no mesmo minuto.
 */
export async function agendaUnificadaDoDia(dataAlvo: string): Promise<AgendaDoDia> {
  const de = new Date(`${dataAlvo}T00:00:00-03:00`).toISOString();
  const ate = new Date(`${dataAlvo}T23:59:59-03:00`).toISOString();

  const [sincronizados, manuais] = await Promise.all([
    listGoogleSincronizados(de, ate),
    listCompromissosManuais(de, ate),
  ]);
  const google =
    sincronizados.length > 0 ? sincronizados : await lerAgendaGoogle(new Date(de), new Date(ate));

  const vistos = new Set<string>();
  const eventos: AgendaEvento[] = [];
  for (const e of [...google, ...manuais].sort((a, b) => a.inicio.localeCompare(b.inicio))) {
    const chave = `${e.titulo.trim().toLowerCase()}|${e.inicio.slice(0, 16)}`;
    if (vistos.has(chave)) continue;
    vistos.add(chave);
    eventos.push(e);
  }
  return { data: dataAlvo, de, ate, eventos };
}

const DIAS_SEMANA = ["domingo", "segunda", "terça", "quarta", "quinta", "sexta", "sábado"];

function horaSP(iso: string): string {
  return new Intl.DateTimeFormat("pt-BR", {
    timeZone: FUSO_AGENDA,
    hour: "2-digit",
    minute: "2-digit",
  }).format(new Date(iso));
}

/**
 * Monta o texto do lembrete de WhatsApp para um dia. `rotulo` é como o dia é
 * chamado na frase (ex.: "amanhã", "hoje").
 */
export function formatarMensagemLembrete(
  dataAlvo: string,
  eventos: AgendaEvento[],
  rotulo = "amanhã",
): string {
  // dd/MM e dia da semana a partir da data (meio-dia SP pra não virar o dia).
  const d = new Date(`${dataAlvo}T12:00:00-03:00`);
  const dataFmt = new Intl.DateTimeFormat("pt-BR", {
    timeZone: FUSO_AGENDA,
    day: "2-digit",
    month: "2-digit",
  }).format(d);
  // Meio-dia SP = mesmo dia em UTC, então getDay() (runtime UTC) é confiável.
  const diaSemana = DIAS_SEMANA[d.getDay()];

  if (eventos.length === 0) {
    return `📅 *${cap(rotulo)} (${diaSemana}, ${dataFmt})* você não tem compromissos na agenda. Bom descanso! 🙏`;
  }
  const linhas = eventos.map((e) => {
    const hora = e.diaTodo ? "dia todo" : horaSP(e.inicio);
    const local = e.local ? ` — ${e.local}` : "";
    const autor = e.autor ? ` (${e.autor})` : "";
    return `• *${hora}* ${e.titulo}${autor}${local}`;
  });
  return (
    `📅 *Seus compromissos de ${rotulo} (${diaSemana}, ${dataFmt}):*\n\n` +
    linhas.join("\n") +
    `\n\nQue Deus abençoe o seu dia! 🙌`
  );
}

function cap(s: string): string {
  return s.charAt(0).toUpperCase() + s.slice(1);
}
