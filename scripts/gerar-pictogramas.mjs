// =============================================================
// EKBALLO ENGLISH · Pictogramas do exercício "toque na figura certa"
//
// POR QUE são desenhados à mão, e não gerados:
//
// A primeira tentativa usou o Canva. Uma em cada quatro voltava como
// cartão de template cheio de texto de placeholder, exigindo conferir
// uma a uma — e as que passavam não formavam sistema entre si.
//
// Pictograma é sinal, não ilustração. Ele precisa ser reconhecível em
// 80 pixels, coerente com os vizinhos e mudo (a palavra escrita
// entregaria a resposta). Isso se resolve com geometria, não com
// modelo de imagem.
//
// REGRA que define o conjunto: só entra substantivo CONCRETO. Gesto
// ("tchau"), sentimento e frase abstrata ficam de fora por definição —
// foi a fronteira que faltou na primeira leva, e é por isso que a mão
// acenando nunca dizia tchau.
//
// Traço único, uma cor, viewBox 64×64, fundo transparente.
// Uso: node scripts/gerar-pictogramas.mjs
// =============================================================

import { mkdir, writeFile } from "node:fs/promises";

const COR = "#E84310"; // laranja-600 da paleta
const DESTINO = "public/english/icones";

// Cada figura é descrita só pelo miolo do SVG; a moldura é comum.
const FIGURAS = {
  // ---------- casa e lugares ----------
  house: `<path d="M32 10 6 32h7v22h14V38h10v16h14V32h7L32 10z"/>`,
  church: `<path d="M32 4l4 8h-3v6h9l10 12h-5v24H43V38H21v16H9V30H4l10-12h9v-6h-3l4-8z"/>
           <rect x="29" y="42" width="6" height="12" rx="3"/>`,
  city: `<path d="M6 56V28h15v28zM25 56V10h15v46zM44 56V36h14v20z"/>
         <g fill="#FBFAF8"><rect x="10" y="34" width="7" height="6"/><rect x="10" y="44" width="7" height="6"/>
         <rect x="29" y="16" width="7" height="6"/><rect x="29" y="26" width="7" height="6"/>
         <rect x="29" y="36" width="7" height="6"/><rect x="48" y="42" width="6" height="6"/></g>`,
  globe: `<circle cx="32" cy="32" r="24" fill="none" stroke="${COR}" stroke-width="5"/>
          <ellipse cx="32" cy="32" rx="10" ry="24" fill="none" stroke="${COR}" stroke-width="4"/>
          <path d="M9 24h46M9 40h46" stroke="${COR}" stroke-width="4" fill="none"/>`,
  store: `<path d="M8 20h48l-4 10H12L8 20z"/><path d="M12 32h40v22H12z"/>
          <rect x="26" y="38" width="12" height="16"/>`,

  // ---------- tempo ----------
  sun: `<circle cx="32" cy="32" r="12"/>
        <path d="M32 4v8M32 52v8M4 32h8M52 32h8M12 12l6 6M46 46l6 6M52 12l-6 6M18 46l-6 6"
              stroke="${COR}" stroke-width="5" stroke-linecap="round" fill="none"/>`,
  moon: `<path d="M41 7a25 25 0 100 50 30 30 0 010-50z"/>`,

  // ---------- comida e bebida ----------
  bread: `<path d="M10 28c0-8 8-12 22-12s22 4 22 12v16c0 3-2 5-5 5H15c-3 0-5-2-5-5V28z"/>
          <path d="M22 22v22M32 22v22M42 22v22" stroke="#FFF" stroke-width="3" fill="none"/>`,
  water: `<path d="M18 12h28l-4 40a4 4 0 01-4 4H26a4 4 0 01-4-4L18 12z"/>
          <path d="M21 32h22" stroke="#FFF" stroke-width="4" fill="none"/>`,
  coffee: `<path d="M10 18h34v20a12 12 0 01-12 12H22a12 12 0 01-12-12V18z"/>
           <path d="M46 22h6a7 7 0 010 14h-6" fill="none" stroke="${COR}" stroke-width="5"/>
           <rect x="10" y="54" width="34" height="5" rx="2"/>`,
  rice: `<path d="M8 34h48c0 12-11 20-24 20S8 46 8 34z"/>
         <path d="M20 26c4-6 20-6 24 0" fill="none" stroke="${COR}" stroke-width="4" stroke-linecap="round"/>`,

  // ---------- roupa ----------
  shirt: `<path d="M24 10l8 6 8-6 14 8-5 10-5-3v29H20V25l-5 3-5-10 14-8z"/>`,
  // sapato ficou de fora: em 80px lia como borrão. Pictograma que precisa
  // de legenda não é pictograma.

  // ---------- objetos ----------
  book: `<path d="M32 16c-6-5-14-7-24-6v36c10-1 18 1 24 6 6-5 14-7 24-6V10c-10-1-18 1-24 6z"/>
         <path d="M32 16v36" stroke="#FFF" stroke-width="3" fill="none"/>`,
  bus: `<path d="M10 12h44v30a6 6 0 01-6 6H16a6 6 0 01-6-6V12z"/>
        <rect x="16" y="18" width="14" height="12" fill="#FFF"/>
        <rect x="34" y="18" width="14" height="12" fill="#FFF"/>
        <circle cx="20" cy="52" r="5"/><circle cx="44" cy="52" r="5"/>`,
  money: `<ellipse cx="32" cy="46" rx="21" ry="8"/><ellipse cx="32" cy="34" rx="21" ry="8"/>
          <ellipse cx="32" cy="22" rx="21" ry="8"/>
          <g fill="#FBFAF8"><ellipse cx="32" cy="22" rx="9" ry="3.5"/></g>`,
  table: `<path d="M6 24h52v7H6z"/><path d="M12 31h6v25h-6zM46 31h6v25h-6z"/>`,
};

await mkdir(DESTINO, { recursive: true });

for (const [nome, miolo] of Object.entries(FIGURAS)) {
  const svg =
    `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" role="img" aria-hidden="true">` +
    `<g fill="${COR}">${miolo.replace(/\s+/g, " ").trim()}</g></svg>`;
  await writeFile(`${DESTINO}/${nome}.svg`, svg);
  console.log(`  ${nome}.svg  ${svg.length} bytes`);
}

console.log(`\n${Object.keys(FIGURAS).length} pictogramas em ${DESTINO}`);
