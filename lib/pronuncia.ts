// =============================================================
// EKBALLO ENGLISH · Correção de pronúncia
//
// POR QUE existe: o exercício de fala usava o reconhecimento do
// próprio navegador. Isso só funciona no Chrome/Edge do computador —
// no iPhone não há suporte confiável, e é provável que boa parte
// dos alunos esteja justamente no iPhone. Ou seja: o exercício que
// dá nome ao curso ("prática de fala") não corrigia quem mais
// precisava.
//
// Agora o áudio é gravado no aparelho e transcrito no servidor pelo
// Whisper (via Groq, chave que o projeto já usava em lib/llm.ts).
// Funciona igual em qualquer aparelho.
//
// ⚠️ O áudio SAI do nosso servidor: ele é enviado ao Groq para
// transcrever. Não é gravado em disco nem no banco em lugar nenhum —
// vive só na memória durante a requisição e é descartado. Ainda
// assim, é voz de aluno (às vezes criança) trafegando para um
// terceiro, e isso precisa ser dito, não escondido.
// =============================================================

const GROQ_TRANSCRICAO = "https://api.groq.com/openai/v1/audio/transcriptions";

// Turbo: rápido o bastante para o aluno não esperar, e preciso o
// bastante para frase curta de curso de idioma.
const MODELO = process.env.GROQ_WHISPER_MODEL || "whisper-large-v3-turbo";

export type ResultadoPronuncia =
  | { ok: true; transcricao: string }
  | { ok: false; erro: string };

/**
 * Transcreve o áudio falado pelo aluno.
 *
 * ⚠️ NÃO passe a frase esperada no parâmetro `prompt` do Whisper. É
 * tentador (melhora a acurácia), mas enviesa o modelo a "ouvir" o que
 * se espera — e aí ele transcreve a frase certa mesmo quando o aluno
 * falou outra coisa. Isso destruiria justamente a correção que este
 * arquivo existe para fazer.
 */
export async function transcreverFala(
  audio: Blob,
  nomeArquivo = "fala.webm",
): Promise<ResultadoPronuncia> {
  const chave = process.env.GROQ_API_KEY;
  if (!chave) return { ok: false, erro: "transcrição não configurada" };

  const form = new FormData();
  form.append("file", audio, nomeArquivo);
  form.append("model", MODELO);
  form.append("language", "en");
  form.append("response_format", "json");
  form.append("temperature", "0");

  try {
    const resp = await fetch(GROQ_TRANSCRICAO, {
      method: "POST",
      headers: { Authorization: `Bearer ${chave}` },
      body: form,
    });

    if (!resp.ok) {
      const detalhe = await resp.text().catch(() => "");
      console.error("[pronuncia] groq", resp.status, detalhe.slice(0, 300));
      return { ok: false, erro: "não consegui ouvir agora" };
    }

    const dados = (await resp.json()) as { text?: string };
    const texto = (dados.text || "").trim();
    if (!texto) return { ok: false, erro: "não entendi nada" };
    return { ok: true, transcricao: texto };
  } catch (e) {
    console.error("[pronuncia] falha", e instanceof Error ? e.message : e);
    return { ok: false, erro: "não consegui ouvir agora" };
  }
}
