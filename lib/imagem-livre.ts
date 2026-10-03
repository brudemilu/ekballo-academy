/**
 * Imagem livre do copiloto (issue #189): o pastor descreve em português o que
 * quer ver e recebe variações para escolher e baixar — sem texto por cima.
 *
 * Aqui ficam as regras puras: os estilos, o pedido que transforma a descrição
 * num bom prompt em inglês (os modelos de imagem entendem melhor inglês) e a
 * validação. Testado em testes/imagem-livre.test.ts.
 *
 * Duas restrições valem para todo estilo, por escolha: SEM TEXTO na imagem
 * (nenhum modelo acerta acento em português; o texto é posto por nós depois) e
 * SEM ROSTO reconhecível (figura sagrada com rosto inventado por IA é um
 * problema pastoral, e rosto gerado costuma sair deformado).
 */

import type { FormatoImagem } from "@/lib/instagram";
import { lerJSONdaIA } from "@/lib/json-ia";

export const ESTILOS = {
  cinematografico: {
    nome: "Cinematográfico",
    prompt:
      "cinematic photography, dramatic chiaroscuro lighting, warm tones, deep shadows, shallow depth of field, 35mm film grain, photorealistic",
  },
  natureza: {
    nome: "Natureza",
    prompt:
      "landscape photography, soft natural light, wide composition, atmospheric haze, photorealistic, high detail",
  },
  objeto: {
    nome: "Objeto em destaque",
    prompt:
      "still life photography, single subject, soft window light, rustic wooden surface, shallow depth of field, photorealistic",
  },
  minimalista: {
    nome: "Minimalista",
    prompt:
      "minimalist composition, large empty negative space, muted earth tones, soft diffuse light, clean, calm",
  },
  aquarela: {
    nome: "Aquarela",
    prompt:
      "delicate watercolor illustration, soft washes, textured paper, warm muted palette, hand-painted feel",
  },
} as const;

export type EstiloImagem = keyof typeof ESTILOS;

// Vale para todos os estilos.
const SEMPRE =
  "no text, no letters, no watermark, no recognizable faces, no distorted hands";

export const FORMATOS: Record<FormatoImagem, { nome: string; proporcao: string }> = {
  feed: { nome: "Post (4:5)", proporcao: "4 / 5" },
  story: { nome: "Story ou Reel (9:16)", proporcao: "9 / 16" },
  quadrado: { nome: "Quadrado (1:1)", proporcao: "1 / 1" },
};

export function estiloValido(v: unknown): v is EstiloImagem {
  return typeof v === "string" && v in ESTILOS;
}

export function formatoValido(v: unknown): v is FormatoImagem {
  return typeof v === "string" && v in FORMATOS;
}

/** O prompt final que vai para o modelo de imagem. */
export function promptCompleto(cena: string, estilo: EstiloImagem): string {
  return `${cena.trim().replace(/[.\s]+$/, "")}. ${ESTILOS[estilo].prompt}, ${SEMPRE}`;
}

/** A chave do cache: tudo o que muda a imagem. */
export function chaveDaImagem(
  cena: string,
  estilo: EstiloImagem,
  formato: FormatoImagem,
  seed: number,
): string {
  return `livre|${estilo}|${formato}|${seed}|${cena.trim()}`;
}

export const SYSTEM_CENA = `Você transforma a descrição de uma imagem, escrita em português por um pastor, num prompt em INGLÊS para um modelo de geração de imagem.

REGRAS
- Descreva a CENA de forma concreta e visual: o que aparece, onde, a luz, a hora do dia, o enquadramento. De 15 a 40 palavras.
- Não mude o que o pastor pediu. Só traduza e torne concreto. Se ele foi vago ("algo sobre esperança"), escolha UMA imagem simples que represente a ideia (ex.: "a single green sprout breaking through dry cracked soil").
- NUNCA peça texto, letras ou palavras na imagem.
- NUNCA descreva rosto. Pessoas, se pedidas, aparecem de costas, em silhueta ou só as mãos. Jesus e figuras bíblicas: de costas, em silhueta ou ao longe — nunca o rosto.
- Não inclua estilo artístico nem nome de artista: o estilo é acrescentado depois.

Responda SOMENTE com JSON válido: {"cena":"..."}`;

/** Limpa a resposta da IA; lança se não vier cena. */
export function normalizarCena(bruto: string): string {
  const o = lerJSONdaIA(
    bruto,
    "a IA não devolveu uma cena legível — tente descrever de outro jeito",
  ) as { cena?: unknown };
  const cena =
    typeof o.cena === "string" ? o.cena.trim().replace(/\s+/g, " ").slice(0, 500) : "";
  if (cena.length < 8)
    throw new Error(
      "a IA não devolveu uma cena legível — tente descrever de outro jeito",
    );
  return cena;
}

/** Valida a descrição vinda da tela. */
export function validarDescricao(
  v: unknown,
): { ok: true; valor: string } | { ok: false; erro: string } {
  const t = typeof v === "string" ? v.trim() : "";
  if (t.length < 4)
    return { ok: false, erro: "Descreva em poucas palavras o que você quer ver." };
  if (t.length > 600)
    return { ok: false, erro: "Descrição longa demais (máximo 600 caracteres)." };
  return { ok: true, valor: t };
}

/** Sementes das variações: fixas a partir de uma base, para "mais 4" não repetir. */
export function sementes(base: number, quantas = 4): number[] {
  return Array.from({ length: quantas }, (_, i) => base + i);
}
