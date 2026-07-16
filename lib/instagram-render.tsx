/**
 * Render compartilhado dos slides do carrossel de Instagram — TEMPLATE "PAPEL".
 *
 * Inspirado no padrão aprovado pelo Bruno (peça "A IGREJA QUE IMPACTAVA todo
 * mundo."): fundo de papel creme, tipografia navy + dourado (display pesado +
 * palavra manuscrita), foto cinematográfica só na faixa de baixo (multidão de
 * costas no nascer do sol), assinatura no topo. Formato retrato 4:5 (1080×1350).
 *
 * Marcadores no texto:
 *   {palavra}   → destaque (dourado / realce).
 *   ((frase))   → fonte manuscrita (Script), com sublinhado à mão (o "todo mundo.").
 *
 * Limitações do Satori que moldam o código (não repetir o erro):
 *  - NÃO estica SVG (img/inline/background) → "círculo" é border+borderRadius.
 *  - some com a borda se borderRadius > ~metade da altura → manter raio seguro.
 *  - ignora text-decoration:underline → o sublinhado é uma barrinha desenhada.
 */

export type FonteKey = "anton" | "bebas" | "dm-serif" | "cormorant";
export type RealceModo = "circulo" | "grifo" | "marca" | "dourado" | "nenhum";

export const FONTES: Record<
  FonteKey,
  { file: string; style: "italic" | "normal"; upper: boolean; label: string }
> = {
  anton: { file: "anton.ttf", style: "normal", upper: true, label: "Anton" },
  bebas: { file: "bebas.ttf", style: "normal", upper: true, label: "Bebas Neue" },
  "dm-serif": { file: "dm-serif.ttf", style: "normal", upper: false, label: "DM Serif Display" },
  cormorant: { file: "cormorant-italic.ttf", style: "italic", upper: false, label: "Cormorant" },
};

/** Fonte manuscrita/brush (assinatura + fecho ((...))). Carregada como "Script".
 *  Kaushan Script — estática (NÃO variável; o Satori não suporta variáveis). */
export const SCRIPT_FONT_FILE = "kaushan.ttf";
/** Papel de fundo (asset fixo em public/fundos). */
export const PAPEL_FILE = "paper.jpg";
/** Texturas (public/texturas): grão de grunge, pincelada dourada, respingos. */
export const GRUNGE_FILE = "grunge.png";
export const BRUSH_FILE = "brush.png";
export const SPLATTER_FILE = "splatter.png";
/** Respingos cor-de-papel — "comem" o topo da foto pra fundir foto+papel. */
export const PAPER_SPECKS_FILE = "paper-specks.png";
/** Névoa irregular — dissolve a foto no papel de forma inconstante. */
export const FOG_FILE = "fog.png";

const COR_NAVY = "#1B2A4A";
const COR_GOLD = "#C0892B";
const COR_PAPEL = "#F4EACB";

/**
 * Temas de cor (OPÇÃO do sistema, não regra). Cada tema = cor de destaque + a
 * pincelada na mesma cor. O texto principal fica navy (legível no papel).
 */
export type TemaKey = "dourado" | "terracota" | "azul" | "verde" | "vinho";
export const TEMAS: Record<TemaKey, { cor: string; brush: string; label: string }> = {
  terracota: { cor: "#C0562B", brush: "brush-terracota.png", label: "Terracota" },
  dourado: { cor: "#C0892B", brush: "brush-dourado.png", label: "Dourado" },
  azul: { cor: "#2C6E8F", brush: "brush-azul.png", label: "Azul-aço" },
  verde: { cor: "#5E7B3A", brush: "brush-verde.png", label: "Verde-oliva" },
  vinho: { cor: "#8E3B46", brush: "brush-vinho.png", label: "Vinho" },
};
export const TEMA_PADRAO: TemaKey = "terracota";

export const TAMANHO_W = 1080;
export const TAMANHO_H = 1350;
// compat: alguns lugares ainda importam TAMANHO_SLIDE
export const TAMANHO_SLIDE = TAMANHO_W;

export type SlideRenderPayload = {
  /** Texto do slide. {chave}=destaque dourado; ((frase))=manuscrita. */
  texto: string;
  /** URL/data-URL da FOTO da faixa de baixo (Flux já gerada ou caminho local). */
  bgSrc: string;
  /** URL absoluta do papel de fundo. */
  paperSrc: string;
  /** URLs absolutas das texturas (grunge, pincelada dourada, respingos). */
  grungeSrc?: string;
  brushSrc?: string;
  splatterSrc?: string;
  paperSpecksSrc?: string;
  fogSrc?: string;
  fonteKey: FonteKey;
  realce: RealceModo;
  /** Cor de destaque do tema escolhido (hex). Default = terracota. */
  cor?: string;
  /** Assinatura no topo (default: Ekballo). */
  top?: string;
  /** Referência opcional (rodapé pequeno, sobre a faixa). */
  ref?: string;
};

export function sanitizeCor(input: string | null | undefined): string {
  const v = (input || "").trim();
  if (/^#?[0-9a-fA-F]{6}$/.test(v)) return v.startsWith("#") ? v : `#${v}`;
  return COR_GOLD;
}

type DisplayWord = { t: string; accent: boolean };

/** Separa o texto em (1) frase manuscrita ((...)) e (2) palavras display, marcando {chave}. */
function parseTexto(texto: string, upper: boolean): { words: DisplayWord[]; script: string } {
  let script = "";
  const semScript = texto.replace(/\(\(([^)]*)\)\)/g, (_, frase) => {
    script = (script ? script + " " : "") + String(frase).trim();
    return " ";
  });
  const words: DisplayWord[] = [];
  for (const seg of semScript.split(/(\{[^}]*\})/)) {
    if (!seg) continue;
    const accent = seg.startsWith("{") && seg.endsWith("}");
    const inner = accent ? seg.slice(1, -1) : seg;
    for (const w of inner.split(/\s+/)) {
      if (w) words.push({ t: upper ? w.toUpperCase() : w, accent });
    }
  }
  return { words, script: script.trim() };
}

export function renderSlideInstagram(p: SlideRenderPayload) {
  const f = FONTES[p.fonteKey] || FONTES.anton;
  // cor de destaque do TEMA (não mais dourado fixo); fallback dourado.
  const gold = p.cor && /^#[0-9a-fA-F]{6}$/.test(p.cor) ? p.cor : COR_GOLD;
  const W = TAMANHO_W;
  const H = TAMANHO_H;

  const { words, script } = parseTexto(p.texto, f.upper);

  const plain = p.texto.replace(/[{}()]/g, "");
  // fonte GRANDE, proporcional à tela (preenche o quadro).
  const base = 184;
  const len = plain.length;
  const size =
    len > 64 ? base * 0.56 : len > 44 ? base * 0.68 : len > 28 ? base * 0.82 : len > 14 ? base * 0.94 : base;
  const scriptSize = Math.round(size * 0.74);

  const baseW = {
    display: "flex",
    fontFamily: "Display",
    fontStyle: f.style,
    fontSize: size,
    letterSpacing: f.upper ? 1 : -0.5,
    color: COR_NAVY,
  } as const;

  return (
    <div
      style={{
        display: "flex",
        position: "relative",
        width: "100%",
        height: "100%",
        overflow: "hidden",
        backgroundColor: COR_PAPEL,
      }}
    >
      {/* FOTO como fundo do quadro INTEIRO */}
      {/* eslint-disable-next-line @next/next/no-img-element */}
      <img
        src={p.bgSrc}
        alt=""
        width={W}
        height={H}
        style={{ position: "absolute", top: 0, left: 0, width: W, height: H, objectFit: "cover" }}
      />
      {/* papel MESCLADO por cima (mesmo tom/desgaste nas duas → vira uma coisa só) */}
      {/* eslint-disable-next-line @next/next/no-img-element */}
      <img
        src={p.paperSrc}
        alt=""
        width={W}
        height={H}
        style={{ position: "absolute", top: 0, left: 0, width: W, height: H, objectFit: "cover", opacity: 0.03 }}
      />
      {/* topo levemente escurecido — o kicker dourado sempre lê sobre céu claro */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          inset: 0,
          background: `linear-gradient(180deg, rgba(22,26,40,0.34) 0%, rgba(22,26,40,0.1) 12%, rgba(22,26,40,0) 26%)`,
        }}
      />
      {/* wash de leitura atrás do texto — suave, claro e EVEN (sem halo/blob),
          só o suficiente pro navy ler; a foto continua vibrante nas bordas. */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          inset: 0,
          background: `radial-gradient(80% 54% at 50% 50%, rgba(250,247,238,0.66) 0%, rgba(250,247,238,0.36) 48%, rgba(250,247,238,0) 78%)`,
        }}
      />
      {/* luz quente canto sup-esq */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          inset: 0,
          background:
            "radial-gradient(60% 45% at 18% 12%, rgba(255,243,210,0.5) 0%, rgba(255,243,210,0) 60%)",
        }}
      />
      {/* vinheta suave */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          inset: 0,
          background:
            "radial-gradient(82% 70% at 50% 46%, rgba(80,55,15,0) 64%, rgba(70,48,12,0.1) 100%)",
        }}
      />
      {/* scrim inferior — legibilidade do rodapé, mantém a foto vibrante em cima */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          inset: 0,
          background:
            "linear-gradient(0deg, rgba(22,26,40,0.52) 0%, rgba(22,26,40,0.18) 15%, rgba(22,26,40,0) 34%)",
        }}
      />
      {/* respingos na zona de mescla (cor do tema) */}
      {p.splatterSrc ? (
        // eslint-disable-next-line @next/next/no-img-element
        <img
          src={p.splatterSrc}
          alt=""
          width={W}
          height={Math.round(H * 0.42)}
          style={{ position: "absolute", left: 0, top: Math.round(H * 0.4), width: W, height: Math.round(H * 0.42), objectFit: "cover", opacity: 0.04 }}
        />
      ) : null}

      {/* CONTEÚDO */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "relative",
          width: "100%",
          height: "100%",
          padding: "86px 66px",
          justifyContent: "space-between",
          alignItems: "center",
          textAlign: "center",
        }}
      >
        {/* KICKER / eyebrow no topo — dá estrutura editorial */}
        <div style={{ display: "flex", flexDirection: "column", alignItems: "center" }}>
          {p.top ? (
            <div style={{ display: "flex", fontFamily: "Display", fontStyle: f.style, fontSize: 30, letterSpacing: 7, color: gold }}>
              {p.top.toUpperCase()}
            </div>
          ) : null}
          <div style={{ display: "flex", width: p.top ? 76 : 52, height: 5, marginTop: p.top ? 18 : 0, borderRadius: 3, backgroundColor: gold }} />
        </div>

        {/* bloco de texto */}
        <div style={{ display: "flex", flex: 1, flexDirection: "column", alignItems: "center", justifyContent: "center", padding: "26px 0" }}>
          <div
            style={{
              display: "flex",
              flexWrap: "wrap",
              alignItems: "center",
              justifyContent: "center",
              columnGap: Math.round(size * 0.22),
              rowGap: Math.round(size * 0.04),
              maxWidth: "100%",
              lineHeight: 1,
            }}
          >
            {words.map((w, idx) => {
              if (w.accent && p.realce === "circulo") {
                return (
                  <div key={idx} style={{ display: "flex", alignItems: "center", justifyContent: "center", padding: "10px 30px", border: `7px solid ${gold}`, borderRadius: 60, transform: "rotate(-2deg)" }}>
                    <div style={{ ...baseW, color: gold, transform: "rotate(2deg)" }}>{w.t}</div>
                  </div>
                );
              }
              if (w.accent && p.realce === "grifo") {
                return (
                  <div key={idx} style={{ display: "flex", flexDirection: "column", alignItems: "center" }}>
                    <div style={{ ...baseW, color: gold }}>{w.t}</div>
                    <div style={{ display: "flex", alignSelf: "stretch", height: 12, marginTop: -Math.round(size * 0.12), borderRadius: 6, backgroundColor: gold, opacity: 0.85 }} />
                  </div>
                );
              }
              if (w.accent && p.realce === "marca") {
                return (
                  <div key={idx} style={{ ...baseW, color: "#FFF7E6", backgroundColor: gold, padding: "0 18px", borderRadius: 6 }}>{w.t}</div>
                );
              }
              // default (dourado/nenhum): palavra dourada + PINCELADA dourada por baixo
              if (w.accent) {
                const bw = Math.round(w.t.length * size * 0.62 + 30);
                const bh = Math.round(size * 0.55);
                return (
                  <div key={idx} style={{ display: "flex", flexDirection: "column", alignItems: "center" }}>
                    <div style={{ ...baseW, color: gold }}>{w.t}</div>
                    {p.brushSrc ? (
                      // eslint-disable-next-line @next/next/no-img-element
                      <img src={p.brushSrc} alt="" width={bw} height={bh} style={{ marginTop: -Math.round(size * 0.2), width: bw, height: bh, objectFit: "cover" }} />
                    ) : (
                      <div style={{ display: "flex", alignSelf: "stretch", height: 12, marginTop: -Math.round(size * 0.12), borderRadius: 6, backgroundColor: gold }} />
                    )}
                  </div>
                );
              }
              return (
                <div key={idx} style={baseW}>
                  {w.t}
                </div>
              );
            })}
          </div>

          {/* fecho manuscrito ((...)) */}
          {script ? (
            <div style={{ display: "flex", flexDirection: "column", alignItems: "center", marginTop: Math.round(size * 0.12) }}>
              <div style={{ display: "flex", fontFamily: "Script", fontSize: scriptSize, color: COR_NAVY, transform: "rotate(-2deg)" }}>
                {script}
              </div>
              <div style={{ display: "flex", width: Math.round(scriptSize * Math.min(script.length, 12) * 0.42), height: 9, marginTop: 4, borderRadius: 5, backgroundColor: COR_NAVY }} />
            </div>
          ) : null}
        </div>

        {/* RODAPÉ: wordmark da marca + referência opcional */}
        <div style={{ display: "flex", flexDirection: "column", alignItems: "center" }}>
          {p.ref ? (
            <div style={{ display: "flex", fontFamily: "Display", fontStyle: f.style, fontSize: 30, letterSpacing: 2, color: "#F6ECCB", marginBottom: 14 }}>
              {p.ref}
            </div>
          ) : null}
          <div style={{ display: "flex", width: 44, height: 4, marginBottom: 16, borderRadius: 2, backgroundColor: gold, opacity: 0.95 }} />
          <div style={{ display: "flex", fontFamily: "Display", fontStyle: f.style, fontSize: 25, letterSpacing: 8, color: "#F6ECCB" }}>
            EKBALLO ACADEMY
          </div>
        </div>
      </div>

      {/* grão de grunge por cima de tudo (textura sutil em papel e letras) */}
      {p.grungeSrc ? (
        // eslint-disable-next-line @next/next/no-img-element
        <img
          src={p.grungeSrc}
          alt=""
          width={W}
          height={H}
          style={{ position: "absolute", top: 0, left: 0, width: W, height: H, objectFit: "cover", opacity: 0.05 }}
        />
      ) : null}

      {/* moldura fina — acabamento "designed", por cima de tudo */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          top: 40,
          left: 40,
          right: 40,
          bottom: 40,
          border: "2px solid rgba(27,42,74,0.22)",
          borderRadius: 8,
        }}
      />
    </div>
  );
}