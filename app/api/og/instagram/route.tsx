import { ImageResponse } from "next/og";
import type { NextRequest } from "next/server";
import { obterFundo } from "@/lib/fundo-cache";
import { renderSlideEditorial } from "@/lib/instagram-editorial-render";
import { ehModeloDeTexto, ehModeloEditorial, lerModelo } from "@/lib/instagram-modelos";
import { renderSlideModelo } from "@/lib/instagram-modelos-render";
import {
  BRUSH_FILE,
  FOG_FILE,
  FONTES,
  type FonteKey,
  GRUNGE_FILE,
  PAPEL_FILE,
  PAPER_SPECKS_FILE,
  type RealceModo,
  renderSlideInstagram,
  SCRIPT_FONT_FILE,
  SPLATTER_FILE,
  sanitizeCor,
  TAMANHO_H,
  TAMANHO_W,
  TEMA_PADRAO,
  TEMAS,
  type TemaKey,
} from "@/lib/instagram-render";
import { buscarFotoPexels } from "@/lib/pexels";

// Rota OG do carrossel (template "papel" 4:5). Compõe texto navy/dourado sobre
// papel creme + uma FOTO na faixa de baixo:
//   - prompt + seed  → gera (ou reaproveita do Storage) a foto FLUX.2.
//   - foto           → usa public/fundos/<foto>.jpg (fallback confiável).
//   - papel          → public/fundos/paper.jpg (asset fixo).
//
// Params: verso, fonte, realce, cor, top, ref, prompt, seed, foto, tom, dl, bg.
//
// `modelo` (citacao | checklist | cartao | manchete) troca tudo isso por uma
// moldura só de texto: não busca foto nem chama a IA.

// A serifada de leitura dos modelos de texto (corpo da citação, itens, cartão).
const FONTE_TEXTO_FILE = "dm-serif.ttf";

const fontCache: Record<string, ArrayBuffer> = {};
async function loadFont(origin: string, file: string) {
  if (!fontCache[file]) {
    fontCache[file] = await fetch(`${origin}/fonts/${file}`).then((r) =>
      r.arrayBuffer(),
    );
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
  const selfOrigin = `http://127.0.0.1:${process.env.PORT ?? 3000}`;
  const verso = (url.searchParams.get("verso") || "").trim();
  const fonteKey = (url.searchParams.get("fonte") || "anton") as FonteKey;
  const realce = (url.searchParams.get("realce") || "dourado") as RealceModo;
  // tema de cor (opção do sistema): define cor de destaque + pincelada.
  const temaKey = (url.searchParams.get("tema") || TEMA_PADRAO) as TemaKey;
  const tema = TEMAS[temaKey] || TEMAS[TEMA_PADRAO];
  // `cor` explícito sobrescreve o tema; senão usa a cor do tema.
  const corParam = url.searchParams.get("cor");
  const cor = corParam ? sanitizeCor(corParam) : tema.cor;
  const top = url.searchParams.get("top")?.trim() || undefined;
  const ref = url.searchParams.get("ref")?.trim() || undefined;
  const prompt = url.searchParams.get("prompt")?.trim() || "";
  const seed = parseInt(url.searchParams.get("seed") || "0", 10) || 0;
  const foto = url.searchParams.get("foto")?.trim() || "fallback";
  const tom = url.searchParams.get("tom") === "claro" ? "claro" : "escuro";
  // f=story: capa de Reel / story (1080×1920) em vez do post 4:5.
  const story = url.searchParams.get("f") === "story";
  const altura = story ? 1920 : TAMANHO_H;
  const download = url.searchParams.get("dl") === "1";
  const soFundo = url.searchParams.get("bg") === "1";

  const modelo = lerModelo(url.searchParams.get("modelo"));

  if (!FONTES[fonteKey]) return new Response("fonte inválida", { status: 400 });
  if (!soFundo && !verso)
    return new Response("parâmetro 'verso' obrigatório", { status: 400 });

  const filename = sanitizeFilename(`${verso.replace(/[{}()]/g, "").slice(0, 40)}.png`);
  const cabecalhos = download
    ? { "Content-Disposition": `attachment; filename="${filename}"` }
    : undefined;

  // Modelo de texto: sai antes de qualquer busca de foto.
  if (ehModeloDeTexto(modelo) && !soFundo) {
    const [display, script, textoFonte] = await Promise.all([
      loadFont(selfOrigin, FONTES[fonteKey].file),
      loadFont(selfOrigin, SCRIPT_FONT_FILE),
      loadFont(selfOrigin, FONTE_TEXTO_FILE),
    ]);
    return new ImageResponse(
      renderSlideModelo({
        modelo,
        texto: verso,
        cor,
        tom,
        maiusculas: FONTES[fonteKey].upper,
        top,
        ref,
        largura: TAMANHO_W,
        altura,
      }),
      {
        width: TAMANHO_W,
        height: altura,
        fonts: [
          {
            name: "Display",
            data: display,
            weight: 400,
            style: FONTES[fonteKey].style,
          },
          { name: "Script", data: script, weight: 400, style: "normal" },
          { name: "Texto", data: textoFonte, weight: 400, style: "normal" },
        ],
        headers: cabecalhos,
      },
    );
  }

  // resolve a foto: 1) IA (FLUX.2, guardada no Storage por prompt+seed) →
  //                 2) Pexels (foto de banco) se a IA falhar ou a cota acabar →
  //                 3) fallback local.
  // A IA vem primeiro porque a foto de banco é escolhida por palavra-chave e
  // raramente conversa com o texto do slide; a gerada segue o prompt.
  let bgSrc = `${selfOrigin}/fundos/${foto}${story ? "-story" : ""}.jpg`;
  // Foto enviada pelo pastor: vale mais que qualquer foto gerada. Só aceita o
  // que está no nosso próprio Storage — a rota não vira busca de URL alheia.
  const img = url.searchParams.get("img")?.trim() || "";
  const storage = `${(process.env.NEXT_PUBLIC_SUPABASE_URL || "").replace(/\/$/, "")}/storage/v1/object/public/`;
  const fotoPropria = img && storage.length > 30 && img.startsWith(storage) ? img : "";
  if (fotoPropria) {
    bgSrc = fotoPropria;
  } else if (prompt && modelo !== "editorial") {
    const gerado = await obterFundo(
      prompt,
      seed,
      story ? "story" : "feed",
      ehModeloEditorial(modelo) ? "documental" : "devocional",
    );
    if (gerado) {
      bgSrc = gerado;
    } else {
      const pex = await buscarFotoPexels(prompt, seed, TAMANHO_W, altura);
      if (pex) bgSrc = pex;
    }
  }

  // modo "só fundo": devolve a foto crua (sem texto/papel) — usada pela prévia da foto.
  if (soFundo) {
    if (bgSrc.startsWith("data:")) {
      const b64 = bgSrc.split(",")[1] || "";
      const bin = atob(b64);
      const bytes = new Uint8Array(bin.length);
      for (let k = 0; k < bin.length; k++) bytes[k] = bin.charCodeAt(k);
      return new Response(bytes, {
        headers: {
          "Content-Type": "image/jpeg",
          "Cache-Control": "public, max-age=86400",
        },
      });
    }
    return Response.redirect(bgSrc, 302);
  }

  // Modelos novos (cinema, bloco, cartaz, editorial): letra sobre a foto crua.
  if (ehModeloEditorial(modelo)) {
    const [condensada, grotesca, legenda, script] = await Promise.all([
      loadFont(selfOrigin, FONTES.anton.file),
      loadFont(selfOrigin, "inter-800.ttf"),
      loadFont(selfOrigin, "inter-500.ttf"),
      loadFont(selfOrigin, SCRIPT_FONT_FILE),
    ]);
    return new ImageResponse(
      renderSlideEditorial({
        modelo,
        texto: verso,
        cor,
        bgSrc: modelo === "editorial" ? undefined : bgSrc,
        graoSrc: `${selfOrigin}/texturas/grao.png`,
        top,
        ref,
        largura: TAMANHO_W,
        altura,
      }),
      {
        width: TAMANHO_W,
        height: altura,
        fonts: [
          { name: "Condensada", data: condensada, weight: 400, style: "normal" },
          { name: "Grotesca", data: grotesca, weight: 800, style: "normal" },
          { name: "Legenda", data: legenda, weight: 500, style: "normal" },
          { name: "Script", data: script, weight: 400, style: "normal" },
        ],
        headers: cabecalhos,
      },
    );
  }

  const [displayFont, scriptFont] = await Promise.all([
    loadFont(selfOrigin, FONTES[fonteKey].file),
    loadFont(selfOrigin, SCRIPT_FONT_FILE),
  ]);

  const paperSrc = `${selfOrigin}/fundos/${PAPEL_FILE}`;
  const grungeSrc = `${selfOrigin}/texturas/${GRUNGE_FILE}`;
  const brushSrc = `${selfOrigin}/texturas/${tema.brush || BRUSH_FILE}`; // pincelada do tema
  const splatterSrc = `${selfOrigin}/texturas/${SPLATTER_FILE}`;
  const paperSpecksSrc = `${selfOrigin}/texturas/${PAPER_SPECKS_FILE}`;
  const fogSrc = `${selfOrigin}/texturas/${FOG_FILE}`;

  const jsx = renderSlideInstagram({
    texto: verso,
    bgSrc,
    paperSrc,
    grungeSrc,
    brushSrc,
    splatterSrc,
    paperSpecksSrc,
    fogSrc,
    fonteKey,
    realce,
    cor,
    top,
    ref,
    tom,
    altura,
  });

  return new ImageResponse(jsx, {
    width: TAMANHO_W,
    height: altura,
    fonts: [
      {
        name: "Display",
        data: displayFont,
        weight: 400,
        style: FONTES[fonteKey].style,
      },
      { name: "Script", data: scriptFont, weight: 400, style: "normal" },
    ],
    headers: cabecalhos,
  });
}
