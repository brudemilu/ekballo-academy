import { NextRequest, NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { getYouTubeMetadata, normalizarYouTubeUrl } from "@/lib/youtube";

// Node runtime (não Edge — usa ytdl-core que precisa de Buffer/streams Node)
export const runtime = "nodejs";
export const maxDuration = 30;

/**
 * GET /api/admin/youtube-meta?url=<youtube_url>
 * Retorna metadata (título, autor, duração, thumbnail) sem baixar o áudio.
 * Usado pelo form admin pra preview antes do download.
 */
export async function GET(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }

  const raw = req.nextUrl.searchParams.get("url") || "";
  const url = normalizarYouTubeUrl(raw);
  if (!url) {
    return NextResponse.json({ error: "url obrigatório" }, { status: 400 });
  }

  try {
    const meta = await getYouTubeMetadata(url);
    return NextResponse.json({ ok: true, url, meta });
  } catch (err) {
    const msg = err instanceof Error ? err.message : "erro desconhecido";
    console.error("[youtube-meta]", msg);
    return NextResponse.json(
      {
        error: msg,
        dica: msg.toLowerCase().includes("bot")
          ? "YouTube bloqueou o IP do servidor (anti-bot). Tente de novo em alguns minutos ou rode local."
          : undefined,
      },
      { status: 502 },
    );
  }
}
