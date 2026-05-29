import { ImageResponse } from "next/og";
import { NextRequest } from "next/server";

// Gerador de capa pros cursos da plataforma.
// Cada slug tem identidade visual própria, dentro da paleta da plataforma
// (bege/laranja/oliveira). Aspect 16:9, 1600x900. Sem foto — só tipografia
// e elementos geométricos.

type CapaConfig = {
  preLabel: string;
  titulo: string;
  subtitulo: string;
  rodape: string;
  bg: string; // gradiente css
  textoCor: string;
  acentoCor: string;
  preLabelCor: string;
  rodapeCor: string;
  badge?: string;
  livroUrl?: string; // se definido, layout vira "livro à esquerda + texto à direita"
};

const CAPAS: Record<string, CapaConfig> = {
  "ego-transformado-keller": {
    preLabel: "ESTUDO · 4 AULAS",
    titulo: "Ego\nTransformado",
    subtitulo: "Identidade · Humildade · Autoesquecimento",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #3F4A1F 0%, #5B6B2E 60%, #8A9856 100%)",
    textoCor: "#FAF6E8",
    acentoCor: "#E8E4CC",
    preLabelCor: "#D6CFA8",
    rodapeCor: "#D6CFA8",
    livroUrl: "https://m.media-amazon.com/images/I/71Vb4sTcewL.jpg",
  },
  "olhe-para-jesus": {
    preLabel: "ESTUDO · 7 AULAS",
    titulo: "Olhe\npara Jesus",
    subtitulo: "O caminho da transformação",
    rodape: "A partir do livro de Douglas Gonçalves",
    bg: "linear-gradient(135deg, #6B2E1A 0%, #B8542E 50%, #D88A3F 100%)",
    textoCor: "#FFF4E8",
    acentoCor: "#FBE4C2",
    preLabelCor: "#F5D0A4",
    rodapeCor: "#F5D0A4",
    livroUrl: "https://m.media-amazon.com/images/I/51Mqaoc5B8L.jpg",
  },
  biblia: {
    preLabel: "LEITURA · 6 VERSÕES",
    titulo: "Bíblia",
    subtitulo: "ACF · NAA · NVT · NVI · ARA · ARC",
    rodape: "Selecione versículos e gere imagens prontas",
    bg: "linear-gradient(135deg, #E8DCC0 0%, #D4C29A 50%, #B89E72 100%)",
    textoCor: "#3D2F18",
    acentoCor: "#6B5530",
    preLabelCor: "#7A6238",
    rodapeCor: "#6B5530",
  },
  "devocional-anual": {
    preLabel: "12 TEMAS MENSAIS",
    titulo: "Devocional\nAnual",
    subtitulo: "365 dias com Cristo",
    rodape: "Pr. Bruno Fernandes",
    bg: "linear-gradient(135deg, #2E3A18 0%, #4A5A28 35%, #C66B2E 100%)",
    textoCor: "#FFF8EC",
    acentoCor: "#F5E4C0",
    preLabelCor: "#E8D8A8",
    rodapeCor: "#E8D8A8",
    badge: "365",
  },
  "seja-um-lider-de-verdade": {
    preLabel: "LEITURA · 13 CAPÍTULOS",
    titulo: "Seja um\nLíder de\nVerdade",
    subtitulo: "Os princípios da liderança cristã",
    rodape: "A partir do livro de John Haggai",
    bg: "linear-gradient(135deg, #1F2A38 0%, #2E4256 55%, #4A6B7A 100%)",
    textoCor: "#F2F6F8",
    acentoCor: "#CFE0E6",
    preLabelCor: "#A8C4CE",
    rodapeCor: "#A8C4CE",
    livroUrl: "https://m.media-amazon.com/images/I/71hF00oPVYL.jpg",
  },
};

let cachedCormorantBold: ArrayBuffer | undefined;
let cachedCormorantItalic: ArrayBuffer | undefined;
let cachedInterItalic: ArrayBuffer | undefined;

async function loadFonts(origin: string) {
  if (!cachedCormorantBold) {
    cachedCormorantBold = await fetch(`${origin}/fonts/cormorant-bold.ttf`).then(
      (r) => r.arrayBuffer(),
    );
  }
  if (!cachedCormorantItalic) {
    cachedCormorantItalic = await fetch(
      `${origin}/fonts/cormorant-italic.ttf`,
    ).then((r) => r.arrayBuffer());
  }
  if (!cachedInterItalic) {
    cachedInterItalic = await fetch(`${origin}/fonts/inter-italic.ttf`).then(
      (r) => r.arrayBuffer(),
    );
  }
  return {
    cormorantBold: cachedCormorantBold!,
    cormorantItalic: cachedCormorantItalic!,
    interItalic: cachedInterItalic!,
  };
}

export async function GET(
  req: NextRequest,
  context: { params: Promise<{ slug: string }> },
) {
  const { slug } = await context.params;
  const config = CAPAS[slug];
  if (!config) {
    return new Response(`capa não definida para slug "${slug}"`, {
      status: 404,
    });
  }

  const origin = new URL(req.url).origin;
  const fonts = await loadFonts(origin);

  const w = 1600;
  const h = 900;

  const layoutLivro = !!config.livroUrl;

  return new ImageResponse(
    (
      <div
        style={{
          width: w,
          height: h,
          display: "flex",
          flexDirection: "row",
          background: config.bg,
          fontFamily: "Cormorant",
          position: "relative",
        }}
      >
        {/* Moldura sutil */}
        <div
          style={{
            position: "absolute",
            top: 36,
            left: 36,
            right: 36,
            bottom: 36,
            border: `1px solid ${config.acentoCor}`,
            opacity: 0.25,
            display: "flex",
          }}
        />

        {/* Badge "365" se houver */}
        {config.badge && (
          <div
            style={{
              position: "absolute",
              top: 90,
              right: 130,
              fontFamily: "Cormorant",
              fontStyle: "italic",
              fontSize: 280,
              color: config.acentoCor,
              opacity: 0.18,
              lineHeight: 1,
              display: "flex",
            }}
          >
            {config.badge}
          </div>
        )}

        {/* Coluna da capa do livro (só quando livroUrl) */}
        {layoutLivro && (
          <div
            style={{
              width: 560,
              height: "100%",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              padding: "90px 20px 90px 90px",
            }}
          >
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={config.livroUrl!}
              alt=""
              width={460}
              height={690}
              style={{
                maxWidth: 460,
                maxHeight: 690,
                objectFit: "contain",
                boxShadow: "0 30px 60px rgba(0,0,0,0.45)",
                borderRadius: 6,
              }}
            />
          </div>
        )}

        {/* Coluna de texto */}
        <div
          style={{
            flex: 1,
            display: "flex",
            flexDirection: "column",
            padding: layoutLivro ? "90px 90px 90px 40px" : "90px",
          }}
        >
          {/* Pré-label */}
          <div
            style={{
              fontFamily: "Inter",
              fontStyle: "italic",
              fontSize: 24,
              letterSpacing: "0.32em",
              color: config.preLabelCor,
              textTransform: "uppercase",
              display: "flex",
            }}
          >
            {config.preLabel}
          </div>

          {/* Espaçador flex */}
          <div style={{ display: "flex", flex: 1 }} />

          {/* Título */}
          <div
            style={{
              fontFamily: "Cormorant",
              fontWeight: 700,
              fontSize: layoutLivro ? 132 : 168,
              lineHeight: 0.94,
              color: config.textoCor,
              letterSpacing: "-0.02em",
              display: "flex",
              whiteSpace: "pre-wrap",
              marginBottom: 32,
            }}
          >
            {config.titulo}
          </div>

          {/* Divisor + subtítulo */}
          <div
            style={{
              display: "flex",
              alignItems: "center",
              gap: 24,
              marginBottom: 16,
            }}
          >
            <div
              style={{
                width: 80,
                height: 3,
                background: config.acentoCor,
                display: "flex",
              }}
            />
            <div
              style={{
                fontFamily: "Cormorant",
                fontStyle: "italic",
                fontSize: layoutLivro ? 34 : 40,
                color: config.acentoCor,
                display: "flex",
              }}
            >
              {config.subtitulo}
            </div>
          </div>

          {/* Rodapé */}
          <div
            style={{
              fontFamily: "Inter",
              fontStyle: "italic",
              fontSize: 22,
              letterSpacing: "0.06em",
              color: config.rodapeCor,
              display: "flex",
              marginTop: 12,
            }}
          >
            {config.rodape}
          </div>
        </div>
      </div>
    ),
    {
      width: w,
      height: h,
      fonts: [
        {
          name: "Cormorant",
          data: fonts.cormorantBold,
          weight: 700,
          style: "normal",
        },
        {
          name: "Cormorant",
          data: fonts.cormorantItalic,
          weight: 400,
          style: "italic",
        },
        {
          name: "Inter",
          data: fonts.interItalic,
          weight: 400,
          style: "italic",
        },
      ],
      headers: {
        "Cache-Control": "public, max-age=31536000, immutable",
      },
    },
  );
}
