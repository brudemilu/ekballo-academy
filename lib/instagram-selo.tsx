/**
 * O selo da conta: a logo, com um texto embaixo, no canto de toda arte
 * (issue #264). Vai direto sobre o fundo da arte, sem moldura — pedido do
 * Bruno. Por isso a logo tem duas versões (lib/logo-variantes.ts): a original
 * nas artes de fundo claro e a "clara" nas escuras e nas de foto.
 *
 * Fica por cima da arte pronta, em vez de dentro de cada modelo: são dezenove
 * modelos, e assim nenhum deles precisa saber que o selo existe.
 */
import type { ReactElement } from "react";

export type Selo = {
  /** A logo original (para fundo claro), já conferida pela rota. */
  logoSrc: string;
  /** A versão para fundo escuro; sem ela, usa-se a original. */
  logoClaraSrc: string;
  /** Texto embaixo da logo; vazio = só a logo. */
  legenda: string;
};

/** Nome com que a rota registra a fonte do texto do selo. */
export const FONTE_DO_SELO = "Selo";
export const ARQUIVO_DA_FONTE_DO_SELO = "inter-800.ttf";

const TINTA = "#161D4E";
const CLARO = "#FFFFFF";

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

// Modelos cujo fundo é sempre claro (papel, off-white): neles vai a logo
// original. Os de texto puro seguem o tom escolhido; o resto é escuro ou foto.
const SEMPRE_CLAROS = new Set(["editorial", "gravura", "caderno"]);
const SEGUEM_O_TOM = new Set(["citacao", "checklist", "manchete"]);

/** O canto onde o selo fica tem fundo claro? Decide qual versão da logo usar. */
export function fundoClaro(modelo: string, tom: "escuro" | "claro"): boolean {
  if (SEMPRE_CLAROS.has(modelo)) return true;
  return SEGUEM_O_TOM.has(modelo) && tom === "claro";
}

export function comSelo(
  arte: ReactElement,
  selo: Selo | null,
  largura: number,
  altura: number,
  /** O modelo e o tom da arte: escolhem o canto livre e a versão da logo. */
  modelo = "",
  tom: "escuro" | "claro" = "escuro",
): ReactElement {
  if (!selo) return arte;
  // Tudo proporcional à largura: a arte de 1080 é a medida de referência.
  const u = largura / 1080;
  const story = altura / largura > 1.5;
  const canto = CANTO_POR_MODELO[modelo] ?? "topo-direita";
  const claro = fundoClaro(modelo, tom);
  const margem = Math.round(48 * u);
  // No story, o alto e o pé ficam sob a interface do Instagram.
  const recuo = Math.round((story ? 230 : 44) * u);
  const larguraDoSelo = Math.round(176 * u);
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
        }}
      >
        {/* biome-ignore lint/performance/noImgElement: desenhado pelo Satori, fora do navegador */}
        <img
          src={claro ? selo.logoSrc : selo.logoClaraSrc || selo.logoSrc}
          alt=""
          width={larguraDoSelo}
          height={Math.round(100 * u)}
          style={{ objectFit: "contain" }}
        />
        {selo.legenda ? (
          <div
            style={{
              display: "flex",
              marginTop: Math.round(6 * u),
              fontFamily: FONTE_DO_SELO,
              fontSize: Math.round(22 * u),
              letterSpacing: Math.round(3 * u),
              color: claro ? TINTA : CLARO,
            }}
          >
            {selo.legenda.toUpperCase()}
          </div>
        ) : null}
      </div>
    </div>
  );
}
