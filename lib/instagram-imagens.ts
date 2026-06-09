// Prepara as imagens pra publicação no Instagram.
//
// PROBLEMA: a rota OG gera a imagem por IA (Flux) na hora — leva ~10s+. Quando
// o Meta tenta BUSCAR essa URL pra publicar, ele dá timeout ("media could not be
// fetched"). SOLUÇÃO: a gente gera a imagem no NOSSO lado, sobe no Storage
// (público, CDN rápido) e manda pro Meta a URL estática. Aí o Meta baixa rápido.

import { createServiceClient } from "@/lib/supabase/service";

const BUCKET = "instagram";

type SlidePub = {
  texto: string;
  prompt: string;
  modo: string;
  cor?: string;
  fonte: string;
  seed: number;
  tema?: string;
  top?: string;
  ref?: string;
  imageUrl?: string; // já é uma imagem pronta (modo upload) — usa direto
};

function ogUrlDoSlide(origin: string, s: SlidePub): string {
  const p = new URLSearchParams({
    verso: s.texto,
    prompt: s.prompt,
    modo: s.modo,
    realce: s.modo,
    fonte: s.fonte,
    seed: String(s.seed),
  });
  if (s.tema) p.set("tema", s.tema);
  if (s.cor) p.set("cor", s.cor);
  if (s.top?.trim()) p.set("top", s.top.trim());
  if (s.ref?.trim()) p.set("ref", s.ref.trim());
  return `${origin}/api/og/instagram?${p.toString()}`;
}

/**
 * Pra cada slide: se já tem imageUrl (upload), usa direto. Senão, gera a imagem
 * pela rota OG, sobe no Storage e devolve a URL pública (estática/rápida).
 * Roda em paralelo. Lança se alguma imagem falhar.
 */
export async function prepararImageUrls(origin: string, slides: SlidePub[]): Promise<string[]> {
  const sb = createServiceClient();
  const urls: string[] = new Array(slides.length);

  await Promise.all(
    slides.map(async (s, i) => {
      if (s.imageUrl) {
        urls[i] = s.imageUrl;
        return;
      }
      const res = await fetch(ogUrlDoSlide(origin, s));
      if (!res.ok) throw new Error(`falha ao gerar a imagem do slide ${i + 1} (HTTP ${res.status})`);
      const bytes = new Uint8Array(await res.arrayBuffer());
      const path = `pub/${crypto.randomUUID()}.png`;
      const { error } = await sb.storage.from(BUCKET).upload(path, bytes, { contentType: "image/png", upsert: false });
      if (error) throw new Error(`falha ao subir a imagem do slide ${i + 1}: ${error.message}`);
      urls[i] = sb.storage.from(BUCKET).getPublicUrl(path).data.publicUrl;
    }),
  );

  return urls;
}
