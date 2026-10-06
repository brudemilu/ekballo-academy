/**
 * Crescimento do perfil (issue #225): o que diz se um post trouxe gente nova.
 *
 * O painel media posts feitos e curtidas. Mas o objetivo é seguidor novo, e
 * isso depende de o post chegar a quem ainda não segue — o que acontece
 * quando ele é ENVIADO adiante e SALVO. Aqui ficam essas contas.
 *
 * Como lib/painel.ts, tudo é conta sobre os números do próprio perfil: nenhuma
 * IA, nenhuma opinião. O diagnóstico é uma lista de regras fixas, cada uma
 * com o número que a disparou. Testado em testes/crescimento.test.ts.
 */
import { somarDias } from "@/lib/conteudo-calendario";
import { type PostPainel, postsNaJanela } from "@/lib/painel";

export const JANELA_CRESCIMENTO_DIAS = 30;

/** Menos posts que isto e as comparações viram ruído. */
export const MINIMO_PARA_COMPARAR = 3;

export type FormatoCrescimento = "reel" | "carrossel" | "imagem";

export const NOME_FORMATO: Record<FormatoCrescimento, string> = {
  reel: "Reel",
  carrossel: "Carrossel",
  imagem: "Imagem única",
};

export function formatoDoPost(p: PostPainel): FormatoCrescimento {
  if (p.reel || p.mediaType === "VIDEO") return "reel";
  if (p.mediaType === "CAROUSEL_ALBUM") return "carrossel";
  return "imagem";
}

function mediana(valores: number[]): number {
  if (!valores.length) return 0;
  const v = [...valores].sort((a, b) => a - b);
  const meio = Math.floor(v.length / 2);
  return v.length % 2 ? v[meio] : (v[meio - 1] + v[meio]) / 2;
}

const soma = (valores: (number | null | undefined)[]) =>
  valores.reduce<number>((s, x) => s + (typeof x === "number" ? x : 0), 0);

/** Algum post da lista traz o número? (senão a tela mostra "sem dado", não zero) */
const temDado = (valores: (number | null | undefined)[]) =>
  valores.some((x) => typeof x === "number");

export type ResumoCrescimento = {
  dias: number;
  posts: number;
  /** Alcance típico de um post (mediana); null sem dado de alcance. */
  alcanceTipico: number | null;
  /** O alcance típico como fração dos seguidores (0,15 = 15%). */
  alcanceSobreSeguidores: number | null;
  /** Totais do período; null quando o Instagram não informou para nenhum post. */
  compartilhamentos: number | null;
  salvos: number | null;
  seguiuPelosPosts: number | null;
  visitasPerfil: number | null;
  /** A cada 100 pessoas alcançadas, quantas enviaram o post adiante. */
  enviosPorCemAlcancados: number | null;
};

export function resumoDoCrescimento(
  posts: PostPainel[],
  hoje: string,
  seguidores: number | null,
  dias = JANELA_CRESCIMENTO_DIAS,
): ResumoCrescimento {
  const p = postsNaJanela(posts, hoje, dias);
  const alcances = p
    .map((x) => x.reach)
    .filter((x): x is number => typeof x === "number");
  const alcanceTipico = alcances.length ? Math.round(mediana(alcances)) : null;
  const comp = p.map((x) => x.compartilhamentos);
  const alcanceTotal = soma(alcances);
  return {
    dias,
    posts: p.length,
    alcanceTipico,
    alcanceSobreSeguidores:
      alcanceTipico !== null && seguidores ? alcanceTipico / seguidores : null,
    compartilhamentos: temDado(comp) ? soma(comp) : null,
    salvos: temDado(p.map((x) => x.salvos)) ? soma(p.map((x) => x.salvos)) : null,
    seguiuPelosPosts: temDado(p.map((x) => x.seguiu))
      ? soma(p.map((x) => x.seguiu))
      : null,
    visitasPerfil: temDado(p.map((x) => x.visitasPerfil))
      ? soma(p.map((x) => x.visitasPerfil))
      : null,
    enviosPorCemAlcancados:
      temDado(comp) && alcanceTotal > 0 ? (soma(comp) / alcanceTotal) * 100 : null,
  };
}

export type LinhaFormato = {
  formato: FormatoCrescimento;
  posts: number;
  alcanceTipico: number | null;
  /** Média por post. */
  compartilhamentos: number | null;
  salvos: number | null;
  interacoes: number;
};

/** Como cada formato se saiu no período, do mais usado ao menos. */
export function porFormato(
  posts: PostPainel[],
  hoje: string,
  dias = 90,
): LinhaFormato[] {
  const p = postsNaJanela(posts, hoje, dias);
  const linhas: LinhaFormato[] = [];
  for (const formato of ["reel", "carrossel", "imagem"] as const) {
    const grupo = p.filter((x) => formatoDoPost(x) === formato);
    if (!grupo.length) continue;
    const alcances = grupo
      .map((x) => x.reach)
      .filter((x): x is number => typeof x === "number");
    const media = (valores: (number | null | undefined)[]) =>
      temDado(valores) ? soma(valores) / grupo.length : null;
    linhas.push({
      formato,
      posts: grupo.length,
      alcanceTipico: alcances.length ? Math.round(mediana(alcances)) : null,
      compartilhamentos: media(grupo.map((x) => x.compartilhamentos)),
      salvos: media(grupo.map((x) => x.salvos)),
      interacoes: soma(grupo.map((x) => x.interacoes)) / grupo.length,
    });
  }
  return linhas.sort((a, b) => b.posts - a.posts);
}

/**
 * Quanto um post "andou": cada envio e cada salvamento é alguém que achou
 * que valia para outra pessoa ou para depois, e cada seguidor novo é o
 * objetivo em si. Os pesos são simples de propósito — é uma ordem, não uma nota.
 */
export function forcaDeCrescimento(p: PostPainel): number {
  return (p.compartilhamentos ?? 0) * 2 + (p.salvos ?? 0) * 2 + (p.seguiu ?? 0) * 10;
}

export type PostQueCresceu = {
  post: PostPainel;
  formato: FormatoCrescimento;
  /** Por que entrou na lista, com os números. */
  motivo: string;
};

/** Os posts que mais foram enviados, salvos ou trouxeram seguidor. */
export function postsQueMaisCresceram(
  posts: PostPainel[],
  hoje: string,
  max = 3,
  dias = 90,
): PostQueCresceu[] {
  return postsNaJanela(posts, hoje, dias)
    .filter((p) => forcaDeCrescimento(p) > 0)
    .sort((a, b) => forcaDeCrescimento(b) - forcaDeCrescimento(a))
    .slice(0, max)
    .map((post) => {
      const partes: string[] = [];
      if (post.seguiu)
        partes.push(plural(post.seguiu, "seguidor novo", "seguidores novos"));
      if (post.compartilhamentos)
        partes.push(plural(post.compartilhamentos, "envio", "envios"));
      if (post.salvos) partes.push(plural(post.salvos, "salvamento", "salvamentos"));
      return { post, formato: formatoDoPost(post), motivo: partes.join(" · ") };
    });
}

function plural(n: number, um: string, varios: string): string {
  return `${n} ${n === 1 ? um : varios}`;
}

export type Achado = {
  /** Identificador estável da regra — a tela usa como chave. */
  chave: string;
  titulo: string;
  /** O número que disparou a regra e o que fazer com ele. */
  detalhe: string;
};

/**
 * O que os números dizem, em frases. Regras fixas, da mais grave à mais leve.
 * Com poucos posts devolve só o aviso de que ainda não dá para dizer nada.
 */
export function diagnostico(
  posts: PostPainel[],
  hoje: string,
  seguidores: number | null,
): Achado[] {
  const p90 = postsNaJanela(posts, hoje, 90);
  if (p90.length < MINIMO_PARA_COMPARAR) {
    return [
      {
        chave: "poucos",
        titulo: "Ainda não há posts suficientes para um diagnóstico",
        detalhe: `São ${p90.length} nos últimos 90 dias; com ${MINIMO_PARA_COMPARAR} ou mais as comparações passam a valer.`,
      },
    ];
  }
  const achados: Achado[] = [];
  const r = resumoDoCrescimento(posts, hoje, seguidores, 90);

  if (r.alcanceSobreSeguidores !== null && r.alcanceSobreSeguidores < 0.35) {
    achados.push({
      chave: "bolha",
      titulo: "O perfil está falando só com quem já segue",
      detalhe: `Um post típico alcança ${r.alcanceTipico} pessoas — ${Math.round(r.alcanceSobreSeguidores * 100)}% dos seguidores. Para crescer, o post precisa chegar a quem não segue: Reel com você falando e conteúdo que as pessoas enviam umas às outras.`,
    });
  }

  if (r.seguiuPelosPosts !== null && r.seguiuPelosPosts <= 1) {
    achados.push({
      chave: "sem-seguidor",
      titulo: "Os posts quase não trazem seguidor novo",
      detalhe: `Nos últimos 90 dias, ${plural(r.seguiuPelosPosts, "pessoa passou", "pessoas passaram")} a seguir a partir de um post do feed (o Instagram não informa esse número para Reel).`,
    });
  }

  if (r.enviosPorCemAlcancados !== null && r.enviosPorCemAlcancados < 1.5) {
    achados.push({
      chave: "pouco-envio",
      titulo: "Pouca gente envia os posts adiante",
      detalhe: `A cada 100 pessoas alcançadas, ${r.enviosPorCemAlcancados.toFixed(1).replace(".", ",")} enviaram o post. É o envio que leva o post a quem não segue. Teste fechar com "mande para quem precisa ler isso" e escrever para a dor de uma pessoa específica.`,
    });
  }

  if (r.salvos !== null && r.salvos <= p90.length / 4) {
    achados.push({
      chave: "pouco-salvo",
      titulo: "Quase ninguém salva",
      detalhe: `${plural(r.salvos, "salvamento", "salvamentos")} em ${p90.length} posts. Salva-se o que serve para depois: lista, passo a passo, oração para um momento, versículos para uma situação.`,
    });
  }

  // O formato que mais anda, quando há base para comparar dois.
  const formatos = porFormato(posts, hoje, 90).filter(
    (f) => f.posts >= MINIMO_PARA_COMPARAR && f.compartilhamentos !== null,
  );
  if (formatos.length >= 2) {
    const [melhor, ...resto] = [...formatos].sort(
      (a, b) => (b.compartilhamentos ?? 0) - (a.compartilhamentos ?? 0),
    );
    const pior = resto[resto.length - 1];
    if ((melhor.compartilhamentos ?? 0) > (pior.compartilhamentos ?? 0) * 1.3) {
      achados.push({
        chave: "formato",
        titulo: `${NOME_FORMATO[melhor.formato]} é o formato mais enviado`,
        detalhe: `Em média ${(melhor.compartilhamentos ?? 0).toFixed(1).replace(".", ",")} envios por post, contra ${(pior.compartilhamentos ?? 0).toFixed(1).replace(".", ",")} de ${NOME_FORMATO[pior.formato].toLowerCase()}. Vale fazer mais dele.`,
      });
    }
  }

  // Constância: semanas inteiras sem post nos últimos 30 dias.
  const ultimos30 = postsNaJanela(posts, hoje, 30).length;
  if (ultimos30 < 8) {
    achados.push({
      chave: "ritmo",
      titulo: "O ritmo está baixo para crescer",
      detalhe: `${plural(ultimos30, "post", "posts")} nos últimos 30 dias (desde ${somarDias(hoje, -29).split("-").reverse().slice(0, 2).join("/")}). Quem cresce costuma manter de 3 a 5 por semana, com Reel na maioria.`,
    });
  }

  return achados;
}
