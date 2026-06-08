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

const COR_NAVY = "#1B2A4A";
const COR_GOLD = "#C0892B";
const COR_PAPEL = "#F4EACB";

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
  fonteKey: FonteKey;
  realce: RealceModo;
  /** Cor do destaque — no template papel é sempre dourado (ignora hex custom). */
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
  const gold = COR_GOLD; // template papel: paleta fixa navy/dourado
  const W = TAMANHO_W;
  const H = TAMANHO_H;
  const BAND = Math.round(H * 0.36); // faixa da foto embaixo

  const { words, script } = parseTexto(p.texto, f.upper);

  const plain = p.texto.replace(/[{}()]/g, "");
  const base = 150;
  const len = plain.length;
  const size =
    len > 64 ? base * 0.52 : len > 44 ? base * 0.64 : len > 28 ? base * 0.78 : len > 14 ? base * 0.92 : base;
  const scriptSize = Math.round(size * 0.72);

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
      {/* papel */}
      {/* eslint-disable-next-line @next/next/no-img-element */}
      <img
        src={p.paperSrc}
        alt=""
        width={W}
        height={H}
        style={{ position: "absolute", top: 0, left: 0, width: W, height: H, objectFit: "cover" }}
      />
      {/* luz quente canto sup-esq */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          inset: 0,
          background:
            "radial-gradient(60% 45% at 18% 12%, rgba(255,243,210,0.55) 0%, rgba(255,243,210,0) 60%)",
        }}
      />
      {/* vinheta suave */}
      <div
        style={{
          display: "flex",
          position: "absolute",
          inset: 0,
          background:
            "radial-gradient(75% 60% at 50% 42%, rgba(80,55,15,0) 55%, rgba(70,48,12,0.14) 100%)",
        }}
      />

      {/* FAIXA DA FOTO (embaixo) */}
      <div style={{ display: "flex", position: "absolute", left: 0, bottom: 0, width: W, height: BAND }}>
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src={p.bgSrc}
          alt=""
          width={W}
          height={BAND}
          style={{ position: "absolute", left: 0, top: 0, width: W, height: BAND, objectFit: "cover" }}
        />
        {/* foto emerge do papel: topo dela funde no creme (fade alto) */}
        <div
          style={{
            display: "flex",
            position: "absolute",
            inset: 0,
            background: `linear-gradient(180deg, ${COR_PAPEL} 0%, rgba(244,234,203,0.88) 16%, rgba(244,234,203,0.45) 36%, rgba(244,234,203,0) 60%)`,
          }}
        />
        {/* respingos cor-de-papel "comendo" o topo da foto → funde foto+papel */}
        {p.paperSpecksSrc ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={p.paperSpecksSrc}
            alt=""
            width={W}
            height={Math.round(BAND * 0.7)}
            style={{ position: "absolute", left: 0, top: -Math.round(BAND * 0.12), width: W, height: Math.round(BAND * 0.7), objectFit: "cover" }}
          />
        ) : null}
        {/* fade lateral suave */}
        <div
          style={{
            display: "flex",
            position: "absolute",
            inset: 0,
            background: `linear-gradient(90deg, ${COR_PAPEL} 0%, rgba(244,234,203,0) 12%, rgba(244,234,203,0) 88%, ${COR_PAPEL} 100%)`,
          }}
        />
        {/* respingos de tinta na transição (azul/dourado) */}
        {p.splatterSrc ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={p.splatterSrc}
            alt=""
            width={W}
            height={Math.round(BAND * 0.85)}
            style={{ position: "absolute", left: 0, top: -Math.round(BAND * 0.34), width: W, height: Math.round(BAND * 0.85), objectFit: "cover", opacity: 0.55 }}
          />
        ) : null}
        {p.ref ? (
          <div
            style={{
              display: "flex",
              position: "absolute",
              left: 0,
              bottom: 26,
              width: W,
              justifyContent: "center",
              fontFamily: "Display",
              fontSize: 22,
              letterSpacing: 6,
              color: "#F5EDDE",
              textTransform: "uppercase",
            }}
          >
            {p.ref}
          </div>
        ) : null}
      </div>

      {/* CONTEÚDO */}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "relative",
          width: "100%",
          height: "100%",
          padding: "70px 80px",
          paddingBottom: BAND - 40,
          justifyContent: "flex-start",
          alignItems: "center",
          textAlign: "center",
        }}
      >
        {/* assinatura topo */}
        <div style={{ display: "flex", flexDirection: "column", alignItems: "center", marginBottom: 10 }}>
          <div style={{ display: "flex", fontFamily: "Script", fontSize: 46, color: COR_NAVY }}>
            {p.top || "Ekballo"}
          </div>
          <div style={{ display: "flex", width: 120, height: 2, marginTop: 6, backgroundColor: gold }} />
        </div>

        {/* bloco de texto */}
        <div style={{ display: "flex", flex: 1, flexDirection: "column", alignItems: "center", justifyContent: "center" }}>
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
      </div>

      {/* grão de grunge por cima de tudo (textura sutil em papel e letras) */}
      {p.grungeSrc ? (
        // eslint-disable-next-line @next/next/no-img-element
        <img
          src={p.grungeSrc}
          alt=""
          width={W}
          height={H}
          style={{ position: "absolute", top: 0, left: 0, width: W, height: H, objectFit: "cover", opacity: 0.1 }}
        />
      ) : null}
    </div>
  );
}