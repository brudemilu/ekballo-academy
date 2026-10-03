/**
 * Piloto automático do Instagram — issue #189.
 *
 * Uma vez por semana a IA escolhe a fonte, monta as peças, agenda a publicação
 * e avisa o pastor no WhatsApp. Ele não precisa fazer nada: se não vetar, o
 * que foi agendado vai ao ar no horário. Se não gostar, cancela com um toque.
 *
 * Esse "publica, com direito a veto" foi escolha do Bruno (out/2026): o post
 * sai no nome dele, então a IA nunca publica sem que ele tenha tido tempo de
 * ver. Por isso existe uma JANELA MÍNIMA entre o aviso e a primeira
 * publicação, e o código se recusa a agendar dentro dela.
 *
 * Aqui ficam as regras puras: configuração, escolha da fonte, horários e o
 * texto do aviso. Testado em testes/piloto.test.ts.
 */

export type TipoFontePiloto = "pregacao" | "livro" | "devocional";

/** Dia da semana (0 = domingo … 6 = sábado) e hora cheia, no horário de Brasília. */
export type Momento = { dia: number; hora: number };

export type PilotoConfig = {
  ativo: boolean;
  /** Fontes que o piloto pode usar. */
  fontes: TipoFontePiloto[];
  /** Livro seguido mesa a mesa. */
  curso_id: string | null;
  /** `ordem` da última mesa já usada desse livro (null = ainda não começou). */
  ultima_mesa_ordem: number | null;
  /** Quando o piloto prepara a semana e avisa. */
  preparo: Momento;
  /** Quando cada peça vai ao ar. */
  carrossel: Momento;
  reel: Momento;
  pecas: { carrossel: boolean; reel_ia: boolean; roteiro: boolean };
  /** WhatsApp que recebe o aviso (só dígitos, com DDI: 5511999998888). */
  telefone: string;
  /** Fonte usada na última execução — para alternar. */
  ultima_fonte: TipoFontePiloto | null;
  /** Análise de pregação já usada — para não repetir a mesma. */
  ultimo_corte_id: string | null;
};

export const PILOTO_PADRAO: PilotoConfig = {
  ativo: false,
  fontes: ["pregacao", "livro", "devocional"],
  curso_id: null,
  ultima_mesa_ordem: null,
  preparo: { dia: 0, hora: 20 }, // domingo, 20h
  carrossel: { dia: 2, hora: 19 }, // terça, 19h
  reel: { dia: 4, hora: 19 }, // quinta, 19h
  pecas: { carrossel: true, reel_ia: true, roteiro: true },
  telefone: "",
  ultima_fonte: null,
  ultimo_corte_id: null,
};

// O pastor precisa de tempo para ver o aviso e vetar. Menos que isto e o
// "direito a veto" vira ficção.
export const JANELA_VETO_HORAS = 12;

const FONTES: TipoFontePiloto[] = ["pregacao", "livro", "devocional"];
export const NOME_DIA = [
  "domingo",
  "segunda",
  "terça",
  "quarta",
  "quinta",
  "sexta",
  "sábado",
];

// Brasília não tem horário de verão desde 2019: UTC−3 fixo.
const FUSO_SP_HORAS = 3;

function momentoValido(v: unknown): Momento | null {
  const o = (v || {}) as Record<string, unknown>;
  const dia = Number(o.dia);
  const hora = Number(o.hora);
  if (!Number.isInteger(dia) || dia < 0 || dia > 6) return null;
  if (!Number.isInteger(hora) || hora < 0 || hora > 23) return null;
  return { dia, hora };
}

/**
 * O próximo instante (ISO, UTC) em que cai `m`, no mínimo `folgaHoras` depois
 * de `agora`. Com folga zero e o momento exatamente agora, devolve a semana
 * seguinte — "próximo" nunca é "já".
 */
export function proximaOcorrencia(agora: Date, m: Momento, folgaHoras = 0): string {
  const limite = agora.getTime() + folgaHoras * 3_600_000;
  // "Agora" visto em Brasília, guardado nos campos UTC de um Date.
  const emSP = new Date(agora.getTime() - FUSO_SP_HORAS * 3_600_000);
  for (let d = 0; d <= 14; d++) {
    const candidato = Date.UTC(
      emSP.getUTCFullYear(),
      emSP.getUTCMonth(),
      emSP.getUTCDate() + d,
      m.hora + FUSO_SP_HORAS,
      0,
      0,
    );
    const diaSemana = new Date(candidato - FUSO_SP_HORAS * 3_600_000).getUTCDay();
    if (diaSemana === m.dia && candidato > limite)
      return new Date(candidato).toISOString();
  }
  throw new Error("não achei a próxima data");
}

/** "terça, 19h" */
export function rotuloMomento(m: Momento): string {
  return `${NOME_DIA[m.dia]}, ${m.hora}h`;
}

/** "terça 06/10 às 19h", no horário de Brasília. */
export function quandoPorExtenso(iso: string): string {
  const sp = new Date(new Date(iso).getTime() - FUSO_SP_HORAS * 3_600_000);
  const dd = String(sp.getUTCDate()).padStart(2, "0");
  const mm = String(sp.getUTCMonth() + 1).padStart(2, "0");
  return `${NOME_DIA[sp.getUTCDay()]} ${dd}/${mm} às ${sp.getUTCHours()}h`;
}

/** Valida a configuração vinda da tela. Devolve a mensagem de erro, ou os campos limpos. */
export function validarPiloto(corpo: unknown):
  | {
      ok: true;
      valor: Omit<
        PilotoConfig,
        "ultima_mesa_ordem" | "ultima_fonte" | "ultimo_corte_id"
      >;
    }
  | { ok: false; erro: string } {
  if (!corpo || typeof corpo !== "object")
    return { ok: false, erro: "Corpo inválido." };
  const c = corpo as Record<string, unknown>;

  const fontes = (Array.isArray(c.fontes) ? c.fontes : []).filter(
    (f): f is TipoFontePiloto => FONTES.includes(f as TipoFontePiloto),
  );
  const preparo = momentoValido(c.preparo);
  const carrossel = momentoValido(c.carrossel);
  const reel = momentoValido(c.reel);
  if (!preparo || !carrossel || !reel)
    return { ok: false, erro: "Escolha o dia e a hora de cada etapa." };

  const p = (c.pecas || {}) as Record<string, unknown>;
  const pecas = {
    carrossel: Boolean(p.carrossel),
    reel_ia: Boolean(p.reel_ia),
    roteiro: Boolean(p.roteiro),
  };
  const telefone = typeof c.telefone === "string" ? c.telefone.replace(/\D/g, "") : "";
  const curso_id = typeof c.curso_id === "string" && c.curso_id ? c.curso_id : null;
  const ativo = Boolean(c.ativo);

  if (ativo) {
    if (!fontes.length)
      return { ok: false, erro: "Escolha pelo menos uma fonte para o piloto usar." };
    if (!pecas.carrossel && !pecas.reel_ia && !pecas.roteiro) {
      return { ok: false, erro: "Escolha pelo menos uma peça para o piloto produzir." };
    }
    if (fontes.includes("livro") && !curso_id && fontes.length === 1) {
      return { ok: false, erro: "Escolha o livro que o piloto vai seguir." };
    }
    // Sem o aviso não existe veto: o piloto publicaria sem ninguém ver.
    if (telefone.length < 12) {
      return {
        ok: false,
        erro: "Informe o WhatsApp que recebe o aviso, com DDI e DDD (ex.: 5531999998888).",
      };
    }
  }

  return {
    ok: true,
    valor: { ativo, fontes, curso_id, preparo, carrossel, reel, pecas, telefone },
  };
}

export type Disponibilidade = {
  /** Há uma análise de pregação pronta que o piloto ainda não usou? */
  pregacaoNova: boolean;
  /** O livro escolhido ainda tem mesa adiante? */
  proximaMesa: boolean;
  /** Existe devocional para o dia do preparo? */
  devocional: boolean;
};

/**
 * Qual fonte usar nesta semana. Pregação nova sempre ganha — é o conteúdo
 * mais fresco e mais do pastor. Entre livro e devocional, alterna para o
 * perfil não ficar monotemático. Devolve null se nada estiver disponível.
 */
export function escolherFonte(
  config: PilotoConfig,
  d: Disponibilidade,
): TipoFontePiloto | null {
  const pode: Record<TipoFontePiloto, boolean> = {
    pregacao: config.fontes.includes("pregacao") && d.pregacaoNova,
    livro: config.fontes.includes("livro") && Boolean(config.curso_id) && d.proximaMesa,
    devocional: config.fontes.includes("devocional") && d.devocional,
  };
  if (pode.pregacao) return "pregacao";
  if (pode.livro && pode.devocional)
    return config.ultima_fonte === "livro" ? "devocional" : "livro";
  if (pode.livro) return "livro";
  if (pode.devocional) return "devocional";
  return null;
}

// ---------------------------------------------------------------------------
// Execução
// ---------------------------------------------------------------------------

export type PecaPiloto = {
  tipo: "carrossel" | "reel_ia" | "roteiro";
  titulo: string;
  /** Quando vai ao ar (ISO). O roteiro não vai ao ar sozinho: null. */
  quando: string | null;
  /** Post agendado (carrossel e reel da IA). */
  post_id?: string;
  /** Roteiro guardado. */
  roteiro_id?: string;
  /** "agendado" até publicar; "vetado" se o pastor cancelou; "falhou" se a IA não conseguiu montar. */
  estado: "agendado" | "vetado" | "pronto" | "falhou";
  /** Motivo, quando falhou. */
  detalhe?: string;
};

export type ExecucaoPiloto = {
  id: string;
  status: "preparando" | "pronto" | "erro";
  fonte: { tipo: TipoFontePiloto; titulo: string } | null;
  pecas: PecaPiloto[];
  erro: string | null;
  aviso_enviado: boolean;
  criado_em: string;
};

/**
 * Os horários das peças desta execução, respeitando a janela de veto: nada é
 * agendado para antes de `JANELA_VETO_HORAS` depois do preparo.
 */
export function horariosDaExecucao(
  agora: Date,
  config: PilotoConfig,
): { carrossel: string; reel: string } {
  return {
    carrossel: proximaOcorrencia(agora, config.carrossel, JANELA_VETO_HORAS),
    reel: proximaOcorrencia(agora, config.reel, JANELA_VETO_HORAS),
  };
}

const NOME_PECA: Record<PecaPiloto["tipo"], string> = {
  carrossel: "Carrossel",
  reel_ia: "Reel (feito pela IA)",
  roteiro: "Roteiro para você gravar",
};

const NOME_FONTE: Record<TipoFontePiloto, string> = {
  pregacao: "sua pregação",
  livro: "o livro",
  devocional: "o devocional",
};

/** O aviso que chega no WhatsApp do pastor. `link` abre a tela do piloto. */
export function mensagemDoPiloto(
  e: Pick<ExecucaoPiloto, "fonte" | "pecas">,
  link: string,
): string {
  const linhas: string[] = ["🤖 *Piloto automático do Instagram*", ""];
  if (e.fonte)
    linhas.push(
      `Preparei a semana a partir de ${NOME_FONTE[e.fonte.tipo]}: _${e.fonte.titulo}_`,
      "",
    );

  const agendadas = e.pecas.filter((p) => p.estado === "agendado" && p.quando);
  const prontas = e.pecas.filter((p) => p.estado === "pronto");
  const falhas = e.pecas.filter((p) => p.estado === "falhou");

  if (agendadas.length) {
    linhas.push("*Vai ao ar sozinho:*");
    for (const p of agendadas)
      linhas.push(
        `• ${NOME_PECA[p.tipo]} — ${quandoPorExtenso(p.quando as string)}\n  ${p.titulo}`,
      );
    linhas.push("");
  }
  if (prontas.length) {
    linhas.push("*Esperando você:*");
    for (const p of prontas) linhas.push(`• ${NOME_PECA[p.tipo]}\n  ${p.titulo}`);
    linhas.push("");
  }
  if (falhas.length) {
    linhas.push("*Não consegui montar:*");
    for (const p of falhas)
      linhas.push(`• ${NOME_PECA[p.tipo]}${p.detalhe ? ` (${p.detalhe})` : ""}`);
    linhas.push("");
  }

  linhas.push(
    agendadas.length
      ? "Se estiver tudo certo, não precisa fazer nada. Para cancelar, responda aqui *cancelar carrossel*, *cancelar reel* ou *cancelar tudo*. Para ver as peças:"
      : "Para ver o que ficou pronto:",
    link,
  );
  return linhas.join("\n");
}

/** Ainda dá para vetar esta peça? Só o que está agendado e ainda não chegou a hora. */
export function podeVetar(p: PecaPiloto, agora: Date): boolean {
  return (
    p.estado === "agendado" &&
    Boolean(p.quando) &&
    new Date(p.quando as string).getTime() > agora.getTime()
  );
}
