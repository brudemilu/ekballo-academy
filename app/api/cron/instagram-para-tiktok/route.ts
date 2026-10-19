import { type NextRequest, NextResponse } from "next/server";
import { repetirNoTikTok } from "@/lib/tiktok-executar";

export const runtime = "nodejs";
export const maxDuration = 300;

// Chamado pelo pg_cron do box de 5 em 5 minutos (job instagram-para-tiktok,
// migration 375), e só quando o recurso está ligado. A rota confere de novo,
// porque também pode ser chamada à mão.

function autorizado(req: NextRequest): boolean {
  const cron = (process.env.CRON_SECRET || "").trim();
  const auth = req.headers.get("authorization") || "";
  if (cron && auth === `Bearer ${cron}`) return true;
  const agenda = (process.env.AGENDA_SYNC_SECRET || "").trim();
  const q = (req.nextUrl.searchParams.get("secret") || "").trim();
  return agenda !== "" && q === agenda;
}

export async function GET(req: NextRequest) {
  if (!autorizado(req))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  try {
    return NextResponse.json({ ok: true, ...(await repetirNoTikTok()) });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "falha ao mandar para o TikTok" },
      { status: 500 },
    );
  }
}
