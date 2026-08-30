// Lê o texto de uma imagem (convite, cartaz, print de conversa) com o modelo de
// visão da Cloudflare — mesma conta e credencial do áudio e do parser.
//
// Escolha do modelo: o llama-3.2-vision da Meta exige que a conta aceite a
// licença dela antes do primeiro uso (403 "Model Agreement" até alguém enviar
// "agree"); o mistral-small-3.1 é Apache 2.0 e não pede nada. Num teste com um
// aviso em português o llava-1.5 trocou palavras ("obreiros" -> "Obras",
// "Prefeitura" -> "Pré-Februra") e o mistral devolveu a frase inteira certa.

const CF_BASE = "https://api.cloudflare.com/client/v4/accounts";
const MODELO = "@cf/mistralai/mistral-small-3.1-24b-instruct";

const PROMPT = `Transcreva TODO o texto visível nesta imagem, em português.
Inclua datas, dias da semana, horários, locais, endereços e nomes exatamente como aparecem.
Se for um convite ou cartaz, transcreva também o que está em letra pequena.
Não interprete, não resuma e não comente: responda apenas com o texto da imagem.`;

/** O modelo aceita data: URI; o tipo certo evita imagem recusada. */
function mimeDe(base64: string): string {
  if (base64.startsWith("iVBOR")) return "image/png";
  if (base64.startsWith("R0lGOD")) return "image/gif";
  if (base64.startsWith("UklGR")) return "image/webp";
  return "image/jpeg"; // o que o WhatsApp manda na esmagadora maioria das vezes
}

/** Extrai o texto de uma imagem (base64, com ou sem prefixo data:). */
export async function lerImagem(base64: string): Promise<string> {
  const accountId = process.env.CLOUDFLARE_ACCOUNT_ID;
  const apiToken = process.env.CLOUDFLARE_API_TOKEN;
  if (!accountId || !apiToken) throw new Error("Cloudflare não configurado");

  const limpo = base64.replace(/^data:[^,]+,/, "");
  const res = await fetch(`${CF_BASE}/${accountId}/ai/run/${MODELO}`, {
    method: "POST",
    headers: { Authorization: `Bearer ${apiToken}`, "Content-Type": "application/json" },
    body: JSON.stringify({
      messages: [
        {
          role: "user",
          content: [
            { type: "text", text: PROMPT },
            { type: "image_url", image_url: { url: `data:${mimeDe(limpo)};base64,${limpo}` } },
          ],
        },
      ],
      max_tokens: 600,
    }),
  });
  if (!res.ok) throw new Error(`Visão ${res.status}: ${(await res.text()).slice(0, 200)}`);

  const json = await res.json();
  // a Cloudflare devolve no formato OpenAI (choices) e repete em `response`
  const texto = json?.result?.choices?.[0]?.message?.content ?? json?.result?.response ?? "";
  return typeof texto === "string" ? texto.trim() : "";
}
