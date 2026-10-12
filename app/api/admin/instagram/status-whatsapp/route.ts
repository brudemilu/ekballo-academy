import { type NextRequest, NextResponse } from "next/server";
import {
  getCurrentSession,
  getStatusWhatsAppAtivo,
  salvarStatusWhatsAppAtivo,
} from "@/lib/db";

export const runtime = "nodejs";

// Liga/desliga a repetição do Instagram no Status do WhatsApp (issue #258).

/** GET — { ativo } */
export async function GET() {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin)
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  try {
    return NextResponse.json({ ativo: await getStatusWhatsAppAtivo() });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "falha ao ler" },
      { status: 500 },
    );
  }
}

/** POST { ativo: boolean } */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin)
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const body = (await req.json().catch(() => null)) as { ativo?: unknown } | null;
  if (typeof body?.ativo !== "boolean")
    return NextResponse.json({ error: "informe ativo: true ou false" }, { status: 400 });
  try {
    await salvarStatusWhatsAppAtivo(body.ativo);
    return NextResponse.json({ ok: true, ativo: body.ativo });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "falha ao salvar" },
      { status: 500 },
    );
  }
}
