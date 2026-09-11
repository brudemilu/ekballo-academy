/**
 * Renderização compartilhada do template Editorial.
 *
 * É o sucessor do `cinematografico` (lib/cinematografico.tsx), que continua
 * funcionando para URLs já salvas. O que muda aqui, e por quê:
 *
 *   FOTO NÍTIDA. O cinematográfico pedia o fundo ao Flux schnell, que só entrega
 *   1024×1024 — no story (1080×1920) isso era esticado ~1,9× e virava papa. Aqui
 *   a primeira opção é fotografia real do Pexels, pedida ao CDN já no tamanho
 *   exato do formato, então a imagem chega no tamanho em que vai ser desenhada.
 *   A IA continua existindo, mas como reserva.
 *
 *   LUZ. O cinematográfico empilhava três camadas escuras e afogava a foto (a
 *   metade de baixo virava preto chapado). Aqui o escurecimento é dividido: um
 *   piso leve na imagem toda, um halo suave só atrás do texto e um pé mais
 *   escuro no rodapé. A fotografia continua visível.
 *
 *   MOLDURA. Sobreposição dourada desenhada no Canva e recortada em PNG
 *   transparente (public/molduras/). Os cantos ornamentados foram redesenhados
 *   pelo Canva em cada proporção, então não há arte esticada.
 *
 *   RITMO. O cinematográfico distribuía o conteúdo pela tela inteira, o que
 *   deixava uma faixa morta enorme no topo do story. Aqui o conteúdo é
 *   posicionado DENTRO da moldura, então os dois formatos ficam equilibrados.
 *
 * Quem chama:
 *   - app/api/og/livre/route.tsx       (gerador do admin e trechos de livro)
 *   - app/api/og/devocional/route.tsx  (tema=editorial)
 *   - app/api/og/biblia/route.tsx      (tema=editorial)
 */
import { gerarFundoSafe } from "@/lib/imagen";
import { buscarFotoPexels } from "@/lib/pexels";

export type EditorialFormato = "feed" | "story";

/**
 * Molduras disponíveis em public/molduras/, ambas desenhadas no Canva:
 *   classica → filete duplo com cantos em arabesco (livro antigo)
 *   deco     → filete triplo com cantos em esquadria (art déco, mais contido)
 */
export type MolduraKey = "classica" | "deco";

export const MOLDURAS: MolduraKey[] = ["classica", "deco"];

export function isMolduraKey(v: string | null | undefined): v is MolduraKey {
  return v === "classica" || v === "deco";
}

export type EditorialPayload = {
  /** Texto principal (versículo, trecho). Será envolto em aspas curvas. */
  verseText: string;
  /** Referência no rodapé. Ex: "SALMOS 23:1". Mostrada em caixa alta. */
  ref: string;
  /** Rótulo opcional no topo. Ex: tema do mês. Vazio = só o losango dourado. */
  topLabel?: string;
  /** Subtexto no rodapé. Ex: autor ("— Timothy Keller") ou versão ("ACF"). */
  subRef?: string;
  /** Marca no rodapé. Default: "EKBALLO ACADEMY". Vazio explícito esconde. */
  brand?: string;
  /** Tema da foto de fundo. Vazio = sem foto (fica no gradiente). */
  bgTema?: string;
  /** Varia a foto de forma determinística (dia do ano, nº do capítulo). */
  bgSeed?: number;
  /**
   * URL absoluta de uma foto específica. Quando definida, tem prioridade sobre
   * bgTema e pula tanto o Pexels quanto a IA.
   */
  bgUrl?: string;
  /**
   * URL absoluta do PNG da moldura. A rota monta a partir do próprio origin
   * (ex.: `${origin}/molduras/classica-feed.png`). Vazio = sem moldura.
   */
  molduraUrl?: string;
};

const COR_CREAM = "#F5EDDE";
const COR_CREAM_SOFT = "rgba(245, 237, 222, 0.72)";
const COR_GOLD = "#C9A961";
const COR_INK = "#0B0F1A";

/**
 * Geometria de cada formato. `molduraX`/`molduraY` são a margem REAL medida nos
 * PNGs de public/molduras (não chutada) — o conteúdo é posicionado a partir
 * delas, mais um respiro, pra nunca encostar no filete dourado.
 *
 * Os valores são os da moldura clássica; a déco fecha 3px mais alto (28/329 em
 * vez de 31/332). A diferença é menor que o respiro, então uma geometria só
 * serve as duas — se entrar uma terceira moldura com margem bem diferente, aí
 * sim isto precisa virar tabela por moldura.
 */
const GEO = {
  feed: { larg: 1080, alt: 1350, molduraX: 48, molduraY: 31, respiro: 62 },
  story: { larg: 1080, alt: 1920, molduraX: 60, molduraY: 332, respiro: 66 },
} as const;

/** Corpo do texto principal, pela quantidade de texto e pelo formato. */
function escalaVerso(texto: string, formato: EditorialFormato): number {
  const base = formato === "story" ? 60 : 56;
  const len = texto.length;
  let escala = 1;
  if (len > 420) escala = 0.62;
  else if (len > 320) escala = 0.7;
  else if (len > 240) escala = 0.79;
  else if (len > 170) escala = 0.88;
  else if (len < 80) escala = 1.16;
  return Math.round(base * escala);
}

/**
 * Resolve a foto de fundo, na ordem: foto explícita → Pexels (real, alta, de
 * graça e sem teto diário) → IA (reserva) → nada (o template cai no gradiente).
 */
async function resolverFundo(
  payload: EditorialPayload,
  formato: EditorialFormato,
): Promise<string | null> {
  if (payload.bgUrl) return payload.bgUrl;
  if (!payload.bgTema) return null;

  const { larg, alt } = GEO[formato];
  const seed = payload.bgSeed ?? 0;

  const foto = await buscarFotoPexels(payload.bgTema, seed, larg, alt);
  if (foto) return foto;

  const ia = await gerarFundoSafe({
    tema: payload.bgTema,
    aspect: formato === "story" ? "9:16" : "4:5",
    seed: payload.bgSeed,
  });
  return ia?.src ?? null;
}

export async function renderEditorial(
  payload: EditorialPayload,
  formato: EditorialFormato,
) {
  const geo = GEO[formato];
  const fundo = await resolverFundo(payload, formato);

  const verseText = `“${payload.verseText.trim()}”`;
  const verseSize = escalaVerso(verseText, formato);

  const refSize = formato === "story" ? 23 : 21;
  const subSize = formato === "story" ? 19 : 17;
  const brandSize = formato === "story" ? 17 : 15;
  const topSize = formato === "story" ? 20 : 18;

  const brandLabel =
    payload.brand === "" ? null : (payload.brand || "EKBALLO ACADEMY").toUpperCase();

  // caixa de conteúdo: exatamente o vão interno da moldura, menos o respiro.
  const caixa = {
    top: geo.molduraY + geo.respiro,
    left: geo.molduraX + geo.respiro,
    width: geo.larg - 2 * (geo.molduraX + geo.respiro),
    height: geo.alt - 2 * (geo.molduraY + geo.respiro),
  };

  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: COR_INK,
      }}
    >
      {/* 1. fotografia (ou gradiente, quando não há foto) */}
      {fundo ? (
        // eslint-disable-next-line @next/next/no-img-element
        // biome-ignore lint/performance/noImgElement: o Satori (next/og) só entende <img> cru — next/image não existe dentro do ImageResponse.
        <img
          src={fundo}
          alt=""
          style={{
            position: "absolute",
            top: 0,
            left: 0,
            width: "100%",
            height: "100%",
            objectFit: "cover",
          }}
        />
      ) : (
        <div
          style={{
            display: "flex",
            position: "absolute",
            top: 0,
            left: 0,
            width: "100%",
            height: "100%",
            background:
              "radial-gradient(ellipse at 30% 25%, #2B3550 0%, #14192B 45%, #06090F 100%)",
          }}
        />
      )}

      {/* 2. piso de escurecimento: segura foto clara demais sem apagar a cena */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 0,
          left: 0,
          width: "100%",
          height: "100%",
          backgroundColor: "rgba(8, 11, 20, 0.38)",
        }}
      />

      {/* 3. halo atrás do texto: escurece onde a palavra cai e some nas bordas,
             que é o que deixa a fotografia continuar aparecendo */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 0,
          left: 0,
          width: "100%",
          height: "100%",
          background:
            "radial-gradient(ellipse 78% 42% at 50% 48%, rgba(8,11,20,0.58) 0%, rgba(8,11,20,0.34) 55%, rgba(8,11,20,0) 100%)",
        }}
      />

      {/* 4. pé mais escuro: garante leitura da referência e da assinatura */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 0,
          left: 0,
          width: "100%",
          height: "100%",
          background:
            "linear-gradient(180deg, rgba(8,11,20,0.42) 0%, rgba(8,11,20,0) 26%, rgba(8,11,20,0) 68%, rgba(8,11,20,0.55) 100%)",
        }}
      />

      {/* 5. moldura dourada (desenhada no Canva, recortada em PNG transparente) */}
      {payload.molduraUrl && (
        // eslint-disable-next-line @next/next/no-img-element
        // biome-ignore lint/performance/noImgElement: o Satori (next/og) só entende <img> cru — next/image não existe dentro do ImageResponse.
        <img
          src={payload.molduraUrl}
          alt=""
          style={{
            position: "absolute",
            top: 0,
            left: 0,
            width: "100%",
            height: "100%",
          }}
        />
      )}

      {/* 6. conteúdo, posicionado DENTRO da moldura */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "absolute",
          top: caixa.top,
          left: caixa.left,
          width: caixa.width,
          height: caixa.height,
          justifyContent: "space-between",
          alignItems: "center",
          textAlign: "center",
          color: COR_CREAM,
        }}
      >
        {/* topo: rótulo do tema, ou um losango discreto */}
        {payload.topLabel ? (
          <div
            style={{
              display: "flex",
              alignItems: "center",
              gap: 14,
              color: COR_GOLD,
              fontFamily: "Cormorant",
              fontWeight: 600,
              fontSize: topSize,
              letterSpacing: 9,
              textTransform: "uppercase",
            }}
          >
            <div
              style={{
                display: "flex",
                width: 30,
                height: 1,
                backgroundColor: COR_GOLD,
              }}
            />
            <div style={{ display: "flex" }}>{payload.topLabel}</div>
            <div
              style={{
                display: "flex",
                width: 30,
                height: 1,
                backgroundColor: COR_GOLD,
              }}
            />
          </div>
        ) : (
          <div
            style={{
              display: "flex",
              width: 7,
              height: 7,
              backgroundColor: COR_GOLD,
              transform: "rotate(45deg)",
            }}
          />
        )}

        {/* centro: o texto é o herói */}
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            justifyContent: "center",
            flex: 1,
            width: "100%",
            paddingTop: 28,
            paddingBottom: 28,
          }}
        >
          <div
            style={{
              display: "flex",
              fontFamily: "Cormorant",
              fontStyle: "italic",
              fontWeight: 400,
              fontSize: verseSize,
              lineHeight: 1.26,
              letterSpacing: -0.5,
              color: COR_CREAM,
              textAlign: "center",
              textShadow: "0 2px 24px rgba(0,0,0,0.55)",
            }}
          >
            {verseText}
          </div>
        </div>

        {/* rodapé: divisor, referência, subtexto e assinatura */}
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            gap: 15,
            width: "100%",
          }}
        >
          {/* divisor filete—losango—filete */}
          <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
            <div
              style={{
                display: "flex",
                width: 52,
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
                width: 52,
                height: 1,
                backgroundColor: COR_GOLD,
              }}
            />
          </div>

          {payload.ref && (
            <div
              style={{
                display: "flex",
                fontFamily: "Cormorant",
                fontWeight: 600,
                fontSize: refSize,
                letterSpacing: 6,
                color: COR_CREAM,
                textTransform: "uppercase",
                textShadow: "0 1px 12px rgba(0,0,0,0.6)",
              }}
            >
              {payload.ref}
            </div>
          )}

          {payload.subRef && (
            <div
              style={{
                display: "flex",
                fontFamily: "Cormorant",
                fontStyle: "italic",
                fontSize: subSize,
                color: COR_CREAM_SOFT,
                letterSpacing: 1.5,
                textShadow: "0 1px 10px rgba(0,0,0,0.6)",
              }}
            >
              {payload.subRef}
            </div>
          )}

          {brandLabel && (
            <div
              style={{
                display: "flex",
                fontFamily: "Cormorant",
                fontWeight: 600,
                fontSize: brandSize,
                letterSpacing: 5,
                color: COR_GOLD,
                textTransform: "uppercase",
                marginTop: 8,
                textShadow: "0 1px 10px rgba(0,0,0,0.6)",
              }}
            >
              {brandLabel}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

/** URL da moldura para um formato, a partir do origin da rota. */
export function molduraUrlPara(
  origin: string,
  formato: EditorialFormato,
  moldura: MolduraKey = "classica",
): string {
  return `${origin}/molduras/${moldura}-${formato}.png`;
}
