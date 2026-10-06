// Painel de novos cadastros (issue #217).
//
// A pergunta que o painel responde é "quem chegou e está esperando por mim?".
// Por isso quem aguarda liberação aparece SEMPRE, não importa há quanto tempo
// se cadastrou — em out/2026 havia gente parada desde o mês anterior, e uma
// janela de dias teria escondido justamente esses. Quem já foi liberado fica
// só enquanto ainda é novidade, para o líder ver o que acabou de resolver.

export const DIAS_COMO_RECENTE = 14;

const UM_DIA = 24 * 60 * 60 * 1000;

type Cadastro = {
  is_admin: boolean;
  acesso_liberado: boolean;
  created_at: string;
};

function instante(criadoEm: string): number {
  const t = Date.parse(criadoEm);
  return Number.isNaN(t) ? 0 : t;
}

export function aguardaLiberacao(c: Cadastro): boolean {
  return !c.is_admin && !c.acesso_liberado;
}

// Pendentes primeiro (é o que pede ação), depois os liberados há pouco;
// dentro de cada grupo, do mais novo para o mais antigo.
export function novosCadastros<T extends Cadastro>(
  alunos: T[],
  agora: number = Date.now(),
): T[] {
  const janela = DIAS_COMO_RECENTE * UM_DIA;
  return alunos
    .filter(
      (a) =>
        !a.is_admin && (aguardaLiberacao(a) || agora - instante(a.created_at) < janela),
    )
    .sort((a, b) => {
      const pa = aguardaLiberacao(a) ? 0 : 1;
      const pb = aguardaLiberacao(b) ? 0 : 1;
      if (pa !== pb) return pa - pb;
      return instante(b.created_at) - instante(a.created_at);
    });
}
