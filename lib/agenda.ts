// Leitura da agenda do Google via feed iCal secreto (sem OAuth).
//
// O usuário cola, no env GOOGLE_AGENDA_ICAL_URL, o "endereço secreto em formato
// iCal" da sua agenda do Google (Google Agenda → Configurações → [agenda] →
// "Endereço secreto no formato iCal"). Lemos esse .ics no servidor e expandimos
// os eventos (inclusive recorrentes) dentro de uma janela de datas.
//
// Tudo é tolerante a falha: sem URL ou com erro de rede, devolve [] e o painel
// mostra apenas os compromissos manuais.

// ical-expander é CommonJS, sem types próprios (tratado como any).
import IcalExpander from "ical-expander";

export type AgendaEvento = {
  id: string;
  titulo: string;
  inicio: string; // ISO
  fim: string | null; // ISO
  diaTodo: boolean;
  local: string | null;
  fonte: "google" | "manual";
};

type IcalTime = { toJSDate: () => Date; isDate?: boolean };
type IcalEvent = {
  uid?: string;
  summary?: string;
  location?: string;
  startDate: IcalTime;
  endDate?: IcalTime;
};
type IcalOccurrence = { item: IcalEvent; startDate: IcalTime; endDate?: IcalTime };

function normaliza(
  ev: IcalEvent,
  start: IcalTime,
  end: IcalTime | undefined,
  idx: number,
): AgendaEvento {
  const diaTodo = !!start.isDate;
  const inicio = start.toJSDate();
  return {
    id: `g:${ev.uid || ev.summary || "evt"}:${inicio.getTime()}:${idx}`,
    titulo: (ev.summary || "(sem título)").trim(),
    inicio: inicio.toISOString(),
    fim: end ? end.toJSDate().toISOString() : null,
    diaTodo,
    local: ev.location ? ev.location.trim() : null,
    fonte: "google",
  };
}

/**
 * Lê os eventos do Google Calendar (via iCal) entre `inicio` e `fim`.
 * Retorna [] se GOOGLE_AGENDA_ICAL_URL não estiver setado ou em qualquer erro.
 */
export async function lerAgendaGoogle(
  inicio: Date,
  fim: Date,
): Promise<AgendaEvento[]> {
  const url = process.env.GOOGLE_AGENDA_ICAL_URL;
  if (!url) return [];
  try {
    const res = await fetch(url, { cache: "no-store" });
    if (!res.ok) {
      console.error("[agenda] iCal HTTP", res.status);
      return [];
    }
    const ics = await res.text();
    const expander = new (IcalExpander as unknown as new (o: {
      ics: string;
      maxIterations: number;
    }) => {
      between: (a: Date, b: Date) => {
        events: IcalEvent[];
        occurrences: IcalOccurrence[];
      };
    })({ ics, maxIterations: 2000 });

    const { events, occurrences } = expander.between(inicio, fim);
    const out: AgendaEvento[] = [];
    events.forEach((ev, i) => out.push(normaliza(ev, ev.startDate, ev.endDate, i)));
    occurrences.forEach((oc, i) =>
      out.push(normaliza(oc.item, oc.startDate, oc.endDate, 10000 + i)),
    );
    return out;
  } catch (err) {
    console.error("[agenda] erro ao ler iCal:", err instanceof Error ? err.message : err);
    return [];
  }
}
