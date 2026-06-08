import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";
import {
  renderSlideInstagram,
  sanitizeCor,
  FONTES,
  SCRIPT_FONT_FILE,
  PAPEL_FILE,
  GRUNGE_FILE,
  BRUSH_FILE,
  SPLATTER_FILE,
  PAPER_SPECKS_FILE,
  TAMANHO_W,
  TAMANHO_H,
  type FonteKey,
  type RealceModo,
} from "@/lib/instagram-render";
import { gerarFundoLivre } from "@/lib/instagram";

// Rota OG do carrossel (template "papel" 4:5). Compõe texto navy/dourado sobre
// papel creme + uma FOTO na faixa de baixo:
//   - prompt + seed  → gera (ou reaproveita do cache) a foto Flux (faixa).
//   - foto           → usa public/fundos/<foto>.jpg (fallback confiável).
//   - papel          → public/fundos/paper.jpg (asset fixo).
//
// Params: verso, fonte, realce, cor, top, ref, prompt, seed, foto, dl, bg.

// cache em memória da foto Flux por (prompt|seed) — evita regerar a cada tweak.
const fundoCache = new Map<string, string>();

const fontCache: Record<string, ArrayBuffer> = {};
async function loadFont(origin: string, file: string) {
  if (!fontCache[file]) {
    fontCache[file] = await fetch(`${origin}/fonts/${file}`).then((r) => r.arrayBuffer());
  }
  return fontCache[file];
}

function sanitizeFilename(s: string): string {
  return s
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .replace(/[^a-zA-Z0-9._-]/g, "-")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");
}

export async function GET(req: NextRequest) {
  const url = new URL(req.url);
  const verso = (url.searchParams.get("verso") || "").trim();
  const fonteKey = (url.searchParams.get("fonte") || "anton") as FonteKey;
  const realce = (url.searchParams.get("realce") || "dourado") as RealceModo;
  const cor = sanitizeCor(url.searchParams.get("cor"));
  const top = url.searchParams.get("top")?.trim() || undefined;
  const ref = url.searchParams.get("ref")?.trim() || undefined;
  const prompt = url.searchParams.get("prompt")?.trim() || "";
  const seed = parseInt(url.searchParams.get("seed") || "0", 10) || 0;
  const foto = url.searchParams.get("foto")?.trim() || "fallback";
  const download = url.searchParams.get("dl") === "1";
  const soFundo = url.searchParams.get("bg") === "1";

  if (!FONTES[fonteKey]) return new Response("fonte inválida", { status: 400 });
  if (!soFundo && !verso) return new Response("parâmetro 'verso' obrigatório", { status: 400 });

  // resolve a foto da faixa
  let bgSrc = `${url.origin}/fundos/${foto}.jpg`;
  if (prompt) {
    const key = `${prompt}|${seed}`;
    let data = fundoCache.get(key);
    if (!data) {
      const gerado = await gerarFundoLivre(prompt, seed);
      if (gerado) {
        data = gerado;
        fundoCache.set(key, data);
        if (fundoCache.size > 120) fundoCache.delete(fundoCache.keys().next().value!);
      }
    }
    if (data) bgSrc = data;
  }

  // modo "só fundo": devolve a foto crua (sem texto/papel) — usada pela prévia da foto.
  if (soFundo) {
    if (bgSrc.startsWith("data:")) {
      const b64 = bgSrc.split(",")[1] || "";
      const bin = atob(b64);
      const bytes = new Uint8Array(bin.length);
      for (let k = 0; k < bin.length; k++) bytes[k] = bin.charCodeAt(k);
      return new Response(bytes, {
        headers: { "Content-Type": "image/jpeg", "Cache-Control": "public, max-age=86400" },
      });
    }
    return Response.redirect(bgSrc, 302);
  }

  const [displayFont, scriptFont] = await Promise.all([
    loadFont(url.origin, FONTES[fonteKey].file),
    loadFont(url.origin, SCRIPT_FONT_FILE),
  ]);

  const paperSrc = `${url.origin}/fundos/${PAPEL_FILE}`;
  const grungeSrc = `${url.origin}/texturas/${GRUNGE_FILE}`;
  const brushSrc = `${url.origin}/texturas/${BRUSH_FILE}`;
  const splatterSrc = `${url.origin}/texturas/${SPLATTER_FILE}`;
  const paperSpecksSrc = `${url.origin}/texturas/${PAPER_SPECKS_FILE}`;

  const jsx = renderSlideInstagram({ texto: verso, bgSrc, paperSrc, grungeSrc, brushSrc, splatterSrc, paperSpecksSrc, fonteKey, realce, cor, top, ref });

  const filename = sanitizeFilename(`${verso.replace(/[{}()]/g, "").slice(0, 40)}.png`);

  return new ImageResponse(jsx, {
    width: TAMANHO_W,
    height: TAMANHO_H,
    fonts: [
      { name: "Display", data: displayFont, weight: 400, style: FONTES[fonteKey].style },
      { name: "Script", data: scriptFont, weight: 400, style: "normal" },
    ],
    headers: download ? { "Content-Disposition": `attachment; filename="${filename}"` } : undefined,
  });
}