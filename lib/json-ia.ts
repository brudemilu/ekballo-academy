/**
 * Lê o JSON que um modelo de linguagem devolveu.
 *
 * O Gemini, em modo JSON, devolve certo. Mas quando ele não responde (cota da
 * camada gratuita, sobrecarga) a corrente cai nos modelos de reserva
 * (lib/llm.ts), que erram o formato de jeitos previsíveis: cercam com
 * ```json, deixam vírgula sobrando antes de fechar, escrevem um comentário.
 * Sem tolerância, o usuário via "Expected double-quoted property name in
 * JSON at position 250" na tela.
 *
 * Aqui se conserta o que é conserto seguro (não muda o conteúdo) e, quando não
 * dá, a mensagem sai em português, dizendo o que fazer.
 */

/** Tira comentários de linha que estejam FORA de strings. */
function semComentarios(json: string): string {
  let saida = "";
  let emString = false;
  for (let i = 0; i < json.length; i++) {
    const c = json[i];
    if (emString) {
      saida += c;
      if (c === "\\") {
        saida += json[i + 1] ?? "";
        i++;
      } else if (c === '"') emString = false;
      continue;
    }
    if (c === '"') {
      emString = true;
      saida += c;
      continue;
    }
    if (c === "/" && json[i + 1] === "/") {
      while (i < json.length && json[i] !== "\n") i++;
      saida += "\n";
      continue;
    }
    saida += c;
  }
  return saida;
}

/** Tira vírgula sobrando antes de } ou ], fora de strings. */
function semVirgulaSobrando(json: string): string {
  let saida = "";
  let emString = false;
  for (let i = 0; i < json.length; i++) {
    const c = json[i];
    if (emString) {
      saida += c;
      if (c === "\\") {
        saida += json[i + 1] ?? "";
        i++;
      } else if (c === '"') emString = false;
      continue;
    }
    if (c === '"') emString = true;
    if (c === ",") {
      let j = i + 1;
      while (j < json.length && /\s/.test(json[j])) j++;
      if (json[j] === "}" || json[j] === "]") continue; // pula a vírgula
    }
    saida += c;
  }
  return saida;
}

/**
 * Devolve o objeto que a IA escreveu. Lança `Error(mensagem)` — em português,
 * pronta para a tela — se não houver JSON ou se ele não tiver conserto.
 */
export function lerJSONdaIA(
  bruto: string,
  mensagem = "a IA devolveu uma resposta que não consegui ler — tente de novo",
): unknown {
  const semCerca = (bruto || "").replace(/```json/gi, "").replace(/```/g, "");
  const ini = semCerca.indexOf("{");
  const fim = semCerca.lastIndexOf("}");
  if (ini === -1 || fim <= ini) {
    console.error("[json-ia] resposta sem JSON:", (bruto || "").slice(0, 300));
    throw new Error(mensagem);
  }
  const trecho = semCerca.slice(ini, fim + 1);
  try {
    return JSON.parse(trecho);
  } catch {
    try {
      return JSON.parse(semVirgulaSobrando(semComentarios(trecho)));
    } catch {
      // Fica no log do servidor (nunca na tela): é o que permite descobrir um
      // defeito novo de formato sem depender de reproduzir a falha.
      console.error("[json-ia] resposta ilegível:", trecho.slice(0, 600));
      throw new Error(mensagem);
    }
  }
}
