// Prepara as imagens pra publicação no Instagram.
//
// PROBLEMA: a rota OG gera a imagem por IA (Flux) na hora — leva ~10s+. Quando
// o Meta tenta BUSCAR essa URL pra publicar, ele dá timeout ("media could not be
// fetched"). SOLUÇÃO: a gente gera a imagem no NOSSO lado, sobe no Storage
// (público, CDN rápido) e manda pro Meta a URL estática. Aí o Meta baixa rápido.

import { ehPng, pngParaJpeg } from "@/lib/imagem-jpeg";
import { createServiceClient } from "@/lib/supabase/service";

const BUCKET = "instagram";

export type SlidePub = {
  texto: string;
  prompt: string;
  modo: string;
  cor?: string;
  fonte: string;
  seed: number;
  tema?: string;
  tom?: string;
  /** Modelo do slide (lib/instagram-modelos.ts). Sem ele, é o de foto. */
  modelo?: string;
  /** "story": a imagem sai em 9:16 e o post é publicado como story, não no feed. */
  formato?: string;
  /** Foto do próprio ministério, no lugar da gerada (URL do nosso Storage). */
  img?: string;
  top?: string;
  ref?: string;
  imageUrl?: string; // já é uma imagem pronta (modo upload) — usa direto
};

/** O post é um story? (uma imagem só, marcada como story) */
export function ehStory(slides: { formato?: string }[]): boolean {
  return slides.length === 1 && slides[0]?.formato === "story";
}

export function ogUrlDoSlide(origin: string, s: SlidePub): string {
  const p = new URLSearchParams({
    verso: s.texto,
    prompt: s.prompt,
    modo: s.modo,
    realce: s.modo,
    fonte: s.fonte,
    seed: String(s.seed),
  });
  // Com tema, a cor vem DELE — igual à prévia do editor. Mandar também o hex
  // sugerido pelo modelo fazia a rota preferir o hex, e o post publicado saía
  // com outra cor de destaque que a aprovada na tela.
  if (s.tema) p.set("tema", s.tema);
  else if (s.cor) p.set("cor", s.cor);
  if (s.tom) p.set("tom", s.tom);
  if (s.modelo && s.modelo !== "foto") p.set("modelo", s.modelo);
  if (s.img) p.set("img", s.img);
  if (s.formato === "story") p.set("f", "story");
  if (s.top?.trim()) p.set("top", s.top.trim());
  if (s.ref?.trim()) p.set("ref", s.ref.trim());
  return `${origin}/api/og/instagram?${p.toString()}`;
}

/**
 * Pra cada slide: se já tem imageUrl (upload), usa direto. Senão, gera a imagem
 * pela rota OG, sobe no Storage e devolve a URL pública (estática/rápida).
 * Roda em paralelo. Lança se alguma imagem falhar.
 */
export async function prepararImageUrls(
  origin: string,
  slides: SlidePub[],
): Promise<string[]> {
  const sb = createServiceClient();
  const urls: string[] = new Array(slides.length);

  await Promise.all(
    slides.map(async (s, i) => {
      if (s.imageUrl) {
        urls[i] = s.imageUrl;
        return;
      }
      const res = await fetch(ogUrlDoSlide(origin, s));
      if (!res.ok)
        throw new Error(
          `falha ao gerar a imagem do slide ${i + 1} (HTTP ${res.status})`,
        );
      const png = new Uint8Array(await res.arrayBuffer());
      // O Instagram desiste de baixar o PNG de 2–3 MB (issue #238): vai em
      // JPEG. Se a conversão falhar, o PNG ainda é melhor que não publicar.
      const jpeg = ehPng(png)
        ? await pngParaJpeg(png).catch((e) => {
            console.error("[imagem] jpeg:", e instanceof Error ? e.message : e);
            return null;
          })
        : null;
      const bytes = jpeg ?? png;
      const path = `pub/${crypto.randomUUID()}.${jpeg ? "jpg" : "png"}`;
      const { error } = await sb.storage.from(BUCKET).upload(path, bytes, {
        contentType: jpeg ? "image/jpeg" : "image/png",
        upsert: false,
      });
      if (error)
        throw new Error(`falha ao subir a imagem do slide ${i + 1}: ${error.message}`);
      urls[i] = sb.storage.from(BUCKET).getPublicUrl(path).data.publicUrl;
    }),
  );

  return urls;
}
