// =============================================================
// EKBALLO ACADEMY · Resumo curto de um capítulo (para avisos)
//
// Serve ao aviso de WhatsApp do líder: quando o discípulo responde uma
// reflexão, a resposta sozinha não diz nada ("achei difícil aceitar isso")
// — é preciso lembrar do que o capítulo tratava.
//
// O resumo é ESCRITO DO ZERO pelo modelo, em duas ou três frases próprias,
// e não um trecho copiado do livro: o aviso é um lembrete de contexto, não
// uma reprodução da obra. Por isso o prompt pede paráfrase e proíbe citação.
//
// Cada capítulo é resumido UMA vez e guardado em `aulas.resumo_curto`; as
// respostas seguintes ao mesmo capítulo reaproveitam o texto gravado.
// =============================================================
import type { SupabaseClient } from "@supabase/supabase-js";
import { chamarLLM } from "./llm";

/** Quanto do capítulo vai para o modelo. Além disso o resumo não melhora. */
const LIMITE_ENTRADA = 7000;

function semHtml(s: string): string {
  return s
    .replace(/<(script|style)[\s\S]*?<\/\1>/gi, " ")
    .replace(/<[^>]+>/g, " ")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&[a-z]+;/gi, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function extrairJSON(bruto: string): { resumo?: unknown } | null {
  try {
    return JSON.parse(bruto);
  } catch {
    const m = bruto.match(/\{[\s\S]*\}/);
    if (!m) return null;
    try {
      return JSON.parse(m[0]);
    } catch {
      return null;
    }
  }
}

/**
 * Devolve o resumo do capítulo, gerando e gravando se ainda não existir.
 * Nunca lança: sem IA configurada (ou com ela fora do ar) volta null, e o
 * aviso sai sem a linha de contexto em vez de não sair.
 */
export async function resumoDaAula(
  db: SupabaseClient,
  aula: {
    id: string;
    titulo: string;
    conteudo: string | null;
    resumo_curto?: string | null;
  },
  livro: string,
): Promise<string | null> {
  const guardado = (aula.resumo_curto || "").trim();
  if (guardado) return guardado;

  const texto = semHtml(aula.conteudo || "");
  if (texto.length < 400) return null; // capítulo vazio ou só título: nada a resumir

  const system =
    "Você resume capítulos de livros cristãos para um líder de discipulado brasileiro. " +
    "Escreva com suas próprias palavras, em português do Brasil, SEM copiar frases do " +
    "texto original e SEM citar trechos. Responda apenas JSON: " +
    '{"resumo": "..."} com duas ou três frases dizendo do que o capítulo trata e qual é ' +
    "o argumento central. Nada de introdução, nada de 'neste capítulo o autor'.";
  const user = `Livro: ${livro}\nCapítulo: ${aula.titulo}\n\nTexto:\n${texto.slice(0, LIMITE_ENTRADA)}`;

  let resumo = "";
  try {
    const bruto = await chamarLLM(system, user, 400);
    const json = extrairJSON(bruto);
    resumo = typeof json?.resumo === "string" ? json.resumo.trim() : "";
  } catch {
    return null;
  }
  if (!resumo) return null;

  // Grava para não pagar a mesma geração duas vezes. Falha aqui não
  // atrapalha o aviso — só faz o próximo resumo ser gerado de novo.
  await db.from("aulas").update({ resumo_curto: resumo }).eq("id", aula.id);
  return resumo;
}
