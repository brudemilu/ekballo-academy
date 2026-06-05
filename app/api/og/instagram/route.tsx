import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";
import {
  renderSlideInstagram,
  sanitizeCor,
  FONTES,
  TAMANHO_SLIDE,
  type FonteKey,
  type RealceModo,
} from "@/lib/instagram-render";
import { gerarFundoLivre } from "@/lib/instagram";

// Rota OG do carrossel de Instagram. Compõe o texto sobre um fundo:
//   - prompt + seed  → gera (ou reaproveita do cache) um fundo Flux. Mesmo
//     prompt+seed = MESMA imagem, então mexer no texto não troca o fundo.
//   - foto           → usa public/fundos/<foto>.jpg (fallback confiável).
//
// Params: verso, fonte, realce, cor, top, ref, n, i, prompt, seed, foto, dl.

// cache em memória do fundo Flux por (prompt|seed) — evita regerar a cada tweak.
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
  const realce = (url.searchParams.get("realce") || "circulo") as RealceModo;
  const cor = sanitizeCor(url.searchParams.get("cor"));
  const top = url.searchParams.get("top")?.trim() || undefined;
  const ref = url.searchParams.get("ref")?.trim() || undefined;
  const n = Math.max(1, parseInt(url.searchParams.get("n") || "1", 10));
  const i = Math.max(0, parseInt(url.searchParams.get("i") || "0", 10));
  const prompt = url.searchParams.get("prompt")?.trim() || "";
  const seed = parseInt(url.searchParams.get("seed") || "0", 10) || 0;
  const foto = url.searchParams.get("foto")?.trim() || "fallback";
  const download = url.searchParams.get("dl") === "1";
  const soFundo = url.searchParams.get("bg") === "1";

  if (!FONTES[fonteKey]) return new Response("fonte inválida", { status: 400 });
  if (!soFundo && !verso) return new Response("parâmetro 'verso' obrigatório", { status: 400 });

  // resolve o fundo
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

  // modo "só fundo": devolve a imagem crua (sem texto) — usada pela prévia ao vivo.
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

  const fontData = await loadFont(url.origin, FONTES[fonteKey].file);

  const jsx = renderSlideInstagram({ texto: verso, bgSrc, fonteKey, realce, cor, top, ref, n, i });

  const filename = sanitizeFilename(`${verso.replace(/[{}]/g, "").slice(0, 40)}-${i + 1}.png`);

  return new ImageResponse(jsx, {
    width: TAMANHO_SLIDE,
    height: TAMANHO_SLIDE,
    fonts: [{ name: "Display", data: fontData, weight: 400, style: FONTES[fonteKey].style }],
    headers: download ? { "Content-Disposition": `attachment; filename="${filename}"` } : undefined,
  });
}
