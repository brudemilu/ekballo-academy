import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";
import { renderCinematografico, CinemaFormato } from "@/lib/cinematografico";

// Gerador livre — usado pelo painel admin /admin/imagens.
// Aceita verso, ref, brand e tema do fundo livres via query params.
//
// Exemplos:
//   /api/og/livre?verso=O%20Senhor%20é%20o%20meu%20pastor&ref=Salmos%2023:1&f=feed&bg=montanhas%20amanhecer
//   /api/og/livre?verso=...&ref=...&brand=Ekballo%20Academy&top=Esperança&sub=NAA&f=story

let cachedCormorantItalic: ArrayBuffer | undefined;
let cachedCormorantBold: ArrayBuffer | undefined;

async function loadFonts(origin: string) {
  if (!cachedCormorantItalic) {
    cachedCormorantItalic = await fetch(`${origin}/fonts/cormorant-italic.ttf`).then(
      (r) => r.arrayBuffer(),
    );
  }
  if (!cachedCormorantBold) {
    cachedCormorantBold = await fetch(`${origin}/fonts/cormorant-bold.ttf`).then(
      (r) => r.arrayBuffer(),
    );
  }
  return { cormorantItalic: cachedCormorantItalic!, cormorantBold: cachedCormorantBold! };
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
  const ref = (url.searchParams.get("ref") || "").trim();
  const top = url.searchParams.get("top")?.trim();
  const sub = url.searchParams.get("sub")?.trim();
  const brand = url.searchParams.get("brand")?.trim();
  const bg = url.searchParams.get("bg")?.trim();
  const formato = (url.searchParams.get("f") || "feed") as CinemaFormato;
  const download = url.searchParams.get("dl") === "1";

  if (!verso) {
    return new Response("parâmetro 'verso' obrigatório", { status: 400 });
  }

  const w = 1080;
  const h = formato === "story" ? 1920 : 1080;

  const fonts = await loadFonts(url.origin);

  const jsx = await renderCinematografico(
    {
      verseText: verso,
      ref: ref || "",
      topLabel: top,
      subRef: sub,
      brand,
      bgTema: bg || undefined,
    },
    formato,
  );

  const filenameBase = ref || verso.slice(0, 40);
  const filename = sanitizeFilename(`${filenameBase}-cinematografico-${formato}.png`);

  return new ImageResponse(jsx, {
    width: w,
    height: h,
    fonts: [
      { name: "Cormorant", data: fonts.cormorantItalic, weight: 400, style: "italic" },
      { name: "Cormorant", data: fonts.cormorantBold, weight: 600, style: "normal" },
    ],
    headers: download ? { "Content-Disposition": `attachment; filename="${filename}"` } : undefined,
  });
}
