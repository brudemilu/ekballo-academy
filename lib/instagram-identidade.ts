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

/**
 * A assinatura que a arte escreve. `undefined` = ninguém disse nada, vale a
 * da conta principal; texto vazio = a conta NÃO quer assinatura escrita
 * (a logo já diz de quem é a arte).
 */
export function marcaDaArte(marca: string | undefined): string {
  return marca === undefined ? MARCA_PADRAO : marca;
}

export type Identidade = {
  /** O que assina as artes. */
  marca?: string;
  /** O @ do perfil, com arroba. */
  arroba?: string;
  /** Endereço da logo que vai em toda arte. */
  logo?: string;
  /** A versão da logo para fundo escuro. */
  logoClara?: string;
  /** Texto escrito embaixo da logo (ex.: "2ª Região"). */
  legendaLogo?: string;
};

const LEGENDA_LOGO_MAX = 24;
const ENDERECO_MAX = 400;

/**
 * A logo só pode vir de dois lugares: do nosso Storage público ou de um
 * arquivo do próprio site (`/marcas/…`). A rota que desenha busca esse
 * endereço — sem a trava, ela viraria um buscador de URL alheia.
 */
export function logoPermitida(
  endereco: string | null | undefined,
  storagePublico: string,
): string {
  const v = (endereco ?? "").trim();
  if (!v || v.length > ENDERECO_MAX) return "";
  if (/^\/marcas\/[A-Za-z0-9._-]+\.(png|jpe?g)$/.test(v)) return v;
  const base = storagePublico.replace(/\/$/, "");
  if (base.length > 30 && v.startsWith(`${base}/`) && /\.(png|jpe?g)$/i.test(v))
    return v;
  return "";
}

/** O endereço público do nosso Storage, de onde as logos enviadas são lidas. */
export function storagePublico(supabaseUrl: string | undefined): string {
  const base = (supabaseUrl ?? "").replace(/\/$/, "");
  return base ? `${base}/storage/v1/object/public` : "";
}

function limpo(v: string | null | undefined): string {
  return (v ?? "").trim().slice(0, TAMANHO_MAX);
}

/** A identidade de uma conta cadastrada. */
export function identidadeDaConta(c: {
  assinatura: string;
  usuario: string;
  logo_url?: string | null;
  logo_clara_url?: string | null;
  logo_legenda?: string | null;
}): Identidade {
  const marca = limpo(c.assinatura);
  const usuario = limpo(c.usuario).replace(/^@+/, "");
  const logo = (c.logo_url ?? "").trim();
  const logoClara = (c.logo_clara_url ?? "").trim();
  const legendaLogo = (c.logo_legenda ?? "").trim().slice(0, LEGENDA_LOGO_MAX);
  return {
    ...(marca ? { marca } : {}),
    ...(usuario ? { arroba: `@${usuario}` } : {}),
    // A legenda só existe embaixo de uma logo.
    ...(logo
      ? {
          logo,
          ...(logoClara ? { logoClara } : {}),
          ...(legendaLogo ? { legendaLogo } : {}),
        }
      : {}),
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
  const logo = (i?.logo ?? "").trim();
  if (logo) {
    // Com a logo na arte, a assinatura escrita sobra (pedido do Bruno).
    p.delete("marca");
    p.set("semmarca", "1");
    p.set("logo", logo);
    const clara = (i?.logoClara ?? "").trim();
    if (clara) p.set("logoc", clara);
    const legenda = (i?.legendaLogo ?? "").trim().slice(0, LEGENDA_LOGO_MAX);
    if (legenda) p.set("logot", legenda);
  }
}

/**
 * Lê o selo do endereço da imagem. `null` = arte sem selo (o padrão, e o que
 * acontece quando a logo pedida não é de um lugar permitido).
 */
export function seloDoEndereco(
  p: URLSearchParams,
  onde: { storagePublico: string; origem: string },
): { logoSrc: string; logoClaraSrc: string; legenda: string } | null {
  const logo = logoPermitida(p.get("logo"), onde.storagePublico);
  if (!logo) return null;
  const clara = logoPermitida(p.get("logoc"), onde.storagePublico);
  const absoluto = (v: string) => (v.startsWith("/") ? `${onde.origem}${v}` : v);
  return {
    logoSrc: absoluto(logo),
    logoClaraSrc: clara ? absoluto(clara) : "",
    legenda: (p.get("logot") ?? "").trim().slice(0, LEGENDA_LOGO_MAX),
  };
}

/** Lê a identidade do endereço da imagem, já com o padrão no que não veio. */
export function identidadeDoEndereco(
  p: URLSearchParams,
): Required<Pick<Identidade, "marca" | "arroba">> {
  return {
    marca: p.get("semmarca") === "1" ? "" : limpo(p.get("marca")) || MARCA_PADRAO,
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
