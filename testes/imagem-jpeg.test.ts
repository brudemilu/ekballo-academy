import { readFileSync } from "node:fs";
import { join } from "node:path";
import { describe, expect, it } from "vitest";
import { ehJpeg, ehPng, pngParaJpeg } from "@/lib/imagem-jpeg";

// =============================================================
// PNG → JPEG das imagens do Instagram (issue #238). O que não
// pode voltar: o post agendado falhar porque o Instagram desistiu
// de baixar um PNG de 2 MB.
// =============================================================

const png = new Uint8Array(
  readFileSync(join(process.cwd(), "public/texturas/grao.png")),
);

describe("reconhecer o formato pelos primeiros bytes", () => {
  it("PNG de verdade é PNG; o resto não", () => {
    expect(ehPng(png)).toBe(true);
    expect(
      ehPng(new Uint8Array([0xff, 0xd8, 0xff, 0xe0, 0, 0, 0, 0, 0xff, 0xd9])),
    ).toBe(false);
    expect(ehPng(new Uint8Array())).toBe(false);
  });

  it("JPEG cortado no meio não passa por JPEG", () => {
    expect(ehJpeg(new Uint8Array([0xff, 0xd8, 0xff, 0xe0, 0x00, 0x10]))).toBe(false);
    expect(ehJpeg(png)).toBe(false);
  });
});

describe("pngParaJpeg", () => {
  it("devolve um JPEG inteiro e bem menor que o PNG", async () => {
    const jpeg = await pngParaJpeg(png);
    expect(ehJpeg(jpeg)).toBe(true);
    expect(jpeg.length).toBeLessThan(png.length);
  });

  it("o que não é imagem vira erro, não arquivo quebrado", async () => {
    await expect(pngParaJpeg(new Uint8Array([1, 2, 3, 4]))).rejects.toThrow();
  });
});
