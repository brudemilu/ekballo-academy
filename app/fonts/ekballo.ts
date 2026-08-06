// =============================================================
// EKBALLO ENGLISH · Tipografia
//
// O projeto inteiro rodava em Georgia + fonte do sistema, ou seja,
// sem tipografia própria. Para o English isso pesava: a palavra em
// inglês é o objeto de estudo, e ela precisava de um tratamento de
// espécime — grande, com personalidade, inconfundível.
//
// Os arquivos ficam embutidos aqui (subconjunto latino, 107 KB no
// total) em vez de virem do Google no build. Assim o build não
// depende de rede, a página não pisca trocando de fonte, e nada
// vaza para servidor de terceiro. Ambas são OFL — ver LICENSE.txt.
// =============================================================

import localFont from "next/font/local";

/** Display — só para a palavra em inglês e títulos. Usar com parcimônia. */
export const displayEnglish = localFont({
  src: "./bricolage-latin.woff2",
  weight: "200 800",
  style: "normal",
  display: "swap",
  variable: "--fonte-display",
  // Georgia como reserva: se a fonte falhar, cai em algo com peso,
  // não numa Arial genérica.
  fallback: ["Georgia", "serif"],
});

/** Interface — enunciado, botões, rótulos, texto de apoio. */
export const uiEnglish = localFont({
  src: "./instrument-latin.woff2",
  weight: "400 700",
  style: "normal",
  display: "swap",
  variable: "--fonte-ui",
  fallback: ["-apple-system", "BlinkMacSystemFont", "Segoe UI", "sans-serif"],
});
