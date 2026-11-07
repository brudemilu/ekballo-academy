import { describe, expect, it } from "vitest";
import { paragrafoNarrado, quebrarEmPedacos } from "@/lib/audio-leitura";

// =============================================================
// O texto dos livros carrega marcadores que só fazem sentido na
// tela. "O Pequeno Peregrino" entrou com 111 ilustrações, cada
// uma num parágrafo "[figura] /figuras/…/p020.jpg": sem este
// filtro, quem ouve o audiolivro escutaria a voz soletrando o
// caminho do arquivo 111 vezes no meio da história.
// =============================================================

describe("paragrafoNarrado · o que a voz lê de cada parágrafo", () => {
  it("não lê o caminho da figura", () => {
    expect(paragrafoNarrado("[figura] /figuras/o-pequeno-peregrino/p020.jpg")).toBe("");
  });

  it("lê a legenda quando a figura tem uma", () => {
    expect(
      paragrafoNarrado(
        "[figura] /figuras/casamento-blindado/mesa06-ciclo.png | O ciclo do conflito",
      ),
    ).toBe("O ciclo do conflito");
  });

  it("tira o marcador de citação e mantém a citação", () => {
    expect(paragrafoNarrado("[cite] Bem-aventurados os pacificadores.")).toBe(
      "Bem-aventurados os pacificadores.",
    );
  });

  it("deixa o parágrafo comum como está", () => {
    expect(paragrafoNarrado("  O pequeno Cristão vivia em uma grande cidade.  ")).toBe(
      "O pequeno Cristão vivia em uma grande cidade.",
    );
  });
});

describe("quebrarEmPedacos · o texto que vai para a síntese", () => {
  const mesa = [
    "O pequeno Cristão vivia em uma grande cidade chamada Destruição.",
    "[figura] /figuras/o-pequeno-peregrino/p017.jpg",
    "— Existe uma bela terra, muito longe desta cidade — diziam.",
    "[figura] /figuras/o-pequeno-peregrino/p020.jpg",
  ].join("\n\n");

  it("nenhum pedaço menciona figura nem caminho de arquivo", () => {
    const narrado = quebrarEmPedacos(mesa).join(" ");
    expect(narrado).not.toContain("[figura]");
    expect(narrado).not.toContain("/figuras/");
    expect(narrado).not.toContain(".jpg");
  });

  it("o texto em volta das figuras continua inteiro e na ordem", () => {
    expect(quebrarEmPedacos(mesa)).toEqual([
      "O pequeno Cristão vivia em uma grande cidade chamada Destruição.\n\n— Existe uma bela terra, muito longe desta cidade — diziam.",
    ]);
  });

  it("mesa só de figuras não gera pedaço vazio", () => {
    expect(
      quebrarEmPedacos("[figura] /figuras/x/p1.jpg\n\n[figura] /figuras/x/p2.jpg"),
    ).toEqual([]);
  });
});
