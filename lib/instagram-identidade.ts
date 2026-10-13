/**
 * A identidade de cada conta de Instagram nas peças (issue #264): o que
 * assina as artes e como os textos da IA chamam o ministério. Parte pura —
 * serve à rota que desenha a imagem, às telas e aos testes.
 */

/** A assinatura das artes quando a conta não diz outra (a conta principal). */
export const MARCA_PADRAO = "Ekballo Academy";
/** O @ que o modelo "muro" escreve quando a conta não tem o seu. */
export const ARROBA_PADRAO = "@brunofesantos";

const TAMANHO_MAX = 40;

export type Identidade = {
  /** O que assina as artes. */
  marca?: string;
  /** O @ do perfil, com arroba. */
  arroba?: string;
};

function limpo(v: string | null | undefined): string {
  return (v ?? "").trim().slice(0, TAMANHO_MAX);
}

/** A identidade de uma conta cadastrada. */
export function identidadeDaConta(c: {
  assinatura: string;
  usuario: string;
}): Identidade {
  const marca = limpo(c.assinatura);
  const usuario = limpo(c.usuario).replace(/^@+/, "");
  return {
    ...(marca ? { marca } : {}),
    ...(usuario ? { arroba: `@${usuario}` } : {}),
  };
}

/**
 * Põe a identidade no endereço da imagem. O que é igual ao padrão não entra:
 * os endereços da conta principal ficam exatamente como eram, e as imagens
 * dela já guardadas continuam valendo.
 */
export function identidadeNoEndereco(p: URLSearchParams, i?: Identidade | null): void {
  const marca = limpo(i?.marca);
  const arroba = limpo(i?.arroba);
  if (marca && marca !== MARCA_PADRAO) p.set("marca", marca);
  if (arroba && arroba !== ARROBA_PADRAO) p.set("arroba", arroba);
}

/** Lê a identidade do endereço da imagem, já com o padrão no que não veio. */
export function identidadeDoEndereco(p: URLSearchParams): Required<Identidade> {
  return {
    marca: limpo(p.get("marca")) || MARCA_PADRAO,
    arroba: limpo(p.get("arroba")) || ARROBA_PADRAO,
  };
}

/**
 * Como os textos da IA apresentam o ministério. A conta principal continua
 * sendo "o Ekballo", um ministério de discipulado; nas outras, só o nome dado
 * à conta — o resto a IA tira do Perfil de conteúdo dela.
 */
export function ministerioParaIA(nome?: string | null): string {
  const n = (nome ?? "").trim().slice(0, 80);
  return n
    ? `um ministério cristão (${n})`
    : "um ministério cristão de discipulado (Ekballo)";
}
