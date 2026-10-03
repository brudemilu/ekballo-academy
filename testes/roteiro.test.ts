import { describe, expect, it } from "vitest";
import {
  contarPalavras,
  duracaoValida,
  limparFonte,
  normalizarRoteiro,
  palavrasFaladas,
  recortarFonte,
  roteiroEmTexto,
  situacaoDoTamanho,
  systemRoteiro,
  usarGancho,
  usuarioRoteiro,
} from "@/lib/roteiro";

// =============================================================
// Roteiro de vídeo do copiloto (issue #189). O risco maior num
// ministério é a IA pôr na boca do pastor algo que a fonte não
// diz. O código não consegue provar fidelidade, mas garante o
// que está ao alcance: a regra vai no pedido, a fonte não é
// cortada no meio de uma frase e uma resposta torta não vira
// roteiro.
// =============================================================

const RESPOSTA = {
  titulo: "Pense menos em você",
  ganchos: [
    "Você vive cansado de provar o seu valor?",
    "E se a paz fosse pensar menos em você?",
  ],
  blocos: [
    {
      momento: "gancho",
      tempo: "0–3s",
      falar: "Você vive cansado de provar o seu valor?",
      tela: "Cansado?",
      mostrar: "Rosto",
    },
    {
      momento: "corpo",
      tempo: "3–25s",
      falar: "O ego humilde pensa menos em si mesmo.",
      tela: "",
      mostrar: "Bíblia aberta",
    },
    {
      momento: "chamada",
      tempo: "25–30s",
      falar: "Comente o que isso muda hoje.",
      tela: "Comente",
      mostrar: "Rosto",
    },
  ],
  legenda: "Uma legenda. #discipulado",
  base: ["O ego humilde não pensa mais de si mesmo nem menos de si mesmo"],
};

describe("durações e tamanho", () => {
  it("só aceita as quatro durações", () => {
    expect(duracaoValida(30)).toBe(true);
    expect(duracaoValida(45)).toBe(false);
    expect(duracaoValida("30")).toBe(false);
  });

  it("conta palavras e soma só a coluna falar", () => {
    expect(contarPalavras("  uma   duas\ntrês ")).toBe(3);
    expect(contarPalavras("")).toBe(0);
    const r = normalizarRoteiro(RESPOSTA);
    expect(palavrasFaladas(r)).toBe(8 + 8 + 6);
  });

  it("avisa quando o roteiro não cabe na duração, com folga de 15%", () => {
    expect(situacaoDoTamanho(75, 30)).toBe("ok");
    expect(situacaoDoTamanho(90, 30)).toBe("ok"); // 80 × 1,15 = 92
    expect(situacaoDoTamanho(100, 30)).toBe("longo");
    expect(situacaoDoTamanho(50, 30)).toBe("curto");
  });
});

describe("fonte", () => {
  it("tira HTML preservando os parágrafos", () => {
    expect(
      limparFonte(
        "<p>Um&nbsp;parágrafo.</p><p>Outro <b>aqui</b>.</p><script>x()</script>",
      ),
    ).toBe("Um parágrafo.\n\nOutro aqui .");
  });

  it("fonte dentro do limite passa inteira", () => {
    expect(recortarFonte("Texto curto.", 100)).toEqual({
      texto: "Texto curto.",
      cortado: false,
    });
  });

  it("corta no fim de um parágrafo, nunca no meio da frase", () => {
    const p1 = `${"Primeira frase do parágrafo. ".repeat(4).trim()}`;
    const p2 = `${"Segunda parte que vai ficar de fora. ".repeat(6).trim()}`;
    const r = recortarFonte(`${p1}\n\n${p2}`, p1.length + 30);
    expect(r.cortado).toBe(true);
    expect(r.texto).toBe(p1);
  });

  it("sem quebra de parágrafo, corta no fim de uma frase", () => {
    const texto =
      "Uma frase inteira aqui. Outra frase inteira aqui. E mais uma que estoura o limite do corte.";
    const r = recortarFonte(texto, 60);
    expect(r.cortado).toBe(true);
    expect(r.texto.endsWith(".")).toBe(true);
    expect(texto.startsWith(r.texto)).toBe(true);
  });
});

describe("pedido à IA", () => {
  it("leva a regra de fidelidade e a faixa de palavras da duração", () => {
    const s = systemRoteiro(60, "");
    expect(s).toContain("SOMENTE as ideias que estão na FONTE");
    expect(s).toContain("Não invente citação bíblica");
    expect(s).toContain("entre 140 e 150 palavras");
    expect(s).toContain("NÃO prometa link, material, grupo nem resposta");
    expect(s).not.toContain("QUEM ESTÁ FALANDO");
  });

  it("inclui o perfil quando há", () => {
    expect(systemRoteiro(30, "OBJETIVO DO PERFIL: levar para a mesa")).toContain(
      "QUEM ESTÁ FALANDO\nOBJETIVO DO PERFIL: levar para a mesa",
    );
  });

  it("o foco do pastor fica preso ao que a fonte diz", () => {
    const u = usuarioRoteiro(
      { tipo: "mesa", titulo: "Ego · Mesa 02", autor: "Keller", texto: "corpo" },
      " descanso ",
    );
    expect(u).toContain("FONTE: Ego · Mesa 02\nAUTOR: Keller");
    expect(u).toContain("(dentro do que a fonte diz): descanso");
  });
});

describe("normalizarRoteiro · funil da resposta da IA", () => {
  it("aceita a resposta dentro de cerca de código", () => {
    const r = normalizarRoteiro(`\`\`\`json\n${JSON.stringify(RESPOSTA)}\n\`\`\``);
    expect(r.blocos).toHaveLength(3);
    expect(r.base).toHaveLength(1);
  });

  it("descarta bloco sem fala e corrige momento desconhecido", () => {
    const r = normalizarRoteiro({
      blocos: [
        { momento: "intro", falar: "Abertura" },
        { momento: "corpo", falar: "   " },
      ],
    });
    expect(r.blocos).toEqual([
      { momento: "corpo", tempo: "", falar: "Abertura", tela: "", mostrar: "" },
    ]);
    expect(r.titulo).toBe("Roteiro sem título");
  });

  it("a abertura em uso é sempre a primeira opção de gancho", () => {
    const r = normalizarRoteiro({ ...RESPOSTA, ganchos: ["Outra abertura"] });
    expect(r.ganchos).toEqual([
      "Você vive cansado de provar o seu valor?",
      "Outra abertura",
    ]);
  });

  it("sem bloco aproveitável não há roteiro", () => {
    expect(() => normalizarRoteiro({ blocos: [] })).toThrow(/legível/);
    expect(() => normalizarRoteiro("não consegui gerar")).toThrow(/legível/);
  });
});

describe("usar e exportar", () => {
  it("trocar o gancho muda só o bloco de abertura", () => {
    const r = usarGancho(
      normalizarRoteiro(RESPOSTA),
      "E se a paz fosse pensar menos em você?",
    );
    expect(r.blocos[0].falar).toBe("E se a paz fosse pensar menos em você?");
    expect(r.blocos[1].falar).toBe("O ego humilde pensa menos em si mesmo.");
  });

  it("vira texto corrido para copiar", () => {
    const t = roteiroEmTexto(normalizarRoteiro(RESPOSTA), 30);
    expect(t.startsWith("Pense menos em você (30s)")).toBe(true);
    expect(t).toContain("[0–3s] Você vive cansado de provar o seu valor?");
    expect(t).toContain("   na tela: Cansado?");
    expect(t).toContain("LEGENDA\nUma legenda. #discipulado");
  });
});
