/**
 * Gera as peças de uma semana a partir de UMA fonte: carrossel + story numa
 * chamada à IA, roteiro de Reel na outra, em paralelo. Usado pelo pacote da
 * semana (o pastor pede) e pelo piloto automático (o cron pede) — issue #189.
 *
 * Só gera; quem chama decide o que fazer com o resultado (rascunho ou agendado).
 */
import {
  contextoDoPerfil,
  type PerfilConteudo,
  type ReferenciaConteudo,
} from "@/lib/conteudo-perfil";
import { instrucaoDoModelo, MODELO_AUTOMATICO } from "@/lib/instagram-modelos";
import { TEMA_PADRAO } from "@/lib/instagram-render";
import { chamarLLMLendo } from "@/lib/llm";
import {
  normalizarPacote,
  type PecasPacote,
  systemPacote,
  usuarioPacote,
} from "@/lib/pacote";
import {
  type Duracao,
  type FonteRoteiro,
  normalizarRoteiro,
  type Roteiro,
  systemRoteiro,
  usuarioRoteiro,
} from "@/lib/roteiro";

export type PecasGeradas = {
  /** Carrossel + story; null se essa chamada falhou. */
  pecas: PecasPacote | null;
  roteiro: Roteiro | null;
  /** Mensagem da falha de cada chamada, quando houve. */
  erros: { pecas?: string; roteiro?: string };
};

export async function gerarPecasDaFonte(
  fonte: FonteRoteiro,
  opcoes: {
    perfil: PerfilConteudo;
    /** A forma de um criador vale só para o Reel: é nele que gancho e ritmo importam. */
    referencia?: ReferenciaConteudo | null;
    foco?: string;
    duracaoReel: Duracao;
    /** false = não gasta a chamada (o piloto pode estar com a peça desligada). */
    comPecas?: boolean;
    comRoteiro?: boolean;
  },
): Promise<PecasGeradas> {
  const {
    perfil,
    referencia,
    foco,
    duracaoReel,
    comPecas = true,
    comRoteiro = true,
  } = opcoes;
  const [pecasR, roteiroR] = await Promise.allSettled([
    comPecas
      ? chamarLLMLendo(
          `${systemPacote(contextoDoPerfil(perfil))}\n\n${instrucaoDoModelo(MODELO_AUTOMATICO)}`,
          usuarioPacote(fonte, foco),
          2400,
          normalizarPacote,
        )
      : Promise.resolve(null),
    comRoteiro
      ? chamarLLMLendo(
          systemRoteiro(duracaoReel, contextoDoPerfil(perfil, referencia)),
          usuarioRoteiro(fonte, foco),
          2200,
          normalizarRoteiro,
        )
      : Promise.resolve(null),
  ]);
  const motivo = (r: PromiseRejectedResult) =>
    r.reason instanceof Error ? r.reason.message : "falha na IA";
  return {
    pecas: pecasR.status === "fulfilled" ? pecasR.value : null,
    roteiro: roteiroR.status === "fulfilled" ? roteiroR.value : null,
    erros: {
      ...(pecasR.status === "rejected" ? { pecas: motivo(pecasR) } : {}),
      ...(roteiroR.status === "rejected" ? { roteiro: motivo(roteiroR) } : {}),
    },
  };
}

/** Os slides do carrossel no formato que o estúdio e a publicação esperam. */
export function slidesParaSalvar(pecas: PecasPacote) {
  return pecas.carrossel.slides.map((s) => ({
    ...s,
    cor: "#C9A961",
    fonte: "anton",
    top: "",
    ref: "",
    seed: Math.floor(Math.random() * 1_000_000),
    tema: TEMA_PADRAO,
    tom: "escuro",
    modelo: MODELO_AUTOMATICO,
  }));
}
