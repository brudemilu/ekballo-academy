import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

// Recebe os eventos do Google (todas as agendas) enviados pelo Apps Script e
// substitui a janela na tabela agenda_google. Autenticado por segredo
// (header x-agenda-secret == AGENDA_SYNC_SECRET). Usa service role.
//
// Body: { de(ISO), ate(ISO), eventos: [{id, agenda?, titulo, inicio(ISO),
//         fim?(ISO), diaTodo?, local?}] }

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const SECRET = process.env.AGENDA_SYNC_SECRET;

type EntradaEvento = {
  id?: unknown;
  agenda?: unknown;
  titulo?: unknown;
  inicio?: unknown;
  fim?: unknown;
  diaTodo?: unknown;
  local?: unknown;
};

export async function POST(req: NextRequest) {
  if (!SECRET || req.headers.get("x-agenda-secret") !== SECRET) {
    return NextResponse.json({ erro: "não autorizado" }, { status: 401 });
  }

  const body = await req.json().catch(() => ({}));
  const de = String(body.de || "");
  const ate = String(body.ate || "");
  const entradas: EntradaEvento[] = Array.isArray(body.eventos) ? body.eventos : [];
  if (!de || !ate || Number.isNaN(Date.parse(de)) || Number.isNaN(Date.parse(ate))) {
    return NextResponse.json({ erro: "janela (de/ate) inválida" }, { status: 400 });
  }

  // Normaliza e deduplica por id.
  const porId = new Map<string, Record<string, unknown>>();
  for (const e of entradas) {
    const id = e?.id != null ? String(e.id).slice(0, 400) : "";
    const titulo = e?.titulo != null ? String(e.titulo).trim() : "";
    const inicio = e?.inicio != null ? String(e.inicio) : "";
    if (!id || !titulo || !inicio || Number.isNaN(Date.parse(inicio))) continue;
    porId.set(id, {
      id,
      agenda: e.agenda ? String(e.agenda).slice(0, 200) : null,
      titulo: titulo.slice(0, 500),
      inicio: new Date(inicio).toISOString(),
      fim: e.fim && !Number.isNaN(Date.parse(String(e.fim))) ? new Date(String(e.fim)).toISOString() : null,
      dia_todo: !!e.diaTodo,
      local: e.local ? String(e.local).slice(0, 300) : null,
      atualizado_em: new Date().toISOString(),
    });
  }
  const rows = [...porId.values()];

  const supabase = createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });

  // Substitui a janela: apaga o que estava e grava o atual (propaga cancelamentos).
  const del = await supabase.from("agenda_google").delete().gte("inicio", de).lte("inicio", ate);
  if (del.error) return NextResponse.json({ erro: del.error.message }, { status: 500 });
  if (rows.length) {
    const ins = await supabase.from("agenda_google").upsert(rows, { onConflict: "id" });
    if (ins.error) return NextResponse.json({ erro: ins.error.message }, { status: 500 });
  }
  return NextResponse.json({ ok: true, count: rows.length });
}
