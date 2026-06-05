/**
 * Render compartilhado dos slides do carrossel de Instagram.
 *
 * Retorna JSX pronto pro ImageResponse (Vercel @vercel/og / Satori). A rota
 * [app/api/og/instagram/route.tsx](app/api/og/instagram/route.tsx) carrega a
 * fonte (registrada como "Display") e o fundo, e chama renderSlideInstagram().
 *
 * Estilo: fundo (foto IA ou local) + scrim escuro + tipografia caixa-alta;
 * a palavra marcada com {chaves} no texto é destacada conforme `realce`.
 *
 * Limitações do Satori que moldam o código (não repetir o erro):
 *  - NÃO estica SVG (img/inline/background) → o "círculo" é border+borderRadius.
 *  - some com a borda se borderRadius > ~metade da altura → manter raio seguro.
 *  - ignora text-decoration:underline → o grifo é uma barrinha desenhada à mão.
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

const COR_CREAM = "#F5EDDE";
const COR_GOLD = "#C9A961";
const COR_INK = "#0B0F1A";
const SOMBRA = "0 2px 12px rgba(0,0,0,0.92), 0 0 36px rgba(0,0,0,0.65)";

export type SlideRenderPayload = {
  /** Texto do slide. A palavra entre {chaves} vira o destaque. */
  texto: string;
  /** URL/data-URL do fundo (foto IA já gerada ou caminho local). */
  bgSrc: string;
  fonteKey: FonteKey;
  realce: RealceModo;
  /** Cor do destaque (hex com #). */
  cor: string;
  /** Rótulo opcional no topo. */
  top?: string;
  /** Referência opcional no rodapé. */
  ref?: string;
  /** Carrossel sem emenda: total de slides e índice (fatiamento da foto). */
  n?: number;
  i?: number;
};

export function sanitizeCor(input: string | null | undefined): string {
  const v = (input || "").trim();
  if (/^#?[0-9a-fA-F]{6}$/.test(v)) return v.startsWith("#") ? v : `#${v}`;
  return COR_GOLD;
}

export const TAMANHO_SLIDE = 1080;

export function renderSlideInstagram(p: SlideRenderPayload) {
  const f = FONTES[p.fonteKey] || FONTES.anton;
  const n = Math.max(1, p.n || 1);
  const i = Math.min(n - 1, Math.max(0, p.i || 0));
  const S = TAMANHO_SLIDE;
  const panoW = n * S;
  const cor = p.cor;

  const plain = p.texto.replace(/[{}]/g, "");
  const base = f.upper ? 132 : 84;
  const len = plain.length;
  const size = len > 60 ? base * 0.62 : len > 36 ? base * 0.78 : len > 18 ? base * 0.92 : base;

  type Word = { t: string; accent: boolean };
  const words: Word[] = [];
  for (const seg of p.texto.split(/(\{[^}]*\})/)) {
    if (!seg) continue;
    const accent = seg.startsWith("{") && seg.endsWith("}");
    const inner = accent ? seg.slice(1, -1) : seg;
    for (const w of inner.split(/\s+/)) {
      if (w) words.push({ t: f.upper ? w.toUpperCase() : w, accent });
    }
  }

  const baseW = {
    display: "flex",
    fontFamily: "Display",
    fontStyle: f.style,
    fontSize: size,
    letterSpacing: f.upper ? 2 : -0.5,
  } as const;

  return (
    <div style={{ display: "flex", position: "relative", width: "100%", height: "100%", overflow: "hidden", backgroundColor: COR_INK }}>
      {/* eslint-disable-next-line @next/next/no-img-element */}
      <img
        src={p.bgSrc}
        alt=""
        width={panoW}
        height={S}
        style={{ position: "absolute", top: 0, left: -(i * S), width: panoW, height: S, objectFit: "cover" }}
      />
      <div
        style={{
          display: "flex",
          position: "absolute",
          inset: 0,
          background:
            "linear-gradient(180deg, rgba(8,11,20,0.80) 0%, rgba(8,11,20,0.45) 26%, rgba(8,11,20,0.50) 50%, rgba(8,11,20,0.45) 74%, rgba(8,11,20,0.90) 100%)",
        }}
      />
      <div
        style={{
          display: "flex",
          position: "absolute",
          inset: 0,
          background:
            "radial-gradient(ellipse 70% 42% at 50% 50%, rgba(6,9,15,0.62) 0%, rgba(6,9,15,0.32) 55%, rgba(6,9,15,0) 100%)",
        }}
      />
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          position: "relative",
          width: "100%",
          height: "100%",
          padding: "96px 80px",
          justifyContent: "space-between",
          alignItems: "center",
          textAlign: "center",
        }}
      >
        {p.top ? (
          <div style={{ display: "flex", alignItems: "center", gap: 14, color: cor, fontFamily: "Display", fontStyle: f.style, fontSize: 22, letterSpacing: 8, textTransform: "uppercase" }}>
            <div style={{ display: "flex", width: 36, height: 1, backgroundColor: cor }} />
            <div style={{ display: "flex" }}>{p.top}</div>
            <div style={{ display: "flex", width: 36, height: 1, backgroundColor: cor }} />
          </div>
        ) : (
          <div style={{ display: "flex", width: 7, height: 7, borderRadius: 999, backgroundColor: cor }} />
        )}

        <div style={{ display: "flex", flex: 1, alignItems: "center", justifyContent: "center", paddingTop: 30, paddingBottom: 30 }}>
          <div style={{ display: "flex", flexWrap: "wrap", alignItems: "baseline", justifyContent: "center", columnGap: Math.round(size * 0.24), rowGap: Math.round(size * 0.06), maxWidth: "100%" }}>
            {words.map((w, idx) => {
              if (w.accent && p.realce === "circulo") {
                return (
                  <div key={idx} style={{ display: "flex", alignItems: "center", justifyContent: "center", padding: "16px 34px", border: `6px solid ${cor}`, borderRadius: 56, transform: "rotate(-3deg)" }}>
                    <div style={{ ...baseW, color: COR_CREAM, textShadow: SOMBRA, transform: "rotate(3deg)" }}>{w.t}</div>
                  </div>
                );
              }
              if (w.accent && p.realce === "grifo") {
                return (
                  <div key={idx} style={{ display: "flex", flexDirection: "column", alignItems: "center" }}>
                    <div style={{ ...baseW, color: COR_CREAM, textShadow: SOMBRA }}>{w.t}</div>
                    <div style={{ display: "flex", alignSelf: "stretch", height: 7, marginTop: -Math.round(size * 0.14), borderRadius: 3, backgroundColor: cor }} />
                  </div>
                );
              }
              let st: Record<string, unknown> = { ...baseW, color: COR_CREAM, textShadow: SOMBRA };
              if (w.accent && p.realce === "marca") st = { ...baseW, color: COR_INK, backgroundColor: cor, padding: "0 16px", borderRadius: 4 };
              else if (w.accent && p.realce === "dourado") st = { ...baseW, color: cor, textShadow: SOMBRA };
              return (
                <div key={idx} style={st}>
                  {w.t}
                </div>
              );
            })}
          </div>
        </div>

        <div style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 14, minHeight: 30 }}>
          {p.ref ? (
            <>
              <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
                <div style={{ display: "flex", width: 40, height: 1, backgroundColor: cor }} />
                <div style={{ display: "flex", width: 6, height: 6, backgroundColor: cor, transform: "rotate(45deg)" }} />
                <div style={{ display: "flex", width: 40, height: 1, backgroundColor: cor }} />
              </div>
              <div style={{ display: "flex", fontFamily: "Display", fontStyle: f.style, fontSize: 22, letterSpacing: 6, color: COR_CREAM, textTransform: "uppercase" }}>{p.ref}</div>
            </>
          ) : (
            <div style={{ display: "flex", width: 6, height: 6, borderRadius: 999, backgroundColor: cor }} />
          )}
        </div>
      </div>
    </div>
  );
}
