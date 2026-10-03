/**
 * Instagram pelo WhatsApp (issue #189): o pastor cria, aprova e cancela posts
 * respondendo no próprio chat "Você", sem abrir o site. A ideia vem de duas
 * ferramentas do mercado (Postou.ai e Clara) que funcionam inteiras assim.
 *
 * Aqui fica só a parte pura: entender o que foi escrito ou falado e, quando há
 * um "quando", transformá-lo num instante. O webhook
 * (app/api/webhook/whatsapp-agenda) decide o que fazer. Testado em
 * testes/whatsapp-instagram.test.ts.
 *
 * Os gatilhos são palavras que a agenda NÃO usa. "agendar…" já é comando da
 * agenda de compromissos — por isso aqui se diz "publicar terça 19h".
 */
import { proximaOcorrencia } from "@/lib/piloto";

/**
 * Toda mensagem que o robô manda começa com isto. As respostas saem pela conta
 * do próprio pastor, para o chat dele mesmo — e voltam pelo webhook como se
 * fossem dele. Sem a marca, uma resposta poderia ser lida como comando e o
 * robô entraria em laço. O webhook descarta o que começa com ela.
 */
export const MARCA_ROBO = "🤖";

/** A mensagem (ou legenda de imagem) foi escrita pelo robô? */
export function ehDoRobo(texto: string): boolean {
  return (texto || "").trimStart().startsWith(MARCA_ROBO);
}

export type ComandoInstagram =
  | { tipo: "criar"; ideia: string }
  | { tipo: "publicar"; quando: string }
  | { tipo: "refazer" }
  | { tipo: "cancelar"; alvo: "rascunho" | "carrossel" | "reel" | "tudo" }
  | { tipo: "ajuda" };

/** Tira acento e caixa, para comparar o que foi dito com os gatilhos. */
function plano(t: string): string {
  return t.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase().trim();
}

// "post sobre…", "postar…", "cria um post de…", "instagram: …". A transcrição
// de áudio costuma vir com pontuação e sem os dois-pontos.
const RE_CRIAR =
  /^(?:(?:cri[ae]|faz|faca|fazer|monta|montar|gera|gerar)\s+(?:um\s+|uma\s+)?(?:post|postagem|carrossel)|post(?:ar|agem)?|carrossel|instagram)\b[\s:,.-]*(?:(?:sobre|de|do|da|com|para)\b[\s:,-]*)?/;

/**
 * Entende um comando de Instagram. Devolve null quando a mensagem não é para
 * o Instagram — o webhook então segue para a agenda, como antes.
 */
export function interpretarComando(texto: string): ComandoInstagram | null {
  const original = (texto || "").trim();
  if (ehDoRobo(original)) return null;
  const t = plano(original).replace(/[.!?]+$/, "");
  if (!t) return null;

  if (/^(?:ajuda|comandos)\s+(?:do\s+)?(?:instagram|insta|post)/.test(t))
    return { tipo: "ajuda" };

  // "cancelar carrossel", "cancela o reel", "vetar tudo", "cancelar"
  const cancelar = t.match(
    /^(?:cancel[ae]r?|vet[ae]r?|descart[ae]r?)\b\s*(?:o|a|os|as)?\s*(.*)$/,
  );
  if (cancelar) {
    const resto = cancelar[1];
    if (/^(?:tudo|todos|todas)/.test(resto)) return { tipo: "cancelar", alvo: "tudo" };
    if (/^carrossel/.test(resto)) return { tipo: "cancelar", alvo: "carrossel" };
    if (/^(?:reel|reels|video)/.test(resto)) return { tipo: "cancelar", alvo: "reel" };
    if (!resto || /^(?:post|postagem|rascunho|esse|este|isso)/.test(resto))
      return { tipo: "cancelar", alvo: "rascunho" };
    return null; // "cancelar a reunião de quinta" não é conosco
  }

  if (/^(?:refaz|refazer|refaca|outra versao|outro|de novo|tenta de novo)\b/.test(t))
    return { tipo: "refazer" };

  // "publicar", "publica agora", "aprovar", "publicar terça 19h"
  const publicar = t.match(
    /^(?:public[ae]r?|aprov[ae]r?|aprovado|pode publicar|pode postar)\b\s*(.*)$/,
  );
  if (publicar)
    return {
      tipo: "publicar",
      quando: publicar[1].replace(/^(?:agora|ja)\b\s*/, "").trim(),
    };

  const criar = t.match(RE_CRIAR);
  if (criar) {
    // Recorta a ideia do texto ORIGINAL (com acento e caixa), pelo mesmo tamanho do gatilho.
    const ideia = original
      .slice(criar[0].length)
      .replace(/^[\s:,.-]+/, "")
      .trim();
    return ideia.length >= 4 ? { tipo: "criar", ideia } : { tipo: "ajuda" };
  }
  return null;
}

const DIAS: Record<string, number> = {
  domingo: 0,
  segunda: 1,
  terca: 2,
  quarta: 3,
  quinta: 4,
  sexta: 5,
  sabado: 6,
};

// Sem hora dita, vale o horário em que o perfil costuma postar.
const HORA_PADRAO = 19;
const FUSO_SP_HORAS = 3;

/**
 * "terça 19h", "amanhã às 8", "hoje 20h", "sexta" → o instante (ISO, UTC), em
 * horário de Brasília. Texto vazio = agora. Devolve null se não entender, ou
 * se o horário já passou.
 */
export function interpretarQuando(texto: string, agora: Date): string | null {
  const t = plano(texto);
  if (!t) return agora.toISOString();

  const h =
    t.match(/(\d{1,2})\s*(?:h|:|hs|horas?)\s*(\d{2})?/) ||
    t.match(/\bas\s+(\d{1,2})\b/);
  const hora = h ? Number(h[1]) : HORA_PADRAO;
  if (!Number.isInteger(hora) || hora < 0 || hora > 23) return null;

  const nomeDia = Object.keys(DIAS).find((d) => new RegExp(`\\b${d}`).test(t));
  if (nomeDia) return proximaOcorrencia(agora, { dia: DIAS[nomeDia], hora });

  const emSP = new Date(agora.getTime() - FUSO_SP_HORAS * 3_600_000);
  const deslocamento = /\bamanha\b/.test(t) ? 1 : /\bhoje\b/.test(t) || h ? 0 : null;
  if (deslocamento === null) return null;
  const instante = Date.UTC(
    emSP.getUTCFullYear(),
    emSP.getUTCMonth(),
    emSP.getUTCDate() + deslocamento,
    hora + FUSO_SP_HORAS,
    0,
    0,
  );
  return instante > agora.getTime() ? new Date(instante).toISOString() : null;
}

export const AJUDA_INSTAGRAM = [
  `${MARCA_ROBO} *Instagram pelo WhatsApp*`,
  "",
  "• *post* + a ideia — eu monto o carrossel e te mando a prévia",
  "   ex.: _post por que o discipulado acontece à mesa_",
  "• *publicar* — vai ao ar agora",
  "• *publicar terça 19h* — fica agendado",
  "• *refazer* — faço outra versão",
  "• *cancelar* — descarto o rascunho",
  "• *cancelar carrossel*, *cancelar reel* ou *cancelar tudo* — tiro da fila o que o piloto agendou",
  "",
  "Pode mandar por áudio também.",
].join("\n");
