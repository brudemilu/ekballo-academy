import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";
import { ehFigura, ehTitulo, lerParagrafos, parseFigura } from "@/lib/estrutura-livro";

const sql = readFileSync(
  "supabase/migrations/282_curso_imitacao_de_cristo.sql",
  "utf-8",
);
const mesas = [
  ...new Set([...sql.matchAll(/\$conteudo\$([\s\S]*?)\$conteudo\$/g)].map((m) => m[1])),
];

describe("carga de A Imitação de Cristo", () => {
  it("tem as 116 mesas", () => expect(mesas.length).toBe(116));

  it("as figuras são reconhecidas pelo leitor e apontam para arquivo existente", () => {
    const figuras = mesas.flatMap((m) => m.split("\n\n")).filter(ehFigura);
    expect(figuras.length).toBe(100);
    for (const bloco of figuras) {
      const { src } = parseFigura(bloco);
      expect(src).toMatch(/^\/figuras\/imitacao-de-cristo\/\d{3}\.jpeg$/);
      expect(() => readFileSync(`public${src}`)).not.toThrow();
    }
  });

  it("o marcador de capítulo é estilizado como título", () => {
    const primeiros = mesas
      .slice(1, -1)
      .map((m) => m.split("\n\n").find((b) => b.startsWith("CAPÍTULO")));
    expect(primeiros.every((b) => b && ehTitulo(b))).toBe(true);
  });

  // A edição marca quem fala de dois jeitos, e a carga conserva os dois: no
  // Livro IV a rubrica ocupa uma linha própria (e o leitor a estiliza como
  // título de seção); no Livro III ela abre o parágrafo, colada ao texto.
  it("as rubricas em linha própria do Livro IV viram título de seção", () => {
    const blocos = mesas.flatMap((m) => m.split("\n\n"));
    const rubricas = blocos.filter((b) =>
      /^(VOZ DO AMADO|VOZ DO DISCÍPULO)$/.test(b.trim()),
    );
    expect(rubricas.length).toBe(17);
    expect(rubricas.every(ehTitulo)).toBe(true);
  });

  it("as rubricas do diálogo do Livro III abrem o parágrafo", () => {
    const blocos = mesas.flatMap((m) => m.split("\n\n"));
    const numeradas = blocos.filter((b) => /^\d+\. (JESUS|A ALMA) — /.test(b.trim()));
    expect(numeradas.length).toBe(84);
    // Duas falas a edição não numera; ainda assim são turno próprio, e não
    // podem ficar grudadas no parágrafo anterior.
    const soltas = blocos.filter((b) => /^(JESUS|A ALMA) — /.test(b.trim()));
    expect(soltas.length).toBe(2);
  });

  it("nenhum parágrafo ficou com resíduo de versalete espaçado", () => {
    const suspeitos = mesas
      .flatMap((m) => lerParagrafos(m))
      .filter((p) => /\b[A-ZÀ-Ü](\s[A-ZÀ-Ü]){3,}/.test(p.texto));
    expect(suspeitos).toEqual([]);
  });
});
