import { NextRequest } from "next/server";
import { Readable } from "node:stream";
import { getCurrentSession } from "@/lib/db";
import {
  baixarComoMp3Stream,
  getYouTubeMetadata,
  nomeArquivoSeguro,
  normalizarYouTubeUrl,
} from "@/lib/youtube";

// Node runtime + tempo estendido (vídeos longos podem passar de 60s)
export const runtime = "nodejs";
export const maxDuration = 300;

/**
 * GET /api/admin/youtube-mp3?url=<youtube_url>
 * Faz streaming do MP3 direto pro browser do admin como attachment.
 * Não persiste nada no servidor — o admin baixa e decide o que fazer.
 *
 * Aviso legal: copyright e ToS do YouTube são responsabilidade do admin.
 */
export async function GET(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return new Response("não autorizado", { status: 401 });
  }

  const raw = req.nextUrl.searchParams.get("url") || "";
  const url = normalizarYouTubeUrl(raw);
  if (!url) return new Response("url obrigatório", { status: 400 });

  let meta;
  try {
    meta = await getYouTubeMetadata(url);
  } catch (err) {
    const msg = err instanceof Error ? err.message : "erro";
    console.error("[youtube-mp3] meta error:", msg);
    return new Response(
      `Não consegui ler o vídeo. ${
        msg.toLowerCase().includes("bot")
          ? "YouTube bloqueou o IP do servidor (anti-bot)."
          : msg
      }`,
      { status: 502 },
    );
  }

  console.log(
    `[youtube-mp3] download solicitado por ${session.profile?.email}: "${meta.title}" (${meta.durationSec}s)`,
  );

  const filename = nomeArquivoSeguro(meta.title, meta.videoId);
  const nodeStream = baixarComoMp3Stream(url);

  // Converte Node Readable em Web ReadableStream que o Response aceita.
  // O `as unknown as ReadableStream` é necessário porque a tipagem do
  // Node.Readable.toWeb não bate 100% com lib.dom.
  const webStream = Readable.toWeb(nodeStream as Readable) as unknown as ReadableStream;

  return new Response(webStream, {
    headers: {
      "Content-Type": "audio/mpeg",
      "Content-Disposition": `attachment; filename="${filename}"`,
      "Cache-Control": "no-store",
      "X-Source-Title": encodeURIComponent(meta.title),
      "X-Source-Author": encodeURIComponent(meta.author),
    },
  });
}
