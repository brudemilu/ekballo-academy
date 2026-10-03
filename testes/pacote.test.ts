import { describe, expect, it } from "vitest";
import {
  diasSugeridos,
  normalizarPacote,
  storyEmTexto,
  systemPacote,
  usuarioPacote,
  validarDias,
} from "@/lib/pacote";

// =============================================================
// Pacote da semana (issue #189): uma fonte vira carrossel,
// roteiro e story, cada um no seu dia. O que não pode acontecer:
// sugerir "hoje" (não sobra tempo de revisar), aceitar um
// carrossel de um slide só como se fosse um pacote, e virar
// enquete uma resposta com três opções.
// =============================================================

describe("diasSugeridos · segunda, quarta e sexta", () => {
  it("numa sexta, sugere a semana seguinte", () => {
    // 2026-10-02 é sexta
    expect(diasSugeridos("2026-10-02")).toEqual({
      carrossel: "2026-10-05",
      reel: "2026-10-07",
      story: "2026-10-09",
    });
  });

  it("nunca sugere hoje, mesmo sendo segunda", () => {
    // 2026-10-05 é segunda: a segunda sugerida é a da outra semana
    expect(diasSugeridos("2026-10-05").carrossel).toBe("2026-10-12");
  });

  it("num domingo, começa no dia seguinte e atravessa o mês", () => {
    // 2026-11-29 é domingo
    expect(diasSugeridos("2026-11-29")).toEqual({
      carrossel: "2026-11-30",
      reel: "2026-12-02",
      story: "2026-12-04",
    });
  });
});

describe("validarDias", () => {
  it("aceita os três dias", () => {
    const d = { carrossel: "2026-10-05", reel: "2026-10-07", story: "2026-10-09" };
    expect(validarDias(d)).toEqual(d);
  });

  it("recusa dia faltando, formato errado ou data que não existe", () => {
    expect(validarDias({ carrossel: "2026-10-05", reel: "2026-10-07" })).toBe(
      "Escolha o dia de cada peça.",
    );
    expect(
      validarDias({ carrossel: "05/10/2026", reel: "2026-10-07", story: "2026-10-09" }),
    ).toBe("Escolha o dia de cada peça.");
    expect(
      validarDias({ carrossel: "2026-02-31", reel: "2026-10-07", story: "2026-10-09" }),
    ).toBe("Escolha o dia de cada peça.");
    expect(validarDias(null)).toBe("Escolha o dia de cada peça.");
  });
});

describe("pedido à IA", () => {
  it("leva a regra de fidelidade e, quando há, o perfil", () => {
    expect(systemPacote("")).toContain("SOMENTE as ideias que estão na FONTE");
    expect(systemPacote("")).not.toContain("QUEM ESTÁ FALANDO");
    expect(systemPacote("VOZ: pastoral")).toContain("QUEM ESTÁ FALANDO\nVOZ: pastoral");
  });

  it("o foco fica preso ao que a fonte diz", () => {
    expect(
      usuarioPacote({ tipo: "livre", titulo: "Texto", texto: "corpo" }, "descanso"),
    ).toContain("(dentro do que a fonte diz): descanso");
  });
});

const RESPOSTA = {
  tema: "Pensar menos em si",
  carrossel: {
    slides: [
      { texto: "Pense menos em {você}", prompt: "a feather", modo: "circulo" },
      { texto: "A {liberdade} de esquecer", prompt: "open window", modo: "neon" },
      { texto: "   ", prompt: "vazio", modo: "grifo" },
    ],
    legenda: "Legenda. #discipulado",
  },
  story: {
    texto: "Sobre provar o próprio valor.",
    pergunta: "Onde você mais tenta se provar?",
    opcoes: ["Trabalho", "Igreja"],
  },
};

describe("normalizarPacote · funil da resposta da IA", () => {
  it("descarta slide vazio e corrige modo desconhecido", () => {
    const p = normalizarPacote(JSON.stringify(RESPOSTA));
    expect(p.carrossel.slides).toEqual([
      { texto: "Pense menos em {você}", prompt: "a feather", modo: "circulo" },
      { texto: "A {liberdade} de esquecer", prompt: "open window", modo: "circulo" },
    ]);
    expect(p.story.opcoes).toEqual(["Trabalho", "Igreja"]);
  });

  it("enquete só com exatamente duas opções; o resto vira caixinha aberta", () => {
    const tres = { ...RESPOSTA, story: { ...RESPOSTA.story, opcoes: ["a", "b", "c"] } };
    expect(normalizarPacote(JSON.stringify(tres)).story.opcoes).toEqual([]);
  });

  it("carrossel com menos de dois slides não é pacote", () => {
    const um = {
      ...RESPOSTA,
      carrossel: { slides: [RESPOSTA.carrossel.slides[0]], legenda: "" },
    };
    expect(() => normalizarPacote(JSON.stringify(um))).toThrow(
      /carrossel aproveitável/,
    );
    expect(() => normalizarPacote("não consegui")).toThrow(/legível/);
  });
});

describe("storyEmTexto · nota da ideia no calendário", () => {
  it("enquete lista as duas opções", () => {
    expect(storyEmTexto(RESPOSTA.story)).toBe(
      "Sobre provar o próprio valor.\nPergunta: Onde você mais tenta se provar?\nEnquete: Trabalho / Igreja",
    );
  });

  it("sem opções vira caixinha aberta", () => {
    expect(storyEmTexto({ texto: "", pergunta: "O que te cansa?", opcoes: [] })).toBe(
      "Pergunta: O que te cansa?\nCaixinha aberta",
    );
  });
});
