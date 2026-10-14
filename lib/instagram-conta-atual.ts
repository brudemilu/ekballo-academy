/**
 * Qual conta de Instagram está em uso NESTA execução (issue #264, servidor).
 *
 * Três fontes, nesta ordem:
 *
 *  1. `comConta(id, fn)` — fixa a conta para tudo o que `fn` fizer, inclusive
 *     o que ela deixar rodando depois de a requisição responder. É o caminho de
 *     quem não tem navegador: os crons (que percorrem as contas) e os trabalhos
 *     em segundo plano (piloto, análise de cortes).
 *  2. O cabeçalho que o painel manda em cada chamada — a conta que ESTA aba
 *     está mostrando. Vem antes do cookie de propósito: com duas janelas
 *     abertas em contas diferentes, o cookie é o da última que trocou, e uma
 *     chamada da outra janela gravaria (ou publicaria) na conta errada.
 *  3. O cookie do painel — a conta que a pessoa escolheu no seletor. É o que
 *     decide qual conta a página abre.
 *
 * Sem nenhuma das três, vale a conta principal: é o que mantém funcionando,
 * sem mudança, tudo o que existia antes de haver mais de uma conta.
 *
 * As funções de dados (lib/db.ts) perguntam aqui em vez de receber a conta
 * por parâmetro: são dezenas de funções e de chamadas, e um parâmetro
 * esquecido gravaria na conta errada em silêncio.
 */
import { AsyncLocalStorage } from "node:async_hooks";
import { cookies, headers } from "next/headers";
import {
  CABECALHO_CONTA,
  CONTA_PRINCIPAL_ID,
  COOKIE_CONTA,
  ehIdDeConta,
} from "@/lib/instagram-contas";

const escopo = new AsyncLocalStorage<string>();

/** Roda `fn` com a conta fixada. Vale para todo o trabalho que `fn` iniciar. */
export function comConta<T>(contaId: string, fn: () => T): T {
  return escopo.run(contaId, fn);
}

/** A conta escolhida no painel (cookie), ou null fora de uma requisição. */
export async function contaDoCookie(): Promise<string | null> {
  try {
    const valor = (await cookies()).get(COOKIE_CONTA)?.value;
    return ehIdDeConta(valor) ? valor : null;
  } catch {
    // Fora de uma requisição (cron já respondido, trabalho em segundo plano).
    return null;
  }
}

/** A conta que a aba do painel disse estar mostrando, na chamada à API. */
async function contaDoCabecalho(): Promise<string | null> {
  try {
    const valor = (await headers()).get(CABECALHO_CONTA);
    return ehIdDeConta(valor) ? valor : null;
  } catch {
    return null;
  }
}

export async function contaAtualId(): Promise<string> {
  return (
    escopo.getStore() ??
    (await contaDoCabecalho()) ??
    (await contaDoCookie()) ??
    CONTA_PRINCIPAL_ID
  );
}
