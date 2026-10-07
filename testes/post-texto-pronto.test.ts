import { describe, expect, it } from "vitest";
import {
  aplicarAjuste,
  aplicarDestaque,
  interpretarAjuste,
  lerAjusteDaIA,
  lerCercaDoTexto,
  lerTextoPronto,
  pareceAjuste,
  pareceTextoPronto,
  separarReferencia,
} from "@/lib/post-texto-pronto";
import { interpretarComando } from "@/lib/whatsapp-instagram";

// =============================================================
// Texto pronto e ajustes pelo WhatsApp (issue #239). O que não
// pode voltar a acontecer: o pastor manda a frase do post e a
// imagem sai com outra; pede uma correção e ela não é feita.
// Os dois textos abaixo são os que ele mandou em 07/10/2026.
// =============================================================

const ESCADA =
  'Onde Lúcifer disse "eu subirei", Jesus disse "eu descerei". Precisamos decidir de quem é a escada que estamos subindo.';
const HEBREUS =
  "“Guardemos firme a confissão da esperança, sem vacilar, pois quem fez a promessa é fiel.”";

const slide = (texto: string) => ({
  texto,
  prompt: "a ladder in a dark corridor",
  seed: 10,
  tema: "vinho",
  modelo: "editorial",
  ref: "",
});

describe("texto pronto ou tema?", () => {
  it("frase inteira, com aspas ou com referência embaixo: é o texto do post", () => {
    expect(pareceTextoPronto(`${ESCADA}\nLivro: O Blueprint de Parach`)).toBe(true);
    expect(pareceTextoPronto(`${HEBREUS}\nHebreus 10:23`)).toBe(true);
    expect(pareceTextoPronto("Deus não desperdiça nenhuma dor.")).toBe(true);
  });

  it("uma palavra ou um assunto solto continua sendo tema", () => {
    expect(pareceTextoPronto("fé")).toBe(false);
    expect(pareceTextoPronto("por que o discipulado acontece à mesa")).toBe(false);
    expect(pareceTextoPronto("família.")).toBe(false);
  });
});

describe("interpretarComando: o texto do pastor vai marcado como pronto", () => {
  it("story com a frase escrita: guarda a frase inteira, sem cortar nada", () => {
    const c = interpretarComando(`story ${ESCADA}\nLivro: O Blueprint de Parach`);
    expect(c).toEqual({
      tipo: "criar",
      formato: "story",
      ideia: `texto: ${ESCADA}\nLivro: O Blueprint de Parach`,
    });
  });

  it("a frase que começa com preposição não perde a primeira palavra", () => {
    const c = interpretarComando("story De quem é a escada que você está subindo?");
    expect(c).toMatchObject({
      ideia: "texto: De quem é a escada que você está subindo?",
    });
  });

  it('"texto:" explícito vale mesmo para frase curta', () => {
    expect(interpretarComando("post único texto: Ele é fiel")).toMatchObject({
      formato: "unico",
      ideia: "texto: Ele é fiel",
    });
  });

  it('"sobre…" é tema — quem escreve é a IA, mesmo com ponto final', () => {
    expect(
      interpretarComando("story sobre a importância de perdoar quem nos feriu."),
    ).toMatchObject({ ideia: "a importância de perdoar quem nos feriu." });
    expect(interpretarComando("post sobre família")).toMatchObject({
      ideia: "família",
    });
  });

  it("áudio só vira texto pronto se disser “texto:” (a transcrição pontua tudo)", () => {
    expect(
      interpretarComando("Post a importância do perdão dentro de casa.", true),
    ).toMatchObject({ ideia: "a importância do perdão dentro de casa." });
  });
});

describe("separarReferencia", () => {
  it("tira a linha de autoria do meio do texto", () => {
    expect(separarReferencia(`${ESCADA}\nLivro: O Blueprint de Parach`)).toEqual({
      texto: ESCADA,
      ref: "Livro: O Blueprint de Parach",
    });
    expect(separarReferencia(`${HEBREUS}\nHebreus 10:23`)).toEqual({
      texto: HEBREUS,
      ref: "Hebreus 10:23",
    });
    expect(separarReferencia("Quem ora, descansa.\n— A. W. Tozer").ref).toBe(
      "A. W. Tozer",
    );
  });

  it("referência bíblica na mesma linha, depois da frase", () => {
    expect(separarReferencia(`${HEBREUS} Hebreus 10:23`)).toEqual({
      texto: HEBREUS,
      ref: "Hebreus 10:23",
    });
    expect(separarReferencia("O amor é paciente. 1 Coríntios 13:4").ref).toBe(
      "1 Coríntios 13:4",
    );
  });

  it("segunda linha que é continuação do texto não vira referência", () => {
    expect(separarReferencia("Ele desceu.\nE nos chamou para descer também.")).toEqual({
      texto: "Ele desceu. E nos chamou para descer também.",
      ref: "",
    });
  });

  it("lerTextoPronto devolve a frase exata; tema devolve null", () => {
    expect(lerTextoPronto(`texto: ${ESCADA}\nLivro: O Blueprint de Parach`)).toEqual({
      texto: ESCADA,
      ref: "Livro: O Blueprint de Parach",
    });
    expect(lerTextoPronto("fé")).toBeNull();
  });
});

describe("aplicarDestaque", () => {
  const semChaves = (t: string) => t.replace(/[{}]/g, "");

  it("marca o trecho e não muda mais nada", () => {
    const r = aplicarDestaque(ESCADA, ["eu descerei"]);
    expect(r.texto).toContain('{"eu descerei".}');
    expect(semChaves(r.texto)).toBe(ESCADA);
    expect(r.naoAchei).toEqual([]);
  });

  it("acha sem acento nem caixa, e aceita mais de um trecho", () => {
    const r = aplicarDestaque(ESCADA, ["LUCIFER", "escada"]);
    expect(r.texto).toContain("{Lúcifer}");
    expect(r.texto).toContain("{escada}");
    expect(semChaves(r.texto)).toBe(ESCADA);
  });

  it("trecho que não está no texto é devolvido, e o texto fica intacto", () => {
    const r = aplicarDestaque(ESCADA, ["humildade"]);
    expect(r.texto).toBe(ESCADA);
    expect(r.naoAchei).toEqual(["humildade"]);
  });
});

describe("interpretarAjuste (sem IA)", () => {
  it("texto: — a frase inteira, com a referência separada", () => {
    expect(
      interpretarAjuste(`ajustar texto: ${ESCADA}\nLivro: O Blueprint de Parach`),
    ).toEqual({ texto: ESCADA, ref: "Livro: O Blueprint de Parach" });
    expect(interpretarAjuste(`corrige o texto: ${HEBREUS}`)).toEqual({
      texto: HEBREUS,
    });
  });

  it("trecho entre aspas em outra cor", () => {
    expect(interpretarAjuste('coloca "eu descerei" de outra cor')).toEqual({
      destaques: ["eu descerei"],
      cor: "outra",
    });
    const a = interpretarAjuste('destacar "eu descerei" em amarelo');
    expect(a?.destaques).toEqual(["eu descerei"]);
    expect(a?.cor).toMatch(/amarelo/);
  });

  it("trecho sem aspas", () => {
    expect(interpretarAjuste("destaca a palavra escada")?.destaques).toEqual([
      "escada",
    ]);
    expect(interpretarAjuste("coloca a frase eu descerei em azul")?.destaques).toEqual([
      "eu descerei",
    ]);
  });

  it("trocar um trecho, outra foto, outra cor, outro modelo", () => {
    expect(interpretarAjuste("troca subindo por descendo")).toEqual({
      trocar: { de: "subindo", para: "descendo" },
    });
    expect(interpretarAjuste("troca a foto")).toEqual({ outraFoto: true });
    expect(interpretarAjuste("outra cor")).toEqual({ cor: "outra" });
    expect(interpretarAjuste("muda o modelo")).toEqual({ outroModelo: true });
  });

  it("pedido que precisa de interpretação fica para a IA", () => {
    expect(interpretarAjuste("corrige, faltou o livro no final")).toBeNull();
  });
});

describe("pareceAjuste", () => {
  it("reconhece os verbos de ajuste e ignora o resto", () => {
    for (const m of [
      "corrige o texto",
      "Ajustar texto: Ele é fiel",
      "troca a foto",
      "destaca a palavra escada",
      'coloca "eu descerei" de outra cor',
      "outra foto",
      "texto: Ele é fiel",
    ])
      expect(pareceAjuste(m), m).toBe(true);
    for (const m of ["reunião quinta 15h", "ok", "muito bom", "trocamos de sala"])
      expect(pareceAjuste(m), m).toBe(false);
  });
});

describe("aplicarAjuste", () => {
  const atual = slide("De quem é a {escada} que você está subindo?");
  const semChaves = (t: string) => t.replace(/[{}]/g, "");

  it("texto novo entra na íntegra", () => {
    const r = aplicarAjuste(atual, {
      texto: ESCADA,
      ref: "Livro: O Blueprint de Parach",
    });
    expect(semChaves(r.slide.texto)).toBe(ESCADA);
    expect(r.slide.ref).toBe("Livro: O Blueprint de Parach");
    // o destaque antigo ("escada") continua, porque a palavra ainda está lá
    expect(r.slide.texto).toContain("{escada}");
    expect(r.mudou).toEqual(["o texto", "a referência"]);
    // o que não foi pedido não muda
    expect(r.slide).toMatchObject({ seed: 10, tema: "vinho", modelo: "editorial" });
  });

  it("destaque e cor mudam sem tocar no texto", () => {
    const r = aplicarAjuste(slide(ESCADA), {
      destaques: ["eu descerei"],
      cor: "em azul",
    });
    expect(semChaves(r.slide.texto)).toBe(ESCADA);
    expect(r.slide.texto).toContain('{"eu descerei".}');
    expect(r.slide.tema).toBe("azul");
    expect(r.mudou).toEqual(["o destaque", "a cor"]);
  });

  it("“outra cor” nunca repete a atual", () => {
    for (const sorteio of [0, 0.3, 0.6, 0.99])
      expect(aplicarAjuste(atual, { cor: "outra" }, sorteio).slide.tema).not.toBe(
        "vinho",
      );
  });

  it("amarelo some no fundo claro: vai para o modelo com foto", () => {
    const r = aplicarAjuste(atual, { cor: "amarelo" });
    expect(r.slide).toMatchObject({
      cor: "#F2C230",
      tema: undefined,
      modelo: "cinema",
    });
  });

  it("troca um trecho e deixa o resto", () => {
    const r = aplicarAjuste(atual, { trocar: { de: "você está", para: "estamos" } });
    expect(semChaves(r.slide.texto)).toBe("De quem é a escada que estamos subindo?");
    expect(r.slide.texto).toContain("{escada}");
  });

  it("trecho que não existe: nada muda e o pedido volta em naoAchei", () => {
    const r = aplicarAjuste(atual, { destaques: ["humildade"] });
    expect(r.mudou).toEqual([]);
    expect(r.naoAchei).toEqual(["humildade"]);
    expect(r.slide.texto).toBe(atual.texto);
  });

  it("outra foto troca a semente e mantém o texto", () => {
    const r = aplicarAjuste({ ...atual, modelo: "cinema" }, { outraFoto: true }, 0.5);
    expect(r.slide.seed).not.toBe(10);
    expect(r.slide.texto).toBe(atual.texto);
    expect(r.mudou).toEqual(["a foto"]);
  });
});

describe("leitura das respostas da IA", () => {
  it("cerca do texto: nunca traz o texto de volta", () => {
    const c = lerCercaDoTexto({
      destaque: "eu descerei",
      prompt: "a ladder",
      legenda: "…",
      texto: "outra frase",
    });
    expect(c).toEqual({ destaque: "eu descerei", prompt: "a ladder", legenda: "…" });
    expect(() => lerCercaDoTexto({})).toThrow();
  });

  it("ajuste: nulos são ignorados; resposta vazia é erro", () => {
    expect(
      lerAjusteDaIA({
        texto: null,
        destaques: ["escada"],
        cor: "azul",
        ref: null,
        outraFoto: false,
      }),
    ).toEqual({ destaques: ["escada"], cor: "azul" });
    expect(() => lerAjusteDaIA({ texto: null, outraFoto: false })).toThrow();
  });
});
