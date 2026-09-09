import { ImageResponse } from "next/og";
import type { NextRequest } from "next/server";
import { CAPA_LIVRO } from "@/lib/capas";

// Card de indicação de livro — sai quando o discípulo termina todas as mesas.
// Quem é o protagonista da arte é o LIVRO: a capa ocupa o centro, e embaixo
// vem a indicação (a frase que ele escreve, ou a que vem do próprio livro).
// Quem leu aparece como assinatura discreta, não como manchete.
//
// Formatos: Story do Instagram (1080x1920) e feed (1080x1350).
//
// A imagem é montada com o que a página já sabe: nada de consulta ao banco
// aqui, a rota só desenha. A capa vem de public/capas pelo slug — quando o
// livro não tem capa mapeada, o título ocupa o lugar dela.
//
// Exemplo:
//   /api/og/indicacao-livro?slug=o-deus-prodigo&titulo=O%20Deus%20Pródigo
//     &autor=Timothy%20Keller&nome=Bruno&frase=Vale%20cada%20página&f=story

let cachedCormorantBold: ArrayBuffer | undefined;
let cachedCormorantItalic: ArrayBuffer | undefined;
let cachedInterItalic: ArrayBuffer | undefined;

async function loadFonts(origin: string) {
  if (!cachedCormorantBold) {
    cachedCormorantBold = await fetch(`${origin}/fonts/cormorant-bold.ttf`).then((r) =>
      r.arrayBuffer(),
    );
  }
  if (!cachedCormorantItalic) {
    cachedCormorantItalic = await fetch(`${origin}/fonts/cormorant-italic.ttf`).then(
      (r) => r.arrayBuffer(),
    );
  }
  if (!cachedInterItalic) {
    cachedInterItalic = await fetch(`${origin}/fonts/inter-italic.ttf`).then((r) =>
      r.arrayBuffer(),
    );
  }
  return {
    cormorantBold: cachedCormorantBold!,
    cormorantItalic: cachedCormorantItalic!,
    interItalic: cachedInterItalic!,
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

const COR_CREAM = "#F5EDDE";
const COR_CREAM_SOFT = "rgba(245, 237, 222, 0.62)";
const COR_GOLD = "#C9A961";
const COR_GOLD_SOFT = "rgba(201, 169, 97, 0.5)";
const COR_INK = "#0B0F1A";

// Título longo tem que caber sem empurrar a capa pra fora do quadro.
function escalaTitulo(titulo: string, base: number): number {
  const len = titulo.length;
  if (len > 60) return Math.round(base * 0.62);
  if (len > 42) return Math.round(base * 0.74);
  if (len > 28) return Math.round(base * 0.86);
  return Math.round(base);
}

// A indicação é escrita à mão: pode vir com duas palavras ou com três linhas.
function escalaFrase(frase: string, base: number): number {
  const len = frase.length;
  if (len > 170) return Math.round(base * 0.68);
  if (len > 110) return Math.round(base * 0.8);
  if (len > 60) return Math.round(base * 0.9);
  return base;
}

// Muita gente aqui se cadastra como "Pr. Bruno" / "Pb. Lucas" — assinar
// "Lido por Pr." seria ridículo. Títulos caem fora; fica o nome.
const TRATAMENTOS = new Set([
  "pr",
  "pra",
  "pb",
  "pbr",
  "rev",
  "dr",
  "dra",
  "sr",
  "sra",
  "ir",
]);

function primeiroNome(nome: string): string {
  const partes = nome
    .trim()
    .split(/\s+/)
    .filter((p) => !TRATAMENTOS.has(p.replace(/\.$/, "").toLowerCase()));
  return partes[0] ?? nome.trim();
}

const MESES = [
  "janeiro",
  "fevereiro",
  "março",
  "abril",
  "maio",
  "junho",
  "julho",
  "agosto",
  "setembro",
  "outubro",
  "novembro",
  "dezembro",
];

export async function GET(req: NextRequest) {
  const url = new URL(req.url);
  const selfOrigin = `http://127.0.0.1:${process.env.PORT ?? 3000}`;

  const titulo = (url.searchParams.get("titulo") || "").trim();
  const autor = url.searchParams.get("autor")?.trim() || "";
  const nomeBruto = url.searchParams.get("nome")?.trim() || "";
  const slug = url.searchParams.get("slug")?.trim() || "";
  // Indicação: o texto que o discípulo escreve (ou a sinopse do livro).
  // Cortada no limite do que cabe na arte sem virar parágrafo de blog.
  const frase = (url.searchParams.get("frase") || "").trim().slice(0, 220);
  const formato = url.searchParams.get("f") === "feed" ? "feed" : "story";
  const download = url.searchParams.get("dl") === "1";
  // A prévia na tela ocupa 135x240 px, mas pedia a arte inteira (1080x1920):
  // 64x mais pixels do que ela usa, ~10 s de espera no celular. `escala` gera
  // a MESMA composição num canvas menor — o que a pessoa vê continua sendo
  // exatamente o que vai pro Story. Full size só no compartilhar/baixar.
  const escalaBruta = Number.parseFloat(url.searchParams.get("escala") || "1");
  const escala =
    Number.isFinite(escalaBruta) && escalaBruta > 0 && escalaBruta <= 1
      ? escalaBruta
      : 1;

  if (!titulo) {
    return new Response("parâmetro 'titulo' obrigatório", { status: 400 });
  }

  const w = 1080;
  const h = formato === "story" ? 1920 : 1350;

  // CAPA_LIVRO mistura arquivo local ("/capas/x.jpg") com URL de fora: só o
  // caminho local precisa do origin pro Satori conseguir buscar.
  const capa = CAPA_LIVRO[slug];
  const capaSrc = capa
    ? capa.startsWith("/")
      ? `${selfOrigin}${capa}`
      : capa
    : undefined;

  const nome = primeiroNome(nomeBruto);
  const agora = new Date();
  const dataLabel = `${MESES[agora.getMonth()]} de ${agora.getFullYear()}`;
  const fonts = await loadFonts(selfOrigin);

  const padX = 90;
  // No Story o Instagram cobre topo (nome do perfil) e base (campo de
  // resposta): ~200px de cada lado. Nada de texto ali dentro.
  const padY = formato === "story" ? 215 : 90;
  const capaAltura = formato === "story" ? (frase ? 780 : 900) : 560;
  const tituloBase = formato === "story" ? 86 : 72;

  const jsx = (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: COR_INK,
      }}
    >
      {/* Fundo: mesmo navy do template cinematográfico, pro card de conclusão
          nascer reconhecível como peça da casa. */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 0,
          left: 0,
          width: "100%",
          height: "100%",
          background:
            "radial-gradient(ellipse at 50% 30%, #2B3550 0%, #14192B 48%, #06090F 100%)",
        }}
      />
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 0,
          left: 0,
          width: "100%",
          height: "100%",
          background:
            "radial-gradient(ellipse 75% 70% at 50% 50%, rgba(0,0,0,0) 0%, rgba(0,0,0,0) 45%, rgba(5,7,12,0.6) 100%)",
        }}
      />

      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "relative",
          width: "100%",
          height: "100%",
          padding: `${padY}px ${padX}px`,
          alignItems: "center",
          justifyContent: "space-between",
          textAlign: "center",
          color: COR_CREAM,
        }}
      >
        {/* Topo: o marco */}
        <div
          style={{
            display: "flex",
            alignItems: "center",
            gap: 14,
            color: COR_GOLD,
            fontFamily: "Cormorant",
            fontWeight: 700,
            fontSize: formato === "story" ? 22 : 20,
            letterSpacing: 10,
            textTransform: "uppercase",
          }}
        >
          <div
            style={{
              display: "flex",
              width: 36,
              height: 1,
              backgroundColor: COR_GOLD_SOFT,
            }}
          />
          <div style={{ display: "flex" }}>Indicação de leitura</div>
          <div
            style={{
              display: "flex",
              width: 36,
              height: 1,
              backgroundColor: COR_GOLD_SOFT,
            }}
          />
        </div>

        {/* Centro: capa + título + autor */}
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            justifyContent: "center",
            flex: 1,
            width: "100%",
            paddingTop: 30,
            paddingBottom: 30,
          }}
        >
          {capaSrc ? (
            <div
              style={{
                display: "flex",
                marginBottom: 56,
                borderRadius: 8,
                border: `1px solid ${COR_GOLD_SOFT}`,
                boxShadow: "0 30px 80px rgba(0,0,0,0.6)",
                overflow: "hidden",
              }}
            >
              {/* biome-ignore lint/performance/noImgElement: Satori só entende <img>; next/image não existe dentro do ImageResponse */}
              <img
                src={capaSrc}
                alt=""
                style={{ height: capaAltura, objectFit: "contain" }}
              />
            </div>
          ) : null}

          <div
            style={{
              display: "flex",
              fontFamily: "Cormorant",
              fontWeight: 700,
              fontSize: escalaTitulo(titulo, capaSrc ? tituloBase * 0.62 : tituloBase),
              lineHeight: 1.06,
              letterSpacing: -1,
              color: COR_CREAM,
              textAlign: "center",
              textShadow: "0 2px 30px rgba(0,0,0,0.45)",
            }}
          >
            {titulo}
          </div>

          {autor ? (
            <div
              style={{
                display: "flex",
                marginTop: 18,
                fontFamily: "Cormorant",
                fontStyle: "italic",
                fontSize: formato === "story" ? 34 : 30,
                color: COR_CREAM_SOFT,
              }}
            >
              {autor}
            </div>
          ) : null}

          {frase ? (
            <div
              style={{
                display: "flex",
                marginTop: 34,
                maxWidth: 820,
                fontFamily: "Cormorant",
                fontStyle: "italic",
                fontWeight: 400,
                fontSize: escalaFrase(frase, formato === "story" ? 42 : 38),
                lineHeight: 1.3,
                color: COR_CREAM,
                textAlign: "center",
                textShadow: "0 2px 24px rgba(0,0,0,0.45)",
              }}
            >
              {`“${frase}”`}
            </div>
          ) : null}
        </div>

        {/* Rodapé: quem leu, quanto leu, e a marca */}
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            gap: 18,
          }}
        >
          <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
            <div
              style={{
                display: "flex",
                width: 48,
                height: 1,
                backgroundColor: COR_GOLD,
              }}
            />
            <div
              style={{
                display: "flex",
                width: 7,
                height: 7,
                backgroundColor: COR_GOLD,
                transform: "rotate(45deg)",
              }}
            />
            <div
              style={{
                display: "flex",
                width: 48,
                height: 1,
                backgroundColor: COR_GOLD,
              }}
            />
          </div>

          <div
            style={{
              display: "flex",
              fontFamily: "Inter",
              fontStyle: "italic",
              fontSize: formato === "story" ? 24 : 22,
              color: COR_CREAM_SOFT,
            }}
          >
            {nome ? `Lido por ${nome} · ${dataLabel}` : dataLabel}
          </div>

          <div
            style={{
              display: "flex",
              marginTop: 14,
              fontFamily: "Cormorant",
              fontWeight: 700,
              fontSize: formato === "story" ? 18 : 16,
              letterSpacing: 8,
              textTransform: "uppercase",
              color: COR_GOLD,
            }}
          >
            Ekballo Academy
          </div>
        </div>
      </div>
    </div>
  );

  const filename = sanitizeFilename(
    `${slug || titulo.slice(0, 40)}-indicacao-${formato}.png`,
  );

  // O desenho é montado sempre nas medidas finais e só então reduzido: assim
  // não existe uma segunda versão do layout para manter em pé.
  const jsxFinal =
    escala === 1 ? (
      jsx
    ) : (
      <div
        style={{
          display: "flex",
          width: w,
          height: h,
          transform: `scale(${escala})`,
          transformOrigin: "top left",
        }}
      >
        {jsx}
      </div>
    );

  return new ImageResponse(jsxFinal, {
    width: Math.round(w * escala),
    height: Math.round(h * escala),
    fonts: [
      { name: "Cormorant", data: fonts.cormorantBold, weight: 700, style: "normal" },
      { name: "Cormorant", data: fonts.cormorantItalic, weight: 400, style: "italic" },
      { name: "Inter", data: fonts.interItalic, weight: 400, style: "italic" },
    ],
    headers: download
      ? { "Content-Disposition": `attachment; filename="${filename}"` }
      : { "Cache-Control": "public, max-age=3600" },
  });
}
