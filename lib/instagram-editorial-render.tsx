/**
 * Os modelos novos do carrossel (issue #211), desenhados a partir das
 * referências do Bruno: cinema, bloco, cartaz e editorial.
 *
 * O que os une: a LETRA é a protagonista. Nada de papel, pincelada ou
 * moldura; a foto (quando há) entra escura, com grão, e o texto vai direto
 * em cima. O encaixe das linhas usa as medidas reais das fontes
 * (lib/instagram-letras.ts), porque o Satori não mede texto.
 *
 * "Impacto" e "recorte" vieram da segunda leva de referências (issue #241).
 *
 * Fontes esperadas no ImageResponse: "Condensada" (Anton), "Grotesca"
 * (Inter 800), "Legenda" (Inter 500), "Script" (manuscrita) e "Serifada"
 * (DM Serif) e "Italica" (Cormorant itálica, só no contraste).
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
import {
  type ModeloEditorial,
  type Palavra,
  palavrasDoSlide,
  partirFrase,
} from "@/lib/instagram-modelos";

const TINTA = "#0C0C0C";
const CLARO = "#F6F5F1";
const CREME = "#F3E9CF";

export type EditorialPayload = {
  modelo: ModeloEditorial;
  texto: string;
  /** Cor de destaque do tema (hex). */
  cor: string;
  /** Foto de fundo (os modelos com foto). */
  bgSrc?: string;
  /** Textura de grão, por cima da foto. */
  graoSrc?: string;
  /** Textura de tinta gasta (só o carimbo usa). */
  grungeSrc?: string;
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

// ---------------------------------------------------------------------------
// Impacto — foto em movimento, frase branca enorme encostada à esquerda
// ---------------------------------------------------------------------------

function Impacto({ p }: { p: EditorialPayload }) {
  const fonte: FonteMedida = "inter800";
  const { palavras } = palavrasDoSlide(p.texto, true);
  const margem = 64;
  const util = p.largura - margem * 2;
  const total = textoDaLinha(palavras).length;
  // Linhas curtas: é a letra grande, e não a largura cheia, que dá o peso.
  const linhasAlvo =
    total > 130
      ? 8
      : total > 100
        ? 7
        : total > 72
          ? 6
          : total > 48
            ? 5
            : total > 26
              ? 4
              : 3;
  const linhas = quebrarEmLinhas(
    palavras,
    fonte,
    alvoParaLinhas(palavras, fonte, linhasAlvo),
  );
  const aperto = -0.055;
  // A frase ocupa no máximo ~55% da altura; a foto respira em cima.
  const tetoPelaAltura = Math.floor((p.altura * 0.55) / (linhas.length * 0.95));
  const tamanho = Math.min(
    tetoPelaAltura,
    ...linhas.map((l) => tamanhoParaCaber(textoDaLinha(l), fonte, util, 150, aperto)),
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
        veu="linear-gradient(180deg, rgba(8,6,4,0.10) 0%, rgba(8,6,4,0.05) 35%, rgba(8,6,4,0.62) 62%, rgba(8,6,4,0.90) 100%)"
      />
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          justifyContent: "flex-end",
          position: "absolute",
          top: 0,
          left: 0,
          width: p.largura,
          height: p.altura,
          padding: `${margem}px ${margem}px ${Math.round(margem * 1.3)}px`,
        }}
      >
        {/* o convite pequeno, em três linhas curtas, como na referência */}
        <div style={{ display: "flex", width: 330, marginBottom: 26 }}>
          <div
            style={{
              display: "flex",
              fontFamily: "Grotesca",
              fontSize: 23,
              lineHeight: 1.22,
              letterSpacing: 0.5,
              color: "#FFFFFF",
            }}
          >
            {(p.top || "Compartilhe essa mensagem com mais alguém").toUpperCase()}
          </div>
        </div>
        {linhas.map((l, i) => (
          <Linha
            key={`${i}-${textoDaLinha(l)}`}
            palavras={l}
            familia="Grotesca"
            tamanho={tamanho}
            cor="#FFFFFF"
            corDestaque={p.cor}
            espaco={Math.round(tamanho * aperto)}
            entrelinha={0.95}
          />
        ))}
        {p.ref ? (
          <div style={{ display: "flex", marginTop: 30 }}>
            <Rotulo
              texto={p.ref}
              cor="rgba(255,255,255,0.82)"
              tamanho={24}
              espaco={6}
            />
          </div>
        ) : null}
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------------
// Recorte — cada linha numa tira de papel, levemente torta, sobre a foto
// ---------------------------------------------------------------------------

const PAPEL_CLARO = "#F3EBDA";
const PAPEL_AMARELO = "#F2D27A";

/** A tinta que se lê sobre a cor do papel (preto no claro, creme no escuro). */
function tintaSobre(hex: string): string {
  const n = Number.parseInt(hex.replace("#", ""), 16);
  if (Number.isNaN(n)) return TINTA;
  const luz = (0.299 * (n >> 16) + 0.587 * ((n >> 8) & 255) + 0.114 * (n & 255)) / 255;
  return luz > 0.55 ? TINTA : "#FBF6EA";
}

function Recorte({ p }: { p: EditorialPayload }) {
  // A serifada não tem tabela de medidas; a grotesca é um pouco mais larga,
  // então medir por ela deixa folga em vez de estourar.
  const fonte: FonteMedida = "inter800";
  const { palavras } = palavrasDoSlide(p.texto);
  const margem = 56;
  const util = Math.round(p.largura * 0.82);
  // Trecho destacado ganha a tira só dele; o resto vai em tiras de ~16 letras.
  const tiras: { palavras: Palavra[]; forte: boolean }[] = [];
  let pendentes: Palavra[] = [];
  const despejar = () => {
    if (!pendentes.length) return;
    const alvo = alvoParaLinhas(
      pendentes,
      fonte,
      Math.ceil(textoDaLinha(pendentes).length / 17),
    );
    for (const l of quebrarEmLinhas(pendentes, fonte, alvo))
      tiras.push({ palavras: l, forte: false });
    pendentes = [];
  };
  let forte: Palavra[] = [];
  for (const w of palavras) {
    if (w.destaque) {
      despejar();
      forte.push(w);
      continue;
    }
    if (forte.length) {
      tiras.push({ palavras: forte, forte: true });
      forte = [];
    }
    pendentes.push(w);
  }
  if (forte.length) tiras.push({ palavras: forte, forte: true });
  despejar();

  const recheio = 34; // respiro lateral dentro da tira
  const medir = (teto: number) =>
    tiras.map((t) =>
      Math.max(
        34,
        tamanhoParaCaber(
          textoDaLinha(t.palavras),
          fonte,
          util - recheio * 2,
          t.forte ? Math.round(teto * 1.45) : teto,
        ),
      ),
    );
  const altoDisponivel = Math.round(p.altura * 0.74);
  let teto = 96;
  let tamanhos = medir(teto);
  while (teto > 40 && tamanhos.reduce((s, t) => s + t * 1.5 + 10, 0) > altoDisponivel) {
    teto -= 6;
    tamanhos = medir(teto);
  }
  // Giro fixo por posição: o mesmo texto sai sempre igual.
  const giros = [-2.2, 1.4, -1.1, 2, -1.6, 0.9, -2, 1.2];
  const papeis = [PAPEL_CLARO, PAPEL_AMARELO];
  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: "#1A1712",
      }}
    >
      <Fundo
        p={p}
        veu="linear-gradient(180deg, rgba(8,6,4,0.18) 0%, rgba(8,6,4,0.0) 40%, rgba(8,6,4,0.35) 100%)"
      />
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "flex-start",
          position: "absolute",
          top: Math.round(p.altura * 0.07),
          left: margem,
          width: p.largura - margem * 2,
        }}
      >
        {tiras.map((t, i) => {
          const papel = t.forte ? p.cor : papeis[i % papeis.length];
          return (
            <div
              key={`${i}-${textoDaLinha(t.palavras)}`}
              style={{
                display: "flex",
                marginTop: i ? 10 : 0,
                // tiras alternadas entram um pouco, como papel colado à mão
                marginLeft: i % 3 === 1 ? 46 : i % 3 === 2 ? 14 : 0,
                padding: `${Math.round(tamanhos[i] * 0.12)}px ${recheio}px ${Math.round(tamanhos[i] * 0.2)}px`,
                backgroundColor: papel,
                boxShadow: "6px 8px 0 rgba(0,0,0,0.28)",
                transform: `rotate(${giros[i % giros.length]}deg)`,
                fontFamily: "Serifada",
                fontSize: tamanhos[i],
                lineHeight: 1.12,
                color: tintaSobre(papel),
              }}
            >
              {textoDaLinha(t.palavras)}
            </div>
          );
        })}
      </div>
      {/* a assinatura (ou a referência) numa tira pequena, embaixo */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          left: margem,
          bottom: Math.round(p.altura * 0.06),
          padding: "12px 22px",
          backgroundColor: PAPEL_CLARO,
          boxShadow: "4px 5px 0 rgba(0,0,0,0.28)",
          transform: "rotate(-1.2deg)",
        }}
      >
        <Rotulo
          texto={p.ref || p.top || "Ekballo Academy"}
          cor={TINTA}
          tamanho={22}
          espaco={5}
        />
      </div>
    </div>
  );
}

// ---------------------------------------------------------------------------
// Os quatro modelos da terceira leva de referências (issue #248). Todos
// partem a frase em principal + complemento (`partirFrase`), sem tirar
// nenhuma palavra do lugar.
// ---------------------------------------------------------------------------

/** Quebra em linhas de largura parecida, mirando `letrasPorLinha`. */
function emLinhas(palavras: Palavra[], fonte: FonteMedida, letrasPorLinha: number) {
  if (!palavras.length) return [];
  const linhas = Math.max(
    1,
    Math.round(textoDaLinha(palavras).length / letrasPorLinha),
  );
  return quebrarEmLinhas(palavras, fonte, alvoParaLinhas(palavras, fonte, linhas));
}

/** O maior tamanho em que todas as linhas cabem na largura. */
function tamanhoDasLinhas(
  linhas: Palavra[][],
  fonte: FonteMedida,
  largura: number,
  teto: number,
  aperto = 0,
) {
  return Math.min(
    teto,
    ...linhas.map((l) =>
      tamanhoParaCaber(textoDaLinha(l), fonte, largura, teto, aperto),
    ),
  );
}

// --- Sereno — paisagem calma, serifada clara em dois tamanhos ---------------

function Sereno({ p }: { p: EditorialPayload }) {
  // A serifada é medida pela grotesca (mais larga): sobra folga, não estoura.
  const fonte: FonteMedida = "inter800";
  const { palavras } = palavrasDoSlide(p.texto);
  const [principal, resto] = partirFrase(palavras);
  const margem = 120;
  const util = p.largura - margem * 2;
  const linhasG = emLinhas(principal, fonte, 13);
  const tamG = tamanhoDasLinhas(linhasG, fonte, util * 0.78, 150);
  const linhasP = emLinhas(resto, fonte, 13);
  const tamP = Math.min(
    Math.round(tamG * 0.52),
    tamanhoDasLinhas(linhasP, fonte, util * 0.5, 80),
  );
  const tinta = "#F4E3CF";
  const linha = (l: Palavra[], tamanho: number, chave: string) => (
    <Linha
      key={chave}
      palavras={l}
      familia="Serifada"
      tamanho={tamanho}
      cor={tinta}
      corDestaque={tinta}
      espaco={Math.round(tamanho * -0.035)}
      entrelinha={0.98}
    />
  );
  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: "#141815",
      }}
    >
      <Fundo
        p={p}
        veu="linear-gradient(180deg, rgba(10,14,12,0.42) 0%, rgba(10,14,12,0.30) 45%, rgba(10,14,12,0.55) 100%)"
      />
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "absolute",
          top: Math.round(p.altura * 0.2),
          left: margem,
          width: util,
        }}
      >
        <div style={{ display: "flex", flexDirection: "column" }}>
          {linhasG.map((l, i) => linha(l, tamG, `g${i}`))}
        </div>
        {linhasP.length ? (
          // o complemento desce para a direita, como quem continua a conversa
          <div
            style={{
              display: "flex",
              flexDirection: "column",
              marginTop: Math.round(tamG * 0.12),
              marginLeft: Math.round(util * 0.5),
            }}
          >
            {linhasP.map((l, i) => linha(l, tamP, `p${i}`))}
          </div>
        ) : null}
      </div>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          position: "absolute",
          left: 0,
          bottom: Math.round(p.altura * 0.07),
          width: p.largura,
        }}
      >
        <Rotulo
          texto={p.ref || p.top || "Ekballo Academy"}
          cor="rgba(244,227,207,0.78)"
          tamanho={22}
          espaco={7}
        />
      </div>
    </div>
  );
}

// --- Contraste — letra fina maiúscula e a palavra forte em itálico serifado --

/** Uma linha em que o destaque troca de família (itálico serifado, minúsculo). */
function LinhaMista({
  palavras,
  tamanho,
  cor,
}: {
  palavras: Palavra[];
  tamanho: number;
  cor: string;
}) {
  return (
    <div style={{ display: "flex", alignItems: "baseline" }}>
      {palavras.map((w, i) => (
        <div
          key={`${i}-${w.t}`}
          style={{
            display: "flex",
            fontFamily: w.destaque ? "Italica" : "Legenda",
            fontStyle: w.destaque ? "italic" : "normal",
            fontSize: w.destaque ? Math.round(tamanho * 1.16) : tamanho,
            lineHeight: 1.04,
            letterSpacing: w.destaque ? 0 : Math.round(tamanho * -0.045),
            marginRight: i < palavras.length - 1 ? Math.round(tamanho * 0.24) : 0,
            color: cor,
          }}
        >
          {w.destaque ? w.t.toLowerCase() : w.t.toUpperCase()}
        </div>
      ))}
    </div>
  );
}

function Contraste({ p }: { p: EditorialPayload }) {
  const fonte: FonteMedida = "inter800";
  const { palavras } = palavrasDoSlide(p.texto);
  const [principal, resto] = partirFrase(palavras);
  const margem = 92;
  const util = p.largura - margem * 2;
  const maiusculas = (l: Palavra[]) => textoDaLinha(l).toUpperCase();
  const linhasG = emLinhas(principal, fonte, 17);
  const tamG = Math.min(
    104,
    ...linhasG.map((l) => tamanhoParaCaber(maiusculas(l), fonte, util * 0.9, 104)),
  );
  const linhasP = emLinhas(resto, fonte, 30);
  const tamP = Math.min(
    Math.round(tamG * 0.46),
    ...linhasP.map((l) => tamanhoParaCaber(maiusculas(l), fonte, util * 0.8, 46)),
  );
  const branco = "#FFFFFF";
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
        veu="linear-gradient(180deg, rgba(8,6,4,0.45) 0%, rgba(8,6,4,0.40) 50%, rgba(8,6,4,0.30) 100%)"
      />
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          position: "absolute",
          top: Math.round(p.altura * 0.055),
          left: 0,
          width: p.largura,
        }}
      >
        <Rotulo
          texto={p.top || "Ekballo Academy"}
          cor={branco}
          tamanho={24}
          espaco={2}
        />
      </div>
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "absolute",
          top: Math.round(p.altura * 0.34),
          left: margem,
          width: util,
        }}
      >
        {linhasG.map((l, i) => (
          <LinhaMista
            key={`g${i}-${textoDaLinha(l)}`}
            palavras={l}
            tamanho={tamG}
            cor={branco}
          />
        ))}
        {linhasP.length ? (
          <div style={{ display: "flex", flexDirection: "column", marginTop: 22 }}>
            {linhasP.map((l, i) => (
              <LinhaMista
                key={`p${i}-${textoDaLinha(l)}`}
                palavras={l}
                tamanho={tamP}
                cor={branco}
              />
            ))}
          </div>
        ) : null}
        {/* o fio que fecha o bloco, no lugar da seta da referência */}
        <div
          style={{
            display: "flex",
            marginTop: 40,
            width: 110,
            height: 3,
            backgroundColor: branco,
          }}
        />
        {p.ref ? (
          <div style={{ display: "flex", marginTop: 22 }}>
            <Rotulo
              texto={p.ref}
              cor="rgba(255,255,255,0.85)"
              tamanho={22}
              espaco={5}
            />
          </div>
        ) : null}
      </div>
    </div>
  );
}

// --- Carimbo — cor forte e gasta, frase enorme e o complemento em tiras -----

function Carimbo({ p }: { p: EditorialPayload }) {
  const fonte: FonteMedida = "anton";
  const { palavras } = palavrasDoSlide(p.texto, true);
  const [principal, resto] = partirFrase(palavras);
  const margem = 70;
  const util = p.largura - margem * 2;
  const linhasG = emLinhas(principal, fonte, 13);
  const tamG = Math.min(
    Math.floor((p.altura * 0.36) / Math.max(1, linhasG.length)),
    tamanhoDasLinhas(linhasG, fonte, util, 250),
  );
  const tiras = emLinhas(resto, "inter800", 18);
  const tamT = tamanhoDasLinhas(tiras, "inter800", util * 0.78, 62, -0.03);
  const creme = "#F1E4C8";
  const caixa = {
    position: "absolute",
    top: 0,
    left: 0,
    width: p.largura,
    height: p.altura,
  } as const;
  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: p.cor,
      }}
    >
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
      {/* a cor cobre o topo inteiro e vai soltando a foto para baixo */}
      <div
        style={{
          ...caixa,
          display: "flex",
          backgroundImage: `linear-gradient(180deg, ${p.cor} 0%, ${p.cor} 44%, ${p.cor}B8 58%, rgba(10,6,4,0.55) 100%)`,
        }}
      />
      {p.grungeSrc ? (
        // biome-ignore lint/performance/noImgElement: Satori só entende <img>; next/image não existe dentro do ImageResponse
        <img
          src={p.grungeSrc}
          alt=""
          width={p.largura}
          height={p.altura}
          style={{ ...caixa, objectFit: "cover", opacity: 0.5 }}
        />
      ) : null}
      {p.graoSrc ? (
        // biome-ignore lint/performance/noImgElement: Satori só entende <img>; next/image não existe dentro do ImageResponse
        <img
          src={p.graoSrc}
          alt=""
          width={p.largura}
          height={p.altura}
          style={{ ...caixa, objectFit: "cover", opacity: 0.22 }}
        />
      ) : null}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "flex-start",
          position: "absolute",
          top: Math.round(p.altura * 0.075),
          left: margem,
          width: util,
        }}
      >
        {linhasG.map((l, i) => (
          <Linha
            key={`g${i}-${textoDaLinha(l)}`}
            palavras={l}
            familia="Condensada"
            tamanho={tamG}
            cor={creme}
            corDestaque={creme}
            espaco={1}
            entrelinha={1.08}
          />
        ))}
        {tiras.map((l, i) => (
          <div
            key={`t${i}-${textoDaLinha(l)}`}
            style={{
              display: "flex",
              marginTop: i ? 8 : 26,
              padding: `6px 18px 8px`,
              backgroundColor: creme,
              transform: `rotate(${i % 2 ? 0.8 : -0.8}deg)`,
              fontFamily: "Grotesca",
              fontSize: tamT,
              lineHeight: 1.1,
              letterSpacing: Math.round(tamT * -0.03),
              color: TINTA,
            }}
          >
            {textoDaLinha(l)}
          </div>
        ))}
      </div>
      <div
        style={{
          display: "flex",
          position: "absolute",
          left: margem,
          bottom: Math.round(p.altura * 0.055),
        }}
      >
        <Rotulo
          texto={p.ref || p.top || "Ekballo Academy"}
          cor={creme}
          tamanho={24}
          espaco={3}
        />
      </div>
    </div>
  );
}

// --- Gravura — papel claro, desenho a traço, a segunda frase numa tarja ------

function Gravura({ p }: { p: EditorialPayload }) {
  const fonte: FonteMedida = "inter800";
  const { palavras } = palavrasDoSlide(p.texto);
  const [principal, resto] = partirFrase(palavras);
  const papel = "#EFEDE8";
  const margem = 118;
  const util = p.largura - margem * 2;
  const linhasG = emLinhas(principal, fonte, 17);
  const tamG = tamanhoDasLinhas(linhasG, fonte, util * 0.82, 84);
  const tarjas = emLinhas(resto, fonte, 16);
  const tamT = tamanhoDasLinhas(tarjas, fonte, util * 0.72, 78);
  const caixa = {
    position: "absolute",
    top: 0,
    left: 0,
    width: p.largura,
    height: p.altura,
  } as const;
  // Sem desenho, o texto desce para o meio do papel.
  const topo = Math.round(p.altura * (p.bgSrc ? 0.15 : 0.32));
  // O papel liso vai até onde o texto acaba; só depois o desenho aparece.
  const altoTexto =
    linhasG.length * tamG * 1.12 +
    (tarjas.length ? 40 + tarjas.length * (tamT * 1.05 + 26) : 0);
  const fimDoPapel = Math.min(
    78,
    Math.round(((topo + altoTexto + 16) / p.altura) * 100),
  );
  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        backgroundColor: papel,
      }}
    >
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
      {/* o papel cobre a metade de cima e se desfaz sobre o desenho */}
      <div
        style={{
          ...caixa,
          display: "flex",
          backgroundImage: `linear-gradient(180deg, ${papel} 0%, ${papel} ${fimDoPapel}%, rgba(239,237,232,0) ${fimDoPapel + 12}%)`,
        }}
      />
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          position: "absolute",
          top: Math.round(p.altura * 0.055),
          left: 78,
          width: p.largura - 156,
        }}
      >
        <div
          style={{
            display: "flex",
            padding: "5px 18px",
            border: `2px solid ${TINTA}`,
            borderRadius: 20,
            fontFamily: "Legenda",
            fontSize: 18,
            letterSpacing: 2,
            color: TINTA,
          }}
        >
          {String(new Date().getFullYear())}
        </div>
        <Rotulo
          texto={p.top || "Ekballo Academy"}
          cor={TINTA}
          tamanho={15}
          espaco={6}
        />
      </div>
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "flex-start",
          position: "absolute",
          top: topo,
          left: margem,
          width: util,
        }}
      >
        {linhasG.map((l, i) => (
          <Linha
            key={`g${i}-${textoDaLinha(l)}`}
            palavras={l}
            familia="Serifada"
            tamanho={tamG}
            cor={TINTA}
            corDestaque={TINTA}
            espaco={Math.round(tamG * -0.03)}
            entrelinha={1.12}
          />
        ))}
        {tarjas.map((l, i) => (
          <div
            key={`t${i}-${textoDaLinha(l)}`}
            style={{
              display: "flex",
              marginTop: i ? 6 : 40,
              padding: `8px 20px 12px`,
              backgroundColor: TINTA,
              fontFamily: "Serifada",
              fontSize: tamT,
              lineHeight: 1.05,
              color: "#F6F4EE",
            }}
          >
            {textoDaLinha(l).toUpperCase()}
          </div>
        ))}
      </div>
      <div
        style={{
          display: "flex",
          position: "absolute",
          left: 78,
          bottom: Math.round(p.altura * 0.045),
          // um pedaço de papel atrás, para o traço do desenho não cortar a letra
          padding: "6px 12px",
          backgroundColor: papel,
        }}
      >
        <Rotulo
          texto={p.ref || "Ekballo Academy"}
          cor={TINTA}
          tamanho={15}
          espaco={5}
        />
      </div>
    </div>
  );
}

/** Desenha um slide em um dos modelos novos. */
export function renderSlideEditorial(p: EditorialPayload) {
  if (p.modelo === "cinema") return <Cinema p={p} />;
  if (p.modelo === "bloco") return <Bloco p={p} />;
  if (p.modelo === "cartaz") return <Cartaz p={p} />;
  if (p.modelo === "impacto") return <Impacto p={p} />;
  if (p.modelo === "recorte") return <Recorte p={p} />;
  if (p.modelo === "sereno") return <Sereno p={p} />;
  if (p.modelo === "contraste") return <Contraste p={p} />;
  if (p.modelo === "carimbo") return <Carimbo p={p} />;
  if (p.modelo === "gravura") return <Gravura p={p} />;
  return <Editorial p={p} />;
}
