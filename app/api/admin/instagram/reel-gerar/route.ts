import { NextRequest, NextResponse } from "next/server";
import { spawn } from "node:child_process";
import { writeFile, readFile, unlink, chmod } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import ffmpegStatic from "ffmpeg-static";
import { getCurrentSession } from "@/lib/db";
import { createServiceClient } from "@/lib/supabase/service";
import { buscarVideoPexels } from "@/lib/pexels";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * POST /api/admin/instagram/reel-gerar  { texto, tema?, cena, seed?, duracao? }
 * Gera um Reel "vídeo de fundo (Pexels) + texto animado": baixa um vídeo
 * vertical do Pexels, sobrepõe a camada de texto (rota OG reel-texto) com
 * ffmpeg, sobe o MP4 pro Supabase e devolve { videoUrl }. NÃO publica.
 * Admin-only.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }

  let texto = "";
  let tema = "";
  let cena = "";
  let seed = Math.floor(Math.random() * 1000);
  let duracao = 9;
  try {
    const b = await req.json();
    texto = typeof b.texto === "string" ? b.texto.trim() : "";
    tema = typeof b.tema === "string" ? b.tema : "";
    cena = typeof b.cena === "string" ? b.cena.trim() : "";
    if (typeof b.seed === "number") seed = Math.trunc(b.seed);
    if (typeof b.duracao === "number") duracao = Math.min(20, Math.max(6, Math.trunc(b.duracao)));
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }
  if (!texto) return NextResponse.json({ error: "Escreva a mensagem do Reel." }, { status: 400 });
  if (!cena) cena = texto;

  const ffmpegPath = ffmpegStatic as unknown as string;
  if (!ffmpegPath) return NextResponse.json({ error: "ffmpeg indisponível." }, { status: 500 });

  const id = crypto.randomUUID();
  const videoIn = join(tmpdir(), `${id}-bg.mp4`);
  const textIn = join(tmpdir(), `${id}-txt.png`);
  const out = join(tmpdir(), `${id}-out.mp4`);

  try {
    // 1) vídeo de fundo (Pexels)
    const vurl = await buscarVideoPexels(cena, seed);
    if (!vurl) return NextResponse.json({ error: "Não achei um vídeo pra essa cena no Pexels." }, { status: 404 });
    const vbuf = Buffer.from(await (await fetch(vurl)).arrayBuffer());
    await writeFile(videoIn, vbuf);

    // 2) camada de texto (PNG transparente 1080x1920)
    const params = new URLSearchParams({ verso: texto });
    if (tema) params.set("tema", tema);
    const tbuf = Buffer.from(await (await fetch(`${req.nextUrl.origin}/api/og/reel-texto?${params}`)).arrayBuffer());
    await writeFile(textIn, tbuf);

    // 3) compõe com ffmpeg (vídeo loopado + texto fade-in + áudio silencioso)
    try { await chmod(ffmpegPath, 0o755); } catch {}
    const D = String(duracao);
    const fc =
      `[0:v]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,trim=0:${D},setpts=PTS-STARTPTS[bg];` +
      `[1:v]format=rgba,fade=t=in:st=0.4:d=0.9:alpha=1,trim=0:${D},setpts=PTS-STARTPTS[txt];` +
      `[bg][txt]overlay=0:0[v]`;
    const args = [
      "-y", "-loglevel", "error",
      "-stream_loop", "-1", "-i", videoIn,
      "-loop", "1", "-i", textIn,
      "-f", "lavfi", "-t", D, "-i", "anullsrc=channel_layout=stereo:sample_rate=44100",
      "-filter_complex", fc,
      "-map", "[v]", "-map", "2:a",
      "-t", D,
      "-c:v", "libx264", "-preset", "veryfast", "-crf", "23", "-pix_fmt", "yuv420p",
      "-c:a", "aac", "-b:a", "128k",
      "-movflags", "+faststart",
      out,
    ];
    await new Promise<void>((resolve, reject) => {
      const p = spawn(ffmpegPath, args);
      let err = "";
      p.stderr.on("data", (d) => (err += d.toString()));
      p.on("error", reject);
      p.on("close", (code) => (code === 0 ? resolve() : reject(new Error(`ffmpeg ${code}: ${err.slice(-300)}`))));
    });

    // 4) sobe pro Supabase
    const mp4 = await readFile(out);
    const supabase = createServiceClient();
    const path = `reels/${id}.mp4`;
    const { error: upErr } = await supabase.storage
      .from("instagram")
      .upload(path, mp4, { contentType: "video/mp4", upsert: false });
    if (upErr) throw new Error(upErr.message);
    const { data: pub } = supabase.storage.from("instagram").getPublicUrl(path);

    return NextResponse.json({ videoUrl: pub.publicUrl });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao gerar o Reel." },
      { status: 500 },
    );
  } finally {
    for (const f of [videoIn, textIn, out]) {
      try { await unlink(f); } catch {}
    }
  }
}
