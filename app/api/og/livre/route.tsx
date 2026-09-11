import { ImageResponse } from "next/og";
import type { NextRequest } from "next/server";
import { type CinemaFormato, renderCinematografico } from "@/lib/cinematografico";
import { isMolduraKey, molduraUrlPara, renderEditorial } from "@/lib/editorial";

// Gerador livre — usado pelo painel admin (/admin/imagens) e pelo botão de
// compartilhar trecho dentro das mesas (components/AulaConteudo.tsx).
//
// Template padrão: "editorial" (lib/editorial.tsx) — foto real do Pexels em
// tamanho nativo, moldura dourada desenhada no Canva, escurecimento repartido.
// O "cinematografico" antigo continua acessível por `tema=cinematografico`, pra
// não quebrar link já salvo ou compartilhado.
//
// Exemplos:
//   /api/og/livre?verso=O%20Senhor%20é%20o%20meu%20pastor&ref=Salmos%2023:1&f=feed
//   /api/og/livre?verso=...&ref=...&brand=Ekballo&top=Esperança&sub=NAA&f=story
//   /api/og/livre?verso=...&tema=cinematografico   (template antigo)

type Tema = "editorial" | "cinematografico";

// Cena padrão pra quando quem chama não escolhe fundo — é o caso dos trechos de
// livro, que só mandam texto e título. Sem isso a peça sairia no gradiente liso.
const TEMA_FUNDO_PADRAO = "paisagem serena ao amanhecer, névoa baixa, luz dourada";

let cachedCormorantItalic: ArrayBuffer | undefined;
let cachedCormorantBold: ArrayBuffer | undefined;

async function loadFonts(origin: string) {
  if (!cachedCormorantItalic) {
    cachedCormorantItalic = await fetch(`${origin}/fonts/cormorant-italic.ttf`).then(
      (r) => r.arrayBuffer(),
    );
  }
  if (!cachedCormorantBold) {
    cachedCormorantBold = await fetch(`${origin}/fonts/cormorant-bold.ttf`).then((r) =>
      r.arrayBuffer(),
    );
  }
  return {
    cormorantItalic: cachedCormorantItalic!,
    cormorantBold: cachedCormorantBold!,
  };
}

function sanitizeFilename(s: string): string {
  return s
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .replace(/[^a-zA-Z0-9._-]/g, "-")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");
}

/**
 * Semente estável a partir do texto: o mesmo trecho pega sempre a mesma foto
 * (reabrir o modal não troca a imagem), mas trechos diferentes variam.
 */
function semente(texto: string): number {
  let h = 0;
  for (let i = 0; i < texto.length; i++) {
    h = (h * 31 + texto.charCodeAt(i)) | 0;
  }
  return Math.abs(h);
}

export async function GET(req: NextRequest) {
  const url = new URL(req.url);
  const selfOrigin = `http://127.0.0.1:${process.env.PORT ?? 3000}`;
  const verso = (url.searchParams.get("verso") || "").trim();
  const ref = (url.searchParams.get("ref") || "").trim();
  const top = url.searchParams.get("top")?.trim();
  const sub = url.searchParams.get("sub")?.trim();
  const brand = url.searchParams.get("brand")?.trim();
  const formato = (url.searchParams.get("f") || "feed") as CinemaFormato;
  const tema = (url.searchParams.get("tema") || "editorial") as Tema;
  const molduraParam = url.searchParams.get("moldura");
  const moldura = isMolduraKey(molduraParam) ? molduraParam : "classica";
  const download = url.searchParams.get("dl") === "1";

  // `bg` ausente → cena padrão (o caso dos trechos de livro).
  // `bg=` vazio de propósito → sem foto, fica no gradiente.
  const bgParam = url.searchParams.get("bg");
  const bg = bgParam === null ? TEMA_FUNDO_PADRAO : bgParam.trim() || undefined;

  if (!verso) {
    return new Response("parâmetro 'verso' obrigatório", { status: 400 });
  }

  const seedParam = Number(url.searchParams.get("seed"));
  const seed = Number.isFinite(seedParam) && seedParam > 0 ? seedParam : semente(verso);

  const larg = 1080;
  // O editorial usa 4:5 no feed (1080×1350), que é o que o Instagram favorece e
  // o que o carrossel já usava. O cinematográfico antigo fica no 1:1 de sempre.
  const alt = formato === "story" ? 1920 : tema === "cinematografico" ? 1080 : 1350;

  const fonts = await loadFonts(selfOrigin);

  const jsx =
    tema === "cinematografico"
      ? await renderCinematografico(
          {
            verseText: verso,
            ref,
            topLabel: top,
            subRef: sub,
            brand,
            bgTema: bg,
            bgSeed: seed,
          },
          formato,
        )
      : await renderEditorial(
          {
            verseText: verso,
            ref,
            topLabel: top,
            subRef: sub,
            brand,
            bgTema: bg,
            bgSeed: seed,
            molduraUrl: molduraUrlPara(selfOrigin, formato, moldura),
          },
          formato,
        );

  const filenameBase = ref || verso.slice(0, 40);
  const filename = sanitizeFilename(`${filenameBase}-${tema}-${formato}.png`);

  return new ImageResponse(jsx, {
    width: larg,
    height: alt,
    fonts: [
      { name: "Cormorant", data: fonts.cormorantItalic, weight: 400, style: "italic" },
      { name: "Cormorant", data: fonts.cormorantBold, weight: 600, style: "normal" },
    ],
    headers: download
      ? { "Content-Disposition": `attachment; filename="${filename}"` }
      : undefined,
  });
}
