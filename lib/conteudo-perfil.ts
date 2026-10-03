/**
 * Perfil de conteúdo do ministério e criadores de referência (issue #189).
 *
 * Regras puras — sem banco, sem rede: o que o perfil guarda, como validar o
 * que vem da tela, como pedir à IA o "DNA" de um criador admirado e como
 * limpar a resposta. Testado em testes/conteudo-perfil.test.ts.
 *
 * A ideia central vem do que os melhores do mercado fazem (Sandcastles, Oiti):
 * da referência se aproveita a FORMA — tipo de gancho, estrutura, ritmo,
 * chamada final — e nunca o conteúdo. A voz é a do dono do perfil. Para um
 * ministério isso tem um cuidado a mais: doutrina e bordões de outra pessoa
 * não entram, mesmo que a forma dela inspire.
 */

import { lerJSONdaIA } from "@/lib/json-ia";

export const MAX_REFERENCIAS = 5;
export const MAX_PILARES = 6;
const MAX_EXEMPLOS = 12_000;

export type Pilar = { nome: string; descricao: string };

/** O que a IA entende da voz do dono, a partir das amostras dele. */
export type VozDNA = {
  tom: string;
  vocabulario: string[];
  evitar: string[];
};

export type PerfilConteudo = {
  objetivo: string;
  publico: string;
  pilares: Pilar[];
  /** Textos do próprio dono (legendas, trechos de pregação) para a IA imitar o jeito. */
  voz_amostras: string;
  voz_dna: VozDNA | null;
  /** Assuntos em que a IA não deve entrar. */
  temas_proibidos: string;
  /** Para onde o conteúdo leva (ex.: "comente MESA para receber o link"). */
  chamada_padrao: string;
};

export const PERFIL_VAZIO: PerfilConteudo = {
  objetivo: "",
  publico: "",
  pilares: [],
  voz_amostras: "",
  voz_dna: null,
  temas_proibidos: "",
  chamada_padrao: "",
};

/** O que se aproveita de um criador admirado: a forma, nunca o conteúdo. */
export type ReferenciaDNA = {
  /** Uma frase: o que torna esse criador reconhecível. */
  resumo: string;
  /** Padrões de abertura, descritos de forma reutilizável. */
  ganchos: string[];
  /** A sequência típica de um post dele (as "batidas"). */
  estrutura: string[];
  tom: string;
  /** Ritmo/duração típicos (ex.: "frases curtas, 30–45 s"). */
  ritmo: string;
  /** Como ele costuma encerrar. */
  chamada: string;
  /** O que vale trazer para o ministério. */
  aproveitar: string[];
  /** O que NÃO trazer: bordões, doutrina, estilo que não combina. */
  nao_copiar: string[];
};

export type ReferenciaConteudo = {
  id: string;
  nome: string;
  /** @ do Instagram, canal ou link — só para identificar. */
  link: string;
  /** Legendas, transcrições ou roteiros colados pelo dono. É disso que sai o DNA. */
  exemplos: string;
  dna: ReferenciaDNA | null;
  analisado_em: string | null;
};

type Resultado<T> = { ok: true; valor: T } | { ok: false; erro: string };

function texto(v: unknown, max: number): string | null {
  if (v === undefined || v === null) return "";
  if (typeof v !== "string") return null;
  const t = v.trim();
  return t.length > max ? null : t;
}

function listaDeTextos(v: unknown, maxItens: number, maxChars = 240): string[] {
  if (!Array.isArray(v)) return [];
  return v
    .filter((x): x is string => typeof x === "string")
    .map((x) => x.trim().slice(0, maxChars))
    .filter(Boolean)
    .slice(0, maxItens);
}

/** Valida o perfil vindo da tela (PUT inteiro: o formulário manda tudo). */
export function validarPerfil(
  corpo: unknown,
): Resultado<Omit<PerfilConteudo, "voz_dna">> {
  if (!corpo || typeof corpo !== "object")
    return { ok: false, erro: "Corpo inválido." };
  const c = corpo as Record<string, unknown>;

  const objetivo = texto(c.objetivo, 600);
  const publico = texto(c.publico, 600);
  const voz = texto(c.voz_amostras, 8000);
  const proibidos = texto(c.temas_proibidos, 1500);
  const chamada = texto(c.chamada_padrao, 300);
  if (objetivo === null)
    return { ok: false, erro: "Objetivo longo demais (máximo 600 caracteres)." };
  if (publico === null)
    return { ok: false, erro: "Público longo demais (máximo 600 caracteres)." };
  if (voz === null)
    return {
      ok: false,
      erro: "Amostras de voz longas demais (máximo 8.000 caracteres).",
    };
  if (proibidos === null)
    return {
      ok: false,
      erro: "Temas proibidos longos demais (máximo 1.500 caracteres).",
    };
  if (chamada === null)
    return { ok: false, erro: "Chamada padrão longa demais (máximo 300 caracteres)." };

  const brutos = Array.isArray(c.pilares) ? c.pilares : [];
  if (brutos.length > MAX_PILARES)
    return { ok: false, erro: `No máximo ${MAX_PILARES} pilares.` };
  const pilares: Pilar[] = [];
  for (const p of brutos) {
    const o = (p || {}) as Record<string, unknown>;
    const nome = texto(o.nome, 60);
    const descricao = texto(o.descricao, 300);
    if (nome === null || descricao === null)
      return { ok: false, erro: "Pilar com texto longo demais." };
    if (nome) pilares.push({ nome, descricao });
  }

  return {
    ok: true,
    valor: {
      objetivo,
      publico,
      pilares,
      voz_amostras: voz,
      temas_proibidos: proibidos,
      chamada_padrao: chamada,
    },
  };
}

/** Valida uma referência. `parcial` = PATCH (só o que veio é conferido). */
export function validarReferencia(
  corpo: unknown,
  parcial = false,
): Resultado<Partial<Pick<ReferenciaConteudo, "nome" | "link" | "exemplos">>> {
  if (!corpo || typeof corpo !== "object")
    return { ok: false, erro: "Corpo inválido." };
  const c = corpo as Record<string, unknown>;
  const valor: Partial<Pick<ReferenciaConteudo, "nome" | "link" | "exemplos">> = {};

  if (c.nome !== undefined || !parcial) {
    const nome = texto(c.nome, 80);
    if (!nome) return { ok: false, erro: "Diga quem é o criador (nome ou @)." };
    valor.nome = nome;
  }
  if (c.link !== undefined) {
    const link = texto(c.link, 300);
    if (link === null) return { ok: false, erro: "Link longo demais." };
    valor.link = link;
  }
  if (c.exemplos !== undefined) {
    const exemplos = texto(c.exemplos, MAX_EXEMPLOS);
    if (exemplos === null) {
      return {
        ok: false,
        erro: "Exemplos longos demais (máximo 12.000 caracteres). Fique com os 3 a 5 melhores.",
      };
    }
    valor.exemplos = exemplos;
  }
  return { ok: true, valor };
}

/** Mínimo de material para a análise não ser um chute. */
export const MIN_EXEMPLOS = 200;

export function podeAnalisar(exemplos: string): boolean {
  return exemplos.trim().length >= MIN_EXEMPLOS;
}

// ---------------------------------------------------------------------------
// Pedidos à IA
// ---------------------------------------------------------------------------

export const SYSTEM_ANALISE_REFERENCIA = `Você analisa criadores de conteúdo para um ministério cristão de discipulado (Ekballo).
Recebe exemplos de posts de UM criador que o pastor admira (legendas, transcrições de vídeo, roteiros).
Sua tarefa é descrever a FORMA como esse criador comunica, para o ministério aprender com ela — não copiar.

REGRAS
- Baseie-se SOMENTE nos exemplos enviados. Não use o que você acha que sabe sobre a pessoa. Se os exemplos não mostram algo, não invente.
- Descreva padrões REUTILIZÁVEIS, não frases dele. Em vez de citar a abertura, diga o tipo: "pergunta que expõe uma dor do dia a dia", "afirmação que contraria o senso comum".
- "aproveitar": o que da FORMA vale levar para um ministério de discipulado.
- "nao_copiar": bordões, marcas pessoais, posições doutrinárias e qualquer coisa que seja a identidade DELE. A voz e a doutrina do ministério são as do próprio ministério.
- Escreva em português do Brasil, direto, sem elogio vazio.

Responda SOMENTE com JSON válido neste formato:
{"resumo":"uma frase","ganchos":["3 a 5 padrões de abertura"],"estrutura":["as batidas de um post típico, em ordem"],"tom":"...","ritmo":"...","chamada":"como costuma encerrar","aproveitar":["2 a 4 itens"],"nao_copiar":["2 a 4 itens"]}`;

export function usuarioAnaliseReferencia(
  ref: Pick<ReferenciaConteudo, "nome" | "exemplos">,
): string {
  return `CRIADOR: ${ref.nome}\n\nEXEMPLOS:\n${ref.exemplos.trim()}`;
}

export const SYSTEM_ANALISE_VOZ = `Você analisa a voz de um pastor a partir de textos que ele mesmo escreveu ou falou (legendas, trechos de pregação).
O objetivo é que roteiros futuros soem como ELE, e não como texto genérico de IA.

REGRAS
- Baseie-se SOMENTE nas amostras. Não invente traços que elas não mostram.
- "tom": duas ou três frases sobre como ele fala (ex.: "direto e pastoral; usa pergunta para trazer o leitor; não usa gíria").
- "vocabulario": palavras e expressões que são marca dele e aparecem nas amostras.
- "evitar": o que ele NÃO faz e a IA costuma fazer (ex.: "frase de coach", "emoji em excesso", "superlativo").
- Português do Brasil.

Responda SOMENTE com JSON válido: {"tom":"...","vocabulario":["até 12"],"evitar":["até 8"]}`;

function soJSON(bruto: string): unknown {
  return lerJSONdaIA(bruto, "a IA não devolveu um resultado legível — tente de novo");
}

function frase(v: unknown, max: number): string {
  return typeof v === "string" ? v.trim().slice(0, max) : "";
}

/** Limpa a resposta da IA; lança se não houver nada aproveitável. */
export function normalizarDNAReferencia(bruto: string): ReferenciaDNA {
  const o = soJSON(bruto) as Record<string, unknown>;
  const dna: ReferenciaDNA = {
    resumo: frase(o.resumo, 300),
    ganchos: listaDeTextos(o.ganchos, 6),
    estrutura: listaDeTextos(o.estrutura, 8),
    tom: frase(o.tom, 400),
    ritmo: frase(o.ritmo, 300),
    chamada: frase(o.chamada, 300),
    aproveitar: listaDeTextos(o.aproveitar, 5),
    nao_copiar: listaDeTextos(o.nao_copiar, 5),
  };
  if (!dna.ganchos.length && !dna.estrutura.length) {
    throw new Error(
      "a análise veio vazia — cole exemplos mais completos e tente de novo",
    );
  }
  return dna;
}

export function normalizarVozDNA(bruto: string): VozDNA {
  const o = soJSON(bruto) as Record<string, unknown>;
  const dna: VozDNA = {
    tom: frase(o.tom, 600),
    vocabulario: listaDeTextos(o.vocabulario, 12, 60),
    evitar: listaDeTextos(o.evitar, 8, 120),
  };
  if (!dna.tom)
    throw new Error("a análise da voz veio vazia — cole mais amostras e tente de novo");
  return dna;
}

/**
 * O bloco de contexto que entra em TODO pedido de conteúdo (roteiro, carrossel,
 * pacote da semana). Fica vazio quando nada foi preenchido — o pedido segue
 * funcionando sem perfil, só mais genérico.
 */
export function contextoDoPerfil(
  perfil: PerfilConteudo,
  referencia?: ReferenciaConteudo | null,
): string {
  const linhas: string[] = [];
  if (perfil.objetivo) linhas.push(`OBJETIVO DO PERFIL: ${perfil.objetivo}`);
  if (perfil.publico) linhas.push(`PARA QUEM FALA: ${perfil.publico}`);
  if (perfil.pilares.length) {
    linhas.push(
      `PILARES DE CONTEÚDO:\n${perfil.pilares.map((p) => `- ${p.nome}${p.descricao ? `: ${p.descricao}` : ""}`).join("\n")}`,
    );
  }
  if (perfil.voz_dna) {
    const v = perfil.voz_dna;
    linhas.push(
      [
        `VOZ DO PASTOR (escreva como ele): ${v.tom}`,
        v.vocabulario.length ? `Expressões dele: ${v.vocabulario.join("; ")}` : "",
        v.evitar.length ? `Ele NÃO faz: ${v.evitar.join("; ")}` : "",
      ]
        .filter(Boolean)
        .join("\n"),
    );
  }
  if (perfil.temas_proibidos)
    linhas.push(`NÃO ENTRE NESTES ASSUNTOS: ${perfil.temas_proibidos}`);
  if (perfil.chamada_padrao)
    linhas.push(`CHAMADA FINAL PREFERIDA: ${perfil.chamada_padrao}`);

  if (referencia?.dna) {
    const d = referencia.dna;
    linhas.push(
      [
        `FORMA DE REFERÊNCIA (inspire-se na ESTRUTURA de ${referencia.nome}; NÃO copie frases, bordões nem doutrina dele):`,
        d.ganchos.length ? `Tipos de gancho: ${d.ganchos.join("; ")}` : "",
        d.estrutura.length ? `Batidas: ${d.estrutura.join(" → ")}` : "",
        d.ritmo ? `Ritmo: ${d.ritmo}` : "",
        d.chamada ? `Encerramento típico: ${d.chamada}` : "",
        d.nao_copiar.length ? `Não trazer: ${d.nao_copiar.join("; ")}` : "",
      ]
        .filter(Boolean)
        .join("\n"),
    );
  }
  return linhas.join("\n\n");
}

/** Quanto do perfil está preenchido — a tela usa para orientar o próximo passo. */
export function progressoDoPerfil(
  perfil: PerfilConteudo,
  referencias: ReferenciaConteudo[],
) {
  const passos = [
    {
      chave: "objetivo",
      feito: Boolean(perfil.objetivo && perfil.publico),
      rotulo: "Objetivo e público",
    },
    {
      chave: "pilares",
      feito: perfil.pilares.length >= 2,
      rotulo: "Pelo menos 2 pilares de conteúdo",
    },
    { chave: "voz", feito: Boolean(perfil.voz_dna), rotulo: "Sua voz analisada" },
    {
      chave: "referencias",
      feito: referencias.filter((r) => r.dna).length >= 1,
      rotulo: "Pelo menos 1 criador de referência analisado",
    },
  ];
  return { passos, feitos: passos.filter((p) => p.feito).length, total: passos.length };
}
