import { describe, expect, it } from "vitest";
import {
  formatarTempo,
  limparSegmentos,
  linkNoTempo,
  normalizarMomentos,
  notaDoCorte,
  type Segmento,
  systemCortes,
  transcricaoParaIA,
  travado,
  trechoFalado,
} from "@/lib/cortes";

// =============================================================
// Cortes de pregação (issue #189). A IA erra tempo com
// facilidade: inventa um minuto que não existe, devolve um
// trecho de 4 segundos, repete o mesmo momento duas vezes. O
// pastor vai abrir o YouTube no minuto que a tela mostrar —
// então nenhum tempo sai daqui sem ser preso ao que a
// transcrição realmente tem.
// =============================================================

/** Transcrição de mentira: um segmento a cada 10 s, até `total` segundos. */
function transcricao(total: number): Segmento[] {
  return Array.from({ length: total / 10 }, (_, k) => ({
    i: k * 10,
    f: k * 10 + 10,
    t: `frase ${k}`,
  }));
}

const SEG = transcricao(600);

function resposta(momentos: object[]): string {
  return JSON.stringify({ momentos });
}

const BASE = {
  titulo: "Um título",
  gancho: "Abre assim",
  porque: "Fecha a ideia",
  legenda: "Legenda #fe",
  nota: 80,
};

describe("formatarTempo e link", () => {
  it("minutos e segundos; hora quando passa de 60 min", () => {
    expect(formatarTempo(0)).toBe("0:00");
    expect(formatarTempo(754)).toBe("12:34");
    expect(formatarTempo(3754)).toBe("1:02:34");
  });

  it("o link abre o vídeo no segundo do corte", () => {
    expect(linkNoTempo("abcdefghijk", 754.8)).toBe(
      "https://www.youtube.com/watch?v=abcdefghijk&t=754s",
    );
  });
});

describe("limparSegmentos · o que o Whisper devolve", () => {
  it("aceita start/end/text, descarta vazios e tempos tortos, ordena", () => {
    const limpos = limparSegmentos([
      { start: 10, end: 20, text: " segundo " },
      { start: 0, end: 10, text: "primeiro" },
      { start: 20, end: 20, text: "duração zero" },
      { start: 30, end: 40, text: "   " },
      { start: "x", end: 50, text: "tempo inválido" },
    ]);
    expect(limpos).toEqual([
      { i: 0, f: 10, t: "primeiro" },
      { i: 10, f: 20, t: "segundo" },
    ]);
    expect(limparSegmentos(null)).toEqual([]);
  });

  it("vai para a IA com o início em segundos inteiros", () => {
    expect(transcricaoParaIA([{ i: 12.7, f: 20, t: "Olá" }])).toBe("[12] Olá");
  });
});

describe("normalizarMomentos · conferência dos tempos", () => {
  it("prende início e fim às fronteiras da transcrição", () => {
    const [m] = normalizarMomentos(resposta([{ ...BASE, inicio: 103, fim: 158 }]), SEG);
    expect(m.inicio).toBe(100);
    expect(m.fim).toBe(160);
  });

  it("descarta trecho curto demais, tempo fora do vídeo e fim antes do início", () => {
    const r = resposta([
      { ...BASE, titulo: "curto", inicio: 100, fim: 110 },
      { ...BASE, titulo: "fora", inicio: 5000, fim: 5060 },
      { ...BASE, titulo: "invertido", inicio: 200, fim: 150 },
      { ...BASE, titulo: "bom", inicio: 300, fim: 350 },
    ]);
    expect(normalizarMomentos(r, SEG).map((m) => m.titulo)).toEqual(["bom"]);
  });

  it("trecho longo demais é encurtado até a última fronteira que cabe em 90 s", () => {
    const [m] = normalizarMomentos(resposta([{ ...BASE, inicio: 100, fim: 400 }]), SEG);
    expect(m.inicio).toBe(100);
    expect(m.fim).toBe(190);
  });

  it("fim além do vídeo é cortado no último segundo que existe", () => {
    const [m] = normalizarMomentos(resposta([{ ...BASE, inicio: 550, fim: 900 }]), SEG);
    expect(m.fim).toBe(600);
  });

  it("ordena pela nota e descarta quem repete mais da metade de um melhor", () => {
    const r = resposta([
      { ...BASE, titulo: "repetido", inicio: 110, fim: 160, nota: 70 },
      { ...BASE, titulo: "melhor", inicio: 100, fim: 160, nota: 95 },
      { ...BASE, titulo: "vizinho", inicio: 150, fim: 210, nota: 80 },
    ]);
    // "vizinho" divide só 10 s com "melhor": fica. "repetido" está inteiro dentro dele: sai.
    expect(normalizarMomentos(r, SEG).map((m) => m.titulo)).toEqual([
      "melhor",
      "vizinho",
    ]);
  });

  it("nota fora da faixa é limitada; sem título o momento não entra", () => {
    const r = resposta([
      { ...BASE, inicio: 100, fim: 150, nota: 400 },
      { ...BASE, titulo: "", inicio: 300, fim: 350 },
    ]);
    const lista = normalizarMomentos(r, SEG);
    expect(lista).toHaveLength(1);
    expect(lista[0].nota).toBe(100);
  });

  it("aceita a resposta dentro de cerca de código", () => {
    const r = `\`\`\`json\n${resposta([{ ...BASE, inicio: 100, fim: 150 }])}\n\`\`\``;
    expect(normalizarMomentos(r, SEG)).toHaveLength(1);
  });

  it("sem nenhum momento válido, avisa em vez de mostrar lista vazia", () => {
    expect(() =>
      normalizarMomentos(resposta([{ ...BASE, inicio: 1, fim: 5 }]), SEG),
    ).toThrow(/sustente sozinho/);
    expect(() => normalizarMomentos("não achei nada", SEG)).toThrow(/legível/);
    expect(() => normalizarMomentos(resposta([]), [])).toThrow(/vazia/);
  });
});

describe("trechoFalado e nota do calendário", () => {
  it("junta o que é dito entre os dois tempos", () => {
    expect(trechoFalado(SEG, 100, 130)).toBe("frase 10 frase 11 frase 12");
  });

  it("a nota leva o intervalo, o link e a legenda", () => {
    const [m] = normalizarMomentos(resposta([{ ...BASE, inicio: 100, fim: 150 }]), SEG);
    const nota = notaDoCorte(m, "Pregação de domingo", "https://youtu.be/x");
    expect(nota).toContain("Corte de 1:40 a 2:30 (50s) — Pregação de domingo");
    expect(nota).toContain("https://youtu.be/x");
    expect(nota).toContain("Abre com: Abre assim");
    expect(nota).toContain("Legenda:\nLegenda #fe");
  });
});

describe("pedido à IA e trabalho travado", () => {
  it("o pedido exige trecho que funciona sozinho e tempo copiado da transcrição", () => {
    const s = systemCortes("");
    expect(s).toContain("Funciona SOZINHO");
    expect(s).toContain("Não invente tempo que não está na transcrição");
    expect(s).toContain("de 20 a 90 segundos");
    expect(systemCortes("VOZ: pastoral")).toContain("QUEM ESTÁ FALANDO\nVOZ: pastoral");
  });

  it("análise processando há mais de 15 minutos é tratada como interrompida", () => {
    const agora = Date.parse("2026-10-03T12:00:00Z");
    expect(
      travado({ status: "processando", criado_em: "2026-10-03T11:40:00Z" }, agora),
    ).toBe(true);
    expect(
      travado({ status: "processando", criado_em: "2026-10-03T11:55:00Z" }, agora),
    ).toBe(false);
    expect(
      travado({ status: "pronto", criado_em: "2026-10-03T08:00:00Z" }, agora),
    ).toBe(false);
  });
});
