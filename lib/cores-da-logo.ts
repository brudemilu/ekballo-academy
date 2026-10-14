/**
 * Tira de uma logo as cores da conta (issue #264): a escura que mais aparece
 * vira o fundo, a viva que mais aparece vira o destaque, e o texto é branco.
 * Parte pura — recebe os pontos da imagem (RGBA) e devolve os três hex.
 */
import type { Paleta } from "@/lib/instagram-identidade";

const hex = (r: number, g: number, b: number) =>
  `#${[r, g, b].map((v) => v.toString(16).padStart(2, "0")).join("")}`.toUpperCase();

/** Agrupa cores vizinhas (16 níveis por canal) e devolve a média do grupo mais cheio. */
function maisFrequente(pontos: number[][]): string | null {
  const grupos = new Map<number, { n: number; r: number; g: number; b: number }>();
  for (const [r, g, b] of pontos) {
    const chave = ((r >> 4) << 8) | ((g >> 4) << 4) | (b >> 4);
    const grupo = grupos.get(chave) ?? { n: 0, r: 0, g: 0, b: 0 };
    grupo.n++;
    grupo.r += r;
    grupo.g += g;
    grupo.b += b;
    grupos.set(chave, grupo);
  }
  let melhor: { n: number; r: number; g: number; b: number } | null = null;
  for (const grupo of grupos.values())
    if (!melhor || grupo.n > melhor.n) melhor = grupo;
  if (!melhor) return null;
  return hex(
    Math.round(melhor.r / melhor.n),
    Math.round(melhor.g / melhor.n),
    Math.round(melhor.b / melhor.n),
  );
}

/**
 * `rgba` é o conteúdo de um ImageData. Devolve `null` quando a logo não tem
 * uma cor escura E uma cor viva (logo de uma cor só, toda clara ou toda cinza):
 * aí as cores precisam ser escolhidas à mão.
 */
export function coresDaLogo(rgba: ArrayLike<number>): Paleta | null {
  const escuros: number[][] = [];
  const vivos: number[][] = [];
  for (let i = 0; i + 3 < rgba.length; i += 4) {
    // Ponto quase transparente é borda suavizada, não cor da logo.
    if (rgba[i + 3] < 200) continue;
    const r = rgba[i];
    const g = rgba[i + 1];
    const b = rgba[i + 2];
    const max = Math.max(r, g, b);
    const min = Math.min(r, g, b);
    const saturacao = max === 0 ? 0 : (max - min) / max;
    if (max < 130) escuros.push([r, g, b]);
    else if (saturacao > 0.45) vivos.push([r, g, b]);
  }
  const fundo = maisFrequente(escuros);
  const destaque = maisFrequente(vivos);
  if (!fundo || !destaque) return null;
  return { destaque, fundo, texto: "#FFFFFF" };
}
