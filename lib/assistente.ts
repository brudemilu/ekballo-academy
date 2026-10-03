/**
 * Assistente de conteúdo do ministério (issue #189): um chat que conhece o
 * Perfil (objetivo, público, pilares, voz, assuntos proibidos) e ajuda a
 * pensar o conteúdo — dar ideias, criticar um texto, planejar a semana.
 *
 * Quando a resposta traz ideias de post, elas vêm também em formato
 * estruturado, e a tela oferece guardar cada uma no calendário. É o que liga
 * a conversa ao resto do copiloto: a ideia não morre no chat.
 *
 * O servidor não guarda a conversa: o navegador manda o histórico a cada
 * pergunta. Regras puras, testadas em testes/assistente.test.ts.
 */
import { FORMATOS_IDEIA, type FormatoIdeiaCal } from "@/lib/conteudo-calendario";
import { lerJSONdaIA } from "@/lib/json-ia";

export type MensagemChat = { papel: "pastor" | "assistente"; texto: string };

export type IdeiaSugerida = { titulo: string; formato: FormatoIdeiaCal; nota: string };

export type RespostaAssistente = { resposta: string; ideias: IdeiaSugerida[] };

export const MENSAGEM_MAX = 2000;
// O que vai para a IA: as últimas mensagens, até este tanto de texto. Conversa
// longa não precisa ir inteira, e pedido grande demais cai da camada gratuita.
const HISTORICO_MAX_MENSAGENS = 12;
const HISTORICO_MAX_CHARS = 8000;

/** Valida e limpa o histórico vindo do navegador. A última mensagem tem de ser do pastor. */
export function validarConversa(
  v: unknown,
): { ok: true; valor: MensagemChat[] } | { ok: false; erro: string } {
  if (!Array.isArray(v) || !v.length)
    return { ok: false, erro: "Escreva uma mensagem." };
  const mensagens: MensagemChat[] = [];
  for (const m of v) {
    const o = (m || {}) as Record<string, unknown>;
    const texto = typeof o.texto === "string" ? o.texto.trim() : "";
    if (!texto) continue;
    if (o.papel !== "pastor" && o.papel !== "assistente")
      return { ok: false, erro: "Conversa inválida." };
    mensagens.push({
      papel: o.papel,
      texto: texto.slice(0, o.papel === "pastor" ? MENSAGEM_MAX : 6000),
    });
  }
  const ultima = mensagens[mensagens.length - 1];
  if (ultima?.papel !== "pastor") return { ok: false, erro: "Escreva uma mensagem." };
  return { ok: true, valor: mensagens };
}

/** As mensagens mais recentes que cabem no limite, na ordem em que aconteceram. */
export function recortarHistorico(mensagens: MensagemChat[]): MensagemChat[] {
  const recentes = mensagens.slice(-HISTORICO_MAX_MENSAGENS);
  let total = 0;
  const cabem: MensagemChat[] = [];
  for (let i = recentes.length - 1; i >= 0; i--) {
    total += recentes[i].texto.length;
    // A última (a pergunta atual) sempre vai, mesmo que sozinha passe do limite.
    if (cabem.length && total > HISTORICO_MAX_CHARS) break;
    cabem.unshift(recentes[i]);
  }
  return cabem;
}

export function systemAssistente(contextoPerfil: string, hoje: string): string {
  return `Você é o assistente de conteúdo do Instagram de um ministério cristão de discipulado (Ekballo).
Conversa com o pastor responsável pelo perfil. Hoje é ${hoje}.

COMO AJUDAR
- Seja direto e prático, como um colega que entende de comunicação e respeita a fé dele. Sem elogio vazio, sem enrolação.
- Pode dar ideias de post, criticar um texto que ele colar, sugerir ganchos, planejar a semana, explicar o que funciona no Instagram.
- Quando faltar informação para responder bem, pergunte UMA coisa em vez de supor.
- Respostas curtas: no máximo uns 6 parágrafos ou uma lista. Ele lê no celular.
- Português do Brasil.

LIMITES
- Não cite versículo com referência (livro, capítulo e versículo), a menos que ele tenha citado antes: você erra referência com facilidade. Pode falar do ensino bíblico com as suas palavras.
- Não invente dado, pesquisa nem número. Se não sabe, diga que não sabe.
- Não é pastor nem conselheiro: em questão doutrinária ou de aconselhamento, devolva a decisão a ele.
- Em assunto controverso entre igrejas, não tome partido.
${contextoPerfil ? `\nO QUE VOCÊ SABE DO MINISTÉRIO\n${contextoPerfil}\n` : "\nO pastor ainda não preencheu a aba Perfil. Se ajudar na resposta, sugira que ele preencha.\n"}
IDEIAS
- Se a sua resposta propõe posts concretos, liste-os TAMBÉM em "ideias" (até 5), para ele guardar no calendário com um clique. "formato" é um de: ${FORMATOS_IDEIA.join(", ")} ("roteiro" = vídeo que ele grava falando). "nota": uma linha com o gancho ou o ângulo.
- Se a resposta não propõe posts, "ideias" fica vazio.

Responda SOMENTE com JSON válido: {"resposta":"o texto da sua resposta","ideias":[{"titulo":"...","formato":"carrossel","nota":"..."}]}`;
}

/** A conversa no formato que vai como mensagem do usuário para a IA. */
export function conversaParaIA(mensagens: MensagemChat[]): string {
  return recortarHistorico(mensagens)
    .map((m) => `${m.papel === "pastor" ? "PASTOR" : "ASSISTENTE"}: ${m.texto}`)
    .join("\n\n");
}

/** Limpa a resposta da IA; lança se não vier texto. */
export function normalizarResposta(bruto: string): RespostaAssistente {
  const o = lerJSONdaIA(
    bruto,
    "o assistente não conseguiu responder agora — tente de novo",
  ) as Record<string, unknown>;
  const resposta =
    typeof o.resposta === "string" ? o.resposta.trim().slice(0, 6000) : "";
  if (!resposta)
    throw new Error("o assistente não conseguiu responder agora — tente de novo");
  const ideias: IdeiaSugerida[] = (Array.isArray(o.ideias) ? o.ideias : [])
    .map((i) => {
      const x = (i || {}) as Record<string, unknown>;
      return {
        titulo: typeof x.titulo === "string" ? x.titulo.trim().slice(0, 200) : "",
        formato: FORMATOS_IDEIA.includes(x.formato as FormatoIdeiaCal)
          ? (x.formato as FormatoIdeiaCal)
          : "carrossel",
        nota: typeof x.nota === "string" ? x.nota.trim().slice(0, 500) : "",
      };
    })
    .filter((i) => i.titulo)
    .slice(0, 5);
  return { resposta, ideias };
}
