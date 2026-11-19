// =============================================================
// EKBALLO ACADEMY · Teste de Dons Ministeriais (Efésios 4.11)
//
// Lógica pura: escala, pontuação, faixas de interpretação e o
// "retrato" do resultado que a pessoa vê ao terminar. Sem banco,
// sem rede — testado em testes/dons.test.ts.
//
// Estrutura do teste (igual à planilha original):
// - 10 perguntas de VIDA MINISTERIAL → 0 a 40 pontos;
// - 150 perguntas de DONS em ciclo de cinco (1 apóstolo, 2 profeta,
//   3 pastor, 4 mestre, 5 evangelista, 6 apóstolo...) → 30 por dom,
//   0 a 120 pontos cada;
// - cada resposta vale de 0 (nunca) a 4 (sempre).
//
// ATENÇÃO À PLANILHA ANTIGA: a fórmula de Apóstolo lá somava a
// pergunta 148 (de Pastor) no lugar da 146. Aqui a conta segue o
// ciclo, que é a regra do próprio teste. Por isso o Apóstolo de
// algumas respostas antigas difere da planilha em 1 a 3 pontos — o
// valor da planilha fica guardado à parte (`pontuacao_planilha`)
// para quem quiser comparar.
// =============================================================

import { PERGUNTAS_DONS, PERGUNTAS_VIDA } from "@/lib/dons-perguntas";

/** Muda só se as perguntas ou a regra mudarem. Fica gravado em cada resposta. */
export const VERSAO_TESTE = "efesios-4-11-v1";

export type Dom = "apostolo" | "profeta" | "pastor" | "mestre" | "evangelista";

/** Na ordem do ciclo das perguntas — não reordenar. */
export const DONS: readonly { chave: Dom; nome: string }[] = [
  { chave: "apostolo", nome: "Apóstolo" },
  { chave: "profeta", nome: "Profeta" },
  { chave: "pastor", nome: "Pastor" },
  { chave: "mestre", nome: "Mestre" },
  { chave: "evangelista", nome: "Evangelista" },
];

export const QTD_VIDA = PERGUNTAS_VIDA.length; // 10
export const QTD_DONS = PERGUNTAS_DONS.length; // 150
export const TOTAL_PERGUNTAS = QTD_VIDA + QTD_DONS; // 160
export const MAX_VIDA = QTD_VIDA * 4; // 40
export const MAX_DOM = (QTD_DONS / DONS.length) * 4; // 120

export const ESCALA: readonly { valor: number; rotulo: string }[] = [
  { valor: 0, rotulo: "Nunca" },
  { valor: 1, rotulo: "Raramente" },
  { valor: 2, rotulo: "Às vezes" },
  { valor: 3, rotulo: "Quase sempre" },
  { valor: 4, rotulo: "Sempre" },
];

export type Faixa = { min: number; max: number; texto: string };

// Textos da legenda da planilha, só com a ortografia acertada.
export const FAIXAS_DOM: readonly Faixa[] = [
  { min: 0, max: 45, texto: "Indica que este não é o seu dom ministerial." },
  {
    min: 46,
    max: 65,
    texto: "Indica que você tem alguma influência neste dom ministerial.",
  },
  {
    min: 66,
    max: 85,
    texto: "Indica que você pode se aperfeiçoar neste dom e fluir nele.",
  },
  {
    min: 86,
    max: 105,
    texto: "Indica que você tem um encargo neste dom ministerial.",
  },
  {
    min: 106,
    max: 120,
    texto:
      "Indica que você tem um chamado específico para este dom; você tem autoridade e o ofício.",
  },
];

export const FAIXAS_VIDA: readonly Faixa[] = [
  {
    min: 0,
    max: 10,
    texto: "Indica que você precisa de ajuda urgente de seu pastor ou líder.",
  },
  {
    min: 11,
    max: 20,
    texto:
      "Indica que você está com deficiências espirituais e precisa ser treinado e discipulado.",
  },
  {
    min: 21,
    max: 30,
    texto:
      "Indica que você precisa evoluir para seu crescimento ministerial (procure um mentoreamento).",
  },
  {
    min: 31,
    max: 35,
    texto:
      "Indica que você tem uma capacidade espiritual adequada para assumir responsabilidades ministeriais.",
  },
  { min: 36, max: 40, texto: "Indica que você tem autoridade espiritual." },
];

/** Dom medido pela pergunta N (1 a 150) da segunda parte. */
export function domDaPergunta(n: number): Dom {
  return DONS[(n - 1) % DONS.length].chave;
}

export function nomeDom(d: Dom): string {
  return DONS.find((x) => x.chave === d)?.nome ?? d;
}

export function faixaDe(pontos: number, faixas: readonly Faixa[]): Faixa {
  return (
    faixas.find((f) => pontos >= f.min && pontos <= f.max) ??
    (pontos < faixas[0].min ? faixas[0] : faixas[faixas.length - 1])
  );
}

/** Índice (0-based) da faixa — para a cor/intensidade na tela. */
export function nivelDaFaixa(pontos: number, faixas: readonly Faixa[]): number {
  return faixas.indexOf(faixaDe(pontos, faixas));
}

/**
 * Confere o que veio do navegador: exatamente 160 inteiros de 0 a 4.
 * Devolve a lista limpa ou null. O cliente é onde está o atacante —
 * nada de confiar em pontuação calculada lá.
 */
export function validarRespostas(entrada: unknown): number[] | null {
  if (!Array.isArray(entrada) || entrada.length !== TOTAL_PERGUNTAS) return null;
  const limpo: number[] = [];
  for (const v of entrada) {
    if (typeof v !== "number" || !Number.isInteger(v) || v < 0 || v > 4) return null;
    limpo.push(v);
  }
  return limpo;
}

export type Pontuacao = { vida: number; dons: Record<Dom, number> };

/** Índices 0–9 = vida ministerial; 10–159 = perguntas de dons 1–150. */
export function pontuar(respostas: readonly number[]): Pontuacao {
  const vida = respostas.slice(0, QTD_VIDA).reduce((s, v) => s + v, 0);
  const dons: Record<Dom, number> = {
    apostolo: 0,
    profeta: 0,
    pastor: 0,
    mestre: 0,
    evangelista: 0,
  };
  respostas.slice(QTD_VIDA, TOTAL_PERGUNTAS).forEach((v, i) => {
    dons[domDaPergunta(i + 1)] += v;
  });
  return { vida, dons };
}

/**
 * Primário = maior pontuação; secundário = a segunda maior.
 * Empate no topo vira dois primários e nenhum secundário — é como a
 * planilha registrava ("PASTOR/APÓSTOLO").
 */
export function destaques(dons: Record<Dom, number>): {
  primarios: Dom[];
  secundarios: Dom[];
} {
  const valores = [...new Set(DONS.map((d) => dons[d.chave]))].sort((a, b) => b - a);
  const comValor = (v: number | undefined) =>
    v === undefined ? [] : DONS.filter((d) => dons[d.chave] === v).map((d) => d.chave);
  const primarios = comValor(valores[0]);
  const secundarios = primarios.length > 1 ? [] : comValor(valores[1]);
  return { primarios, secundarios };
}

/**
 * Exatamente o que a pessoa vê ao terminar. Gravado como está
 * (`resultado_exibido`), para o líder saber depois o que apareceu
 * para ela — mesmo que um dia os textos das faixas mudem.
 */
export type ResultadoDons = {
  versao: string;
  vida: { pontos: number; maximo: number; faixa: string };
  dons: { dom: Dom; nome: string; pontos: number; maximo: number; faixa: string }[];
  primarios: string[];
  secundarios: string[];
};

export function montarResultado(p: Pontuacao): ResultadoDons {
  const { primarios, secundarios } = destaques(p.dons);
  return {
    versao: VERSAO_TESTE,
    vida: {
      pontos: p.vida,
      maximo: MAX_VIDA,
      faixa: faixaDe(p.vida, FAIXAS_VIDA).texto,
    },
    dons: DONS.map((d) => ({
      dom: d.chave,
      nome: d.nome,
      pontos: p.dons[d.chave],
      maximo: MAX_DOM,
      faixa: faixaDe(p.dons[d.chave], FAIXAS_DOM).texto,
    })),
    primarios: primarios.map(nomeDom),
    secundarios: secundarios.map(nomeDom),
  };
}

// -------- identificação de quem responde pelo link aberto --------

function semAcento(s: string): string {
  return s.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase().trim();
}

/** "joana machado DE souza " → "Joana Machado de Souza". */
export function arrumarNome(nome: string): string {
  const minusculas = new Set(["de", "da", "do", "das", "dos", "e"]);
  return nome
    .trim()
    .replace(/\s+/g, " ")
    .split(" ")
    .map((p, i) => {
      const l = p.toLocaleLowerCase("pt-BR");
      if (i > 0 && minusculas.has(l)) return l;
      return l.charAt(0).toLocaleUpperCase("pt-BR") + l.slice(1);
    })
    .join(" ");
}

/**
 * É a mesma pessoa que já respondeu? Mesmo telefone E mesmo primeiro
 * nome. Só telefone não basta: na planilha um casal respondeu com o
 * mesmo número, e juntar os dois apagaria o histórico de um deles.
 */
export function mesmaPessoa(
  a: { nome: string; telefone: string | null },
  b: { nome: string; telefone: string | null },
): boolean {
  if (!a.telefone || !b.telefone || a.telefone !== b.telefone) return false;
  const primeiro = (n: string) => semAcento(n).split(/\s+/)[0] ?? "";
  return primeiro(a.nome) !== "" && primeiro(a.nome) === primeiro(b.nome);
}

/** Idade digitada livremente ("51 anos ") → 51; fora de 5–120 vira null. */
export function lerIdade(entrada: unknown): number | null {
  const n =
    typeof entrada === "number"
      ? entrada
      : Number.parseInt(String(entrada ?? "").replace(/\D+/g, ""), 10);
  if (!Number.isFinite(n) || n < 5 || n > 120) return null;
  return Math.trunc(n);
}
