/**
 * Os modelos novos do carrossel (issue #211), desenhados a partir das
 * referências do Bruno: cinema, bloco, cartaz e editorial.
 *
 * O que os une: a LETRA é a protagonista. Nada de papel, pincelada ou
 * moldura; a foto (quando há) entra escura, com grão, e o texto vai direto
 * em cima. O encaixe das linhas usa as medidas reais das fontes
 * (lib/instagram-letras.ts), porque o Satori não mede texto.
 *
 * Fontes esperadas no ImageResponse: "Condensada" (Anton), "Grotesca"
 * (Inter 800), "Legenda" (Inter 500) e "Script" (manuscrita).
 *
 * Lembretes do Satori: todo <div> com mais de um filho precisa de display
 * flex, e `inset` não é desenhado — top/left/width/height por extenso.
 */
import {
  alvoParaLinhas,
  type FonteMedida,
  quebrarEmLinhas,
  tamanhoParaCaber,
  textoDaLinha,
} from "@/lib/instagram-letras";
import { type Palavra, palavrasDoSlide } from "@/lib/instagram-modelos";

const TINTA = "#0C0C0C";
const CLARO = "#F6F5F1";
const CREME = "#F3E9CF";

export type EditorialPayload = {
  modelo: "cinema" | "bloco" | "cartaz" | "editorial";
  texto: string;
  /** Cor de destaque do tema (hex). */
  cor: string;
  /** Foto de fundo (os modelos com foto). */
  bgSrc?: string;
  /** Textura de grão, por cima da foto. */
  graoSrc?: string;
  /** Linha pequena do topo (assinatura, tema, série). */
  top?: string;
  /** Referência, autoria ou numeração ("Lição #08"). */
  ref?: string;
  largura: number;
  altura: number;
};

// ---------------------------------------------------------------------------
// Peças comuns
// ---------------------------------------------------------------------------

/** Rótulo pequeno em maiúsculas espaçadas — a "voz baixa" de todos os modelos. */
function Rotulo({
  texto,
  cor,
  tamanho = 26,
  espaco = 7,
}: {
  texto: string;
  cor: string;
  tamanho?: number;
  espaco?: number;
}) {
  return (
    <div
      style={{
        display: "flex",
        fontFamily: "Legenda",
        fontSize: tamanho,
        letterSpacing: espaco,
        lineHeight: 1.35,
        color: cor,
      }}
    >
      {texto.toUpperCase()}
    </div>
  );
}

/** Foto no quadro inteiro, escurecida e com grão. `veu` é o degradê por cima. */
function Fundo({ p, veu }: { p: EditorialPayload; veu: string }) {
  const caixa = {
    position: "absolute",
    top: 0,
    left: 0,
    width: p.largura,
    height: p.altura,
  } as const;
  return (
    <>
      {p.bgSrc ? (
        // biome-ignore lint/performance/noImgElement: Satori só entende <img>; next/image não existe dentro do ImageResponse
        <img
          src={p.bgSrc}
          alt=""
          width={p.largura}
          height={p.altura}
          style={{ ...caixa, objectFit: "cover" }}
        />
      ) : null}
      {/* tom quente e escuro por igual: tira o ar de "foto de banco" */}
      <div
        style={{ ...caixa, display: "flex", backgroundColor: "rgba(18,12,8,0.22)" }}
      />
      <div style={{ ...caixa, display: "flex", backgroundImage: veu }} />
      {p.graoSrc ? (
        // biome-ignore lint/performance/noImgElement: Satori só entende <img>; next/image não existe dentro do ImageResponse
        <img
          src={p.graoSrc}
          alt=""
          width={p.largura}
          height={p.altura}
          style={{ ...caixa, objectFit: "cover", opacity: 0.15 }}
        />
      ) : null}
    </>
  );
}

/** Uma linha de palavras num tamanho só, com destaque em cor e riscado. */
function Linha({
  palavras,
  familia,
  tamanho,
  cor,
  corDestaque,
  espaco,
  entrelinha,
}: {
  palavras: Palavra[];
  familia: string;
  tamanho: number;
  cor: string;
  corDestaque: string;
  /** letter-spacing em px */
  espaco: number;
  entrelinha: number;
}) {
  return (
    <div style={{ display: "flex", alignItems: "baseline" }}>
      {palavras.map((w, i) => (
        <div
          key={`${i}-${w.t}`}
          style={{
            display: "flex",
            fontFamily: familia,
            fontSize: tamanho,
            lineHeight: entrelinha,
            letterSpacing: espaco,
            marginRight: i < palavras.length - 1 ? Math.round(tamanho * 0.22) : 0,
            color: w.destaque ? corDestaque : cor,
            textDecoration: w.riscada ? "line-through" : "none",
          }}
        >
          {w.t}
        </div>
      ))}
    </div>
  );
}

// ---------------------------------------------------------------------------
// Cinema — foto escura, rótulo no topo, frase forte embaixo
// ---------------------------------------------------------------------------

function Cinema({ p }: { p: EditorialPayload }) {
  const fonte: FonteMedida = "inter800";
  const { palavras } = palavrasDoSlide(p.texto, true);
  const margem = 110;
  const util = p.largura - margem * 2;
  const total = textoDaLinha(palavras).length;
  const linhasAlvo = total > 70 ? 5 : total > 44 ? 4 : total > 22 ? 3 : 2;
  const linhas = quebrarEmLinhas(
    palavras,
    fonte,
    alvoParaLinhas(palavras, fonte, linhasAlvo),
  );
  // -0.045em: a grotesca apertada das referências.
  const aperto = -0.045;
  const tamanho = Math.min(
    ...linhas.map((l) => tamanhoParaCaber(textoDaLinha(l), fonte, util, 124, aperto)),
  );
  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: "#0B0907",
      }}
    >
      <Fundo
        p={p}
        veu="linear-gradient(180deg, rgba(8,6,4,0.72) 0%, rgba(8,6,4,0.12) 30%, rgba(8,6,4,0.30) 55%, rgba(8,6,4,0.90) 100%)"
      />
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          alignItems: "center",
          position: "absolute",
          top: 0,
          left: 0,
          width: p.largura,
          height: p.altura,
          padding: `${margem}px ${margem}px ${Math.round(margem * 1.5)}px`,
        }}
      >
        <Rotulo
          texto={p.top || "Ekballo Academy"}
          cor={CREME}
          tamanho={30}
          espaco={16}
        />
        <div style={{ display: "flex", flexDirection: "column", alignItems: "center" }}>
          {linhas.map((l, i) => (
            <Linha
              key={`${i}-${textoDaLinha(l)}`}
              palavras={l}
              familia="Grotesca"
              tamanho={tamanho}
              cor={CREME}
              corDestaque={p.cor}
              espaco={Math.round(tamanho * aperto)}
              entrelinha={1.04}
            />
          ))}
          {p.ref ? (
            <div style={{ display: "flex", marginTop: 44 }}>
              <Rotulo
                texto={p.ref}
                cor="rgba(243,233,207,0.78)"
                tamanho={26}
                espaco={9}
              />
            </div>
          ) : null}
        </div>
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------------
// Bloco — coluna de texto, cada linha no tamanho que preenche a largura
// ---------------------------------------------------------------------------

function Bloco({ p }: { p: EditorialPayload }) {
  const fonte: FonteMedida = "anton";
  const { palavras, manuscrita } = palavrasDoSlide(p.texto, true);
  const margem = 84;
  const coluna = Math.round(p.largura * 0.54);
  // Linhas curtas: é a variação de tamanho entre elas que dá o ritmo.
  // Palavra destacada ganha a linha só para ela (fica enorme).
  const linhas: Palavra[][] = [];
  let pendentes: Palavra[] = [];
  const despejar = () => {
    if (!pendentes.length) return;
    // Cerca de 18 letras por linha, variando: é a diferença de comprimento
    // entre as linhas que vira diferença de tamanho.
    const alvo = alvoParaLinhas(
      pendentes,
      fonte,
      Math.ceil(textoDaLinha(pendentes).length / 18),
    );
    linhas.push(...quebrarEmLinhas(pendentes, fonte, alvo));
    pendentes = [];
  };
  for (const w of palavras) {
    if (w.destaque) {
      despejar();
      linhas.push([w]);
    } else pendentes.push(w);
  }
  despejar();
  // Palavrinha sozinha numa linha ("O", "E", "DE") viraria uma letra gigante:
  // ela sobe para a linha de baixo.
  for (let i = linhas.length - 2; i >= 0; i--) {
    if (
      linhas[i].length === 1 &&
      linhas[i][0].t.length <= 3 &&
      !linhas[i][0].destaque
    ) {
      linhas[i + 1] = [...linhas[i], ...linhas[i + 1]];
      linhas.splice(i, 1);
    }
  }

  // O que sobra de altura depois da margem, da manuscrita e da assinatura.
  const altoDisponivel =
    p.altura - margem * 2 - (manuscrita ? 210 : 0) - (p.ref ? 70 : 0);
  const medir = (teto: number) =>
    linhas.map((l) =>
      Math.max(40, tamanhoParaCaber(textoDaLinha(l), fonte, coluna, teto)),
    );
  // Baixa o teto até a coluna caber na altura.
  let teto = 210;
  let tamanhos = medir(teto);
  while (teto > 70 && tamanhos.reduce((s, t) => s + t * 1.1, 0) > altoDisponivel) {
    teto -= 10;
    tamanhos = medir(teto);
  }

  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: "#0A0A12",
      }}
    >
      <Fundo
        p={p}
        veu="linear-gradient(90deg, rgba(6,6,12,0.80) 0%, rgba(6,6,12,0.50) 44%, rgba(6,6,12,0.0) 72%, rgba(6,6,12,0.0) 100%)"
      />
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "absolute",
          top: margem,
          left: margem,
          width: coluna + 40,
        }}
      >
        {linhas.map((l, i) => (
          <Linha
            key={`${i}-${textoDaLinha(l)}`}
            palavras={l}
            familia="Condensada"
            tamanho={tamanhos[i]}
            cor="#FFFFFF"
            corDestaque="#FFFFFF"
            espaco={0}
            entrelinha={1.2}
          />
        ))}
        {manuscrita ? (
          <div
            style={{
              display: "flex",
              marginTop: 6,
              fontFamily: "Script",
              fontSize: Math.min(
                140,
                tamanhoParaCaber(manuscrita, "anton", coluna * 0.8, 140),
              ),
              lineHeight: 1.1,
              color: p.cor,
              transform: "rotate(-3deg)",
            }}
          >
            {manuscrita}
          </div>
        ) : null}
        {p.ref ? (
          <div style={{ display: "flex", marginTop: 26 }}>
            <Rotulo texto={p.ref} cor="rgba(255,255,255,0.8)" tamanho={22} espaco={3} />
          </div>
        ) : null}
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------------
// Cartaz — a palavra gigante no topo, de ponta a ponta, sobre a foto
// ---------------------------------------------------------------------------

function Cartaz({ p }: { p: EditorialPayload }) {
  const fonte: FonteMedida = "inter800";
  const { palavras } = palavrasDoSlide(p.texto, true);
  // O título são as palavras entre chaves; sem nenhuma, as duas primeiras.
  let titulo = palavras.filter((w) => w.destaque);
  let apoio = palavras.filter((w) => !w.destaque);
  if (!titulo.length) {
    titulo = palavras.slice(0, 2);
    apoio = palavras.slice(2);
  }
  titulo = titulo.slice(0, 3);
  const margem = 48;
  const util = p.largura - margem * 2;
  const aperto = -0.06;
  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: "#0B0907",
      }}
    >
      <Fundo
        p={p}
        veu="linear-gradient(180deg, rgba(8,6,4,0.38) 0%, rgba(8,6,4,0.0) 42%, rgba(8,6,4,0.55) 100%)"
      />
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "absolute",
          top: margem - 10,
          left: margem,
          width: util,
        }}
      >
        {titulo.map((w, i) => {
          const tamanho = tamanhoParaCaber(w.t, fonte, util, 520, aperto);
          return (
            <div
              key={`${i}-${w.t}`}
              style={{
                display: "flex",
                // linhas alternadas encostam em lados opostos, como no cartaz
                justifyContent: i % 2 ? "flex-end" : "flex-start",
                fontFamily: "Grotesca",
                fontSize: tamanho,
                lineHeight: 0.86,
                letterSpacing: Math.round(tamanho * aperto),
                color: p.cor,
              }}
            >
              {w.t}
            </div>
          );
        })}
      </div>
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "flex-end",
          position: "absolute",
          left: margem + 8,
          bottom: Math.round(p.altura * 0.26),
          width: util - 16,
        }}
      >
        <div style={{ display: "flex", maxWidth: Math.round(util * 0.68) }}>
          <Rotulo
            texto={textoDaLinha(apoio) || p.top || "Ekballo Academy"}
            cor={CREME}
            tamanho={30}
            espaco={10}
          />
        </div>
        {p.ref ? <Rotulo texto={p.ref} cor={CREME} tamanho={24} espaco={2} /> : null}
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------------
// Editorial — fundo claro, letra enorme, legendas nos cantos
// ---------------------------------------------------------------------------

function Editorial({ p }: { p: EditorialPayload }) {
  const fonte: FonteMedida = "anton";
  const { palavras } = palavrasDoSlide(p.texto, true);
  const margem = 100;
  const util = p.largura - margem * 2 - 70; // 70: a faixa do fio à direita
  const total = textoDaLinha(palavras).length;
  const linhasAlvo = total > 60 ? 5 : total > 34 ? 4 : total > 16 ? 3 : 2;
  const linhas = quebrarEmLinhas(
    palavras,
    fonte,
    alvoParaLinhas(palavras, fonte, linhasAlvo),
  );
  const tamanho = Math.min(
    ...linhas.map((l) => tamanhoParaCaber(textoDaLinha(l), fonte, util, 230)),
  );
  const fio = "rgba(12,12,12,0.85)";
  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: CLARO,
      }}
    >
      {/* fios verticais à direita: o "respiro" gráfico da referência */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 62,
          right: 268,
          width: 2,
          height: 180,
          backgroundColor: fio,
        }}
      />
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 290,
          right: 96,
          width: 2,
          height: Math.round(p.altura * 0.34),
          backgroundColor: fio,
        }}
      />
      <div
        style={{
          display: "flex",
          position: "absolute",
          bottom: 60,
          right: 96,
          width: 2,
          height: Math.round(p.altura * 0.26),
          backgroundColor: fio,
        }}
      />

      <div
        style={{
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          position: "absolute",
          top: 0,
          left: 0,
          width: p.largura,
          height: p.altura,
          padding: `${margem - 10}px ${margem}px ${margem}px`,
        }}
      >
        {/* topo: a série e a assinatura */}
        <div style={{ display: "flex", justifyContent: "space-between" }}>
          <div style={{ display: "flex", flexDirection: "column" }}>
            {/* Sem rótulo próprio, a assinatura ocupa o lugar — nunca um tema
                fixo ("mesa de discipulado") num post que fala de outra coisa. */}
            <Rotulo
              texto={p.top || "Ekballo Academy"}
              cor={TINTA}
              tamanho={32}
              espaco={9}
            />
            <div
              style={{
                display: "flex",
                width: 96,
                height: 5,
                marginTop: 22,
                backgroundColor: p.cor,
              }}
            />
          </div>
          <div style={{ display: "flex", width: 150 }}>
            {p.top ? (
              <Rotulo texto="Ekballo Academy" cor={TINTA} tamanho={17} espaco={5} />
            ) : null}
          </div>
        </div>

        {/* a frase */}
        <div style={{ display: "flex", flexDirection: "column" }}>
          {linhas.map((l, i) => (
            <Linha
              key={`${i}-${textoDaLinha(l)}`}
              palavras={l}
              familia="Condensada"
              tamanho={tamanho}
              cor={TINTA}
              corDestaque={p.cor}
              espaco={-1}
              entrelinha={1.14}
            />
          ))}
        </div>

        {/* base: a referência e a seta */}
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "flex-end",
          }}
        >
          <div style={{ display: "flex", flexDirection: "column" }}>
            <div
              style={{
                display: "flex",
                width: 84,
                height: 5,
                marginBottom: 26,
                backgroundColor: p.cor,
              }}
            />
            {p.ref ? (
              // Referência longa ("Livro: …") encolhe para não encostar na seta.
              <Rotulo
                texto={p.ref}
                cor={p.cor}
                tamanho={p.ref.length > 22 ? 27 : 38}
                espaco={p.ref.length > 22 ? 6 : 9}
              />
            ) : null}
          </div>
          {/* seta ↗ desenhada: dois lados de um quadrado e a diagonal */}
          <div
            style={{
              display: "flex",
              position: "relative",
              width: 70,
              height: 70,
              marginRight: 120,
            }}
          >
            <div
              style={{
                display: "flex",
                position: "absolute",
                top: 0,
                right: 0,
                width: 46,
                height: 46,
                borderTop: `4px solid ${p.cor}`,
                borderRight: `4px solid ${p.cor}`,
              }}
            />
            <div
              style={{
                display: "flex",
                position: "absolute",
                top: 33,
                left: -12,
                width: 96,
                height: 4,
                backgroundColor: p.cor,
                transform: "rotate(-45deg)",
              }}
            />
          </div>
        </div>
      </div>
    </div>
  );
}

/** Desenha um slide em um dos modelos novos. */
export function renderSlideEditorial(p: EditorialPayload) {
  if (p.modelo === "cinema") return <Cinema p={p} />;
  if (p.modelo === "bloco") return <Bloco p={p} />;
  if (p.modelo === "cartaz") return <Cartaz p={p} />;
  return <Editorial p={p} />;
}
