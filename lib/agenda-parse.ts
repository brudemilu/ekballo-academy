// Interpreta uma mensagem em linguagem natural (PT-BR) e extrai um compromisso
// de agenda, usando o modelo de texto da Cloudflare (mesma credencial do resto).
// Resolve datas relativas ("amanhã", "quinta 15h", "dia 20") com base em "agora".

const CF_BASE = "https://api.cloudflare.com/client/v4/accounts";

export type CompromissoExtraido = {
  entendi: boolean;
  titulo: string;
  inicio: string; // ISO 8601 com fuso -03:00
  fim: string | null;
  dia_todo: boolean;
  local: string | null;
};

function agoraBRT(): { humano: string; iso: string } {
  // string legível no fuso de Brasília pra ancorar as datas relativas
  const fmt = new Intl.DateTimeFormat("pt-BR", {
    timeZone: "America/Sao_Paulo",
    weekday: "long",
    day: "2-digit",
    month: "2-digit",
    year: "numeric",
    hour: "2-digit",
    minute: "2-digit",
  });
  return { humano: fmt.format(new Date()), iso: new Date().toISOString() };
}

export async function parseCompromissoIA(texto: string): Promise<CompromissoExtraido> {
  const accountId = process.env.CLOUDFLARE_ACCOUNT_ID;
  const apiToken = process.env.CLOUDFLARE_API_TOKEN;
  if (!accountId || !apiToken) throw new Error("Cloudflare não configurado");

  const agora = agoraBRT();
  const system = `Você extrai UM compromisso de agenda de uma mensagem em português do Brasil.
Agora é: ${agora.humano} (horário de Brasília, fuso -03:00).
Resolva datas/horas relativas com base nesse "agora": "amanhã", "hoje", "quinta", "semana que vem", "dia 20", "às 15h", "de tarde", etc.
Regras:
- "inicio": data e hora em ISO 8601 COM o fuso -03:00 (ex.: "2026-06-12T15:00:00-03:00"). Se não houver hora e for o dia inteiro, use 00:00 e dia_todo=true.
- "fim": ISO 8601 -03:00 se a mensagem indicar duração/fim; senão null.
- "titulo": curto e claro (o assunto do compromisso).
- "local": se mencionado; senão null.
- "entendi": true se conseguiu identificar um compromisso com data; false se a mensagem não é um compromisso ou falta data.
Responda SOMENTE com JSON válido:
{"entendi":true,"titulo":"...","inicio":"...","fim":null,"dia_todo":false,"local":null}`;

  const res = await fetch(`${CF_BASE}/${accountId}/ai/run/@cf/meta/llama-3.3-70b-instruct-fp8-fast`, {
    method: "POST",
    headers: { Authorization: `Bearer ${apiToken}`, "Content-Type": "application/json" },
    body: JSON.stringify({
      messages: [
        { role: "system", content: system },
        { role: "user", content: texto },
      ],
      max_tokens: 400,
    }),
  });
  if (!res.ok) throw new Error(`Cloudflare ${res.status}`);
  const json = await res.json();
  const raw = json?.result?.response;
  // a Cloudflare às vezes devolve `response` como objeto, às vezes string
  let o: Record<string, unknown>;
  if (raw && typeof raw === "object") {
    o = raw as Record<string, unknown>;
  } else if (typeof raw === "string") {
    const ini = raw.indexOf("{");
    const fim = raw.lastIndexOf("}");
    if (ini === -1 || fim === -1) throw new Error("sem JSON");
    o = JSON.parse(raw.slice(ini, fim + 1)) as Record<string, unknown>;
  } else {
    throw new Error("resposta inesperada");
  }

  return {
    entendi: o.entendi === true && typeof o.inicio === "string",
    titulo: typeof o.titulo === "string" ? o.titulo.trim() : "",
    inicio: typeof o.inicio === "string" ? o.inicio : "",
    fim: typeof o.fim === "string" ? o.fim : null,
    dia_todo: o.dia_todo === true,
    local: typeof o.local === "string" ? o.local : null,
  };
}
