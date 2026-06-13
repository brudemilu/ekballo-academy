import { NextRequest, NextResponse } from "next/server";
import { listGoogleSincronizados, listCompromissosManuais } from "@/lib/db";
import { lerAgendaGoogle, type AgendaEvento } from "@/lib/agenda";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

// Resumo da agenda UNIFICADA (Google sincronizado/iCal + compromissos do painel
// e do WhatsApp) para uma janela de dias. É a MESMA composição da página
// /admin/agenda — serve pro lembrete de WhatsApp (Apps Script) refletir
// exatamente o que aparece no site, sem ler o Google por conta própria.
//
//   GET /api/agenda/resumo?secret=...&dia=amanha|hoje
//   GET /api/agenda/resumo?secret=...&data=2026-06-13
//
// Auth: ?secret= OU header x-agenda-secret == AGENDA_SYNC_SECRET.

const SECRET = process.env.AGENDA_SYNC_SECRET;
const FUSO = "America/Sao_Paulo"; // offset fixo -03:00 (sem horário de verão desde 2019)

function autorizado(req: NextRequest): boolean {
  if (!SECRET) return false;
  const q = req.nextUrl.searchParams.get("secret");
  const h = req.headers.get("x-agenda-secret");
  return q === SECRET || h === SECRET;
}

// "YYYY-MM-DD" do dia em São Paulo, deslocado por `offsetDias`.
function diaSP(offsetDias: number): string {
  const fmt = new Intl.DateTimeFormat("en-CA", {
    timeZone: FUSO,
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

export async function GET(req: NextRequest) {
  if (!autorizado(req)) {
    return NextResponse.json({ erro: "não autorizado" }, { status: 401 });
  }

  const sp = req.nextUrl.searchParams;
  // Resolve a data alvo (YYYY-MM-DD em SP).
  let dataAlvo: string;
  const dataParam = sp.get("data");
  if (dataParam && /^\d{4}-\d{2}-\d{2}$/.test(dataParam)) {
    dataAlvo = dataParam;
  } else {
    const dia = (sp.get("dia") || "amanha").toLowerCase();
    dataAlvo = diaSP(dia === "hoje" ? 0 : 1);
  }

  // Janela do dia inteiro em horário de São Paulo (-03:00) → ISO/UTC.
  const deISO = new Date(`${dataAlvo}T00:00:00-03:00`).toISOString();
  const ateISO = new Date(`${dataAlvo}T23:59:59-03:00`).toISOString();

  // Mesma composição da página /admin/agenda:
  // Google sincronizado (todas as agendas) com fallback no iCal + manuais/WhatsApp.
  const [sincronizados, manuais] = await Promise.all([
    listGoogleSincronizados(deISO, ateISO),
    listCompromissosManuais(deISO, ateISO),
  ]);
  const google =
    sincronizados.length > 0
      ? sincronizados
      : await lerAgendaGoogle(new Date(deISO), new Date(ateISO));

  // Junta e deduplica (um compromisso pode ter sido espelhado no Google):
  // mesma fonte de verdade que o site, sem repetir título no mesmo minuto.
  const todos = [...google, ...manuais];
  const vistos = new Set<string>();
  const eventos: AgendaEvento[] = [];
  for (const e of todos.sort((a, b) => a.inicio.localeCompare(b.inicio))) {
    const chave = `${e.titulo.trim().toLowerCase()}|${e.inicio.slice(0, 16)}`;
    if (vistos.has(chave)) continue;
    vistos.add(chave);
    eventos.push(e);
  }

  return NextResponse.json({
    de: deISO,
    ate: ateISO,
    data: dataAlvo,
    fuso: FUSO,
    total: eventos.length,
    eventos: eventos.map((e) => ({
      titulo: e.titulo,
      inicio: e.inicio,
      fim: e.fim,
      diaTodo: e.diaTodo,
      local: e.local,
      fonte: e.fonte,
      autor: e.autor,
    })),
  });
}
