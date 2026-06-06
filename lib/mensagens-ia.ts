/**
 * Variação de mensagem por pessoa.
 *
 * O Bruno não quer mandar o MESMO texto para todo mundo. Esta função pega o
 * "sentido" da mensagem (o template já com nome/curso) e devolve uma redação
 * única — via Llama (Cloudflare AI). Se a IA falhar/estiver sem credencial,
 * cai num banco de variações escritas à mão (rotacionado por índice), de modo
 * que nunca saia o texto idêntico para todos.
 *
 * Mesmas credenciais do gerador de carrossel: CLOUDFLARE_ACCOUNT_ID / CLOUDFLARE_API_TOKEN.
 */

const CF_BASE = "https://api.cloudflare.com/client/v4/accounts";

// Banco de variações (fallback) — {nome} e {curso} substituídos. Mesmo sentido,
// redações diferentes. Rotacionado por índice para não repetir entre pessoas.
const FALLBACK: string[] = [
  "Oi {nome}! Vi que você avançou em {curso} 🙌 Só faltou responder as perguntas de reflexão daquela aula. Reserva uns minutinhos? Elas ajudam demais a fixar o que você leu. Deus abençoe! 🙏",
  "{nome}, que alegria te ver caminhando em {curso}! 😊 Lembrei aqui que as atividades de reflexão ficaram pendentes. Quando puder, dá uma passada pra responder — vale muito a pena. Um abraço!",
  "Olá {nome}! Continua firme em {curso} 🔥 Faltou só uma coisinha: as perguntas de reflexão daquela aula. Separa um tempinho pra responder com calma, tá? Tamo junto! 🙏",
  "Oi {nome}! Passando pra te incentivar 💪 As reflexões de {curso} estão te esperando. Responder ajuda a levar o que você aprendeu pra vida. Conta comigo no que precisar!",
  "{nome}, tudo bem? Você está indo bem em {curso}! Só notei que as atividades de reflexão ficaram pra trás. Que tal reservar uns minutos hoje pra responder? Deus te abençoe! 🙏",
  "Olá {nome}! 🙌 Lembrete carinhoso: as perguntas de reflexão da sua aula de {curso} continuam abertas. Elas são rapidinhas e fazem diferença. Bora completar?",
  "Oi {nome}! Fico feliz com o seu avanço em {curso} 🎉 Faltou só responder as reflexões daquela aula. Quando der um tempinho, volta lá — vai te edificar bastante. Abraço!",
  "{nome}, uma palavrinha 😊 As atividades de reflexão de {curso} estão pendentes. Não precisa pressa, mas não deixa pra depois e esquecer, tá? Estou na torcida por você! 🙏",
  "Olá {nome}! Você marcou a aula como concluída em {curso}, mas as perguntas de reflexão ficaram em aberto. Responder fecha o ciclo do aprendizado — bora? 💛",
  "Oi {nome}! Só um empurrãozinho 🙏 As reflexões da sua aula de {curso} te esperam. Tira uns minutos pra meditar e responder — é aí que a Palavra ganha vida. Deus abençoe!",
];

function aplicarFallback(primeiroNome: string, curso: string, variante: number): string {
  const t = FALLBACK[((variante % FALLBACK.length) + FALLBACK.length) % FALLBACK.length];
  return t
    .replace(/\{nome\}/g, primeiroNome || "irmão(ã)")
    .replace(/\{curso\}/g, curso || "seus estudos");
}

const SYSTEM = `Você é um pastor/líder cristão brasileiro carinhoso escrevendo UMA mensagem curta de WhatsApp para um discípulo.
Objetivo: lembrar com gentileza que ele marcou a aula como concluída mas ainda não respondeu as ATIVIDADES DE REFLEXÃO do curso, e incentivá-lo a responder.
Regras:
- Português do Brasil, tom acolhedor e pessoal (nada de tom corporativo).
- Curta: 2 a 4 frases. Pode usar 1 ou 2 emojis, com moderação.
- Comece pelo primeiro nome da pessoa.
- Cite o nome do curso naturalmente.
- NÃO use markdown, listas, aspas, nem assinatura. Só o texto da mensagem.
- Varie a redação (cada mensagem deve soar diferente das outras), mantendo o mesmo sentido.`;

/**
 * Gera uma redação única. Retorna null se a IA falhar (caller usa fallback).
 */
export async function variarMensagemIA(
  primeiroNome: string,
  curso: string,
  variante: number,
): Promise<string | null> {
  const accountId = process.env.CLOUDFLARE_ACCOUNT_ID;
  const apiToken = process.env.CLOUDFLARE_API_TOKEN;
  if (!accountId || !apiToken) return null;

  const user = `Primeiro nome: ${primeiroNome || "(sem nome)"}
Curso: ${curso || "seus estudos"}
Escreva a mensagem (variação nº ${variante + 1}, deve soar diferente das outras).`;

  try {
    const ctrl = new AbortController();
    const timer = setTimeout(() => ctrl.abort(), 12000);
    const res = await fetch(
      `${CF_BASE}/${accountId}/ai/run/@cf/meta/llama-3.3-70b-instruct-fp8-fast`,
      {
        method: "POST",
        headers: { Authorization: `Bearer ${apiToken}`, "Content-Type": "application/json" },
        body: JSON.stringify({
          messages: [
            { role: "system", content: SYSTEM },
            { role: "user", content: user },
          ],
          max_tokens: 320,
          temperature: 0.9,
        }),
        signal: ctrl.signal,
      },
    );
    clearTimeout(timer);
    if (!res.ok) return null;
    const json = await res.json();
    const raw = json?.result?.response;
    if (typeof raw !== "string") return null;
    // limpa cercas/aspas que o modelo às vezes adiciona
    const txt = raw
      .replace(/```[a-z]*/gi, "")
      .replace(/```/g, "")
      .replace(/^["'“”]+|["'“”]+$/g, "")
      .replace(/\s{2,}/g, " ")
      .trim();
    if (txt.length < 15 || txt.length > 600) return null;
    return txt;
  } catch {
    return null;
  }
}

/**
 * Texto final para um destinatário: tenta IA, cai no banco de variações.
 * Garante que ninguém receba texto idêntico (fallback rotaciona por índice).
 */
export async function gerarTextoLembrete(
  primeiroNome: string,
  curso: string,
  variante: number,
): Promise<string> {
  const ia = await variarMensagemIA(primeiroNome, curso, variante);
  return ia ?? aplicarFallback(primeiroNome, curso, variante);
}
