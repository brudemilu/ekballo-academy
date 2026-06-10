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

/** Divide a mensagem em PARTES que aparecem em sequência no reel. */
function dividirEmPartes(t: string): string[] {
  // 1) por linhas (cada linha = uma parte)
  let p = t.split(/\n+/).map((s) => s.trim()).filter(Boolean);
  if (p.length >= 2) return p.slice(0, 5);
  // 2) por " / " ou por fim de frase
  p = t.split(/\s*\/\s*|(?<=[.!?…])\s+/).map((s) => s.trim()).filter(Boolean);
  if (p.length >= 2) return p.slice(0, 5);
  // 3) auto: mensagem longa numa linha → parte no meio
  const words = t.trim().split(/\s+/);
  if (words.length > 6) {
    const mid = Math.ceil(words.length / 2);
    return [words.slice(0, mid).join(" "), words.slice(mid).join(" ")];
  }
  return [t.trim()];
}

/** Baixa uma URL com timeout + retry (vídeo do Pexels pode oscilar). */
async function baixar(url: string, tentativas = 3): Promise<Buffer> {
  let ultimo: unknown;
  for (let i = 0; i < tentativas; i++) {
    try {
      const ctrl = new AbortController();
      const to = setTimeout(() => ctrl.abort(), 35000);
      const r = await fetch(url, { signal: ctrl.signal });
      clearTimeout(to);
      if (!r.ok) throw new Error(`HTTP ${r.status}`);
      return Buffer.from(await r.arrayBuffer());
    } catch (e) {
      ultimo = e;
    }
  }
  throw new Error(`download falhou: ${ultimo instanceof Error ? ultimo.message : "erro"}`);
}

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
  let musicaUrl = "";
  let seed = Math.floor(Math.random() * 1000);
  let duracao = 14;
  try {
    const b = await req.json();
    texto = typeof b.texto === "string" ? b.texto.trim() : "";
    tema = typeof b.tema === "string" ? b.tema : "";
    cena = typeof b.cena === "string" ? b.cena.trim() : "";
    if (typeof b.musicaUrl === "string") musicaUrl = b.musicaUrl;
    if (typeof b.seed === "number") seed = Math.trunc(b.seed);
    if (typeof b.duracao === "number") duracao = Math.min(25, Math.max(12, Math.trunc(b.duracao)));
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }
  if (!texto) return NextResponse.json({ error: "Escreva a mensagem do Reel." }, { status: 400 });
  if (!cena) cena = texto;

  const ffmpegPath = ffmpegStatic as unknown as string;
  if (!ffmpegPath) return NextResponse.json({ error: "ffmpeg indisponível." }, { status: 500 });

  const id = crypto.randomUUID();
  const partes = dividirEmPartes(texto);
  // mín 12s e ~4s por parte (teto 25s)
  duracao = Math.min(25, Math.max(12, duracao, partes.length * 4));
  const videoIn = join(tmpdir(), `${id}-bg.mp4`);
  const textIns = partes.map((_, i) => join(tmpdir(), `${id}-txt${i}.png`));
  const musicIn = join(tmpdir(), `${id}-mus`);
  const out = join(tmpdir(), `${id}-out.mp4`);
  let temMusica = false;

  try {
    // 1) vídeo de fundo (Pexels)
    const vurl = await buscarVideoPexels(cena, seed);
    if (!vurl) return NextResponse.json({ error: "Não achei um vídeo pra essa cena no Pexels." }, { status: 404 });
    await writeFile(videoIn, await baixar(vurl));

    // 2) uma camada de texto (PNG transparente 1080x1920) POR PARTE
    await Promise.all(
      partes.map(async (parte, i) => {
        const params = new URLSearchParams({ verso: parte });
        if (tema) params.set("tema", tema);
        const buf = Buffer.from(await (await fetch(`${req.nextUrl.origin}/api/og/reel-texto?${params}`)).arrayBuffer());
        await writeFile(textIns[i], buf);
      }),
    );

    // 2b) música escolhida (opcional)
    if (musicaUrl) {
      try {
        await writeFile(musicIn, await baixar(musicaUrl));
        temMusica = true;
      } catch {
        temMusica = false; // se a faixa falhar, segue sem música
      }
    }

    // 3) compõe com ffmpeg: vídeo loopado + partes aparecendo EM SEQUÊNCIA
    try { await chmod(ffmpegPath, 0o755); } catch {}
    const D = duracao;
    const N = partes.length;
    const seg = D / N;
    let fc = `[0:v]scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,trim=0:${D},setpts=PTS-STARTPTS[bg];`;
    for (let i = 0; i < N; i++) {
      const si = i * seg;
      const ei = (i + 1) * seg;
      const fadeOut = N > 1 ? `,fade=t=out:st=${(ei - 0.5).toFixed(2)}:d=0.5:alpha=1` : "";
      fc += `[${i + 1}:v]format=rgba,fade=t=in:st=${(si + 0.1).toFixed(2)}:d=0.55:alpha=1${fadeOut}[t${i}];`;
    }
    let prev = "bg";
    for (let i = 0; i < N; i++) {
      const si = (i * seg).toFixed(2);
      const ei = (i === N - 1 ? D : (i + 1) * seg + 0.05).toFixed(2);
      const lbl = i === N - 1 ? "v" : `o${i}`;
      fc += `[${prev}][t${i}]overlay=0:0:enable='between(t,${si},${ei})'[${lbl}];`;
      prev = lbl;
    }
    fc = fc.replace(/;$/, "");

    const audioIdx = N + 1; // input do áudio (música ou silêncio)
    let audioMap = `${audioIdx}:a`;
    if (temMusica) {
      // música loopada, cortada na duração, com fade in/out e volume reduzido
      fc += `;[${audioIdx}:a]atrim=0:${D},asetpts=PTS-STARTPTS,afade=t=in:st=0:d=1.2,afade=t=out:st=${(D - 1.5).toFixed(2)}:d=1.5,volume=0.85[a]`;
      audioMap = "[a]";
    }

    const args: string[] = ["-y", "-loglevel", "error", "-stream_loop", "-1", "-i", videoIn];
    for (const t of textIns) args.push("-loop", "1", "-i", t);
    if (temMusica) args.push("-stream_loop", "-1", "-i", musicIn);
    else args.push("-f", "lavfi", "-t", String(D), "-i", "anullsrc=channel_layout=stereo:sample_rate=44100");
    args.push(
      "-filter_complex", fc,
      "-map", "[v]", "-map", audioMap,
      "-t", String(D),
      "-c:v", "libx264", "-preset", "veryfast", "-crf", "23", "-pix_fmt", "yuv420p",
      "-c:a", "aac", "-b:a", "128k",
      "-movflags", "+faststart",
      out,
    );
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
    for (const f of [videoIn, ...textIns, musicIn, out]) {
      try { await unlink(f); } catch {}
    }
  }
}
