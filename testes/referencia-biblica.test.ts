import { describe, expect, it } from "vitest";
import {
  acharReferencias,
  lerTrechos,
  trechosDosNumeros,
} from "@/lib/referencia-biblica";

// =============================================================
// Referência bíblica clicável (issue #282). O leitor acha a
// referência no texto corrido e o popup pede o trecho por número
// do livro — então cada faixa precisa dizer QUAL livro e QUAIS
// versículos. Os exemplos vêm dos guias do Perspectivas.
// =============================================================

function alvos(texto: string) {
  return acharReferencias(texto).map((f) => ({
    texto: texto.slice(f.start, f.end),
    livroId: f.livroId,
    trechos: f.trechos,
  }));
}

describe("acharReferencias", () => {
  it("lê livro e trecho de cada referência", () => {
    expect(alvos("Leia Gênesis 3.14-15. Repare, como em Gálatas 3.16, que…")).toEqual([
      { texto: "Gênesis 3.14-15", livroId: 1, trechos: "3:14-15" },
      { texto: "Gálatas 3.16", livroId: 48, trechos: "3:16-16" },
    ]);
  });

  it("referência em sequência herda o livro da anterior", () => {
    expect(
      alvos(
        "Leia em sua Bíblia: Gênesis 12.1-3; 18.18; 26.4; 28.14. Qual o significado",
      ),
    ).toEqual([
      { texto: "Gênesis 12.1-3", livroId: 1, trechos: "12:1-3" },
      { texto: "18.18", livroId: 1, trechos: "18:18-18" },
      { texto: "26.4", livroId: 1, trechos: "26:4-4" },
      { texto: "28.14", livroId: 1, trechos: "28:14-14" },
    ]);
  });

  it("aceita livro com numeral, abreviação e capítulo sozinho", () => {
    const r = alvos(
      "Apocalipse 5.1-14, Daniel 7.9-14 e Salmo 110; também 1Co 13.4-7 e 1 Tessalonicenses 2.7-12",
    );
    expect(r.map((x) => [x.texto, x.livroId, x.trechos])).toEqual([
      ["Apocalipse 5.1-14", 66, "5:1-14"],
      ["Daniel 7.9-14", 27, "7:9-14"],
      ["Salmo 110", 19, "110"],
      ["1Co 13.4-7", 46, "13:4-7"],
      ["1 Tessalonicenses 2.7-12", 52, "2:7-12"],
    ]);
  });

  it("referência em caixa alta que assina o versículo em bloco", () => {
    expect(alvos("1CORÍNTIOS 13.13—14.1")).toEqual([
      { texto: "1CORÍNTIOS 13.13—14.1", livroId: 46, trechos: "13:13-;14:1-1" },
    ]);
  });

  it("número solto depois de ponto e vírgula não vira versículo", () => {
    expect(alvos("Leia Romanos 8.28; 3 pessoas responderam")).toHaveLength(1);
  });
});

describe("trechosDosNumeros", () => {
  it.each([
    ["23", "23"],
    ["3.16", "3:16-16"],
    ["3:16-18", "3:16-18"],
    ["3.16,18", "3:16-16;3:18-18"],
    ["8.28a", "8:28-28"],
    ["13.13—14.1", "13:13-;14:1-1"],
  ])("%s → %s", (entrada, saida) => {
    expect(trechosDosNumeros(entrada)).toBe(saida);
  });

  it("recusa intervalo ao contrário", () => {
    expect(trechosDosNumeros("3.18-16")).toBeNull();
  });
});

describe("lerTrechos (o que chega pela rede)", () => {
  it("lê o próprio formato de volta", () => {
    expect(lerTrechos("13:13-;14:1-1")).toEqual([
      { capitulo: 13, de: 13, ate: undefined },
      { capitulo: 14, de: 1, ate: 1 },
    ]);
    expect(lerTrechos("23")).toEqual([{ capitulo: 23 }]);
  });

  it.each(["", "abc", "3:0-2", "3:5-2", "1;2;3;4", "0", "3:16-18;<script>"])(
    "recusa %j",
    (spec) => {
      expect(lerTrechos(spec)).toBeNull();
    },
  );
});
