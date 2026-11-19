import { describe, expect, it } from "vitest";
import {
  arrumarNome,
  destaques,
  domDaPergunta,
  FAIXAS_DOM,
  FAIXAS_VIDA,
  faixaDe,
  lerIdade,
  MAX_DOM,
  MAX_VIDA,
  mesmaPessoa,
  montarResultado,
  nivelDaFaixa,
  pontuar,
  QTD_VIDA,
  TOTAL_PERGUNTAS,
  validarRespostas,
} from "@/lib/dons";

const zeros = () => Array<number>(TOTAL_PERGUNTAS).fill(0);
/** Marca o valor na pergunta N (1–150) da parte de dons. */
const naPerguntaDeDom = (n: number, valor: number) => {
  const r = zeros();
  r[QTD_VIDA + n - 1] = valor;
  return r;
};

describe("estrutura do teste", () => {
  it("tem 10 perguntas de vida ministerial e 150 de dons", () => {
    expect(TOTAL_PERGUNTAS).toBe(160);
    expect(MAX_VIDA).toBe(40);
    expect(MAX_DOM).toBe(120);
  });

  it("as perguntas giram em ciclo de cinco dons", () => {
    expect(domDaPergunta(1)).toBe("apostolo");
    expect(domDaPergunta(2)).toBe("profeta");
    expect(domDaPergunta(3)).toBe("pastor");
    expect(domDaPergunta(4)).toBe("mestre");
    expect(domDaPergunta(5)).toBe("evangelista");
    expect(domDaPergunta(6)).toBe("apostolo");
    expect(domDaPergunta(150)).toBe("evangelista");
  });
});

describe("pontuação", () => {
  it("tudo 'sempre' dá o máximo em tudo", () => {
    const p = pontuar(Array(TOTAL_PERGUNTAS).fill(4));
    expect(p.vida).toBe(40);
    expect(Object.values(p.dons)).toEqual([120, 120, 120, 120, 120]);
  });

  it("a pergunta 146 conta para Apóstolo (a planilha antiga errava aqui)", () => {
    expect(pontuar(naPerguntaDeDom(146, 4)).dons.apostolo).toBe(4);
  });

  it("a pergunta 148 conta para Pastor, não para Apóstolo", () => {
    const p = pontuar(naPerguntaDeDom(148, 3));
    expect(p.dons.pastor).toBe(3);
    expect(p.dons.apostolo).toBe(0);
  });

  it("vida ministerial soma só as dez primeiras", () => {
    const r = zeros();
    r[0] = 4;
    r[9] = 2;
    r[10] = 4; // primeira de dons
    const p = pontuar(r);
    expect(p.vida).toBe(6);
    expect(p.dons.apostolo).toBe(4);
  });
});

describe("faixas de interpretação", () => {
  it("dom: os limites caem na faixa certa", () => {
    expect(faixaDe(45, FAIXAS_DOM).min).toBe(0);
    expect(faixaDe(46, FAIXAS_DOM).min).toBe(46);
    expect(faixaDe(105, FAIXAS_DOM).min).toBe(86);
    expect(faixaDe(106, FAIXAS_DOM).texto).toMatch(/chamado específico/);
    expect(faixaDe(120, FAIXAS_DOM).max).toBe(120);
  });

  it("vida ministerial: os limites caem na faixa certa", () => {
    expect(faixaDe(10, FAIXAS_VIDA).texto).toMatch(/ajuda urgente/);
    expect(faixaDe(11, FAIXAS_VIDA).min).toBe(11);
    expect(faixaDe(35, FAIXAS_VIDA).min).toBe(31);
    expect(faixaDe(36, FAIXAS_VIDA).texto).toMatch(/autoridade espiritual/);
  });

  it("valor fora da escala não quebra", () => {
    expect(faixaDe(-3, FAIXAS_DOM).min).toBe(0);
    expect(faixaDe(999, FAIXAS_DOM).max).toBe(120);
    expect(nivelDaFaixa(110, FAIXAS_DOM)).toBe(4);
  });
});

describe("primário e secundário", () => {
  it("o maior é primário e o seguinte é secundário", () => {
    const d = destaques({
      apostolo: 80,
      profeta: 60,
      pastor: 100,
      mestre: 90,
      evangelista: 10,
    });
    expect(d.primarios).toEqual(["pastor"]);
    expect(d.secundarios).toEqual(["mestre"]);
  });

  it("empate no topo: dois primários e nenhum secundário", () => {
    const d = destaques({
      apostolo: 78,
      profeta: 62,
      pastor: 78,
      mestre: 69,
      evangelista: 71,
    });
    expect(d.primarios).toEqual(["apostolo", "pastor"]);
    expect(d.secundarios).toEqual([]);
  });

  it("empate no segundo lugar: dois secundários", () => {
    const d = destaques({
      apostolo: 70,
      profeta: 75,
      pastor: 78,
      mestre: 63,
      evangelista: 75,
    });
    expect(d.secundarios).toEqual(["profeta", "evangelista"]);
  });

  it("tudo igual: todos primários", () => {
    const d = destaques({
      apostolo: 0,
      profeta: 0,
      pastor: 0,
      mestre: 0,
      evangelista: 0,
    });
    expect(d.primarios).toHaveLength(5);
    expect(d.secundarios).toEqual([]);
  });
});

describe("resultado exibido", () => {
  it("traz pontos, faixa e nomes legíveis", () => {
    const r = montarResultado({
      vida: 33,
      dons: { apostolo: 50, profeta: 40, pastor: 110, mestre: 90, evangelista: 20 },
    });
    expect(r.vida.faixa).toMatch(/capacidade espiritual adequada/);
    expect(r.primarios).toEqual(["Pastor"]);
    expect(r.secundarios).toEqual(["Mestre"]);
    expect(r.dons.map((d) => d.nome)).toEqual([
      "Apóstolo",
      "Profeta",
      "Pastor",
      "Mestre",
      "Evangelista",
    ]);
    expect(r.dons[2].faixa).toMatch(/ofício/);
    expect(r.versao).toBeTruthy();
  });
});

describe("validação do que vem do navegador", () => {
  it("aceita 160 inteiros de 0 a 4", () => {
    expect(validarRespostas(zeros())).toHaveLength(160);
  });

  it("recusa tamanho errado, fora da escala, fração e texto", () => {
    expect(validarRespostas(zeros().slice(1))).toBeNull();
    expect(validarRespostas([...zeros().slice(1), 5])).toBeNull();
    expect(validarRespostas([...zeros().slice(1), -1])).toBeNull();
    expect(validarRespostas([...zeros().slice(1), 2.5])).toBeNull();
    expect(validarRespostas([...zeros().slice(1), "4"])).toBeNull();
    expect(validarRespostas("tudo 4")).toBeNull();
    expect(validarRespostas(null)).toBeNull();
  });
});

describe("identificação de quem responde", () => {
  it("mesmo telefone e mesmo primeiro nome é a mesma pessoa", () => {
    expect(
      mesmaPessoa(
        { nome: "Beatriz Moreira Lima", telefone: "5531900000001" },
        { nome: "beatriz lima", telefone: "5531900000001" },
      ),
    ).toBe(true);
  });

  it("casal com o mesmo telefone continua sendo duas pessoas", () => {
    expect(
      mesmaPessoa(
        { nome: "Paula Silva", telefone: "5531900000002" },
        { nome: "Paulo Silva", telefone: "5531900000002" },
      ),
    ).toBe(false);
  });

  it("sem telefone não junta ninguém", () => {
    expect(
      mesmaPessoa({ nome: "Ana", telefone: null }, { nome: "Ana", telefone: null }),
    ).toBe(false);
  });

  it("acento não separa a mesma pessoa", () => {
    expect(
      mesmaPessoa(
        { nome: "Márcia", telefone: "5531900000003" },
        { nome: "Marcia Souza", telefone: "5531900000003" },
      ),
    ).toBe(true);
  });

  it("arruma maiúsculas e espaços do nome", () => {
    expect(arrumarNome("  joana   machado DE souza da silva ")).toBe(
      "Joana Machado de Souza da Silva",
    );
  });

  it("lê idade digitada de qualquer jeito", () => {
    expect(lerIdade("51 anos ")).toBe(51);
    expect(lerIdade(37)).toBe(37);
    expect(lerIdade("")).toBeNull();
    expect(lerIdade("300")).toBeNull();
  });
});
