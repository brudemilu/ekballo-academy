import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { converterParaMp3, extractVideoId, apiConfigurada } from "@/lib/youtube";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * GET /api/admin/youtube-mp3?url=<youtube_url>
 * Converte o vídeo em MP3 via API de terceiros e devolve JSON com o link
 * direto pro arquivo. O servidor não baixa nada — só intermedeia a API.
 *
 * Admin-only. Aviso legal de copyright/ToS é responsabilidade do admin.
 */
export async function GET(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }

  if (!apiConfigurada()) {
    return NextResponse.json(
      {
        error:
          "O servidor ainda não tem a chave da API de download configurada (YOUTUBE_MP3_API_KEY).",
      },
      { status: 503 },
    );
  }

  const raw = req.nextUrl.searchParams.get("url") || "";
  const videoId = extractVideoId(raw);
  if (!videoId) {
    return NextResponse.json(
      { error: "Link do YouTube inválido. Cole a URL completa do vídeo." },
      { status: 400 },
    );
  }

  try {
    const r = await converterParaMp3(videoId);
    console.log(
      `[youtube-mp3] ${session.profile?.email} converteu "${r.title}" (${r.durationSec}s)`,
    );
    return NextResponse.json({ ok: true, ...r });
  } catch (err) {
    const msg = err instanceof Error ? err.message : "erro desconhecido";
    console.error("[youtube-mp3]", msg);
    return NextResponse.json({ error: msg }, { status: 502 });
  }
}
