import { describe, expect, it } from "vitest";
import {
  acoesDoDia,
  constancia,
  destaques,
  type EstadoDoCopiloto,
  indicadores,
  type PostPainel,
  postsNaJanela,
} from "@/lib/painel";

// =============================================================
// Painel do Instagram (issue #189). Um painel perde a confiança
// no primeiro número que não bate. O que se trava aqui: não
// mostrar variação em cima de um post só, medir "fora da curva"
// contra o normal do PRÓPRIO perfil, e a ordem das ações do dia
// (o que está quebrado vem antes do que é melhoria).
// =============================================================

const HOJE = "2026-10-03"; // sábado

function post(
  diasAtras: number,
  interacoes: number,
  extra: Partial<PostPainel> = {},
): PostPainel {
  const d = new Date(Date.UTC(2026, 9, 3 - diasAtras, 15, 0, 0)); // 12h em SP
  return {
    id: `p${diasAtras}-${interacoes}`,
    caption: "Legenda de tamanho comum para o perfil.",
    mediaType: "IMAGE",
    timestamp: d.toISOString(),
    likes: interacoes,
    comments: 0,
    reach: null,
    permalink: "",
    interacoes,
    ...extra,
  };
}

describe("postsNaJanela", () => {
  it("inclui hoje e o 90º dia, e deixa de fora o 91º", () => {
    const l = [post(0, 1), post(89, 1), post(90, 1)];
    expect(postsNaJanela(l, HOJE).map((p) => p.id)).toEqual(["p0-1", "p89-1"]);
  });

  it("conta o dia em São Paulo, não em UTC", () => {
    // 01h UTC do dia 4 ainda é 22h do dia 3 em SP: entra como "hoje"
    const tarde = post(0, 5, { id: "noite", timestamp: "2026-10-04T01:00:00Z" });
    expect(postsNaJanela([tarde], HOJE)).toHaveLength(1);
  });
});

describe("indicadores · 45 dias contra os 45 anteriores", () => {
  it("soma, tira a média e compara as duas metades", () => {
    const l = [
      post(1, 30),
      post(10, 50),
      post(20, 40),
      post(50, 20),
      post(60, 20),
      post(70, 20),
    ];
    const [publicados, interacoes, porPost, alcance] = indicadores(l, HOJE);
    expect(publicados).toEqual({ rotulo: "Posts publicados", valor: 6, variacao: 0 });
    expect(interacoes.valor).toBe(180);
    expect(interacoes.variacao).toBe(100); // 120 contra 60
    expect(porPost.valor).toBe(30);
    expect(alcance.valor).toBeNull(); // o Instagram não liberou alcance
  });

  it("não mostra variação com menos de três posts em alguma das metades", () => {
    const l = [post(1, 300), post(2, 300), post(3, 300), post(60, 10), post(70, 10)];
    expect(indicadores(l, HOJE)[1].variacao).toBeNull();
  });

  it("perfil sem post nenhum não quebra", () => {
    const [publicados, , porPost] = indicadores([], HOJE);
    expect(publicados.valor).toBe(0);
    expect(porPost.valor).toBeNull();
  });

  it("usa o alcance quando ele existe", () => {
    const l = [post(1, 10, { reach: 400 }), post(2, 10, { reach: 600 })];
    expect(indicadores(l, HOJE)[3].valor).toBe(500);
  });
});

describe("constancia · posts por semana", () => {
  it("devolve as 12 semanas, da mais antiga à atual, com zero onde não houve post", () => {
    const semanas = constancia([post(0, 1), post(1, 1), post(8, 1)], HOJE);
    expect(semanas).toHaveLength(12);
    expect(semanas[11]).toEqual({ segunda: "2026-09-28", posts: 2 }); // sábado 3 e sexta 2
    expect(semanas[10]).toEqual({ segunda: "2026-09-21", posts: 1 });
    expect(semanas[0].posts).toBe(0);
  });
});

describe("destaques · fora da curva do próprio perfil", () => {
  const base = [post(5, 20), post(10, 22), post(15, 18), post(20, 20)];

  it("com menos de quatro posts não há 'normal' para comparar", () => {
    expect(destaques([post(1, 500), post(2, 10), post(3, 10)], HOJE)).toEqual([]);
  });

  it("aponta o post que passou de 1,5× a mediana e diz o que ele tinha de diferente", () => {
    const fora = post(2, 60, {
      id: "fora",
      mediaType: "CAROUSEL_ALBUM",
      caption: "Quem senta à sua mesa?",
      likes: 40,
      comments: 20,
    });
    const [d, ...resto] = destaques([...base, fora], HOJE);
    expect(resto).toEqual([]);
    expect(d.post.id).toBe("fora");
    expect(d.vezes).toBe(3); // 60 contra mediana 20
    expect(d.porque).toContain("Carrossel, formato que você usa pouco");
    expect(d.porque).toContain("Legenda bem mais curta que o seu normal");
    expect(d.porque).toContain("A legenda faz uma pergunta");
    expect(d.porque).toContain(
      "Gerou conversa: muitos comentários em relação às curtidas",
    );
    expect(d.porque.some((f) => f.startsWith("Saiu quinta"))).toBe(true);
  });

  it("perfil estável não inventa destaque", () => {
    expect(destaques(base, HOJE)).toEqual([]);
  });
});

describe("acoesDoDia · até três, da mais urgente à menos", () => {
  // HOJE fica a 9 dias do Dia das Crianças. Com esta ideia no calendário, a
  // data está coberta e não vira ação — os testes abaixo olham as outras regras.
  const DIA_DAS_CRIANCAS = {
    titulo: "Fé que se ensina a uma criança",
    formato: "carrossel",
    data_planejada: "2026-10-12",
    carrossel_id: null,
  };
  const vazio: EstadoDoCopiloto = {
    hoje: HOJE,
    posts: [post(1, 10)],
    salvos: [],
    ideias: [
      {
        titulo: "Qualquer",
        formato: "carrossel",
        data_planejada: "2026-10-04",
        carrossel_id: null,
      },
      DIA_DAS_CRIANCAS,
    ],
    perfil: { feitos: 4, total: 4 },
  };

  it("com tudo em dia, nada a fazer", () => {
    // a ideia é para amanhã, mas é só ideia: não há peça pronta esperando
    expect(acoesDoDia(vazio)).toEqual([]);
  });

  it("post com erro vem antes de tudo", () => {
    const a = acoesDoDia({
      ...vazio,
      salvos: [{ id: "x", status: "erro" }],
      perfil: { feitos: 1, total: 4 },
    });
    expect(a.map((x) => x.chave)).toEqual(["erro", "perfil"]);
  });

  it("peças prontas que vencem até amanhã viram ação, com o dia por extenso", () => {
    const a = acoesDoDia({
      ...vazio,
      salvos: [{ id: "c1", status: "rascunho" }],
      ideias: [
        {
          titulo: "Carrossel da mesa",
          formato: "carrossel",
          data_planejada: HOJE,
          carrossel_id: "c1",
        },
        {
          titulo: "Reel da mesa",
          formato: "roteiro",
          data_planejada: "2026-10-04",
          carrossel_id: null,
          roteiro_id: "r1",
        },
        {
          titulo: "Pergunta",
          formato: "story",
          data_planejada: "2026-10-02",
          carrossel_id: null,
        },
        {
          titulo: "Longe",
          formato: "roteiro",
          data_planejada: "2026-10-20",
          carrossel_id: null,
          roteiro_id: "r2",
        },
      ],
    });
    expect(a.map((x) => x.chave)).toEqual(["agendar", "gravar", "story"]);
    expect(a[0].detalhe).toContain("é hoje");
    expect(a[1].detalhe).toContain("é amanhã");
    expect(a[1].href).toBe("/admin/instagram?aba=roteiros&roteiro=r1");
    expect(a[2].detalhe).toContain("ontem");
  });

  it("rascunho já agendado não pede para agendar de novo", () => {
    const a = acoesDoDia({
      ...vazio,
      salvos: [{ id: "c1", status: "agendado" }],
      ideias: [
        {
          titulo: "Carrossel",
          formato: "carrossel",
          data_planejada: HOJE,
          carrossel_id: "c1",
        },
        DIA_DAS_CRIANCAS,
      ],
    });
    expect(a).toEqual([]);
  });

  it("semana sem nada planejado e perfil parado há dias", () => {
    const a = acoesDoDia({
      ...vazio,
      ideias: [DIA_DAS_CRIANCAS],
      posts: [post(9, 10)],
    });
    expect(a.map((x) => x.chave)).toEqual(["semana", "parado"]);
    expect(a[1].titulo).toBe("Faz 9 dias que o perfil não posta");
  });

  it("data do calendário cristão chegando sem nada planejado vira ação", () => {
    const a = acoesDoDia({ ...vazio, ideias: [vazio.ideias[0]] });
    expect(a.map((x) => x.chave)).toEqual(["data"]);
    expect(a[0].titulo).toBe("Dia das Crianças é daqui a 9 dias");
    // O botão abre o calendário já na semana da data.
    expect(a[0].href).toContain("semana=2026-10-12");
  });

  it("data longe demais ainda não é assunto", () => {
    // Em 1º de julho a próxima data (Dia dos Pais, 9 de agosto) está a mais de um mês.
    const a = acoesDoDia({
      ...vazio,
      hoje: "2026-07-01",
      posts: [],
      ideias: [
        {
          titulo: "Qualquer",
          formato: "carrossel",
          data_planejada: "2026-07-02",
          carrossel_id: null,
        },
      ],
    });
    expect(a).toEqual([]);
  });

  it("nunca passa de três", () => {
    const a = acoesDoDia({
      hoje: HOJE,
      posts: [post(20, 1)],
      salvos: [{ id: "e", status: "erro" }],
      ideias: [],
      perfil: { feitos: 0, total: 4 },
    });
    expect(a.map((x) => x.chave)).toEqual(["erro", "data", "semana"]);
  });
});
