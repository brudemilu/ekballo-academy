// Busca textual simples, do jeito que o acervo precisa: sem acento, sem caixa,
// e com os termos podendo aparecer em qualquer ordem. "pastor imperf" e
// "IMPERFEITO pastor" acham os dois "O Pastor Imperfeito".
//
// É deliberadamente ingênua (substring, sem ranking, sem índice): o acervo tem
// ~200 livros e o filtro roda no navegador sobre uma lista já carregada. Trocar
// isso por busca no banco só faria sentido com muito mais título do que isso.

// "João Calvino" → "joao calvino". Tira diacrítico, caixa e pontuação de
// referência, e achata espaço repetido — é a forma canônica dos dois lados
// da comparação.
export function normalizarBusca(texto: string): string {
  return texto
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .toLowerCase()
    .replace(/[.,;:!?'"()[\]–—-]/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

// Quebra a consulta em termos já normalizados. Consulta vazia = nenhum termo,
// o que faz `combinaBusca` devolver true (lista inteira, sem filtro).
export function termosDaBusca(consulta: string): string[] {
  const normal = normalizarBusca(consulta);
  return normal ? normal.split(" ") : [];
}

// Casa quando TODOS os termos aparecem no texto (E, não OU). Com ~200 livros,
// "keller ego" tem que estreitar o resultado, não alargar.
export function combinaBusca(texto: string, consulta: string): boolean {
  const termos = termosDaBusca(consulta);
  if (termos.length === 0) return true;
  const alvo = normalizarBusca(texto);
  return termos.every((termo) => alvo.includes(termo));
}

// O que o filtro enxerga de cada livro: título, autor e a seção da vitrine em
// que ele está. A descrição fica de fora de propósito — são ~200 livros, e
// mandar o texto inteiro de cada um pro navegador só pra buscar custaria mais
// do que ajuda. Usado pelas três vitrines (discípulo, painel pastoral e gestão).
export function textoBuscavelDoLivro(
  livro: { titulo: string; autor?: string | null },
  secao?: string,
): string {
  return [livro.titulo, livro.autor, secao].filter(Boolean).join(" ");
}
