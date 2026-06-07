import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";

// Reverse-sync: os compromissos MANUAIS do painel viram eventos na agenda do
// Google. O Apps Script (com acesso de escrita à agenda do usuário) chama:
//   GET  /api/agenda/push   -> lista os compromissos manuais a criar no Google
//   POST /api/agenda/push {id} -> remove o compromisso do ekballo (já criado no
//        Google; volta pro painel via sincronização normal como evento Google)
// Autenticado por segredo (header x-agenda-secret == AGENDA_SYNC_SECRET).

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const SECRET = process.env.AGENDA_SYNC_SECRET;

function autorizado(req: NextRequest): boolean {
  return !!SECRET && req.headers.get("x-agenda-secret") === SECRET;
}

function admin() {
  return createClient(SUPABASE_URL, SERVICE_ROLE, { auth: { persistSession: false } });
}

export async function GET(req: NextRequest) {
  if (!autorizado(req)) return NextResponse.json({ erro: "não autorizado" }, { status: 401 });
  // Compromissos de até 1 dia atrás pra frente (não reenvia passado distante).
  const desde = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
  const { data, error } = await admin()
    .from("compromissos")
    .select("id, titulo, inicio, fim, dia_todo, local, nota")
    .gte("inicio", desde)
    .order("inicio", { ascending: true });
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  return NextResponse.json({ compromissos: data || [] });
}

export async function POST(req: NextRequest) {
  if (!autorizado(req)) return NextResponse.json({ erro: "não autorizado" }, { status: 401 });
  const body = await req.json().catch(() => ({}));
  const id = String(body.id || "").trim();
  if (!id) return NextResponse.json({ erro: "id obrigatório" }, { status: 400 });
  const { error } = await admin().from("compromissos").delete().eq("id", id);
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  return NextResponse.json({ ok: true });
}
