/**
 * O selo da conta: a logo, com um texto embaixo, sobre uma plaquinha branca
 * no canto de toda arte (issue #264). A plaquinha existe porque a logo é
 * desenhada para fundo claro e as artes são quase todas escuras ou com foto.
 *
 * Fica por cima da arte pronta, em vez de dentro de cada modelo: são mais de
 * quinze modelos, e assim nenhum deles precisa saber que o selo existe.
 */
import type { ReactElement } from "react";

export type Selo = {
  /** Endereço da logo, já conferido pela rota. */
  logoSrc: string;
  /** Texto embaixo da logo; vazio = só a logo. */
  legenda: string;
};

/** Nome com que a rota registra a fonte do texto do selo. */
export const FONTE_DO_SELO = "Selo";
export const ARQUIVO_DA_FONTE_DO_SELO = "inter-800.ttf";

const TINTA = "#161D4E";

type Canto = "topo-direita" | "base-direita" | "base-esquerda";

// O selo vai no alto, à direita — o canto que a maioria dos modelos deixa
// livre. Estes são os que escrevem ali (conferido arte por arte): neles o
// selo desce. Modelo novo que ocupe o alto à direita entra nesta lista.
const CANTO_POR_MODELO: Record<string, Canto> = {
  cartaz: "base-direita",
  carimbo: "base-direita",
  gravura: "base-direita",
  chamada: "base-esquerda",
};

export function comSelo(
  arte: ReactElement,
  selo: Selo | null,
  largura: number,
  altura: number,
  /** O modelo da arte, para escolher o canto que ele deixa livre. */
  modelo = "",
): ReactElement {
  if (!selo) return arte;
  // Tudo proporcional à largura: a arte de 1080 é a medida de referência.
  const u = largura / 1080;
  const story = altura / largura > 1.5;
  const canto = CANTO_POR_MODELO[modelo] ?? "topo-direita";
  const margem = Math.round(44 * u);
  // No story, o alto e o pé ficam sob a interface do Instagram.
  const recuo = Math.round((story ? 230 : 44) * u);
  const larguraDoSelo = Math.round(196 * u);
  const posicao = {
    ...(canto === "topo-direita" ? { top: recuo } : { bottom: recuo }),
    left: canto === "base-esquerda" ? margem : largura - margem - larguraDoSelo,
  };
  return (
    <div
      style={{ display: "flex", position: "relative", width: largura, height: altura }}
    >
      {arte}
      <div
        style={{
          position: "absolute",
          ...posicao,
          width: larguraDoSelo,
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          padding: `${Math.round(14 * u)}px ${Math.round(12 * u)}px`,
          borderRadius: Math.round(18 * u),
          backgroundColor: "#FFFFFF",
          boxShadow: "0 6px 22px rgba(0,0,0,0.28)",
        }}
      >
        {/* biome-ignore lint/performance/noImgElement: desenhado pelo Satori, fora do navegador */}
        <img
          src={selo.logoSrc}
          alt=""
          width={Math.round(164 * u)}
          height={Math.round(92 * u)}
          style={{ objectFit: "contain" }}
        />
        {selo.legenda ? (
          <div
            style={{
              display: "flex",
              marginTop: Math.round(8 * u),
              fontFamily: FONTE_DO_SELO,
              fontSize: Math.round(21 * u),
              letterSpacing: Math.round(2 * u),
              color: TINTA,
            }}
          >
            {selo.legenda.toUpperCase()}
          </div>
        ) : null}
      </div>
    </div>
  );
}
