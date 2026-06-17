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
  "pregacao-keller": {
    preLabel: "ESTUDO · 10 AULAS",
    titulo: "Pregação",
    subtitulo: "Comunicando a fé na era do ceticismo",
    rodape: "A partir do livro de Timothy Keller",
    bg: "linear-gradient(135deg, #14233A 0%, #243E5C 52%, #4E7390 100%)",
    textoCor: "#EDF3FA",
    acentoCor: "#E2B86A",
    preLabelCor: "#A9C3DB",
    rodapeCor: "#A9C3DB",
  },
  "proverbios-para-criancas": {
    preLabel: "LEITURA · 31 DIAS",
    titulo: "Provérbios\npara Crianças",
    subtitulo: "31 dias de ensinamentos",
    rodape: "A partir do livro de Caiene Cassoli",
    bg: "linear-gradient(135deg, #1F5A66 0%, #2E8C8A 50%, #6FC3A8 100%)",
    textoCor: "#F2FBF8",
    acentoCor: "#FBD86A",
    preLabelCor: "#BFE6DC",
    rodapeCor: "#BFE6DC",
  },
  "herois-da-fe": {
    preLabel: "LEITURA · 20 BIOGRAFIAS",
    titulo: "Heróis\nda Fé",
    subtitulo: "Vinte homens que incendiaram o mundo",
    rodape: "A partir do livro de Orlando Boyer",
    bg: "linear-gradient(135deg, #2B1410 0%, #6E2A1C 52%, #B8842E 100%)",
    textoCor: "#FBF0E6",
    acentoCor: "#F0C66A",
    preLabelCor: "#DBB592",
    rodapeCor: "#DBB592",
  },
  "adoracao-biblica": {
    preLabel: "ESTUDO · 11 MESAS",
    titulo: "Adoração\nBíblica",
    subtitulo: "Os fundamentos da verdadeira adoração",
    rodape: "A partir do livro de Russell P. Shedd",
    bg: "linear-gradient(135deg, #1A2238 0%, #2E3A5C 45%, #B8923E 100%)",
    textoCor: "#FBF6EA",
    acentoCor: "#EFE0BC",
    preLabelCor: "#D9C088",
    rodapeCor: "#D9C088",
  },
  "carta-aos-pecadores": {
    preLabel: "ESTUDO · 11 CARTAS",
    titulo: "Carta aos\nPecadores",
    subtitulo: "Graça e verdade para quem luta",
    rodape: "A partir do livro de Douglas Gonçalves e Saulo Daniel",
    bg: "linear-gradient(135deg, #2A1614 0%, #5E2A24 52%, #B05A42 100%)",
    textoCor: "#FBEEE8",
    acentoCor: "#EEC9A8",
    preLabelCor: "#D9A98C",
    rodapeCor: "#D9A98C",
  },
  "o-cuidado-do-corpo": {
    preLabel: "ESTUDO · 14 MESAS",
    titulo: "O Cuidado\ndo Corpo",
    subtitulo: "Sabedoria bíblica para o bem-estar físico e espiritual",
    rodape: "A partir do livro de Luciano Subirá",
    bg: "linear-gradient(135deg, #15301F 0%, #2C5A3B 52%, #6FA85E 100%)",
    textoCor: "#EEFBEF",
    acentoCor: "#CCEABA",
    preLabelCor: "#9FC891",
    rodapeCor: "#9FC891",
  },
  corajosas: {
    preLabel: "LEITURA · 4 HISTÓRIAS",
    titulo: "Corajosas",
    subtitulo: "Coragem, identidade e valor aos olhos de Deus",
    rodape: "Ficção cristã — Arlene, Queren, Maria e Thaís",
    bg: "linear-gradient(135deg, #3A1633 0%, #6E2A54 52%, #C97AA0 100%)",
    textoCor: "#FBEEF5",
    acentoCor: "#F0C7DC",
    preLabelCor: "#DCA9C4",
    rodapeCor: "#DCA9C4",
  },
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
  "o-desafio-de-todo-lider": {
    preLabel: "ESTUDO · LIDERANÇA CRISTÃ",
    titulo: "O Desafio\nde Todo\nLíder",
    subtitulo: "Da visão à ação",
    rodape: "A partir do livro de Elias Dantas, Ph.D.",
    bg: "linear-gradient(135deg, #241A12 0%, #4A3624 55%, #7E5C34 100%)",
    textoCor: "#F8F1E4",
    acentoCor: "#E9D2A4",
    preLabelCor: "#D4B985",
    rodapeCor: "#D4B985",
    livroUrl: "/capas/o-desafio-de-todo-lider.png",
  },
  "autoridade-espiritual": {
    preLabel: "ESTUDO · 20 CAPÍTULOS",
    titulo: "Autoridade\nEspiritual",
    subtitulo: "Autoridade e submissão",
    rodape: "A partir do livro de Watchman Nee",
    bg: "linear-gradient(135deg, #1C1630 0%, #3A2A50 52%, #6E4A86 100%)",
    textoCor: "#F6F0FA",
    acentoCor: "#E6C98A",
    preLabelCor: "#C9A9D8",
    rodapeCor: "#C9A9D8",
    livroUrl: "https://m.media-amazon.com/images/I/61AohjLEplL.jpg",
  },
  "blueprint-parach": {
    preLabel: "ESTUDO · LIDERANÇA DO REINO",
    titulo: "O Blueprint\nde Parach",
    subtitulo: "Lidere do transbordar, não da exaustão",
    rodape: "A partir do livro de Dr. Richard William",
    bg: "linear-gradient(135deg, #131D10 0%, #2C3B22 50%, #7E7A34 100%)",
    textoCor: "#F7F2E0",
    acentoCor: "#E8C56A",
    preLabelCor: "#CBC07E",
    rodapeCor: "#CBC07E",
    livroUrl: "/capas/blueprint-parach.jpg",
  },
  "igreja-simples": {
    preLabel: "ESTUDO · 9 CAPÍTULOS",
    titulo: "Igreja\nSimples",
    subtitulo: "Retornando ao processo de Deus para fazer discípulos",
    rodape: "A partir do livro de Thom S. Rainer & Eric Geiger",
    bg: "linear-gradient(135deg, #3A2614 0%, #7A5326 48%, #C98F49 100%)",
    textoCor: "#FBF2E0",
    acentoCor: "#E8C079",
    preLabelCor: "#D8B381",
    rodapeCor: "#D8B381",
    livroUrl: "/capas/igreja-simples.jpg",
  },
  contentamento: {
    preLabel: "ESTUDO · 11 CAPÍTULOS",
    titulo: "Contentamento",
    subtitulo: "Aprender a se contentar em toda e qualquer situação",
    rodape: "A partir do livro de Nancy Wilson",
    livroUrl: "/capas/contentamento.png",
    bg: "linear-gradient(135deg, #4A2433 0%, #7E3F54 52%, #C98AA0 100%)",
    textoCor: "#FBEFF2",
    acentoCor: "#E8B65C",
    preLabelCor: "#E6C2CC",
    rodapeCor: "#E6C2CC",
  },
  "discipulado-bonhoeffer": {
    preLabel: "ESTUDO · 15 CAPÍTULOS",
    titulo: "Discipulado",
    subtitulo: "A graça preciosa e o chamado a seguir Jesus",
    rodape: "A partir do livro de Dietrich Bonhoeffer",
    livroUrl: "/capas/discipulado-bonhoeffer.jpg",
    bg: "linear-gradient(135deg, #1C1A19 0%, #3A2320 52%, #7C2F26 100%)",
    textoCor: "#F4ECE4",
    acentoCor: "#C9A24B",
    preLabelCor: "#C9B7A6",
    rodapeCor: "#C9B7A6",
  },
  "oracao-keller": {
    preLabel: "ESTUDO · 15 CAPÍTULOS",
    titulo: "Oração",
    subtitulo: "Experimentando intimidade com Deus",
    rodape: "A partir do livro de Timothy Keller",
    livroUrl: "/capas/oracao-keller.jpg",
    bg: "linear-gradient(135deg, #11203A 0%, #1E3A5F 55%, #3E6FA0 100%)",
    textoCor: "#EAF1FA",
    acentoCor: "#E6B450",
    preLabelCor: "#AEC6E0",
    rodapeCor: "#AEC6E0",
  },
  "cristao-sociedade-nao-crista": {
    preLabel: "ESTUDO · 17 CAPÍTULOS",
    titulo: "O Cristão\nna Sociedade",
    subtitulo: "Posicionar-se biblicamente diante dos desafios de hoje",
    rodape: "A partir do livro de John Stott",
    livroUrl: "/capas/cristao-sociedade-nao-crista.jpg",
    bg: "linear-gradient(135deg, #122420 0%, #1F4039 55%, #3E7A66 100%)",
    textoCor: "#EAF3EE",
    acentoCor: "#E6C27A",
    preLabelCor: "#AFCDBF",
    rodapeCor: "#AFCDBF",
  },
  "cultura-da-honra": {
    preLabel: "ESTUDO · 8 CAPÍTULOS",
    titulo: "Cultura\nda Honra",
    subtitulo: "Vivendo em uma atmosfera sobrenatural",
    rodape: "A partir do livro de Danny Silk",
    livroUrl: "/capas/cultura-da-honra.jpg",
    bg: "linear-gradient(135deg, #2E2208 0%, #5E4715 55%, #A9842F 100%)",
    textoCor: "#FBF4E2",
    acentoCor: "#F2D27A",
    preLabelCor: "#DCC79A",
    rodapeCor: "#DCC79A",
  },
  "jesuscopy": {
    preLabel: "ESTUDO · 8 CAPÍTULOS",
    titulo: "JesusCopy",
    subtitulo: "Tornar-se uma cópia de Jesus",
    rodape: "A partir do livro de Douglas Gonçalves",
    bg: "linear-gradient(135deg, #161616 0%, #2C2C2C 55%, #555555 100%)",
    textoCor: "#F4F4F2",
    acentoCor: "#E0B24A",
    preLabelCor: "#BDBDBD",
    rodapeCor: "#BDBDBD",
    livroUrl: "/capas/jesuscopy.jpg",
  },
  "igreja-com-propositos": {
    preLabel: "ESTUDO · 20 CAPÍTULOS",
    titulo: "Uma Igreja\ncom Propósitos",
    subtitulo: "Edificando a igreja nos cinco propósitos de Deus",
    rodape: "A partir do livro de Rick Warren",
    bg: "linear-gradient(135deg, #14223A 0%, #21456E 55%, #3E80B0 100%)",
    textoCor: "#ECF3FA",
    acentoCor: "#E2B24A",
    preLabelCor: "#AECBE4",
    rodapeCor: "#AECBE4",
    livroUrl: "/capas/igreja-com-propositos.jpg",
  },
  "trelica-videira": {
    preLabel: "ESTUDO · 12 CAPÍTULOS",
    titulo: "A Treliça\ne a Videira",
    subtitulo: "A mentalidade de discipulado que muda tudo",
    rodape: "A partir do livro de Colin Marshall & Tony Payne",
    bg: "linear-gradient(135deg, #1E2B16 0%, #3C5226 55%, #6E8B3D 100%)",
    textoCor: "#F1F5E8",
    acentoCor: "#D9B24A",
    preLabelCor: "#C3D29E",
    rodapeCor: "#C3D29E",
    livroUrl: "/capas/trelica-videira.jpg",
  },
  "discipulado-contemplacao": {
    preLabel: "ESTUDO · 26 CAPÍTULOS",
    titulo: "Discipulado\ncomeça com\nContemplação",
    subtitulo: "Tornar-se como Jesus ao contemplá-Lo",
    rodape: "A partir do livro de Samuel Whitefield",
    bg: "linear-gradient(135deg, #5A0E10 0%, #8E1B1C 52%, #C0392B 100%)",
    textoCor: "#FCEFE6",
    acentoCor: "#F2B24C",
    preLabelCor: "#F0C9A0",
    rodapeCor: "#F0C9A0",
    livroUrl: "/capas/discipulado-contemplacao.jpg",
  },
  "lideranca-com-propositos": {
    preLabel: "ESTUDO · LIDERANÇA BÍBLICA",
    titulo: "Liderança\ncom\nPropósitos",
    subtitulo: "Princípios eficazes para o líder no século XXI",
    rodape: "A partir do livro de Rick Warren",
    bg: "linear-gradient(135deg, #2A1B0E 0%, #5A3E22 55%, #A07C46 100%)",
    textoCor: "#FAF3E6",
    acentoCor: "#E6C27A",
    preLabelCor: "#D4B585",
    rodapeCor: "#D4B585",
    livroUrl: "/capas/lideranca-com-propositos.jpg",
  },
  "campo-batalha-mente": {
    preLabel: "ESTUDO · 25 CAPÍTULOS",
    titulo: "Campo de\nBatalha\nda Mente",
    subtitulo: "Vencendo a batalha em sua mente",
    rodape: "A partir do livro de Joyce Meyer",
    bg: "linear-gradient(135deg, #0B1A2E 0%, #14365C 55%, #2E6BA0 100%)",
    textoCor: "#F0F5FB",
    acentoCor: "#E6B450",
    preLabelCor: "#AEC6E0",
    rodapeCor: "#AEC6E0",
    livroUrl: "/capas/campo-batalha-mente.jpg",
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

  const fontList = [
    { name: "Cormorant", data: fonts.cormorantBold, weight: 700 as const, style: "normal" as const },
    { name: "Cormorant", data: fonts.cormorantItalic, weight: 400 as const, style: "italic" as const },
    { name: "Inter", data: fonts.interItalic, weight: 400 as const, style: "italic" as const },
  ];

  const temLivro = !!config.livroUrl;
  // Capas locais (em /public) começam com "/"; precisam do origin pro Satori buscar.
  const capaSrc = config.livroUrl
    ? config.livroUrl.startsWith("/")
      ? `${origin}${config.livroUrl}`
      : config.livroUrl
    : undefined;

  // Formato retrato (3:4) — card padronizado pros cursos. Layout vertical com a
  // mesma moldura/identidade. Quando há capa de livro, ela aparece centralizada
  // e do mesmo tamanho em todos (object-contain + sombra), sobre o gradiente da
  // marca; quando não há (ex.: Bíblia, Devocional), usa a tipografia.
  if (new URL(req.url).searchParams.get("formato") === "retrato") {
    const pw = 900;
    const ph = 1200;
    if (temLivro) {
      // Pôster: a capa preenche o card inteiro (object-cover) e o
      // título/autor descansam sobre um degradê escuro embaixo — uniforme
      // pra todas as capas, sem aquela imagem flutuando no vazio.
      return new ImageResponse(
        (
          <div
            style={{
              width: pw,
              height: ph,
              display: "flex",
              flexDirection: "column",
              justifyContent: "flex-end",
              background: config.bg,
              fontFamily: "Cormorant",
              position: "relative",
            }}
          >
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={capaSrc!}
              alt=""
              width={pw}
              height={ph}
              style={{
                position: "absolute",
                top: 0,
                left: 0,
                width: pw,
                height: ph,
                objectFit: "cover",
              }}
            />
            {/* degradê inferior pro texto descansar */}
            <div
              style={{
                position: "absolute",
                top: 0,
                left: 0,
                width: pw,
                height: ph,
                display: "flex",
                background:
                  "linear-gradient(to top, rgba(10,9,12,0.94) 0%, rgba(10,9,12,0.78) 20%, rgba(10,9,12,0.30) 42%, rgba(10,9,12,0) 60%)",
              }}
            />
            {/* plaquê de texto */}
            <div
              style={{
                position: "relative",
                display: "flex",
                flexDirection: "column",
                padding: "0 58px 70px",
              }}
            >
              <div
                style={{
                  display: "flex",
                  fontFamily: "Inter",
                  fontStyle: "italic",
                  fontSize: 21,
                  letterSpacing: "0.26em",
                  textTransform: "uppercase",
                  color: "rgba(255,255,255,0.82)",
                  marginBottom: 18,
                }}
              >
                {config.preLabel}
              </div>
              <div
                style={{
                  display: "flex",
                  width: 60,
                  height: 3,
                  background: config.acentoCor,
                  marginBottom: 22,
                }}
              />
              <div
                style={{
                  display: "flex",
                  fontFamily: "Cormorant",
                  fontWeight: 700,
                  fontSize: 74,
                  lineHeight: 1.02,
                  color: "#ffffff",
                  whiteSpace: "pre-line",
                }}
              >
                {config.titulo}
              </div>
              <div
                style={{
                  display: "flex",
                  fontFamily: "Inter",
                  fontStyle: "italic",
                  fontSize: 23,
                  letterSpacing: "0.02em",
                  color: "rgba(255,255,255,0.78)",
                  marginTop: 20,
                }}
              >
                {config.rodape}
              </div>
            </div>
          </div>
        ),
        {
          width: pw,
          height: ph,
          fonts: fontList,
          headers: { "Cache-Control": "public, max-age=31536000, immutable" },
        },
      );
    }
    return new ImageResponse(
      (
        <div
          style={{
            width: pw,
            height: ph,
            display: "flex",
            flexDirection: "column",
            justifyContent: "space-between",
            background: config.bg,
            fontFamily: "Cormorant",
            position: "relative",
            padding: 80,
          }}
        >
          <div
            style={{
              position: "absolute",
              top: 30,
              left: 30,
              right: 30,
              bottom: 30,
              border: `1px solid ${config.acentoCor}`,
              opacity: 0.25,
              display: "flex",
            }}
          />
          {config.badge && (
            <div
              style={{
                position: "absolute",
                bottom: 24,
                right: 60,
                fontFamily: "Cormorant",
                fontStyle: "italic",
                fontSize: 360,
                color: config.acentoCor,
                opacity: 0.13,
                lineHeight: 1,
                display: "flex",
              }}
            >
              {config.badge}
            </div>
          )}

          <div
            style={{
              fontFamily: "Inter",
              fontStyle: "italic",
              fontSize: 24,
              letterSpacing: "0.3em",
              color: config.preLabelCor,
              textTransform: "uppercase",
              display: "flex",
            }}
          >
            {config.preLabel}
          </div>

          <div style={{ display: "flex", flexDirection: "column" }}>
            <div
              style={{
                fontFamily: "Cormorant",
                fontWeight: 700,
                fontSize: 150,
                lineHeight: 0.94,
                color: config.textoCor,
                letterSpacing: "-0.02em",
                whiteSpace: "pre-wrap",
                display: "flex",
                marginBottom: 28,
              }}
            >
              {config.titulo}
            </div>
            <div style={{ display: "flex", alignItems: "center", gap: 20 }}>
              <div style={{ width: 70, height: 3, background: config.acentoCor, display: "flex" }} />
              <div
                style={{
                  fontFamily: "Cormorant",
                  fontStyle: "italic",
                  fontSize: 44,
                  color: config.acentoCor,
                  display: "flex",
                }}
              >
                {config.subtitulo}
              </div>
            </div>
          </div>

          <div
            style={{
              fontFamily: "Inter",
              fontStyle: "italic",
              fontSize: 24,
              letterSpacing: "0.06em",
              color: config.rodapeCor,
              display: "flex",
            }}
          >
            {config.rodape}
          </div>
        </div>
      ),
      {
        width: pw,
        height: ph,
        fonts: fontList,
        headers: { "Cache-Control": "public, max-age=31536000, immutable" },
      },
    );
  }

  const w = 1600;
  const h = 900;

  const layoutLivro = !!config.livroUrl;
  // Capas locais (em /public) começam com "/"; precisam do origin pro Satori buscar.
  const livroSrc = config.livroUrl
    ? config.livroUrl.startsWith("/")
      ? `${origin}${config.livroUrl}`
      : config.livroUrl
    : undefined;

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
              src={livroSrc!}
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
