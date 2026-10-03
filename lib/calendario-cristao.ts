/**
 * Calendário cristão (issue #189): as datas do ano que pedem um post.
 *
 * Tudo aqui é conta de calendário — nenhuma IA, nenhuma rede. As datas
 * móveis saem da Páscoa; as demais são fixas ou "o segundo domingo de…".
 * Usado pelo calendário de conteúdo (selo no dia), pelo Painel (aviso de
 * data chegando sem nada planejado) e pelo assistente (que passa a saber o
 * que vem aí). Testado em testes/calendario-cristao.test.ts.
 *
 * A lista é a que uma igreja evangélica brasileira costuma lembrar. Datas
 * que variam por denominação (dia de missões, aniversários de igreja) ficam
 * de fora: o pastor as põe como ideia no calendário.
 */
import { somarDias } from "@/lib/conteudo-calendario";

export type DataCrista = {
  /** "YYYY-MM-DD" */
  dia: string;
  chave: string;
  nome: string;
  /** Um ângulo de conteúdo, em uma linha — ponto de partida, não roteiro. */
  angulo: string;
};

function iso(ano: number, mes: number, dia: number): string {
  return new Date(Date.UTC(ano, mes - 1, dia)).toISOString().slice(0, 10);
}

/** Domingo de Páscoa no calendário gregoriano (algoritmo de Meeus/Jones/Butcher). */
export function pascoa(ano: number): string {
  const a = ano % 19;
  const b = Math.floor(ano / 100);
  const c = ano % 100;
  const d = Math.floor(b / 4);
  const e = b % 4;
  const f = Math.floor((b + 8) / 25);
  const g = Math.floor((b - f + 1) / 3);
  const h = (19 * a + b - d - g + 15) % 30;
  const i = Math.floor(c / 4);
  const k = c % 4;
  const l = (32 + 2 * e + 2 * i - h - k) % 7;
  const m = Math.floor((a + 11 * h + 22 * l) / 451);
  const mes = Math.floor((h + l - 7 * m + 114) / 31);
  const dia = ((h + l - 7 * m + 114) % 31) + 1;
  return iso(ano, mes, dia);
}

/** O n-ésimo dia da semana (0 = domingo) de um mês. Ex.: 2º domingo de maio. */
export function enesimoDiaDaSemana(
  ano: number,
  mes: number,
  diaDaSemana: number,
  n: number,
): string {
  const primeiro = new Date(Date.UTC(ano, mes - 1, 1)).getUTCDay();
  const dia = 1 + ((diaDaSemana - primeiro + 7) % 7) + (n - 1) * 7;
  return iso(ano, mes, dia);
}

/** Primeiro domingo do Advento: o quarto domingo antes do Natal. */
export function primeiroDomingoDoAdvento(ano: number): string {
  const natal = new Date(Date.UTC(ano, 11, 25)).getUTCDay(); // 0 = domingo
  // O domingo anterior ao Natal (o próprio dia 25 não conta) é o 4º do Advento.
  const quarto = 25 - (natal === 0 ? 7 : natal);
  return iso(ano, 12, quarto - 21);
}

/** As datas de um ano, em ordem. */
export function datasDoAno(ano: number): DataCrista[] {
  const p = pascoa(ano);
  const datas: DataCrista[] = [
    {
      dia: iso(ano, 1, 1),
      chave: "ano-novo",
      nome: "Ano novo",
      angulo: "O que entregar a Deus no ano que começa.",
    },
    {
      dia: somarDias(p, -46),
      chave: "cinzas",
      nome: "Quarta-feira de Cinzas",
      angulo: "Começa a Quaresma: 40 dias de arrependimento e preparo para a Páscoa.",
    },
    {
      dia: somarDias(p, -7),
      chave: "ramos",
      nome: "Domingo de Ramos",
      angulo: "A entrada de Jesus em Jerusalém: que tipo de rei a multidão esperava?",
    },
    {
      dia: somarDias(p, -2),
      chave: "sexta-santa",
      nome: "Sexta-feira Santa",
      angulo: "A cruz: o que foi pago ali e por quem.",
    },
    {
      dia: p,
      chave: "pascoa",
      nome: "Páscoa",
      angulo: "Ele ressuscitou: o que muda numa vida se o túmulo está vazio.",
    },
    {
      dia: enesimoDiaDaSemana(ano, 5, 0, 2),
      chave: "maes",
      nome: "Dia das Mães",
      angulo: "A fé que passa de mãe para filho — e uma palavra para quem sente falta.",
    },
    {
      dia: somarDias(p, 39),
      chave: "ascensao",
      nome: "Ascensão",
      angulo: "Jesus subiu e deixou uma tarefa: fazer discípulos.",
    },
    {
      dia: somarDias(p, 49),
      chave: "pentecostes",
      nome: "Pentecostes",
      angulo: "O Espírito veio para a igreja sair de casa.",
    },
    {
      dia: enesimoDiaDaSemana(ano, 6, 0, 2),
      chave: "pastor",
      nome: "Dia do Pastor",
      angulo: "Quem cuidou de você na fé? Gratidão por quem pastoreia.",
    },
    {
      dia: enesimoDiaDaSemana(ano, 8, 0, 2),
      chave: "pais",
      nome: "Dia dos Pais",
      angulo: "O pai que discipula em casa — e o Pai que não falha.",
    },
    {
      dia: iso(ano, 10, 12),
      chave: "criancas",
      nome: "Dia das Crianças",
      angulo: "Discipulado começa cedo: como a fé se ensina a uma criança.",
    },
    {
      dia: iso(ano, 10, 31),
      chave: "reforma",
      nome: "Dia da Reforma",
      angulo: "Só a Escritura, só a graça, só a fé: por que isso ainda importa.",
    },
    {
      dia: iso(ano, 11, 2),
      chave: "finados",
      nome: "Finados",
      angulo: "Luto com esperança: o que o evangelho diz a quem perdeu alguém.",
    },
    {
      dia: enesimoDiaDaSemana(ano, 11, 4, 4),
      chave: "acao-de-gracas",
      nome: "Dia de Ação de Graças",
      angulo: "Gratidão como disciplina, não como humor do dia.",
    },
    {
      dia: iso(ano, 11, 30),
      chave: "evangelico",
      nome: "Dia do Evangélico",
      angulo: "Ser conhecido pelo evangelho que se vive, não pelo rótulo.",
    },
    {
      dia: primeiroDomingoDoAdvento(ano),
      chave: "advento",
      nome: "1º domingo do Advento",
      angulo: "Começa a espera pelo Natal: quatro semanas para preparar o coração.",
    },
    {
      dia: enesimoDiaDaSemana(ano, 12, 0, 2),
      chave: "biblia",
      nome: "Dia da Bíblia",
      angulo: "Como ler a Bíblia de verdade — e com quem.",
    },
    {
      dia: iso(ano, 12, 25),
      chave: "natal",
      nome: "Natal",
      angulo: "Deus veio morar entre nós: o que a encarnação diz sobre discipular.",
    },
    {
      dia: iso(ano, 12, 31),
      chave: "virada",
      nome: "Virada do ano",
      angulo: "Olhar para trás com gratidão antes de pedir o próximo ano.",
    },
  ];
  return datas.sort((a, b) => a.dia.localeCompare(b.dia));
}

/** As datas entre dois dias (inclusive), mesmo atravessando a virada do ano. */
export function datasEntre(de: string, ate: string): DataCrista[] {
  if (de > ate) return [];
  const anoDe = Number(de.slice(0, 4));
  const anoAte = Number(ate.slice(0, 4));
  const todas: DataCrista[] = [];
  for (let ano = anoDe; ano <= anoAte; ano++) todas.push(...datasDoAno(ano));
  return todas.filter((d) => d.dia >= de && d.dia <= ate);
}

/** As datas de hoje até daqui a `dias` dias. */
export function proximasDatas(hoje: string, dias: number): DataCrista[] {
  return datasEntre(hoje, somarDias(hoje, dias));
}

/** "Páscoa — domingo, 5 de abril": a linha que vai para a IA e para a tela. */
export function dataPorExtenso(d: DataCrista): string {
  const [a, m, dia] = d.dia.split("-").map(Number);
  const quando = new Date(Date.UTC(a, m - 1, dia)).toLocaleDateString("pt-BR", {
    weekday: "long",
    day: "numeric",
    month: "long",
    timeZone: "UTC",
  });
  return `${d.nome} — ${quando}`;
}
