/**
 * Renderização compartilhada do template Cinematográfico.
 *
 * Retorna JSX pronto pra ser passado pro ImageResponse de uma route OG.
 * Cada route ainda registra as fontes (Cormorant Italic/Bold) na chamada
 * de ImageResponse — só o JSX em si é compartilhado aqui.
 *
 * Quem chama:
 *   - app/api/og/devocional/route.tsx
 *   - app/api/og/biblia/route.tsx
 *   - app/api/og/livre/route.tsx    (gerador livre do admin)
 */
import { gerarFundoSafe } from "@/lib/imagen";

export type CinemaFormato = "feed" | "story";

export type CinemaPayload = {
  /** Texto principal (versículo, frase). Será envolto em aspas curvas. */
  verseText: string;
  /** Referência grande no rodapé. Ex: "SALMOS 23:1". Mostrado em caixa alta. */
  ref: string;
  /** Rótulo opcional no topo. Ex: tema do mês "RECOMEÇO". Vazio = só ponto dourado. */
  topLabel?: string;
  /** Subtexto no rodapé. Ex: autor ("— Pr. Bruno Fernandes") ou versão ("ACF"). */
  subRef?: string;
  /** Marca no rodapé. Default: "EKBALLO ACADEMY". Vazio explícito esconde. */
  brand?: string;
  /** Tema do fundo IA. Vazio = sem chamar IA (fica em gradiente). */
  bgTema?: string;
};

const COR_CREAM = "#F5EDDE";
const COR_CREAM_SOFT = "rgba(245, 237, 222, 0.65)";
const COR_GOLD = "#C9A961";
const COR_GOLD_SOFT = "rgba(201, 169, 97, 0.55)";
const COR_INK = "#0B0F1A";

function escalaVerso(verseText: string, formato: CinemaFormato): number {
  const base = formato === "story" ? 62 : 54;
  const len = verseText.length;
  let scale = 1;
  if (len > 320) scale = 0.7;
  else if (len > 240) scale = 0.8;
  else if (len > 170) scale = 0.9;
  else if (len < 80) scale = 1.15;
  return Math.round(base * scale);
}

export async function renderCinematografico(
  payload: CinemaPayload,
  formato: CinemaFormato,
) {
  const aspect = formato === "story" ? "9:16" : "1:1";
  const fundo = payload.bgTema
    ? await gerarFundoSafe({ tema: payload.bgTema, aspect })
    : null;

  const verseText = `“${payload.verseText.trim()}”`;
  const verseSize = escalaVerso(verseText, formato);

  const padX = formato === "story" ? 90 : 80;
  const padY = formato === "story" ? 160 : 100;
  const refSize = formato === "story" ? 22 : 20;
  const subSize = formato === "story" ? 18 : 16;
  const brandSize = formato === "story" ? 16 : 14;
  const topSize = formato === "story" ? 20 : 18;

  const brandLabel =
    payload.brand === ""
      ? null
      : (payload.brand || "EKBALLO ACADEMY").toUpperCase();

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
      {/* Camada 1: fundo IA ou gradiente de fallback */}
      {fundo ? (
        // eslint-disable-next-line @next/next/no-img-element
        <img
          src={fundo.src}
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

      {/* Camada 2: gradiente vertical (escurece topo+base, abre o meio) */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 0,
          left: 0,
          width: "100%",
          height: "100%",
          background:
            "linear-gradient(180deg, rgba(8,11,20,0.82) 0%, rgba(8,11,20,0.45) 22%, rgba(8,11,20,0.18) 42%, rgba(8,11,20,0.18) 58%, rgba(8,11,20,0.55) 80%, rgba(8,11,20,0.95) 100%)",
        }}
      />

      {/* Camada 3: vinheta radial */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 0,
          left: 0,
          width: "100%",
          height: "100%",
          background:
            "radial-gradient(ellipse 75% 70% at 50% 50%, rgba(0,0,0,0) 0%, rgba(0,0,0,0) 45%, rgba(5,7,12,0.55) 100%)",
        }}
      />

      {/* Camada 4: conteúdo */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "relative",
          width: "100%",
          height: "100%",
          padding: `${padY}px ${padX}px`,
          color: COR_CREAM,
          justifyContent: "space-between",
          alignItems: "center",
          textAlign: "center",
        }}
      >
        {/* Topo: rótulo (tema) ou ponto dourado */}
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
              letterSpacing: 10,
              textTransform: "uppercase",
            }}
          >
            <div style={{ display: "flex", width: 36, height: 1, backgroundColor: COR_GOLD_SOFT }} />
            <div style={{ display: "flex" }}>{payload.topLabel}</div>
            <div style={{ display: "flex", width: 36, height: 1, backgroundColor: COR_GOLD_SOFT }} />
          </div>
        ) : (
          <div
            style={{
              display: "flex",
              width: 7,
              height: 7,
              borderRadius: 999,
              backgroundColor: COR_GOLD,
            }}
          />
        )}

        {/* Centro: versículo */}
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            justifyContent: "center",
            flex: 1,
            width: "100%",
            paddingTop: 40,
            paddingBottom: 40,
          }}
        >
          <div
            style={{
              display: "flex",
              fontFamily: "Cormorant",
              fontStyle: "italic",
              fontWeight: 400,
              fontSize: verseSize,
              lineHeight: 1.22,
              letterSpacing: -0.5,
              color: COR_CREAM,
              textAlign: "center",
              textShadow: "0 2px 30px rgba(0,0,0,0.45)",
            }}
          >
            {verseText}
          </div>
        </div>

        {/* Rodapé: divisor + ref + subRef + brand */}
        <div style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 16 }}>
          {/* Divisor linha—diamante—linha */}
          <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
            <div style={{ display: "flex", width: 48, height: 1, backgroundColor: COR_GOLD }} />
            <div
              style={{
                display: "flex",
                width: 7,
                height: 7,
                backgroundColor: COR_GOLD,
                transform: "rotate(45deg)",
              }}
            />
            <div style={{ display: "flex", width: 48, height: 1, backgroundColor: COR_GOLD }} />
          </div>

          <div
            style={{
              display: "flex",
              fontFamily: "Cormorant",
              fontWeight: 600,
              fontSize: refSize,
              letterSpacing: 7,
              color: COR_CREAM,
              textTransform: "uppercase",
            }}
          >
            {payload.ref}
          </div>

          {payload.subRef && (
            <div
              style={{
                display: "flex",
                fontFamily: "Cormorant",
                fontStyle: "italic",
                fontSize: subSize,
                color: COR_CREAM_SOFT,
                letterSpacing: 2,
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
                letterSpacing: 6,
                color: COR_GOLD_SOFT,
                textTransform: "uppercase",
                marginTop: 10,
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
