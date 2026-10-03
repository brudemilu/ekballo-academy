import { describe, expect, it } from "vitest";
import {
  escolherFonte,
  horariosDaExecucao,
  JANELA_VETO_HORAS,
  mensagemDoPiloto,
  PILOTO_PADRAO,
  type PilotoConfig,
  podeVetar,
  proximaOcorrencia,
  quandoPorExtenso,
  validarPiloto,
} from "@/lib/piloto";

// =============================================================
// Piloto automático do Instagram (issue #189). A IA publica no
// nome do pastor; a única proteção é ele ter tempo de ver e
// vetar. Então o que se trava aqui é: nada é agendado dentro da
// janela de veto, o piloto não liga sem um WhatsApp para avisar,
// e os horários caem no dia certo em Brasília (o servidor roda
// em UTC).
// =============================================================

const CONFIG: PilotoConfig = {
  ...PILOTO_PADRAO,
  ativo: true,
  curso_id: "c1",
  telefone: "5531999998888",
};

// Domingo 04/10/2026, 20h em Brasília = 23h UTC
const DOMINGO_20H = new Date("2026-10-04T23:00:00Z");

describe("proximaOcorrencia · dia e hora em Brasília", () => {
  it("de domingo 20h, a próxima terça 19h é dali a dois dias", () => {
    expect(proximaOcorrencia(DOMINGO_20H, { dia: 2, hora: 19 })).toBe(
      "2026-10-06T22:00:00.000Z",
    );
  });

  it("o próprio momento, agora, vira a semana seguinte", () => {
    expect(proximaOcorrencia(DOMINGO_20H, { dia: 0, hora: 20 })).toBe(
      "2026-10-11T23:00:00.000Z",
    );
  });

  it("hora tardia em Brasília não escorrega para o dia seguinte", () => {
    // sábado 23h em SP = domingo 02h UTC; tem de continuar sendo sábado
    const iso = proximaOcorrencia(DOMINGO_20H, { dia: 6, hora: 23 });
    expect(iso).toBe("2026-10-11T02:00:00.000Z");
    expect(quandoPorExtenso(iso)).toBe("sábado 10/10 às 23h");
  });

  it("respeita a folga pedida", () => {
    // segunda 08h está a 12h de domingo 20h: com folga de 12h não serve (precisa ser DEPOIS)
    expect(proximaOcorrencia(DOMINGO_20H, { dia: 1, hora: 8 }, 12)).toBe(
      "2026-10-12T11:00:00.000Z",
    );
    expect(proximaOcorrencia(DOMINGO_20H, { dia: 1, hora: 9 }, 12)).toBe(
      "2026-10-05T12:00:00.000Z",
    );
  });
});

describe("horariosDaExecucao · janela de veto", () => {
  it("nada é agendado para antes da janela depois do preparo", () => {
    // carrossel configurado para segunda 06h: só 10h depois do preparo → vai para a outra semana
    const h = horariosDaExecucao(DOMINGO_20H, {
      ...CONFIG,
      carrossel: { dia: 1, hora: 6 },
    });
    const folga = (new Date(h.carrossel).getTime() - DOMINGO_20H.getTime()) / 3_600_000;
    expect(folga).toBeGreaterThan(JANELA_VETO_HORAS);
    expect(h.carrossel).toBe("2026-10-12T09:00:00.000Z");
  });

  it("com a configuração padrão: terça e quinta, às 19h", () => {
    expect(horariosDaExecucao(DOMINGO_20H, CONFIG)).toEqual({
      carrossel: "2026-10-06T22:00:00.000Z",
      reel: "2026-10-08T22:00:00.000Z",
    });
  });
});

describe("validarPiloto", () => {
  const corpo = {
    ativo: true,
    fontes: ["livro", "devocional", "tiktok"],
    curso_id: "c1",
    preparo: { dia: 0, hora: 20 },
    carrossel: { dia: 2, hora: 19 },
    reel: { dia: 4, hora: 19 },
    pecas: { carrossel: true, reel_ia: false, roteiro: true },
    telefone: "+55 (31) 99999-8888",
  };

  it("aceita, limpa o telefone e ignora fonte desconhecida", () => {
    const r = validarPiloto(corpo);
    expect(r.ok).toBe(true);
    if (r.ok) {
      expect(r.valor.telefone).toBe("5531999998888");
      expect(r.valor.fontes).toEqual(["livro", "devocional"]);
    }
  });

  it("não liga sem WhatsApp: sem aviso não existe veto", () => {
    const r = validarPiloto({ ...corpo, telefone: "999" });
    expect(r).toEqual({
      ok: false,
      erro: "Informe o WhatsApp que recebe o aviso, com DDI e DDD (ex.: 5531999998888).",
    });
  });

  it("não liga sem fonte ou sem peça", () => {
    expect(validarPiloto({ ...corpo, fontes: [] }).ok).toBe(false);
    expect(validarPiloto({ ...corpo, pecas: {} }).ok).toBe(false);
  });

  it("desligado, salva mesmo incompleto", () => {
    expect(validarPiloto({ ...corpo, ativo: false, telefone: "", fontes: [] }).ok).toBe(
      true,
    );
  });

  it("recusa dia ou hora fora da faixa", () => {
    expect(validarPiloto({ ...corpo, carrossel: { dia: 7, hora: 19 } }).ok).toBe(false);
    expect(validarPiloto({ ...corpo, reel: { dia: 4, hora: 24 } }).ok).toBe(false);
  });
});

describe("escolherFonte", () => {
  const tudo = { pregacaoNova: true, proximaMesa: true, devocional: true };

  it("pregação nova sempre ganha", () => {
    expect(escolherFonte(CONFIG, tudo)).toBe("pregacao");
  });

  it("sem pregação nova, alterna livro e devocional", () => {
    const sem = { ...tudo, pregacaoNova: false };
    expect(escolherFonte({ ...CONFIG, ultima_fonte: null }, sem)).toBe("livro");
    expect(escolherFonte({ ...CONFIG, ultima_fonte: "livro" }, sem)).toBe("devocional");
    expect(escolherFonte({ ...CONFIG, ultima_fonte: "devocional" }, sem)).toBe("livro");
  });

  it("fonte desligada ou sem material não entra", () => {
    expect(escolherFonte({ ...CONFIG, fontes: ["devocional"] }, tudo)).toBe(
      "devocional",
    );
    expect(
      escolherFonte({ ...CONFIG, curso_id: null }, { ...tudo, pregacaoNova: false }),
    ).toBe("devocional");
    expect(
      escolherFonte(CONFIG, {
        pregacaoNova: false,
        proximaMesa: false,
        devocional: false,
      }),
    ).toBeNull();
  });
});

describe("mensagemDoPiloto e veto", () => {
  const pecas = [
    {
      tipo: "carrossel" as const,
      titulo: "Pense menos em você",
      quando: "2026-10-06T22:00:00.000Z",
      estado: "agendado" as const,
    },
    {
      tipo: "roteiro" as const,
      titulo: "A liberdade de se esquecer",
      quando: null,
      estado: "pronto" as const,
    },
    {
      tipo: "reel_ia" as const,
      titulo: "",
      quando: null,
      estado: "falhou" as const,
      detalhe: "cota de voz",
    },
  ];

  it("diz o que vai ao ar, o que espera o pastor e o que falhou", () => {
    const msg = mensagemDoPiloto(
      { fonte: { tipo: "livro", titulo: "Ego Transformado · Mesa 02" }, pecas },
      "https://x/piloto",
    );
    expect(msg).toContain("a partir de o livro: _Ego Transformado · Mesa 02_");
    expect(msg).toContain("• Carrossel — terça 06/10 às 19h\n  Pense menos em você");
    expect(msg).toContain("*Esperando você:*\n• Roteiro para você gravar");
    expect(msg).toContain("• Reel (feito pela IA) (cota de voz)");
    expect(msg).toContain("não precisa fazer nada");
    expect(msg.endsWith("https://x/piloto")).toBe(true);
  });

  it("só dá para vetar o que está agendado e ainda não chegou a hora", () => {
    const antes = new Date("2026-10-06T21:00:00Z");
    const depois = new Date("2026-10-06T23:00:00Z");
    expect(podeVetar(pecas[0], antes)).toBe(true);
    expect(podeVetar(pecas[0], depois)).toBe(false);
    expect(podeVetar(pecas[1], antes)).toBe(false);
    expect(podeVetar({ ...pecas[0], estado: "vetado" }, antes)).toBe(false);
  });
});
