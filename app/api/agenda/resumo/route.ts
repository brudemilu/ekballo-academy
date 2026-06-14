import { NextRequest, NextResponse } from "next/server";
import { agendaUnificadaDoDia, diaSP, FUSO_AGENDA } from "@/lib/agenda-resumo";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

// Resumo da agenda UNIFICADA (Google sincronizado/iCal + compromissos do painel
// e do WhatsApp) para um dia. É a MESMA composição da página /admin/agenda.
//
//   GET /api/agenda/resumo?secret=...&dia=amanha|hoje
//   GET /api/agenda/resumo?secret=...&data=2026-06-13
//
// Auth: ?secret= OU header x-agenda-secret == AGENDA_SYNC_SECRET.

const SECRET = process.env.AGENDA_SYNC_SECRET;

function autorizado(req: NextRequest): boolean {
  if (!SECRET) {
    console.warn("[resumo] AGENDA_SYNC_SECRET não configurado no ambiente");
    return false;
  }
  // Tolerante a espaços/quebras de linha de copy-paste.
  const esperado = SECRET.trim();
  const q = (req.nextUrl.searchParams.get("secret") || "").trim();
  const h = (req.headers.get("x-agenda-secret") || "").trim();
  const ok = (q !== "" && q === esperado) || (h !== "" && h === esperado);
  if (!ok) {
    console.warn(
      `[resumo] 401 — recebido(query)=${q.length} recebido(header)=${h.length} esperado=${esperado.length}`,
    );
  }
  return ok;
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

  const { de, ate, eventos } = await agendaUnificadaDoDia(dataAlvo);

  return NextResponse.json({
    de,
    ate,
    data: dataAlvo,
    fuso: FUSO_AGENDA,
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
