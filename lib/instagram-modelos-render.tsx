/**
 * O desenho dos modelos de texto do carrossel (issue #189): citação,
 * checklist, cartão e manchete. Tudo é Satori — nenhuma imagem, nenhuma
 * chamada de IA. As contas de texto e tamanho ficam em lib/instagram-modelos.ts.
 *
 * Fontes esperadas no ImageResponse: "Display" (a escolhida no editor),
 * "Texto" (serifada de leitura) e "Script" (manuscrita).
 *
 * Lembrete do Satori: todo <div> com mais de um filho precisa de display
 * flex, e `inset` não é desenhado — por isso top/left/right/bottom por extenso.
 */
import {
  itensDoChecklist,
  type ModeloSlide,
  type Palavra,
  palavrasDoSlide,
  tamanhoPorTexto,
  tamanhoQueCabe,
} from "@/lib/instagram-modelos";

const NAVY = "#14203A";
const CREME = "#FBF5E6";
const PAPEL = "#F4EACB";
const MARGEM = 96;

export type ModeloRenderPayload = {
  modelo: Exclude<ModeloSlide, "foto">;
  texto: string;
  /** Cor de destaque do tema (hex). */
  cor: string;
  tom: "escuro" | "claro";
  /** A fonte Display escreve em maiúsculas? (Anton, Bebas) */
  maiusculas: boolean;
  /** Assinatura no topo. */
  top?: string;
  /** Referência / autoria. */
  ref?: string;
  largura: number;
  altura: number;
};

type Cores = { fundo: string; texto: string; suave: string; cor: string };

function coresDo(p: ModeloRenderPayload): Cores {
  const escuro = p.tom !== "claro";
  return {
    fundo: escuro ? NAVY : PAPEL,
    texto: escuro ? CREME : NAVY,
    suave: escuro ? "rgba(251,245,230,0.62)" : "rgba(20,32,58,0.6)",
    cor: p.cor,
  };
}

function Assinatura({ p, c }: { p: ModeloRenderPayload; c: Cores }) {
  return (
    <div style={{ display: "flex", alignItems: "center" }}>
      <div
        style={{
          display: "flex",
          width: 36,
          height: 6,
          marginRight: 18,
          borderRadius: 3,
          backgroundColor: c.cor,
        }}
      />
      <div
        style={{
          display: "flex",
          fontFamily: "Texto",
          fontSize: 28,
          letterSpacing: 6,
          color: c.suave,
        }}
      >
        {(p.top || "Ekballo Academy").toUpperCase()}
      </div>
    </div>
  );
}

function Rodape({ c, texto }: { c: Cores; texto: string }) {
  return (
    <div
      style={{
        display: "flex",
        fontFamily: "Texto",
        fontSize: 24,
        letterSpacing: 7,
        color: c.suave,
      }}
    >
      {texto}
    </div>
  );
}

/** Texto corrido, palavra a palavra, com as destacadas na cor do tema. */
function Corrido({
  palavras,
  tamanho,
  cor,
  corDestaque,
  familia = "Texto",
}: {
  palavras: Palavra[];
  tamanho: number;
  cor: string;
  corDestaque: string;
  familia?: string;
}) {
  return (
    <div style={{ display: "flex", flexWrap: "wrap", alignItems: "baseline" }}>
      {palavras.map((w, i) => (
        <div
          key={i}
          style={{
            display: "flex",
            fontFamily: familia,
            fontSize: tamanho,
            lineHeight: 1.22,
            marginRight: Math.round(tamanho * 0.26),
            color: w.destaque ? corDestaque : cor,
          }}
        >
          {w.t}
        </div>
      ))}
    </div>
  );
}

function Citacao({ p, c }: { p: ModeloRenderPayload; c: Cores }) {
  const { palavras } = palavrasDoSlide(p.texto);
  const len = palavras.reduce((n, w) => n + w.t.length + 1, 0);
  const tamanho = tamanhoPorTexto(
    len,
    [
      [220, 50],
      [160, 58],
      [110, 68],
      [70, 80],
    ],
    94,
  );
  return (
    <div style={{ display: "flex", flexDirection: "column" }}>
      <div
        style={{
          display: "flex",
          fontFamily: "Texto",
          fontSize: 320,
          lineHeight: 0.8,
          height: 170,
          color: c.cor,
        }}
      >
        “
      </div>
      <Corrido
        palavras={palavras}
        tamanho={tamanho}
        cor={c.texto}
        corDestaque={c.cor}
      />
      {p.ref ? (
        <div style={{ display: "flex", alignItems: "center", marginTop: 48 }}>
          <div
            style={{
              display: "flex",
              width: 64,
              height: 4,
              marginRight: 20,
              backgroundColor: c.cor,
            }}
          />
          <div
            style={{
              display: "flex",
              fontFamily: "Texto",
              fontSize: 38,
              color: c.suave,
            }}
          >
            {p.ref}
          </div>
        </div>
      ) : null}
    </div>
  );
}

function Checklist({ p, c }: { p: ModeloRenderPayload; c: Cores }) {
  const { titulo, itens } = itensDoChecklist(p.texto);
  const maior = Math.max(0, ...itens.map((i) => i.length));
  const tamanhoItem = tamanhoPorTexto(
    Math.max(maior, itens.length * 14),
    [
      [70, 40],
      [48, 46],
    ],
    54,
  );
  const tituloFinal = p.maiusculas ? titulo.toUpperCase() : titulo;
  const tamanhoTitulo = tamanhoQueCabe(
    tamanhoPorTexto(
      tituloFinal.length,
      [
        [44, 64],
        [28, 80],
      ],
      98,
    ),
    Math.max(0, ...tituloFinal.split(" ").map((w) => w.length)),
    p.largura - MARGEM * 2,
    0.5,
  );
  const caixa = Math.round(tamanhoItem * 1.1);
  return (
    <div style={{ display: "flex", flexDirection: "column" }}>
      {tituloFinal ? (
        <div
          style={{
            display: "flex",
            fontFamily: "Display",
            fontSize: tamanhoTitulo,
            // folga para o acento da linha de baixo não encostar na de cima
            lineHeight: 1.18,
            color: c.texto,
            marginBottom: 56,
          }}
        >
          {tituloFinal}
        </div>
      ) : null}
      {itens.map((item, i) => (
        <div
          key={i}
          style={{ display: "flex", alignItems: "flex-start", marginBottom: 34 }}
        >
          <div
            style={{
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              flexShrink: 0,
              width: caixa,
              height: caixa,
              marginRight: 28,
              marginTop: 4,
              borderRadius: 12,
              backgroundColor: c.cor,
            }}
          >
            {/* o "✓" desenhado: nem toda fonte traz o caractere */}
            <div
              style={{
                display: "flex",
                width: Math.round(caixa * 0.28),
                height: Math.round(caixa * 0.52),
                marginTop: -Math.round(caixa * 0.1),
                borderRight: `7px solid ${CREME}`,
                borderBottom: `7px solid ${CREME}`,
                transform: "rotate(45deg)",
              }}
            />
          </div>
          <div
            style={{
              display: "flex",
              flex: 1,
              fontFamily: "Texto",
              fontSize: tamanhoItem,
              lineHeight: 1.25,
              color: c.texto,
            }}
          >
            {item}
          </div>
        </div>
      ))}
    </div>
  );
}

function Cartao({ p, c }: { p: ModeloRenderPayload; c: Cores }) {
  const { palavras } = palavrasDoSlide(p.texto);
  const len = palavras.reduce((n, w) => n + w.t.length + 1, 0);
  const tamanho = tamanhoPorTexto(
    len,
    [
      [260, 40],
      [190, 46],
      [130, 54],
      [80, 62],
    ],
    72,
  );
  const nome = p.top || "Ekballo Academy";
  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        width: "100%",
        padding: 64,
        borderRadius: 40,
        backgroundColor: "#FFFDF7",
        boxShadow: "0 24px 60px rgba(0,0,0,0.28)",
      }}
    >
      <div style={{ display: "flex", alignItems: "center", marginBottom: 44 }}>
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            width: 92,
            height: 92,
            marginRight: 26,
            borderRadius: 46,
            backgroundColor: c.cor,
            fontFamily: "Texto",
            fontSize: 50,
            color: CREME,
          }}
        >
          {nome.trim().charAt(0).toUpperCase()}
        </div>
        <div style={{ display: "flex", flexDirection: "column" }}>
          <div
            style={{ display: "flex", fontFamily: "Texto", fontSize: 40, color: NAVY }}
          >
            {nome}
          </div>
          {p.ref ? (
            <div
              style={{
                display: "flex",
                fontFamily: "Texto",
                fontSize: 28,
                color: "rgba(20,32,58,0.55)",
              }}
            >
              {p.ref}
            </div>
          ) : null}
        </div>
      </div>
      <Corrido palavras={palavras} tamanho={tamanho} cor={NAVY} corDestaque={c.cor} />
    </div>
  );
}

function Manchete({ p, c }: { p: ModeloRenderPayload; c: Cores }) {
  const { palavras, manuscrita } = palavrasDoSlide(p.texto, p.maiusculas);
  const len = palavras.reduce((n, w) => n + w.t.length + 1, 0);
  const tamanho = tamanhoQueCabe(
    tamanhoPorTexto(
      len,
      [
        [80, 96],
        [50, 124],
        [28, 156],
      ],
      196,
    ),
    Math.max(0, ...palavras.map((w) => w.t.length)),
    p.largura - MARGEM * 2 - 36,
    0.5,
  );
  return (
    <div style={{ display: "flex", flexDirection: "column" }}>
      <div style={{ display: "flex", flexWrap: "wrap", alignItems: "center" }}>
        {palavras.map((w, i) => (
          <div
            key={i}
            style={{
              display: "flex",
              fontFamily: "Display",
              fontSize: tamanho,
              lineHeight: 1.08,
              marginRight: Math.round(tamanho * 0.2),
              marginBottom: Math.round(tamanho * 0.1),
              padding: w.destaque ? `0 ${Math.round(tamanho * 0.09)}px` : 0,
              backgroundColor: w.destaque ? c.cor : "transparent",
              color: w.destaque ? CREME : c.texto,
            }}
          >
            {w.t}
          </div>
        ))}
      </div>
      {manuscrita ? (
        <div
          style={{
            display: "flex",
            marginTop: 28,
            fontFamily: "Script",
            fontSize: Math.round(tamanho * 0.5),
            color: c.cor,
            transform: "rotate(-2deg)",
          }}
        >
          {manuscrita}
        </div>
      ) : null}
    </div>
  );
}

/** Desenha um slide em um dos modelos de texto. */
export function renderSlideModelo(p: ModeloRenderPayload) {
  const c = coresDo(p);
  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        justifyContent: "space-between",
        width: "100%",
        height: "100%",
        padding: MARGEM,
        backgroundColor: c.fundo,
      }}
    >
      {/* No cartão a assinatura já está dentro dele. */}
      {p.modelo === "cartao" ? (
        <div style={{ display: "flex", height: 34 }} />
      ) : (
        <Assinatura p={p} c={c} />
      )}

      <div style={{ display: "flex", flexDirection: "column", width: "100%" }}>
        {p.modelo === "citacao" ? <Citacao p={p} c={c} /> : null}
        {p.modelo === "checklist" ? <Checklist p={p} c={c} /> : null}
        {p.modelo === "cartao" ? <Cartao p={p} c={c} /> : null}
        {p.modelo === "manchete" ? <Manchete p={p} c={c} /> : null}
      </div>

      {/* A marca aparece uma vez só: no topo, ou aqui quando o topo é do cartão.
          Na citação a referência já está sob a frase. */}
      <Rodape
        c={c}
        texto={
          p.modelo === "cartao"
            ? "EKBALLO ACADEMY"
            : p.modelo !== "citacao" && p.ref
              ? p.ref.toUpperCase()
              : " "
        }
      />
    </div>
  );
}
