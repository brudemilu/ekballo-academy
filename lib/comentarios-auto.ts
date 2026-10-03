/**
 * Resposta automática a comentários do Instagram (issue #189).
 *
 * Quem comenta uma palavra combinada num post ("MESA") recebe uma resposta
 * pública e/ou uma mensagem direta — é o "comente X que eu te mando o link".
 *
 * Aqui fica só o que é regra e texto (testado em testes/comentarios-auto.test.ts);
 * as chamadas ao Instagram estão em lib/comentarios-auto-executar.ts.
 *
 * Dois cuidados que valem explicar:
 * - A palavra tem de aparecer INTEIRA no comentário. "mesa" não casa com
 *   "mesada" nem com "promessa": responder a quem não pediu é pior do que
 *   deixar de responder.
 * - Não há IA aqui. A resposta é a que o pastor escreveu, palavra por palavra.
 */

export type RegraComentario = {
  id: string;
  /** A palavra (ou expressão curta) que dispara a resposta. */
  palavra: string;
  /** Resposta pública, embaixo do comentário. Vazia = não responde em público. */
  resposta_publica: string;
  /** Mensagem direta para quem comentou. Vazia = não manda. */
  mensagem_privada: string;
  ativo: boolean;
  criado_em: string;
};

export type ComentarioRespondido = {
  comentario_id: string;
  regra_id: string | null;
  media_id: string;
  usuario: string;
  texto: string;
  palavra: string;
  /** null = não havia o que mandar por esse canal. */
  publico_ok: boolean | null;
  privado_ok: boolean | null;
  erro: string | null;
  criado_em: string;
};

export const MAX_REGRAS = 10;
export const PALAVRA_MAX = 30;
export const RESPOSTA_MAX = 300;
export const MENSAGEM_MAX = 900;

/** Sem acento, sem caixa, sem pontuação: como as palavras são comparadas. */
export function normalizar(texto: string): string {
  return (texto || "")
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

type Resultado<T> = { ok: true; valor: T } | { ok: false; erro: string };

export type RegraValidada = Pick<
  RegraComentario,
  "palavra" | "resposta_publica" | "mensagem_privada"
>;

export function validarRegra(corpo: unknown): Resultado<RegraValidada> {
  const o = (corpo || {}) as Record<string, unknown>;
  const texto = (v: unknown) => (typeof v === "string" ? v.trim() : "");
  const palavra = texto(o.palavra).replace(/\s+/g, " ");
  const resposta_publica = texto(o.resposta_publica);
  const mensagem_privada = texto(o.mensagem_privada);

  if (normalizar(palavra).length < 2)
    return { ok: false, erro: "Escolha uma palavra com pelo menos 2 letras." };
  if (palavra.length > PALAVRA_MAX)
    return { ok: false, erro: `A palavra pode ter até ${PALAVRA_MAX} caracteres.` };
  if (!resposta_publica && !mensagem_privada)
    return {
      ok: false,
      erro: "Escreva a resposta pública, a mensagem direta ou as duas.",
    };
  if (resposta_publica.length > RESPOSTA_MAX)
    return {
      ok: false,
      erro: `A resposta pública pode ter até ${RESPOSTA_MAX} caracteres.`,
    };
  if (mensagem_privada.length > MENSAGEM_MAX)
    return {
      ok: false,
      erro: `A mensagem direta pode ter até ${MENSAGEM_MAX} caracteres.`,
    };
  return { ok: true, valor: { palavra, resposta_publica, mensagem_privada } };
}

/** Já existe uma regra para esta palavra (ignorando acento e caixa)? */
export function palavraRepetida(palavra: string, regras: RegraComentario[]): boolean {
  const p = normalizar(palavra);
  return regras.some((r) => normalizar(r.palavra) === p);
}

/**
 * A regra que o comentário dispara, ou null. A palavra precisa aparecer
 * inteira; entre duas que casam, vale a mais longa (a mais específica).
 */
export function casarRegra(
  comentario: string,
  regras: RegraComentario[],
): RegraComentario | null {
  const texto = ` ${normalizar(comentario)} `;
  let melhor: RegraComentario | null = null;
  let tamanho = 0;
  for (const r of regras) {
    if (!r.ativo) continue;
    const p = normalizar(r.palavra);
    if (p.length < 2) continue;
    if (texto.includes(` ${p} `) && p.length > tamanho) {
      melhor = r;
      tamanho = p.length;
    }
  }
  return melhor;
}

/** Troca {nome} pelo usuário de quem comentou. */
export function montarMensagem(modelo: string, usuario: string): string {
  const nome = usuario ? `@${usuario.replace(/^@/, "")}` : "";
  return modelo
    .replace(/\{nome\}/gi, nome)
    .replace(/[ \t]{2,}/g, " ")
    .trim();
}

export type ComentarioIG = {
  id: string;
  text: string;
  username: string;
  /** ISO 8601 */
  timestamp: string;
  /** id de quem comentou, quando o Instagram informa. */
  fromId?: string;
};

// A mensagem direta em resposta a um comentário só é aceita pelo Instagram
// até 7 dias depois dele. Fica um dia de folga.
export const JANELA_COMENTARIO_DIAS = 6;

/**
 * Entre os comentários de um post, os que pedem resposta agora: casam com
 * uma regra, não são do próprio perfil, ainda não foram tratados e estão
 * dentro do prazo em que o Instagram aceita a mensagem.
 */
export function comentariosAResponder(
  comentarios: ComentarioIG[],
  regras: RegraComentario[],
  jaTratados: Set<string>,
  proprio: { id: string; usuario: string },
  agora: Date,
): { comentario: ComentarioIG; regra: RegraComentario }[] {
  const limite = agora.getTime() - JANELA_COMENTARIO_DIAS * 86_400_000;
  const saida: { comentario: ComentarioIG; regra: RegraComentario }[] = [];
  for (const c of comentarios) {
    if (!c.id || jaTratados.has(c.id)) continue;
    if (proprio.id && c.fromId === proprio.id) continue;
    if (proprio.usuario && c.username?.toLowerCase() === proprio.usuario.toLowerCase())
      continue;
    const quando = new Date(c.timestamp).getTime();
    if (!Number.isFinite(quando) || quando < limite) continue;
    const regra = casarRegra(c.text, regras);
    if (regra) saida.push({ comentario: c, regra });
  }
  return saida;
}
