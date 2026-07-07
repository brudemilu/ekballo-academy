import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

// Feed iCal (.ics) dos compromissos do Ekballo (painel/WhatsApp), pra ASSINAR
// no Google Agenda ("Outras agendas → De URL"). Assim os compromissos criados
// por áudio/WhatsApp aparecem no Google sem precisar de credencial de escrita —
// o Google faz o polling deste feed (leitura). Protegido por ?key= (== segredo).
//
//   GET /api/agenda/ics?key=<AGENDA_SYNC_SECRET>  -> text/calendar

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const KEY = process.env.AGENDA_SYNC_SECRET;

function dtUtc(iso: string): string {
  // 2026-07-11T12:00:00Z -> 20260711T120000Z
  return new Date(iso).toISOString().replace(/\.\d{3}/, "").replace(/[-:]/g, "");
}
function dtDate(iso: string): string {
  return new Date(iso).toISOString().slice(0, 10).replace(/-/g, "");
}
function esc(s: string | null): string {
  return (s || "")
    .replace(/\\/g, "\\\\")
    .replace(/;/g, "\\;")
    .replace(/,/g, "\\,")
    .replace(/\r?\n/g, "\\n");
}

export async function GET(req: NextRequest) {
  if (!KEY || req.nextUrl.searchParams.get("key") !== KEY) {
    return new NextResponse("não autorizado", { status: 401 });
  }

  const db = createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });
  const desde = new Date(Date.now() - 90 * 864e5).toISOString();
  const { data } = await db
    .from("compromissos")
    .select("id, titulo, inicio, fim, dia_todo, local, nota")
    .gte("inicio", desde)
    .order("inicio", { ascending: true });

  const agora = dtUtc(new Date().toISOString());
  const L: string[] = [
    "BEGIN:VCALENDAR",
    "VERSION:2.0",
    "PRODID:-//Ekballo//Agenda//PT-BR",
    "CALSCALE:GREGORIAN",
    "METHOD:PUBLISH",
    "X-WR-CALNAME:Ekballo — Compromissos",
    "X-WR-TIMEZONE:America/Sao_Paulo",
    "REFRESH-INTERVAL;VALUE=DURATION:PT30M",
    "X-PUBLISHED-TTL:PT30M",
  ];

  for (const c of (data || []) as Array<{
    id: string; titulo: string; inicio: string; fim: string | null;
    dia_todo: boolean; local: string | null; nota: string | null;
  }>) {
    L.push("BEGIN:VEVENT");
    L.push(`UID:ekballo-${c.id}@ekballo-academy.vercel.app`);
    L.push(`DTSTAMP:${agora}`);
    if (c.dia_todo) {
      L.push(`DTSTART;VALUE=DATE:${dtDate(c.inicio)}`);
    } else {
      L.push(`DTSTART:${dtUtc(c.inicio)}`);
      const fim = c.fim || new Date(new Date(c.inicio).getTime() + 36e5).toISOString();
      L.push(`DTEND:${dtUtc(fim)}`);
    }
    L.push(`SUMMARY:${esc(c.titulo)}`);
    if (c.local) L.push(`LOCATION:${esc(c.local)}`);
    if (c.nota) L.push(`DESCRIPTION:${esc(c.nota)}`);
    L.push("END:VEVENT");
  }
  L.push("END:VCALENDAR");

  return new NextResponse(L.join("\r\n"), {
    headers: {
      "Content-Type": "text/calendar; charset=utf-8",
      "Cache-Control": "no-store",
    },
  });
}
