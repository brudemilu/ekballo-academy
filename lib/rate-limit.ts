// =============================================================
// EKBALLO ACADEMY · Limite de tentativas
//
// Guarda as rotas que custam dinheiro ou abrem porta:
//
// - `/api/recuperar-senha` dispara mensagem no WhatsApp a cada
//   chamada. Sem limite, alguém de fora consegue queimar a cota do
//   gateway e encher de mensagem o telefone de um aluno.
// - `/api/recuperar-senha/confirmar` valida um código de 6 dígitos.
//   São um milhão de combinações: sem limite, dá para varrer todas
//   e entrar na conta de qualquer pessoa.
//
// POR QUE EM MEMÓRIA, e quando isso deixa de servir:
// o app roda hoje como UMA réplica no Swarm (`1/1`). Com uma
// réplica, um mapa em memória conta certo e não custa dependência
// nenhuma. Se um dia subir para duas réplicas, cada uma passa a
// contar metade e o limite efetivo dobra silenciosamente — é a
// hora de trocar por uma contagem compartilhada (uma tabela no
// Postgres já resolve; não precisa de Redis para este volume).
// Está escrito aqui para que a troca aconteça por decisão, não por
// susto.
// =============================================================

type Janela = { inicio: number; contagem: number };

const JANELAS = new Map<string, Janela>();

// Faxina preguiçosa: sem isso o mapa cresceria para sempre num
// processo que fica meses de pé. Roda no máximo uma vez por minuto,
// e só quando alguém chama o limitador.
let ultimaFaxina = 0;
function faxinar(agora: number) {
  if (agora - ultimaFaxina < 60_000) return;
  ultimaFaxina = agora;
  for (const [chave, janela] of JANELAS) {
    // 1h cobre com folga a maior janela em uso.
    if (agora - janela.inicio > 3_600_000) JANELAS.delete(chave);
  }
}

export type Veredito = {
  permitido: boolean;
  restantes: number;
  /** Segundos até a janela abrir de novo. Vira o cabeçalho Retry-After. */
  esperarSegundos: number;
};

/**
 * Janela deslizante simples.
 *
 * @param chave    quem está sendo contado (ver `chaveDoPedido`)
 * @param limite   quantas tentativas a janela aceita
 * @param janelaMs tamanho da janela
 */
export function limitar(chave: string, limite: number, janelaMs: number): Veredito {
  const agora = Date.now();
  faxinar(agora);

  const atual = JANELAS.get(chave);
  if (!atual || agora - atual.inicio >= janelaMs) {
    JANELAS.set(chave, { inicio: agora, contagem: 1 });
    return { permitido: true, restantes: limite - 1, esperarSegundos: 0 };
  }

  atual.contagem++;
  const restantes = Math.max(0, limite - atual.contagem);
  const permitido = atual.contagem <= limite;
  return {
    permitido,
    restantes,
    esperarSegundos: permitido
      ? 0
      : Math.ceil((atual.inicio + janelaMs - agora) / 1000),
  };
}

/**
 * De quem é este pedido.
 *
 * Atrás do Traefik, `request.ip` não existe — o que chega é o
 * cabeçalho `x-forwarded-for`, e o PRIMEIRO endereço dele é o
 * cliente real (os seguintes são os proxies do caminho). Quem lê o
 * último acaba limitando o próprio proxy, o que na prática limita
 * a plataforma inteira de uma vez.
 *
 * Este cabeçalho é forjável por quem fala direto com o app. Aqui
 * ele só é confiável porque o Traefik é a única porta de entrada e
 * reescreve o valor. Se um dia a porta 3000 ficar exposta, isto
 * deixa de valer.
 */
export function chaveDoPedido(req: Request, prefixo: string): string {
  const xff = req.headers.get("x-forwarded-for") ?? "";
  const ip =
    xff.split(",")[0]?.trim() || req.headers.get("x-real-ip")?.trim() || "desconhecido";
  return `${prefixo}:${ip}`;
}

/** Resposta 429 com o cabeçalho que o navegador entende. */
export function respostaExcedida(veredito: Veredito, mensagem: string): Response {
  return new Response(JSON.stringify({ ok: false, erro: mensagem }), {
    status: 429,
    headers: {
      "content-type": "application/json",
      "retry-after": String(veredito.esperarSegundos),
    },
  });
}

/** Só para os testes: zera o estado entre um caso e outro. */
export function _limparTudo() {
  JANELAS.clear();
  ultimaFaxina = 0;
}
