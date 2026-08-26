/**
 * Parte do dicionário que roda dos DOIS lados: o leitor (client component)
 * precisa do mesmo tipo e do mesmo critério de "isso é uma consulta de
 * dicionário?" que a rota usa. Fica em módulo separado pra não arrastar
 * lib/llm.ts (chaves de API, código de servidor) pro bundle do navegador.
 */

export type Verbete = {
  palavra: string;
  /** "substantivo feminino", "verbo", "expressão"… vazio se o modelo não souber. */
  classe: string;
  /** Definição curta, de dicionário. */
  significado: string;
  sinonimos: string[];
  /** O sentido dentro do trecho lido. `null` quando não veio contexto. */
  noTexto: string | null;
};

/** Selecionar um parágrafo inteiro não é consulta de dicionário. */
export const MAX_PALAVRAS = 5;
export const MAX_CARACTERES = 60;

export function selecaoConsultavel(texto: string): boolean {
  const t = texto.trim();
  if (!t || t.length > MAX_CARACTERES) return false;
  if (t.split(/\s+/).length > MAX_PALAVRAS) return false;
  return /[A-Za-zÀ-ÿ]/.test(t);
}
