import { describe, expect, it } from "vitest";
import { acharIndicacao, casarLeitura, licaoDoTitulo } from "@/lib/leitura-indicada";

// =============================================================
// "Leia Stott (cap. 3, p. 33-40): …" abre a leitura ao lado
// (issue #283). Frases e títulos copiados do curso Perspectivas,
// com a grafia do original — erro incluído, porque é isso que o
// guia tem de verdade.
// =============================================================

const aulas = [
  "Lição 1 · Guia de estudo — Deus é um Deus Missionário",
  "Lição 1 · Leitura — Stott, cap. 1: A Bíblia na evangelização do mundo",
  "Lição 1 · Leitura — Stott, cap. 3: O Deus vivo é um Deus missionário",
  "Lição 1 · Leitura — Kaiser: A chamada missionária de Israel",
  "Lição 1 · Leitura — Gallagher e Hawthorne: Bênção como transformação",
  "Lição 2 · Leitura — Lewis: As duas forças",
  "Lição 2 · Leitura — Hawthorne, cap. 4: A História da Sua Glória",
  "Lição 3 · Leitura — Hawthorne, cap. 13: Mandamento na montanha",
  "Lição 3 · Leitura — Hawthorne: A Grande Comissão e o Grande Mandamento",
  "Lição 4 · Leitura — Thomas, cap. 15: O momento decisivo — libertando o evangelho",
  "Lição 4 · Leitura — Thomas: O Vale da Decisão",
  "Lição 4 · Leitura — Irmão André, cap. 27: Se eu tiver que morrer",
  "Lição 9 · Leitura — L. Mak: Transparência à prova da internet",
  "Lição 9 · Leitura — Parshall, cap. 97: Indo longe demais?",
  "Lição 11 · Leitura — Parshall, cap. 97: Indo longe demais?",
  "Lição 11 · Leitura — Travis, cap. 98: Todos os muçulmanos devem deixar o “islã” para seguir a Jesus?",
].map((titulo, i) => ({ id: `a${i}`, titulo }));

const tituloDe = (id: string | null) => aulas.find((a) => a.id === id)?.titulo ?? null;

function abre(frase: string, licao: number): string | null {
  const ind = acharIndicacao(frase);
  return ind ? tituloDe(casarLeitura(ind, aulas, licao)) : null;
}

describe("acharIndicacao", () => {
  it("separa autor, capítulo e título; a faixa clicável vai até o fim do título", () => {
    const frase = "Leia Stott (cap. 3, p. 33-40): O Deus vivo é um Deus missionário.";
    const ind = acharIndicacao(frase);
    expect(ind).toMatchObject({ autores: "Stott", capitulo: 3, dentro: false });
    expect(frase.slice(ind!.start, ind!.end)).toBe(
      "Leia Stott (cap. 3, p. 33-40): O Deus vivo é um Deus missionário",
    );
  });

  it("corta o título antes do recorte de seção", () => {
    const frase =
      "Leia na plataforma Kaiser: A chamada missionára de Israel, até a seção “Salmo 67: Provar seu propósito”";
    const ind = acharIndicacao(frase)!;
    expect(frase.slice(ind.start, ind.end)).toBe(
      "Leia na plataforma Kaiser: A chamada missionára de Israel",
    );
  });

  it.each([
    "Leia em sua Bíblia: Gênesis 12.1-3; 18.18; 26.4; 28.14.",
    "Leia Gênesis 3.14-15. Repare que a palavra “descendente” está na forma singular",
    "Leia a história de Gênesis 22.1-18. Por que Deus declarou…",
    "Leia 1 Tessalonicenses 2.7-12. Como você percebe Paulo…",
    "John Stott descreve o cumprimento triplo desta promessa.",
  ])("pedido de leitura bíblica ou texto comum não vira indicação: %s", (frase) => {
    expect(acharIndicacao(frase)).toBeNull();
  });
});

describe("casarLeitura", () => {
  it("capítulo do livro decide entre leituras do mesmo autor", () => {
    expect(
      abre("Leia Stott (cap. 3, p. 33-40): O Deus vivo é um Deus missionário.", 1),
    ).toBe("Lição 1 · Leitura — Stott, cap. 3: O Deus vivo é um Deus missionário");
  });

  it("artigo da plataforma casa por autor e título, mesmo com erro de grafia", () => {
    expect(
      abre(
        "Leia na plataforma Kaiser: A chamada missionára de Israel, toda a seção…",
        1,
      ),
    ).toBe("Lição 1 · Leitura — Kaiser: A chamada missionária de Israel");
    expect(
      abre(
        "Leia na plataforma o artigo do L. Mac, Transparência à prova da internet",
        9,
      ),
    ).toBe("Lição 9 · Leitura — L. Mak: Transparência à prova da internet");
  });

  it("dois Thomas na mesma lição: o título desempata", () => {
    expect(abre("Leia na plataforma Lyndi Parshal Thomas: O Vale da Decisão.", 4)).toBe(
      "Lição 4 · Leitura — Thomas: O Vale da Decisão",
    );
    expect(
      abre(
        "Leia Thomas (cap. 15, p. 129-132): O momento decisivo: libertando o evangelho.",
        4,
      ),
    ).toBe(
      "Lição 4 · Leitura — Thomas, cap. 15: O momento decisivo — libertando o evangelho",
    );
  });

  it("autor grafado diferente ainda casa pelo capítulo", () => {
    expect(abre("Leia Andrew (cap. 27, p. 198-200): Se eu tiver que morrer.", 4)).toBe(
      "Lição 4 · Leitura — Irmão André, cap. 27: Se eu tiver que morrer",
    );
  });

  it("quadro dentro de capítulo: a leitura própria, se houver; senão o capítulo hospedeiro", () => {
    expect(abre("Leia Lewis (dentro do cap. 7, p. 64-65): As duas forças.", 2)).toBe(
      "Lição 2 · Leitura — Lewis: As duas forças",
    );
    expect(
      abre(
        "Leia Travis (p. 690-691): O espectro C-1 a C-6 (dentro do capítulo 97).",
        11,
      ),
    ).toBe("Lição 11 · Leitura — Parshall, cap. 97: Indo longe demais?");
  });

  it("prefere a cópia da própria lição quando a leitura se repete", () => {
    expect(abre("Leia Parshall (cap. 97, p. 691-692): Indo longe demais.", 9)).toBe(
      "Lição 9 · Leitura — Parshall, cap. 97: Indo longe demais?",
    );
  });

  it("leitura que não está no sistema fica sem link", () => {
    expect(abre("Leia na plataforma Bryant: Além de Amar o Mundo.", 12)).toBeNull();
  });
});

describe("licaoDoTitulo", () => {
  it("lê o número da lição", () => {
    expect(licaoDoTitulo("Lição 11 · Guia de estudo — …")).toBe(11);
    expect(licaoDoTitulo("Mesa 3")).toBeNull();
  });
});
