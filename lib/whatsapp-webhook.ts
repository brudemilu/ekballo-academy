import { webhookBase } from "@/lib/site-url";

/**
 * URL do webhook de RECEBIMENTO do WhatsApp (agendar por áudio/texto), com o
 * secret embutido. Montada sempre server-side — o segredo não pode vazar pro
 * cliente.
 *
 * Vive aqui, e não dentro de uma rota, porque dois lugares precisam dela: o
 * painel admin (botão "webhook" e o "conectar") e o vigia da conexão, que
 * reinicia a instância sozinho. O webhook NÃO sobrevive a toda reinicialização
 * da Evolution; quem reinicia tem obrigação de registrá-lo de novo, senão o
 * recebimento morre calado — a plataforma continua mandando mensagem e
 * simplesmente para de escutar as respostas.
 *
 * Sem fallback pra domínio fixo: o literal antigo apontava pro
 * ekballo-academy.vercel.app, morto desde a migração pro Contabo. Registrar o
 * webhook num host inexistente é pior que não registrar — melhor devolver null
 * e falhar alto.
 */
export function montarWebhookUrl(): string | null {
  const secret = process.env.AGENDA_WHATSAPP_SECRET || "";
  if (!secret) return null;
  const base = webhookBase();
  if (!base) return null;
  return `${base}/api/webhook/whatsapp-agenda?secret=${encodeURIComponent(secret)}`;
}
