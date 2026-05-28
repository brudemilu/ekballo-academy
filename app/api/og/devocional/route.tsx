import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";
import { getDevocionalAnualByDia } from "@/lib/devocionais";
import { renderCinematografico } from "@/lib/cinematografico";

// Gerador de imagem do devocional anual.
//
// Tamanhos:
//   feed  → 1080x1080 (Insta feed, WhatsApp status)
//   story → 1080x1920 (Insta Story)
//
// Templates (fontes diversas):
//   pergaminho     → Cormorant Italic, fundo bege/sépia, ornamentos clássicos
//   bloco          → Inter Bold, terracota sólido, tipografia dominante
//   reflexao       → gradient oliveira+bege, layout limpo, versículo grande
//   cinematografico → Cormorant Italic + fundo gerado por IA (Imagen),
//                     overlay cinematográfico (gradiente + vinheta),
//                     paleta navy/cream/dourado. Fallback de gradiente se
//                     GEMINI_API_KEY não estiver definido.

type Template = "pergaminho" | "bloco" | "reflexao" | "cinematografico";
type Formato = "feed" | "story";

let cachedCormorantItalic: ArrayBuffer | undefined;
let cachedCormorantBold: ArrayBuffer | undefined;
let cachedInterItalic: ArrayBuffer | undefined;
let cachedInterBold: ArrayBuffer | undefined;

async function loadFonts(origin: string) {
  if (!cachedCormorantItalic) {
    cachedCormorantItalic = await fetch(`${origin}/fonts/cormorant-italic.ttf`).then((r) =>
      r.arrayBuffer(),
    );
  }
  if (!cachedCormorantBold) {
    cachedCormorantBold = await fetch(`${origin}/fonts/cormorant-bold.ttf`).then((r) =>
      r.arrayBuffer(),
    );
  }
  if (!cachedInterItalic) {
    cachedInterItalic = await fetch(`${origin}/fonts/inter-italic.ttf`).then((r) =>
      r.arrayBuffer(),
    );
  }
  // Fonte bold do Inter — usa a bold do Cormorant como fallback se não houver arquivo dedicado.
  if (!cachedInterBold) {
    cachedInterBold = cachedCormorantBold;
  }
  return {
    cormorantItalic: cachedCormorantItalic!,
    cormorantBold: cachedCormorantBold!,
    interItalic: cachedInterItalic!,
    interBold: cachedInterBold!,
  };
}

function sanitizeFilename(s: string) {
  return s.replace(/[^a-zA-Z0-9._-]/g, "-");
}

export async function GET(req: NextRequest) {
  const url = new URL(req.url);
  const diaAno = Number(url.searchParams.get("dia") || "0");
  const formato = (url.searchParams.get("f") || "feed") as Formato;
  const template = (url.searchParams.get("tema") || "pergaminho") as Template;
  const download = url.searchParams.get("dl") === "1";

  if (!Number.isInteger(diaAno) || diaAno < 1 || diaAno > 365) {
    return new Response("parâmetro dia inválido (1-365)", { status: 400 });
  }

  const [dev, fonts] = await Promise.all([
    getDevocionalAnualByDia(diaAno),
    loadFonts(url.origin),
  ]);
  if (!dev) return new Response("devocional não encontrado", { status: 404 });

  const w = 1080;
  const h = formato === "story" ? 1920 : 1080;

  // Tema do fundo IA: usa ?bg=... se passado, senão deriva do tema do devocional.
  const bgTema = url.searchParams.get("bg") || temaFundoDoDevocional(dev);

  let jsx;
  if (template === "bloco") {
    jsx = renderBloco(dev, formato);
  } else if (template === "reflexao") {
    jsx = renderReflexao(dev, formato);
  } else if (template === "cinematografico") {
    jsx = await renderCinematografico(
      {
        verseText: dev.versiculo_texto,
        ref: dev.versiculo_ref,
        topLabel: dev.tema,
        subRef: `— ${dev.autor}`,
        bgTema,
        bgSeed: diaAno,
      },
      formato,
    );
  } else {
    jsx = renderPergaminho(dev, formato);
  }

  return new ImageResponse(jsx, {
    width: w,
    height: h,
    fonts: [
      { name: "Cormorant", data: fonts.cormorantItalic, weight: 400, style: "italic" },
      { name: "Cormorant", data: fonts.cormorantBold, weight: 600, style: "normal" },
      { name: "Inter", data: fonts.interItalic, weight: 400, style: "italic" },
      { name: "InterBold", data: fonts.interBold, weight: 700, style: "normal" },
    ],
    headers: download
      ? {
          "Content-Disposition": `attachment; filename="${sanitizeFilename(
            `devocional-${diaAno}-${template}-${formato}.png`,
          )}"`,
        }
      : undefined,
  });
}

type Dev = {
  titulo: string;
  versiculo_ref: string;
  versiculo_texto: string;
  versiculo_versao: string;
  tema: string;
  autor: string;
};

// Mapeia cada tema mensal pra uma CENA DE NATUREZA/PAISAGEM — nunca pessoas
// nem figuras religiosas. As exclusões fortes ficam no lib/imagen, aqui só
// damos a cena. A variação por dia vem do seed (dia_ano).
const CENA_POR_TEMA: Record<string, string> = {
  Recomeço:
    "vast sunrise over a calm horizon, first light breaking through soft clouds, new dawn",
  Coração:
    "serene still lake at dawn reflecting a warm sky, gentle ripples, quiet water",
  Família:
    "warm countryside path lined with trees at golden hour, cozy distant home lights",
  "Cruz e vida nova":
    "empty hilltop at sunrise with dramatic sky, green shoots emerging from soil, renewal",
  Honra:
    "majestic mountain peaks bathed in golden light, vast valley below, grandeur",
  "Espírito Santo":
    "wind moving through a golden wheat field, soft light, flowing air and clouds",
  Propósito:
    "long winding road through open landscape toward distant mountains at sunrise",
  Mordomia:
    "fertile green fields and terraced farmland under soft morning light, abundance",
  Arrependimento:
    "gentle rain clearing over a quiet valley, mist lifting, soft light returning",
  Igreja:
    "grove of strong trees standing together in warm forest light, rays through canopy",
  Perseverança:
    "lone tree on a windswept cliff against a dramatic sky, steadfast, resilient",
  Emanuel:
    "peaceful starry winter night over snowy hills, warm light glowing on the horizon",
};

// Deriva um prompt de fundo a partir do tema mensal. Usa a cena de natureza
// mapeada; se o tema não estiver no mapa, cai num pôr do sol genérico.
function temaFundoDoDevocional(d: Dev): string {
  const base = d.tema?.trim() || "";
  return (
    CENA_POR_TEMA[base] ||
    "tranquil natural landscape at golden hour, soft light, wide open sky"
  );
}

// ============================================================================
// TEMPLATE 1: PERGAMINHO (Cormorant Italic, bege/sépia, ornamentos clássicos)
// ============================================================================
function renderPergaminho(d: Dev, formato: Formato) {
  const tituloSize = formato === "story" ? 100 : 78;
  const verseSize = formato === "story" ? 52 : 42;
  const refSize = formato === "story" ? 42 : 34;

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        width: "100%",
        height: "100%",
        padding: formato === "story" ? "120px 90px" : "90px 80px",
        background:
          "radial-gradient(circle at 30% 20%, #FCE5C7 0%, #F2C896 55%, #DEAA6D 100%)",
        color: "#3D2811",
        fontFamily: "Cormorant",
      }}
    >
      {/* Topo: tema mensal + ornamento */}
      <div style={{ display: "flex", alignItems: "center", gap: 16 }}>
        <div style={{ display: "flex", flex: 1, height: 1, background: "#B57E2F", opacity: 0.4 }} />
        <div
          style={{
            display: "flex",
            fontFamily: "Cormorant",
            fontStyle: "italic",
            fontSize: 28,
            letterSpacing: 10,
            color: "#8B4513",
            textTransform: "uppercase",
          }}
        >
          {d.tema}
        </div>
        <div style={{ display: "flex", flex: 1, height: 1, background: "#B57E2F", opacity: 0.4 }} />
      </div>

      {/* Título */}
      <div
        style={{
          display: "flex",
          marginTop: formato === "story" ? 80 : 60,
          fontFamily: "Cormorant",
          fontWeight: 600,
          fontSize: tituloSize,
          color: "#5E3D17",
          lineHeight: 1.1,
          textAlign: "center",
          justifyContent: "center",
        }}
      >
        {d.titulo}
      </div>

      {/* Versículo */}
      <div
        style={{
          display: "flex",
          flex: 1,
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "center",
          marginTop: 40,
          marginBottom: 40,
        }}
      >
        <div
          style={{
            display: "flex",
            fontSize: verseSize,
            fontStyle: "italic",
            lineHeight: 1.4,
            color: "#3D2811",
            textAlign: "center",
            maxWidth: "92%",
          }}
        >
          &ldquo;{d.versiculo_texto}&rdquo;
        </div>
        <div
          style={{
            display: "flex",
            fontWeight: 600,
            fontSize: refSize,
            color: "#8B4513",
            marginTop: 30,
            letterSpacing: 1,
          }}
        >
          {d.versiculo_ref} · {d.versiculo_versao}
        </div>
      </div>

      {/* Footer: autor + Ekballo */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          gap: 12,
        }}
      >
        <div style={{ display: "flex", width: 80, height: 1, background: "#B57E2F", opacity: 0.5 }} />
        <div
          style={{
            display: "flex",
            fontStyle: "italic",
            fontSize: formato === "story" ? 34 : 28,
            color: "#5E3D17",
          }}
        >
          — {d.autor}
        </div>
        <div
          style={{
            display: "flex",
            fontFamily: "InterBold",
            fontWeight: 700,
            fontSize: formato === "story" ? 22 : 18,
            letterSpacing: 6,
            color: "#8B4513",
            opacity: 0.7,
            marginTop: 8,
          }}
        >
          EKBALLO ACADEMY
        </div>
      </div>
    </div>
  );
}

// ============================================================================
// TEMPLATE 2: BLOCO (Inter Bold + Italic, fundo terracota sólido, ousado)
// ============================================================================
function renderBloco(d: Dev, formato: Formato) {
  const tituloSize = formato === "story" ? 130 : 96;
  const verseSize = formato === "story" ? 44 : 36;

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        width: "100%",
        height: "100%",
        padding: formato === "story" ? "100px 80px" : "80px 70px",
        background: "#2A1810",
        color: "#FBDDC0",
        fontFamily: "Inter",
      }}
    >
      {/* Barra lateral laranja + tema */}
      <div style={{ display: "flex", alignItems: "center", gap: 24 }}>
        <div style={{ display: "flex", width: 8, height: 60, background: "#D55416" }} />
        <div
          style={{
            display: "flex",
            fontFamily: "InterBold",
            fontWeight: 700,
            fontSize: 28,
            letterSpacing: 8,
            color: "#D55416",
            textTransform: "uppercase",
          }}
        >
          {d.tema}
        </div>
      </div>

      {/* Título dominante */}
      <div
        style={{
          display: "flex",
          marginTop: formato === "story" ? 60 : 40,
          fontFamily: "InterBold",
          fontWeight: 700,
          fontSize: tituloSize,
          lineHeight: 1.05,
          color: "#FBDDC0",
        }}
      >
        {d.titulo}
      </div>

      {/* Espaço pra versículo */}
      <div
        style={{
          display: "flex",
          flex: 1,
          flexDirection: "column",
          justifyContent: "flex-end",
          marginBottom: 40,
        }}
      >
        <div
          style={{
            display: "flex",
            fontStyle: "italic",
            fontSize: verseSize,
            lineHeight: 1.45,
            color: "#FBDDC0",
            opacity: 0.85,
            maxWidth: "88%",
          }}
        >
          &ldquo;{d.versiculo_texto}&rdquo;
        </div>
      </div>

      {/* Footer: barra + ref + autor */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          gap: 18,
          paddingTop: 30,
          borderTop: "2px solid #D55416",
        }}
      >
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
          }}
        >
          <div
            style={{
              display: "flex",
              fontFamily: "InterBold",
              fontWeight: 700,
              fontSize: formato === "story" ? 44 : 36,
              color: "#FBDDC0",
            }}
          >
            {d.versiculo_ref}
          </div>
          <div
            style={{
              display: "flex",
              fontFamily: "InterBold",
              fontWeight: 700,
              fontSize: 22,
              letterSpacing: 4,
              color: "#D55416",
            }}
          >
            {d.versiculo_versao}
          </div>
        </div>
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            opacity: 0.7,
          }}
        >
          <div style={{ display: "flex", fontStyle: "italic", fontSize: 24, color: "#FBDDC0" }}>
            — {d.autor}
          </div>
          <div
            style={{
              display: "flex",
              fontFamily: "InterBold",
              fontWeight: 700,
              fontSize: 18,
              letterSpacing: 4,
              color: "#FBDDC0",
            }}
          >
            EKBALLO ACADEMY
          </div>
        </div>
      </div>
    </div>
  );
}

// ============================================================================
// TEMPLATE 3: REFLEXÃO (Cormorant + Inter mistos, gradient oliveira/bege)
// ============================================================================
function renderReflexao(d: Dev, formato: Formato) {
  const tituloSize = formato === "story" ? 88 : 70;
  const verseSize = formato === "story" ? 62 : 50;

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        width: "100%",
        height: "100%",
        padding: formato === "story" ? "100px 80px" : "80px 70px",
        background:
          "linear-gradient(160deg, #FBDDC0 0%, #DEAA6D 45%, #7A8B5C 100%)",
        color: "#2A1810",
        fontFamily: "Cormorant",
      }}
    >
      {/* Topo: tema */}
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          fontFamily: "InterBold",
          fontWeight: 700,
          fontSize: 24,
          letterSpacing: 12,
          color: "#5E3D17",
          textTransform: "uppercase",
        }}
      >
        {d.tema}
      </div>

      {/* Versículo grande, centralizado */}
      <div
        style={{
          display: "flex",
          flex: 1,
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "center",
          padding: "40px 0",
        }}
      >
        <div
          style={{
            display: "flex",
            fontFamily: "Cormorant",
            fontStyle: "italic",
            fontWeight: 400,
            fontSize: verseSize,
            lineHeight: 1.3,
            color: "#2A1810",
            textAlign: "center",
            maxWidth: "92%",
          }}
        >
          &ldquo;{d.versiculo_texto}&rdquo;
        </div>
        <div
          style={{
            display: "flex",
            fontFamily: "InterBold",
            fontWeight: 700,
            fontSize: formato === "story" ? 38 : 30,
            color: "#5E3D17",
            marginTop: 36,
            letterSpacing: 2,
          }}
        >
          {d.versiculo_ref}
        </div>
      </div>

      {/* Título embaixo */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          gap: 16,
          paddingTop: 30,
          borderTop: "1px solid rgba(94,61,23,0.4)",
        }}
      >
        <div
          style={{
            display: "flex",
            fontFamily: "Cormorant",
            fontWeight: 600,
            fontSize: tituloSize,
            color: "#5E3D17",
            textAlign: "center",
            lineHeight: 1.1,
          }}
        >
          {d.titulo}
        </div>
        <div
          style={{
            display: "flex",
            fontStyle: "italic",
            fontSize: formato === "story" ? 30 : 24,
            color: "#5E3D17",
            opacity: 0.8,
          }}
        >
          — {d.autor}
        </div>
      </div>
    </div>
  );
}

