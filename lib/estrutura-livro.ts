// =============================================================
// EKBALLO ACADEMY · Estrutura tipográfica dos livros do acervo
//
// O texto dos livros entra no banco como prosa corrida: parágrafos separados
// por linha em branco, sem marcação de título, citação ou versículo. Quem
// devolve a estrutura da página impressa é este módulo — pela FORMA do
// parágrafo (CAIXA ALTA = seção, Caixa de Título = subseção, parágrafo que é
// só uma referência = assinatura da citação acima).
//
// O padrão saiu de "Seja um Líder de Verdade" (Haggai), o primeiro livro
// conferido palavra a palavra contra o PDF, e vale para todo o acervo: o
// leitor aplica as mesmas regras a qualquer livro, sem precisar remarcar o
// conteúdo no banco.
//
// Só três marcadores são explícitos no texto, porque não têm forma que os
// entregue: "[cite] ", "[quadro] " e "[figura] ".
//
// Módulo puro (sem React, sem banco): serve o leitor e os scripts de carga.
// =============================================================

import {
  acharReferencias,
  ehCitacaoEntreAspas,
  ehSoReferencia,
} from "@/lib/referencia-biblica";

export { acharReferencias };

// ---- Detecção de título (linha em CAIXA ALTA, curta, sem minúsculas) ----
export function ehTitulo(linha: string): boolean {
  const t = linha.trim();
  if (t.length < 2 || t.length > 70) return false;
  if (t.startsWith("•")) return false;
  if (/[a-zàáâãäçéêëíîïóôõöúûü]/.test(t)) return false; // tem minúscula → não é título
  if (!/[A-ZÀÁÂÃÄÇÉÊËÍÎÏÓÔÕÖÚÛÜ]/.test(t)) return false; // precisa de ao menos 1 maiúscula
  // "1CORÍNTIOS 13.13" tem a forma de título mas é a referência que assina o
  // versículo citado acima — quem cuida dela é papeisDosParagrafos.
  if (ehSoReferencia(t)) return false;
  return true;
}

// ---- Subtítulo (linha curta em Caixa Alta de Título, sem ponto final) ----
// Nível abaixo do título em CAIXA ALTA: "Descobrir a Nós Mesmos",
// "Empenhemo-nos Pela Excelência". Sem marcação no texto para se apoiar, a
// pista é a forma: parágrafo de uma linha só, curto, que não fecha frase e em
// que as palavras de peso começam em maiúscula.
const PALAVRA_MENOR = new Set([
  "de", "da", "do", "das", "dos", "a", "o", "as", "os", "e", "em", "na", "no",
  "nas", "nos", "com", "para", "por", "pela", "pelo", "pelas", "pelos", "que",
  "à", "ao", "aos", "às", "um", "uma", "se", "sem", "sobre", "entre", "ou",
  "não", "mais", "como", "até",
]);

export function ehSubtitulo(paragrafo: string): boolean {
  const t = paragrafo.trim();
  if (!t || t.includes("\n") || t.length > 95) return false;
  if ("—–-\"“'([*•".includes(t[0])) return false;
  if (".!?:;,…\"”)»".includes(t[t.length - 1])) return false;
  if (/\d$/.test(t)) return false; // cabeçalho corrido com número de página
  if (t.includes(".") || t.includes(";")) return false; // referência bibliográfica
  if (!/^[A-ZÀÁÂÃÄÇÉÊËÍÎÏÓÔÕÖÚÛÜ]/.test(t)) return false;
  if (ehTitulo(t)) return false; // já é título de seção
  const palavras = t.split(/\s+/);
  if (palavras.length < 2 || palavras.length > 12) return false;
  const fortes = palavras.filter((w) => !PALAVRA_MENOR.has(w.toLowerCase().replace(/[(),]/g, "")));
  if (fortes.length < 2) return false;
  const maiusculas = fortes.filter((w) => /^[A-ZÀÁÂÃÄÇÉÊËÍÎÏÓÔÕÖÚÛÜ“"']/.test(w)).length;
  return maiusculas / fortes.length >= 0.8;
}

export type Nivel = "titulo" | "subtitulo" | null;

// O parágrafo INTEIRO é um cabeçalho? (linha de título solta no meio do texto
// continua sendo só negrito, tratada em faixasDeTitulo)
export function nivelDoParagrafo(paragrafo: string, proximo: string | undefined): Nivel {
  const t = paragrafo.trim();
  if (!t.includes("\n") && ehTitulo(t)) return "titulo";
  // cabeçalho não fecha capítulo: precisa de texto depois dele
  if (proximo && ehSubtitulo(t)) return "subtitulo";
  return null;
}

// ---- Citação em bloco (versículo, epígrafe, trecho citado) ----
// O acervo quase nunca marca a citação: o que ele traz é o formato do livro
// impresso — o trecho citado num parágrafo e, logo abaixo, um parágrafo com
// só a referência ("MATEUS 5.9", "1 Coríntios 13.4-7"). Reconhecer esse par
// é o que devolve ao leitor o destaque que a página do livro dá.
export type Papel = "cita" | "cita-ref" | null;

// Nota de fim de livro também é "só uma referência", mas não assina citação
// nenhuma — vem em bloco, uma atrás da outra, e muitas trazem a seta de volta.
function ehNotaDeFim(texto: string, anterior: string | undefined): boolean {
  if (texto.includes("↩")) return true;
  return Boolean(anterior && ehSoReferencia(anterior));
}

export function papeisDosParagrafos(
  paragrafos: { texto: string; cite: boolean }[],
): Papel[] {
  const papeis: Papel[] = paragrafos.map((p) => (p.cite ? "cita" : null));
  paragrafos.forEach((p, i) => {
    const t = p.texto.trim();
    if (papeis[i] || ehQuadro(t) || ehFigura(t)) return;

    // (a) parágrafo que é só a referência: assina a citação logo acima.
    if (ehSoReferencia(t)) {
      const anterior = paragrafos[i - 1];
      const corpo = anterior?.texto.trim() ?? "";
      const assinavel =
        corpo.length >= 40 &&
        !ehQuadro(corpo) &&
        !ehFigura(corpo) &&
        !ehTitulo(corpo) &&
        !ehNotaDeFim(t, paragrafos[i - 2]?.texto);
      if (assinavel) {
        papeis[i] = "cita-ref";
        papeis[i - 1] = "cita";
      }
      return;
    }

    // (b) epígrafe de abertura: o capítulo começa com um trecho entre aspas,
    // às vezes seguido da linha de crédito ao autor.
    if (i <= 1 && ehCitacaoEntreAspas(t)) {
      papeis[i] = "cita";
      const seguinte = paragrafos[i + 1]?.texto.trim();
      if (seguinte && seguinte.length <= 120 && !ehCitacaoEntreAspas(seguinte) && /[,.]/.test(seguinte)) {
        papeis[i + 1] = "cita-ref";
      }
    }
  });
  return papeis;
}

export type Faixa = { start: number; end: number };

export function faixasDeTitulo(texto: string): Faixa[] {
  const faixas: Faixa[] = [];
  let offset = 0;
  for (const linha of texto.split("\n")) {
    if (ehTitulo(linha)) faixas.push({ start: offset, end: offset + linha.length });
    offset += linha.length + 1; // +1 pelo \n
  }
  return faixas;
}

// ---- Quadros (tabelas/boxes fiéis ao PDF) ----
// Bloco que começa com "[quadro] Título" e tem linhas com colunas separadas
// por " | ". Uma linha só de traços (--- | ---) marca a linha anterior como
// cabeçalho.
export function ehQuadro(paragrafo: string): boolean {
  return /^\[quadro\]/i.test(paragrafo.trim());
}

export function parseQuadro(paragrafo: string): {
  titulo: string;
  header: string[] | null;
  linhas: string[][];
} {
  const linhasTxt = paragrafo.split("\n");
  const titulo = linhasTxt[0].replace(/^\[quadro\]\s*/i, "").trim();
  const corpo = linhasTxt.slice(1).filter((l) => l.trim() !== "");
  let header: string[] | null = null;
  const linhas: string[][] = [];
  for (const linha of corpo) {
    const cells = linha.split("|").map((c) => c.trim());
    const ehSeparador = cells.every((c) => c === "" || /^-{2,}$/.test(c));
    if (ehSeparador && linhas.length > 0) {
      header = linhas.pop() ?? null;
      continue;
    }
    linhas.push(cells);
  }
  return { titulo, header, linhas };
}


// ---- Figuras (gráficos e diagramas do livro original) ----
// Bloco "[figura] /caminho/da/imagem.png | Legenda opcional". Existe porque
// vários livros trazem diagrama que o texto referencia diretamente ("o diagrama
// abaixo representa..."): sem a figura, o leitor cai numa remissão vazia.
export function ehFigura(paragrafo: string): boolean {
  return /^\[figura\]/i.test(paragrafo.trim());
}

export function parseFigura(bloco: string): { src: string; legenda: string } {
  const corpo = bloco.trim().replace(/^\[figura\]\s*/i, "");
  const [src, ...resto] = corpo.split("|");
  return { src: src.trim(), legenda: resto.join("|").trim() };
}

/**
 * Separa o marcador "[cite] " do texto do parágrafo. O marcador sai aqui pra
 * não deslocar os offsets de grifo e de busca, que são contados no texto.
 */
export function lerParagrafos(conteudo: string): { texto: string; cite: boolean }[] {
  return conteudo.split("\n\n").map((p) =>
    p.startsWith("[cite] ") ? { texto: p.slice(7), cite: true } : { texto: p, cite: false },
  );
}
