/**
 * Envia um texto por WhatsApp pela edge function do gateway (a mesma que os
 * avisos de resposta e o lembrete da agenda usam). Até aqui cada rota de cron
 * tinha a própria cópia desta função; o piloto automático usa esta.
 */
import { supabaseFunctionsBase } from "@/lib/supabase/functions-url";

/** Devolve null se enviou; senão, o motivo da falha. Nunca lança. */
export async function enviarTextoWhatsApp(
  destinatario: string,
  mensagem: string,
): Promise<string | null> {
  const base = supabaseFunctionsBase();
  const secret = process.env.INTERNAL_SECRET;
  if (!base || !secret)
    return "envio não configurado (SUPABASE_FUNCTIONS_URL/INTERNAL_SECRET)";
  try {
    const res = await fetch(`${base}/enviar-whatsapp-evolution`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-internal-secret": secret },
      body: JSON.stringify({ destinatario, mensagem }),
      signal: AbortSignal.timeout(25_000),
    });
    if (!res.ok)
      return `${res.status} ${await res.text().catch(() => "")}`.trim().slice(0, 200);
    return null;
  } catch (e) {
    return e instanceof Error ? e.message : "erro de rede";
  }
}

/**
 * Envia uma imagem (por URL pública) com legenda. Devolve null se enviou;
 * senão, o motivo. Nunca lança.
 */
export async function enviarImagemWhatsApp(
  destinatario: string,
  url: string,
  legenda?: string,
): Promise<string | null> {
  const base = supabaseFunctionsBase();
  const secret = process.env.INTERNAL_SECRET;
  if (!base || !secret)
    return "envio não configurado (SUPABASE_FUNCTIONS_URL/INTERNAL_SECRET)";
  try {
    const res = await fetch(`${base}/enviar-whatsapp-midia`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-internal-secret": secret },
      body: JSON.stringify({
        destinatario,
        url,
        tipo: "image",
        ...(legenda ? { legenda } : {}),
      }),
      // A URL é a rota que desenha o slide: o gateway espera a imagem ficar pronta.
      signal: AbortSignal.timeout(60_000),
    });
    if (!res.ok)
      return `${res.status} ${await res.text().catch(() => "")}`.trim().slice(0, 200);
    return null;
  } catch (e) {
    return e instanceof Error ? e.message : "erro de rede";
  }
}
