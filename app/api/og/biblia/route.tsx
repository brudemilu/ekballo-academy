import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";
import { getLivro, getCapitulo, VERSAO_PADRAO } from "@/lib/biblia";
import { renderCinematografico } from "@/lib/cinematografico";

// Tamanhos:
//   feed  → 1080x1080 (Insta feed, WhatsApp)
//   story → 1080x1920 (Insta Story, Status WhatsApp)
//
// Temas:
//   classico        → fundo bege/terracota, Cormorant Garamond Italic, ornamentos
//   moderno         → fundo terracota sólido, Inter Italic, tipografia dominante
//   cinematografico → fundo gerado por IA (Imagen), overlay sacro navy/gold,
//                     Cormorant Italic. Fallback de gradiente se GEMINI_API_KEY ausente.

type Tema = "classico" | "moderno" | "cinematografico";
type Formato = "feed" | "story";

// Cache simples de fontes (fetch só na primeira chamada de cada runtime)
let cachedCormorantItalic: ArrayBuffer | undefined;
let cachedCormorantBold: ArrayBuffer | undefined;
let cachedInterItalic: ArrayBuffer | undefined;

async function loadFonts(origin: string): Promise<{
  cormorantItalic: ArrayBuffer;
  cormorantBold: ArrayBuffer;
  interItalic: ArrayBuffer;
}> {
  if (!cachedCormorantItalic) {
    cachedCormorantItalic = await fetch(
      `${origin}/fonts/cormorant-italic.ttf`
    ).then((r) => r.arrayBuffer());
  }
  if (!cachedCormorantBold) {
    cachedCormorantBold = await fetch(
      `${origin}/fonts/cormorant-bold.ttf`
    ).then((r) => r.arrayBuffer());
  }
  if (!cachedInterItalic) {
    cachedInterItalic = await fetch(
      `${origin}/fonts/inter-italic.ttf`
    ).then((r) => r.arrayBuffer());
  }
  return {
    cormorantItalic: cachedCormorantItalic!,
    cormorantBold: cachedCormorantBold!,
    interItalic: cachedInterItalic!,
  };
}

export async function GET(req: NextRequest) {
  const url = new URL(req.url);
  const livroId = Number(url.searchParams.get("livro") || "0");
  const cap = Number(url.searchParams.get("cap") || "0");
  const versParam = url.searchParams.get("v") || "";
  const formato = (url.searchParams.get("f") || "feed") as Formato;
  const tema = (url.searchParams.get("tema") || "classico") as Tema;
  const versao = (url.searchParams.get("versao") || VERSAO_PADRAO).toUpperCase();
  const download = url.searchParams.get("dl") === "1";

  const versNums = versParam
    .split(",")
    .map((s) => Number(s.trim()))
    .filter((n) => Number.isInteger(n) && n > 0);

  if (!livroId || !cap || versNums.length === 0) {
    return new Response("parâmetros inválidos: livro, cap, v obrigatórios", {
      status: 400,
    });
  }

  const [livro, todosDoCap, fonts] = await Promise.all([
    getLivro(livroId),
    getCapitulo(livroId, cap, versao),
    loadFonts(url.origin),
  ]);
  if (!livro) return new Response("livro não encontrado", { status: 404 });

  const selecionados = todosDoCap
    .filter((v) => versNums.includes(v.versiculo))
    .sort((a, b) => a.versiculo - b.versiculo);

  if (selecionados.length === 0) {
    return new Response("nenhum versículo encontrado", { status: 404 });
  }

  const nums = selecionados.map((s) => s.versiculo);
  const isRange =
    nums.length > 1 && nums.every((n, i) => i === 0 || n === nums[i - 1] + 1);
  const refLabel = isRange
    ? `${livro.nome} ${cap}:${nums[0]}-${nums[nums.length - 1]}`
    : `${livro.nome} ${cap}:${nums.join(",")}`;

  const texto = selecionados
    .map((s, i) => (i === 0 ? s.texto : ` ${s.texto}`))
    .join("");

  const w = 1080;
  const h = formato === "story" ? 1920 : 1080;

  const bgTema =
    url.searchParams.get("bg") ||
    "tranquil natural landscape at golden hour, wide open sky, soft light, contemplative";

  const jsx =
    tema === "cinematografico"
      ? await renderCinematografico(
          {
            verseText: texto,
            ref: refLabel,
            subRef: versao,
            bgTema,
            bgSeed: livroId * 1000 + cap,
          },
          formato,
        )
      : tema === "moderno"
        ? renderModerno(texto, refLabel, versao, formato)
        : renderClassico(texto, refLabel, versao, formato);

  return new ImageResponse(jsx, {
    width: w,
    height: h,
    fonts: [
      {
        name: "Cormorant",
        data: fonts.cormorantItalic,
        weight: 400,
        style: "italic",
      },
      {
        name: "Cormorant",
        data: fonts.cormorantBold,
        weight: 600,
        style: "normal",
      },
      {
        name: "Inter",
        data: fonts.interItalic,
        weight: 400,
        style: "italic",
      },
    ],
    headers: download
      ? {
          "Content-Disposition": `attachment; filename="${sanitizeFilename(
            `${refLabel}-${versao}-${tema}-${formato}.png`
          )}"`,
        }
      : undefined,
  });
}

// ============================================================================
// TEMA CLÁSSICO
// Fundo bege com gradient, Cormorant Italic, aspas grandes, cruz tipográfica.
// ============================================================================
function renderClassico(
  texto: string,
  refLabel: string,
  versao: string,
  formato: Formato
) {
  const charCount = texto.length;
  // Fontes maiores que o Moderno — clássico precisa "respirar" mais
  const fontSize =
    formato === "story"
      ? charCount < 120
        ? 110
        : charCount < 240
          ? 88
          : charCount < 380
            ? 70
            : 58
      : charCount < 100
        ? 92
        : charCount < 200
          ? 74
          : charCount < 320
            ? 60
            : 50;

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        width: "100%",
        height: "100%",
        padding: formato === "story" ? "120px 80px" : "90px 80px",
        background:
          "radial-gradient(circle at 30% 20%, #FCE5C7 0%, #F2C896 55%, #DEAA6D 100%)",
        color: "#3D2811",
        fontFamily: "Cormorant",
        position: "relative",
      }}
    >
      {/* Ornamento topo: linha + losango/quatrefólio SVG + linha */}
      <div
        style={{
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          gap: 18,
        }}
      >
        <div
          style={{
            display: "flex",
            flex: 1,
            height: 1,
            background: "#B57E2F",
            opacity: 0.5,
          }}
        />
        <svg width="42" height="42" viewBox="0 0 24 24">
          {/* Quatrefólio cristão sutil */}
          <path
            d="M12 2 C 14 6, 18 6, 22 8 C 18 10, 18 14, 12 22 C 6 14, 6 10, 2 8 C 6 6, 10 6, 12 2 Z"
            fill="#D55416"
            opacity="0.85"
          />
          <circle cx="12" cy="12" r="2" fill="#FCE5C7" />
        </svg>
        <div
          style={{
            display: "flex",
            flex: 1,
            height: 1,
            background: "#B57E2F",
            opacity: 0.5,
          }}
        />
      </div>

      {/* Versículo central */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          flex: 1,
          justifyContent: "center",
          alignItems: "center",
          padding: formato === "story" ? "60px 0" : "40px 0",
          position: "relative",
        }}
      >
        {/* Aspa grande decorativa */}
        <div
          style={{
            display: "flex",
            position: "absolute",
            top: formato === "story" ? -40 : -50,
            left: 20,
            fontSize: formato === "story" ? 360 : 300,
            fontFamily: "Cormorant",
            fontWeight: 600,
            color: "#D55416",
            opacity: 0.2,
            lineHeight: 1,
          }}
        >
          "
        </div>

        <div
          style={{
            display: "flex",
            fontSize,
            lineHeight: 1.3,
            fontFamily: "Cormorant",
            fontStyle: "italic",
            fontWeight: 400,
            textAlign: "center",
            color: "#3D2811",
            maxWidth: "100%",
          }}
        >
          {texto}
        </div>
      </div>

      {/* Footer: ref + versão + marca */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          gap: 16,
        }}
      >
        <div
          style={{
            display: "flex",
            fontFamily: "Cormorant",
            fontWeight: 600,
            fontSize: formato === "story" ? 68 : 56,
            color: "#5E3D17",
            letterSpacing: 1,
          }}
        >
          {refLabel}
        </div>
        <div
          style={{
            display: "flex",
            fontFamily: "Cormorant",
            fontStyle: "italic",
            fontSize: formato === "story" ? 28 : 24,
            letterSpacing: 8,
            color: "#8B4513",
            textTransform: "uppercase",
          }}
        >
          {versao}
        </div>

        {/* Ornamento entre footer e marca */}
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            gap: 14,
            marginTop: 24,
          }}
        >
          <div
            style={{
              display: "flex",
              width: 50,
              height: 1,
              background: "#B57E2F",
              opacity: 0.5,
            }}
          />
          <svg width="34" height="34" viewBox="0 0 32 32">
            <circle
              cx="16"
              cy="16"
              r="13"
              stroke="#D55416"
              strokeWidth="1.4"
              fill="none"
            />
            <path
              d="M9 19 L16 11 L23 19"
              stroke="#D55416"
              strokeWidth="1.7"
              fill="none"
              strokeLinecap="round"
              strokeLinejoin="round"
            />
            <line
              x1="9"
              y1="22.5"
              x2="23"
              y2="22.5"
              stroke="#5E3D17"
              strokeWidth="1.4"
              strokeLinecap="round"
            />
          </svg>
          <div
            style={{
              display: "flex",
              fontFamily: "Cormorant",
              fontWeight: 600,
              fontSize: 26,
              color: "#5E3D17",
              letterSpacing: 3,
            }}
          >
            EKBALLO ACADEMY
          </div>
          <div
            style={{
              display: "flex",
              width: 50,
              height: 1,
              background: "#B57E2F",
              opacity: 0.5,
            }}
          />
        </div>
      </div>
    </div>
  );
}

// ============================================================================
// TEMA MODERNO
// Fundo sólido terracota escuro, Inter Italic, tipografia dominante.
// ============================================================================
function renderModerno(
  texto: string,
  refLabel: string,
  versao: string,
  formato: Formato
) {
  const charCount = texto.length;
  const fontSize =
    formato === "story"
      ? charCount < 120
        ? 90
        : charCount < 240
          ? 72
          : charCount < 380
            ? 58
            : 48
      : charCount < 100
        ? 76
        : charCount < 200
          ? 62
          : charCount < 320
            ? 50
            : 42;

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        width: "100%",
        height: "100%",
        padding: formato === "story" ? "120px 80px" : "100px 80px",
        background: "#2A1810",
        color: "#FBDDC0",
        fontFamily: "Inter",
        position: "relative",
      }}
    >
      {/* Topo: barra laranja vertical + label */}
      <div
        style={{
          display: "flex",
          alignItems: "center",
          gap: 16,
        }}
      >
        <div
          style={{
            display: "flex",
            width: 4,
            height: 36,
            background: "#D55416",
          }}
        />
        <div
          style={{
            display: "flex",
            fontFamily: "Inter",
            fontSize: 22,
            letterSpacing: 8,
            color: "#D55416",
            textTransform: "uppercase",
            fontStyle: "italic",
          }}
        >
          Palavra
        </div>
      </div>

      {/* Versículo dominante */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          flex: 1,
          justifyContent: "center",
          paddingTop: formato === "story" ? 40 : 20,
          paddingBottom: formato === "story" ? 40 : 20,
        }}
      >
        <div
          style={{
            display: "flex",
            fontFamily: "Inter",
            fontStyle: "italic",
            fontSize,
            lineHeight: 1.25,
            color: "#FBDDC0",
            fontWeight: 400,
          }}
        >
          {texto}
        </div>
      </div>

      {/* Footer: ref grande + versão pequena + marca à direita */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
        }}
      >
        <div
          style={{
            display: "flex",
            width: 80,
            height: 3,
            background: "#D55416",
            marginBottom: 24,
          }}
        />
        <div
          style={{
            display: "flex",
            alignItems: "flex-end",
            justifyContent: "space-between",
            gap: 24,
          }}
        >
          <div
            style={{
              display: "flex",
              flexDirection: "column",
              gap: 6,
            }}
          >
            <div
              style={{
                display: "flex",
                fontFamily: "Inter",
                fontStyle: "italic",
                fontWeight: 400,
                fontSize: formato === "story" ? 52 : 42,
                color: "#FBDDC0",
              }}
            >
              {refLabel}
            </div>
            <div
              style={{
                display: "flex",
                fontFamily: "Inter",
                fontStyle: "italic",
                fontSize: formato === "story" ? 22 : 18,
                letterSpacing: 6,
                color: "#D55416",
                textTransform: "uppercase",
              }}
            >
              {versao}
            </div>
          </div>

          <div
            style={{
              display: "flex",
              alignItems: "center",
              gap: 10,
            }}
          >
            <svg width="28" height="28" viewBox="0 0 32 32">
              <circle
                cx="16"
                cy="16"
                r="13"
                stroke="#D55416"
                strokeWidth="1.4"
                fill="none"
              />
              <path
                d="M9 19 L16 11 L23 19"
                stroke="#D55416"
                strokeWidth="1.7"
                fill="none"
                strokeLinecap="round"
                strokeLinejoin="round"
              />
              <line
                x1="9"
                y1="22.5"
                x2="23"
                y2="22.5"
                stroke="#FBDDC0"
                strokeWidth="1.4"
                strokeLinecap="round"
              />
            </svg>
            <div
              style={{
                display: "flex",
                fontFamily: "Inter",
                fontSize: 18,
                color: "#FBDDC0",
                letterSpacing: 3,
                fontStyle: "italic",
              }}
            >
              ekballo
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

function sanitizeFilename(name: string): string {
  return name
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .replace(/[^a-zA-Z0-9._-]/g, "-")
    .replace(/-+/g, "-")
    .replace(/^-|-$/g, "");
}

