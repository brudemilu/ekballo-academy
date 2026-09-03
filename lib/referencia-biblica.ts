// =============================================================
// EKBALLO ACADEMY · Referências bíblicas dentro do texto dos livros
//
// O leitor precisa reconhecer "Provérbios 29.18", "1Co 13.4-7" ou
// "1CORÍNTIOS 13.13—14.1" no meio da prosa por dois motivos:
//
//  1. realçar a referência (o olho acha o versículo sem reler o parágrafo);
//  2. descobrir que o parágrafo ANTERIOR é um versículo em bloco — no
//     acervo a citação bíblica quase sempre vem seguida de um parágrafo
//     que contém só a referência.
//
// Módulo puro de propósito: roda no cliente (AulaConteudo) e nos scripts
// de varredura, sem tocar no banco. A busca da Bíblia tem o seu próprio
// parser (lib/biblia-busca.ts), que resolve o livro contra a tabela —
// aqui o problema é outro: achar a referência DENTRO de um texto corrido.
// =============================================================

/**
 * Nome canônico + as formas que aparecem impressas. A ordem interna não
 * importa (o regex ordena por tamanho), mas a lista precisa cobrir o que
 * as editoras usam de fato: nome inteiro, abreviação com e sem ponto,
 * numeral arábico e romano.
 */
const LIVROS: { nome: string; formas: string[] }[] = [
  { nome: "Gênesis", formas: ["Gênesis", "Genesis", "Gn", "Gên"] },
  { nome: "Êxodo", formas: ["Êxodo", "Exodo", "Êx", "Ex"] },
  { nome: "Levítico", formas: ["Levítico", "Levitico", "Lv", "Lev"] },
  { nome: "Números", formas: ["Números", "Numeros", "Nm", "Núm"] },
  { nome: "Deuteronômio", formas: ["Deuteronômio", "Deuteronomio", "Dt", "Deut"] },
  { nome: "Josué", formas: ["Josué", "Josue", "Js", "Jos"] },
  { nome: "Juízes", formas: ["Juízes", "Juizes", "Jz"] },
  { nome: "Rute", formas: ["Rute", "Rt"] },
  { nome: "1 Samuel", formas: ["1 Samuel", "1Samuel", "I Samuel", "1 Sm", "1Sm", "1Sam"] },
  { nome: "2 Samuel", formas: ["2 Samuel", "2Samuel", "II Samuel", "2 Sm", "2Sm", "2Sam"] },
  { nome: "1 Reis", formas: ["1 Reis", "1Reis", "I Reis", "1 Rs", "1Rs"] },
  { nome: "2 Reis", formas: ["2 Reis", "2Reis", "II Reis", "2 Rs", "2Rs"] },
  { nome: "1 Crônicas", formas: ["1 Crônicas", "1 Cronicas", "1Crônicas", "I Crônicas", "1 Cr", "1Cr"] },
  { nome: "2 Crônicas", formas: ["2 Crônicas", "2 Cronicas", "2Crônicas", "II Crônicas", "2 Cr", "2Cr"] },
  { nome: "Esdras", formas: ["Esdras", "Ed"] },
  { nome: "Neemias", formas: ["Neemias", "Ne"] },
  { nome: "Ester", formas: ["Ester", "Et"] },
  { nome: "Jó", formas: ["Jó"] },
  { nome: "Salmos", formas: ["Salmos", "Salmo", "Sl", "Sal"] },
  { nome: "Provérbios", formas: ["Provérbios", "Proverbios", "Pv", "Prov"] },
  { nome: "Eclesiastes", formas: ["Eclesiastes", "Ec", "Ecl"] },
  { nome: "Cantares", formas: ["Cantares", "Cânticos", "Canticos", "Cantares de Salomão", "Ct"] },
  { nome: "Isaías", formas: ["Isaías", "Isaias", "Is"] },
  { nome: "Jeremias", formas: ["Jeremias", "Jr", "Jer"] },
  { nome: "Lamentações", formas: ["Lamentações", "Lamentacoes", "Lm"] },
  { nome: "Ezequiel", formas: ["Ezequiel", "Ez"] },
  { nome: "Daniel", formas: ["Daniel", "Dn", "Dan"] },
  { nome: "Oseias", formas: ["Oseias", "Oséias", "Os"] },
  { nome: "Joel", formas: ["Joel", "Jl"] },
  { nome: "Amós", formas: ["Amós", "Amos", "Am"] },
  { nome: "Obadias", formas: ["Obadias", "Ob"] },
  { nome: "Jonas", formas: ["Jonas", "Jn"] },
  { nome: "Miqueias", formas: ["Miqueias", "Miquéias", "Mq"] },
  { nome: "Naum", formas: ["Naum", "Na"] },
  { nome: "Habacuque", formas: ["Habacuque", "Hc"] },
  { nome: "Sofonias", formas: ["Sofonias", "Sf"] },
  { nome: "Ageu", formas: ["Ageu", "Ag"] },
  { nome: "Zacarias", formas: ["Zacarias", "Zc"] },
  { nome: "Malaquias", formas: ["Malaquias", "Ml"] },
  { nome: "Mateus", formas: ["Mateus", "Mt"] },
  { nome: "Marcos", formas: ["Marcos", "Mc"] },
  { nome: "Lucas", formas: ["Lucas", "Lc"] },
  { nome: "João", formas: ["João", "Joao", "Jo"] },
  { nome: "Atos", formas: ["Atos dos Apóstolos", "Atos", "At"] },
  { nome: "Romanos", formas: ["Romanos", "Rm", "Rom"] },
  { nome: "1 Coríntios", formas: ["1 Coríntios", "1 Corintios", "1Coríntios", "1Corintios", "I Coríntios", "1 Co", "1Co", "1Cor"] },
  { nome: "2 Coríntios", formas: ["2 Coríntios", "2 Corintios", "2Coríntios", "2Corintios", "II Coríntios", "2 Co", "2Co", "2Cor"] },
  { nome: "Gálatas", formas: ["Gálatas", "Galatas", "Gl", "Gál"] },
  { nome: "Efésios", formas: ["Efésios", "Efesios", "Ef"] },
  { nome: "Filipenses", formas: ["Filipenses", "Fp", "Fil"] },
  { nome: "Colossenses", formas: ["Colossenses", "Cl", "Col"] },
  { nome: "1 Tessalonicenses", formas: ["1 Tessalonicenses", "1Tessalonicenses", "I Tessalonicenses", "1 Ts", "1Ts"] },
  { nome: "2 Tessalonicenses", formas: ["2 Tessalonicenses", "2Tessalonicenses", "II Tessalonicenses", "2 Ts", "2Ts"] },
  { nome: "1 Timóteo", formas: ["1 Timóteo", "1 Timoteo", "1Timóteo", "I Timóteo", "1 Tm", "1Tm", "1Tim"] },
  { nome: "2 Timóteo", formas: ["2 Timóteo", "2 Timoteo", "2Timóteo", "II Timóteo", "2 Tm", "2Tm", "2Tim"] },
  { nome: "Tito", formas: ["Tito", "Tt"] },
  { nome: "Filemom", formas: ["Filemom", "Filemon", "Fm"] },
  { nome: "Hebreus", formas: ["Hebreus", "Hb", "Heb"] },
  { nome: "Tiago", formas: ["Tiago", "Tg"] },
  { nome: "1 Pedro", formas: ["1 Pedro", "1Pedro", "I Pedro", "1 Pe", "1Pe", "1Pd"] },
  { nome: "2 Pedro", formas: ["2 Pedro", "2Pedro", "II Pedro", "2 Pe", "2Pe", "2Pd"] },
  { nome: "1 João", formas: ["1 João", "1 Joao", "1João", "I João", "1 Jo", "1Jo"] },
  { nome: "2 João", formas: ["2 João", "2 Joao", "2João", "II João", "2 Jo", "2Jo"] },
  { nome: "3 João", formas: ["3 João", "3 Joao", "3João", "III João", "3 Jo", "3Jo"] },
  { nome: "Judas", formas: ["Judas", "Jd"] },
  { nome: "Apocalipse", formas: ["Apocalipse", "Ap", "Apoc"] },
];

/**
 * Formas com 1-3 letras ("Jo", "At", "Ex") são perigosas: viram falso
 * positivo em cima de palavra comum ("Ex 2" numa lista, "Na 3"). Só valem
 * quando o que vem depois é capítulo E versículo ("Jo 3.16"), nunca só o
 * capítulo. As formas longas não precisam dessa trava.
 */
function ehFormaCurta(forma: string): boolean {
  return forma.replace(/[^A-Za-zÀ-ú]/g, "").length <= 3;
}

function escapar(s: string): string {
  return s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

// Os livros também aparecem em CAIXA ALTA — é como boa parte do acervo
// grafa a referência que assina o versículo em bloco ("1CORÍNTIOS 13.13").
// Entram como formas próprias em vez de virar regex case-insensitive, que
// casaria "na", "ex" e "jo" minúsculos no meio da frase.
const TODAS_FORMAS = [
  ...new Set(LIVROS.flatMap((l) => l.formas).flatMap((f) => [f, f.toUpperCase()])),
];

// Maiores primeiro: senão "Jo" casaria antes de "João" e a referência
// sairia truncada.
const porTamanho = (a: string, b: string) => b.length - a.length;
const ALT_LONGAS = TODAS_FORMAS.filter((f) => !ehFormaCurta(f)).sort(porTamanho).map(escapar).join("|");
const ALT_CURTAS = TODAS_FORMAS.filter(ehFormaCurta).sort(porTamanho).map(escapar).join("|");

// Números do trecho: "3", "3.16", "3:16", "3.16-17", "3.16,18", "13.13—14.1".
const VERSICULOS = String.raw`\s*[:.,]\s*\d{1,3}[a-z]?(?:\s*[-–—]\s*(?:\d{1,3}[:.])?\d{1,3}[a-z]?)?(?:\s*,\s*\d{1,3}[a-z]?)*`;
const CAPITULO = String.raw`\d{1,3}`;

// Livro por extenso: aceita só o capítulo ("Salmos 23") ou capítulo e
// versículos. Abreviação curta: exige os versículos.
const RE_REFERENCIA = new RegExp(
  String.raw`(?:^|[^\p{L}\p{N}])((?:(?:${ALT_LONGAS})\.?\s*${CAPITULO}(?:${VERSICULOS})?)|(?:(?:${ALT_CURTAS})\.?\s*${CAPITULO}(?:${VERSICULOS})))`,
  "gu",
);

// Versão entre parênteses no fim da referência: "(NVI)", "ARA", "ACF".
const VERSOES = /\b(?:ACF|ARA|ARC|NAA|NVI|NVT|NTLH|A21|KJA|BJ|TB|AS21|RA|RC)\b/;

export type FaixaRef = { start: number; end: number };

/**
 * Onde estão as referências bíblicas dentro do texto. Devolve faixas de
 * caractere — o leitor pinta por cima sem mexer no texto, o que mantém
 * intactos os offsets dos grifos já salvos.
 */
export function acharReferencias(texto: string): FaixaRef[] {
  const faixas: FaixaRef[] = [];
  RE_REFERENCIA.lastIndex = 0;
  let m: RegExpExecArray | null;
  while ((m = RE_REFERENCIA.exec(texto)) !== null) {
    const bruto = m[1];
    const start = m.index + m[0].length - bruto.length;
    faixas.push({ start, end: start + bruto.length });
    // O separador consumido pelo (?:^|[^\p{L}\p{N}]) não pode esconder a
    // referência seguinte quando duas vêm coladas ("Rm 8.1; Ef 2.8").
    RE_REFERENCIA.lastIndex = start + bruto.length;
  }
  return faixas;
}

/**
 * O parágrafo é SÓ uma referência bíblica? É esse o sinal de que o
 * parágrafo anterior era um versículo em bloco. Aceita a moldura que as
 * editoras usam em volta: travessão de abertura, parênteses, versão no
 * fim ("— Mateus 5.9 (NVI)"), grifo em caixa alta.
 */
export function ehSoReferencia(paragrafo: string): boolean {
  const t = paragrafo.trim();
  if (!t || t.includes("\n") || t.length > 70) return false;
  const limpo = t
    .replace(/^[—–\-(["“]+\s*/, "")
    .replace(/[)\].,;"”]+$/, "")
    .replace(VERSOES, "")
    .replace(/[()]/g, "")
    .trim();
  if (!limpo) return false;
  // CAIXA ALTA ("1CORÍNTIOS 13.13") não casa com as formas da tabela, que
  // estão em Caixa de Título — normaliza antes de comparar.
  const candidato = /[a-zà-ú]/.test(limpo) ? limpo : capitalizarReferencia(limpo);
  const faixas = acharReferencias(candidato);
  if (faixas.length === 0) return false;
  const coberto = faixas.reduce((soma, f) => soma + (f.end - f.start), 0);
  return coberto >= candidato.replace(/\s/g, "").length * 0.7;
}

/** "1CORÍNTIOS 13.13" → "1Coríntios 13.13" (só para reconhecer, não para exibir). */
function capitalizarReferencia(s: string): string {
  return s.replace(/\p{Lu}[\p{Lu}\s]*/gu, (bloco) =>
    bloco
      .split(/(\s+)/)
      .map((p) => (/\s/.test(p) ? p : p.charAt(0) + p.slice(1).toLowerCase()))
      .join(""),
  );
}

/**
 * O parágrafo tem cara de citação em bloco: abre e fecha aspas e não é um
 * diálogo curto perdido no meio da narrativa.
 */
export function ehCitacaoEntreAspas(paragrafo: string): boolean {
  const t = paragrafo.trim();
  if (t.length < 40) return false;
  const abre = /^["“«]/.test(t);
  const fecha = /["”»][\s.,;]*$/.test(t);
  return abre && fecha;
}
