// Teste local do pipeline yt-dlp + ffmpeg.
// Roda: node scripts/test-youtube.mjs [url]
import { spawn } from "node:child_process";
import { createWriteStream } from "node:fs";
import { PassThrough } from "node:stream";
import ffmpeg from "fluent-ffmpeg";
import ffmpegStatic from "ffmpeg-static";
const binaryPath = "/opt/homebrew/bin/yt-dlp";

ffmpeg.setFfmpegPath(ffmpegStatic);

const url = process.argv[2] || "https://www.youtube.com/watch?v=dQw4w9WgXcQ";

console.log("→ Lendo metadata via yt-dlp…");
const meta = await new Promise((resolve, reject) => {
  const p = spawn(binaryPath, ["--dump-json", "--no-warnings", url]);
  let out = "", err = "";
  p.stdout.on("data", (d) => (out += d));
  p.stderr.on("data", (d) => (err += d));
  p.on("close", (c) => (c === 0 ? resolve(JSON.parse(out)) : reject(new Error(err))));
});
console.log(`  título:  ${meta.title}`);
console.log(`  autor:   ${meta.uploader || meta.channel}`);
console.log(`  duração: ${meta.duration}s`);

console.log("→ Baixando bestaudio + convertendo MP3…");
const ytdlp = spawn(binaryPath, ["-f", "bestaudio", "-o", "-", "--no-progress", "--no-warnings", url]);
const output = new PassThrough();
const file = createWriteStream("/tmp/yt-test.mp3");

const t0 = Date.now();
ffmpeg(ytdlp.stdout)
  .audioBitrate(128)
  .audioCodec("libmp3lame")
  .format("mp3")
  .on("error", (err) => {
    console.error("✗ Erro ffmpeg:", err.message);
    process.exit(1);
  })
  .pipe(output);

output.pipe(file);
file.on("finish", () => {
  const dt = ((Date.now() - t0) / 1000).toFixed(1);
  console.log(`✓ /tmp/yt-test.mp3 pronto em ${dt}s`);
});
