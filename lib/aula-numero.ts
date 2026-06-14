// Número exibido da aula (badge da lista + cabeçalho "Aula NN").
//
// Em cursos montados a partir de um livro (ex.: "O Blueprint de Parach"),
// o Prefácio e a Introdução ocupam as primeiras posições de leitura, então
// `ordem` (ordem de leitura) NÃO bate com o número do capítulo: o Capítulo 1
// fica em ordem 3. Aqui derivamos o rótulo do próprio título:
//   - "Capítulo N — ..."  → "0N"
//   - Prefácio / Introdução → "00"
//   - qualquer outro       → cai no `ordem` (comportamento original)
//
// Para cursos cujo `ordem` já coincide com o capítulo (ou sem prefácio/
// introdução), o resultado é idêntico ao de antes — então é seguro usar
// em toda a plataforma.

export function rotuloNumeroAula(aula: { titulo: string; ordem: number }): string {
  const cap = aula.titulo.match(/cap[íi]tulo\s+(\d+)/i);
  if (cap) return cap[1].padStart(2, "0");
  if (/^\s*(pref[áa]cio|introdu[çc][ãa]o)\b/i.test(aula.titulo)) return "00";
  return String(aula.ordem).padStart(2, "0");
}
