// =============================================================
// EKBALLO ACADEMY · "Leia Stott (cap. 3, p. 33-40): …" no guia de estudo
//
// Os guias do Perspectivas mandam ler capítulos do livro e artigos da
// plataforma, e essas leituras JÁ são aulas da mesma lição ("Lição 1 ·
// Leitura — Stott, cap. 3: O Deus vivo é um Deus missionário"). Este módulo
// acha a indicação no parágrafo e descobre qual aula ela aponta, para o
// leitor abrir a leitura numa janela ao lado do guia.
//
// Puro de propósito (roda no cliente e nos testes). A grafia do guia é a do
// original, com erro e tudo — "platafomra", "L. Mac" para "L. Mak", "cap,
// 116", "Pp." —, então o casamento pontua por capítulo, autor e palavras do
// título em vez de exigir igualdade.
// =============================================================

export type AulaTitulo = { id: string; titulo: string };

export type Indicacao = {
  /** Faixa clicável dentro do parágrafo: de "Leia" até o fim do título. */
  start: number;
  end: number;
  /** Capítulo do livro, quando o guia diz ("cap. 3"). */
  capitulo: number | null;
  /** "dentro do cap. 7": o texto é um quadro dentro do capítulo de outro autor. */
  dentro: boolean;
  /** Nomes que vêm antes do título ("Gallagher e Hawthorne"). */
  autores: string;
  /** Título da leitura como o guia escreveu. */
  titulo: string;
};

// Indicação de leitura é parágrafo que COMEÇA com "Leia" seguido de autor —
// "Leia em sua Bíblia", "Leia a história de Gênesis" e "Leia Isaías 56.6-7"
// são pedidos de leitura bíblica, que o popup do versículo já resolve.
const RE_INICIO = /^\s*Leia\s+/u;
const NAO_E_AUTOR =
  /^(?:em\s+sua\s+B[ií]blia|a\s+hist[oó]ria|a\s+se[cç][aã]o|o\s+texto|o\s+cap[ií]tulo|novamente|tamb[eé]m|com\s+aten)/iu;

// Prefixos que o guia põe antes do autor.
const RE_PREFIXO =
  /^(?:na\s+plata\w*\s*[:.,]?\s*)?(?:[oaq]\s+)?(?:artigo\s+)?(?:d[aoe]s?\s+)?/iu;

const RE_CAPITULO = /\bcap(?:[ií]tulo)?\s*[.,]?\s*(\d{1,3})/iu;

function normalizar(s: string): string {
  return s.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase();
}

const PALAVRAS_VAZIAS = new Set(
  "a o as os de da do das dos e em no na nos nas um uma uns umas para por com que se sua seu suas seus ao aos the of".split(
    " ",
  ),
);

function palavras(s: string): string[] {
  return normalizar(s)
    .split(/[^a-z0-9]+/)
    .filter((p) => p.length >= 3 && !PALAVRAS_VAZIAS.has(p));
}

/** Acha a indicação de leitura no começo do parágrafo, ou null. */
export function acharIndicacao(paragrafo: string): Indicacao | null {
  const inicio = RE_INICIO.exec(paragrafo);
  if (!inicio) return null;
  let resto = paragrafo.slice(inicio[0].length);
  if (NAO_E_AUTOR.test(resto)) return null;

  const prefixo = RE_PREFIXO.exec(resto);
  const desloc = inicio[0].length + (prefixo ? prefixo[0].length : 0);
  resto = paragrafo.slice(desloc);
  // Autor começa com maiúscula. "Leia Gênesis 3.14" e afins caem fora pelo
  // número logo depois do nome (é referência bíblica, não autor).
  if (!/^\p{Lu}/u.test(resto)) return null;
  if (/^\p{L}+\s+\d/u.test(resto) && !/\(/.test(resto.slice(0, 40))) return null;

  // Autor = até o primeiro "(", ":", "," ou aspas.
  // O ponto de uma inicial ("L. Mac") não encerra o nome.
  const fimAutor = resto.search(/\s*[(:,“"]|(?<!\b\p{Lu})\.\s/u);
  if (fimAutor <= 0) return null;
  const autores = resto.slice(0, fimAutor).trim();
  if (autores.length > 60) return null;

  // Parênteses com capítulo e página: "(cap. 3, p. 33-40)", "(dentro do cap. 7 …)".
  let posDepois = desloc + fimAutor;
  let depoisAutor = resto.slice(fimAutor);
  let capitulo: number | null = null;
  let dentro = false;
  const parenteses = /^\s*,?\s*\(([^)]*)\)/u.exec(depoisAutor);
  if (parenteses) {
    const cap = RE_CAPITULO.exec(parenteses[1]);
    capitulo = cap ? Number(cap[1]) : null;
    dentro = /dentro/i.test(parenteses[1]);
    depoisAutor = depoisAutor.slice(parenteses[0].length);
    posDepois += parenteses[0].length;
  }
  // "(dentro do capítulo 97)" também aparece no fim da frase.
  const capFinal = /\(dentro\s+do\s+cap(?:[ií]tulo)?\s*[.,]?\s*(\d{1,3})\)/iu.exec(
    paragrafo,
  );
  if (capFinal) {
    dentro = true;
    capitulo = capitulo ?? Number(capFinal[1]);
  }
  if (capitulo === null) {
    const cap = RE_CAPITULO.exec(depoisAutor.slice(0, 40));
    if (cap) capitulo = Number(cap[1]);
  }

  // Título: depois do ":" (ou entre aspas), até a pontuação que encerra.
  const t = /^\s*[,:.]?\s*[“"]?\s*/u.exec(depoisAutor);
  const tituloInicio = t ? t[0].length : 0;
  const corpo = depoisAutor.slice(tituloInicio);
  const corte = corpo.search(
    /[”"(;]|\.(?:\s|$)|,?\s(?:at[eé]|a\s+partir|do\s+in[ií]cio|come[cç]ando|somente|toda|a\s+se[cç][aã]o|os?\s+par[aá]grafos?|desde|e\s+veja|NB)[\s,]/u,
  );
  const titulo = (corte === -1 ? corpo : corpo.slice(0, corte)).trimEnd();

  return {
    start: inicio[0].search(/\S/),
    end: titulo ? posDepois + tituloInicio + titulo.length : posDepois,
    capitulo,
    dentro,
    autores,
    titulo,
  };
}

/** "Lição 4 · Guia de estudo — …" → 4. */
export function licaoDoTitulo(titulo: string): number | null {
  const m = /^Li[cç][aã]o\s+(\d+)\b/iu.exec(titulo);
  return m ? Number(m[1]) : null;
}

type Leitura = {
  id: string;
  licao: number | null;
  capitulo: number | null;
  autores: string[];
  titulo: string[];
};

/** "Lição 1 · Leitura — Stott, cap. 3: O Deus vivo…" → partes comparáveis. */
function lerLeitura(a: AulaTitulo): Leitura | null {
  const m = /·\s*Leitura\s*[—–-]\s*(.+)$/u.exec(a.titulo);
  if (!m) return null;
  const resto = m[1];
  const doisPontos = resto.indexOf(":");
  const cabeca = doisPontos === -1 ? resto : resto.slice(0, doisPontos);
  const titulo = doisPontos === -1 ? resto : resto.slice(doisPontos + 1);
  const cap = RE_CAPITULO.exec(cabeca);
  return {
    id: a.id,
    licao: licaoDoTitulo(a.titulo),
    capitulo: cap ? Number(cap[1]) : null,
    autores: palavras(cabeca.replace(RE_CAPITULO, "")),
    titulo: palavras(titulo),
  };
}

function sobreposicao(a: string[], b: string[]): number {
  if (a.length === 0 || b.length === 0) return 0;
  const conj = new Set(b);
  const comuns = a.filter((p) => conj.has(p)).length;
  return comuns / Math.min(a.length, b.length);
}

/**
 * Qual aula a indicação aponta. Procura primeiro na mesma lição do guia —
 * leitura pedida por duas lições é duplicada de propósito, uma em cada —, e
 * só depois no livro todo. Devolve null quando nada convence: melhor deixar
 * o texto sem link do que abrir a leitura errada.
 */
export function casarLeitura(
  indicacao: Indicacao,
  aulas: AulaTitulo[],
  licaoAtual: number | null,
): string | null {
  const leituras = aulas.map(lerLeitura).filter((l): l is Leitura => l !== null);
  const autores = palavras(indicacao.autores);
  const titulo = palavras(indicacao.titulo);

  const pontuar = (l: Leitura): number => {
    const autor = sobreposicao(autores, l.autores);
    const tit = sobreposicao(titulo, l.titulo);
    // Capítulo igual é o sinal mais forte — mas num quadro "dentro do cap. 7"
    // o capítulo é do hospedeiro, e a leitura própria tem outro autor.
    const capIgual = indicacao.capitulo !== null && l.capitulo === indicacao.capitulo;
    let pontos = autor * 2 + tit * 1.5;
    // Sem a leitura própria do quadro, o capítulo hospedeiro é onde ele mora.
    if (capIgual) pontos += indicacao.dentro ? 1.5 : 3;
    // Capítulo diferente é outro texto — vale também para o quadro: o
    // "Travis (dentro do capítulo 97)" não é o Travis do cap. 98.
    if (indicacao.capitulo !== null && l.capitulo !== null && !capIgual) {
      pontos -= 2;
    }
    return pontos;
  };

  const melhor = (lista: Leitura[]) => {
    let alvo: Leitura | null = null;
    let max = 0;
    for (const l of lista) {
      const p = pontuar(l);
      if (p > max) {
        max = p;
        alvo = l;
      }
    }
    // Abaixo disso é coincidência de uma palavra solta.
    return max >= 1.5 ? alvo : null;
  };

  const daLicao =
    licaoAtual === null ? [] : leituras.filter((l) => l.licao === licaoAtual);
  return (melhor(daLicao) ?? melhor(leituras))?.id ?? null;
}
