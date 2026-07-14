import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";
import { TEMAS, TEMA_PADRAO, type TemaKey } from "@/lib/instagram-render";

export const runtime = "nodejs";

// Camada de TEXTO do Reel: PNG 1080×1920 TRANSPARENTE (só texto + scrim suave),
// pra ser sobreposto ao vídeo do Pexels pelo ffmpeg. {palavra} = cor do tema;
// ((frase)) = manuscrita (Kaushan).

const W = 1080;
const H = 1920;
const CREAM = "#F5EDDE";
const SOMBRA = "0 3px 14px rgba(0,0,0,0.95), 0 0 30px rgba(0,0,0,0.7)";

const fontCache: Record<string, ArrayBuffer> = {};
async function loadFont(origin: string, file: string) {
  if (!fontCache[file]) {
    fontCache[file] = await fetch(`${origin}/fonts/${file}`).then((r) => r.arrayBuffer());
  }
  return fontCache[file];
}

export async function GET(req: NextRequest) {
  const url = new URL(req.url);
  const selfOrigin = `http://127.0.0.1:${process.env.PORT ?? 3000}`;
  const texto = (url.searchParams.get("verso") || "").trim();
  if (!texto) return new Response("parâmetro 'verso' obrigatório", { status: 400 });
  const temaKey = (url.searchParams.get("tema") || TEMA_PADRAO) as TemaKey;
  const cor = (TEMAS[temaKey] || TEMAS[TEMA_PADRAO]).cor;

  // frase manuscrita ((...)) separada das palavras display
  let script = "";
  const semScript = texto.replace(/\(\(([^)]*)\)\)/g, (_, f) => {
    script = (script ? script + " " : "") + String(f).trim();
    return " ";
  });
  const words: { t: string; accent: boolean }[] = [];
  for (const seg of semScript.split(/(\{[^}]*\})/)) {
    if (!seg) continue;
    const accent = seg.startsWith("{") && seg.endsWith("}");
    const inner = accent ? seg.slice(1, -1) : seg;
    for (const w of inner.split(/\s+/)) if (w) words.push({ t: w.toUpperCase(), accent });
  }

  const plain = texto.replace(/[{}()]/g, "");
  const base = 150;
  const len = plain.length;
  const size = len > 60 ? base * 0.6 : len > 40 ? base * 0.72 : len > 24 ? base * 0.86 : base;
  const scriptSize = Math.round(size * 0.74);

  const [anton, kaushan] = await Promise.all([
    loadFont(selfOrigin, "anton.ttf"),
    loadFont(selfOrigin, "kaushan.ttf"),
  ]);

  const baseW = {
    display: "flex",
    fontFamily: "Display",
    fontSize: size,
    letterSpacing: 1,
    color: CREAM,
    textShadow: SOMBRA,
  } as const;

  return new ImageResponse(
    (
      <div style={{ display: "flex", position: "relative", width: "100%", height: "100%" }}>
        {/* scrim escuro suave no centro pra legibilidade (sobre o vídeo) */}
        <div
          style={{
            display: "flex",
            position: "absolute",
            inset: 0,
            background:
              "radial-gradient(62% 30% at 50% 54%, rgba(8,11,20,0.62) 0%, rgba(8,11,20,0.3) 55%, rgba(8,11,20,0) 80%)",
          }}
        />
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            position: "relative",
            width: "100%",
            height: "100%",
            padding: "0 90px",
            paddingTop: Math.round(H * 0.42),
            alignItems: "center",
            textAlign: "center",
          }}
        >
          <div style={{ display: "flex", flexWrap: "wrap", alignItems: "center", justifyContent: "center", columnGap: Math.round(size * 0.22), rowGap: Math.round(size * 0.05), lineHeight: 1, maxWidth: "100%" }}>
            {words.map((w, i) => (
              <div key={i} style={w.accent ? { ...baseW, color: cor } : baseW}>
                {w.t}
              </div>
            ))}
          </div>
          {script ? (
            <div style={{ display: "flex", fontFamily: "Script", fontSize: scriptSize, color: CREAM, textShadow: SOMBRA, marginTop: Math.round(size * 0.14), transform: "rotate(-2deg)" }}>
              {script}
            </div>
          ) : null}
        </div>
      </div>
    ),
    {
      width: W,
      height: H,
      fonts: [
        { name: "Display", data: anton, weight: 400, style: "normal" },
        { name: "Script", data: kaushan, weight: 400, style: "normal" },
      ],
    },
  );
}
