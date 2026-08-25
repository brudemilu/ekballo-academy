/**
 * Base pública do app (sem barra no fim).
 *
 * Até jul/2026 vários pontos do código caíam num literal
 * "https://ekballo-academy.vercel.app" quando a env não estava setada —
 * domínio que morreu na migração pro Contabo. O efeito era pior que um erro:
 * silencioso. O webhook do WhatsApp era registrado num host inexistente e as
 * mensagens agendadas tentavam sair por lá sem nada explodir de forma visível.
 *
 * Por isso aqui NÃO existe fallback pra domínio fixo: sem env, devolve string
 * vazia e quem chama decide o que fazer — erro claro em vez de destino errado.
 *
 * Use só quando a URL precisa ser alcançável DE FORA (link que o usuário abre,
 * webhook que outro serviço chama). Pra o app chamar a si mesmo, use
 * `selfOrigin()` — passar pelo domínio público atrás do Traefik já causou
 * travamento (o mesmo bug de TLS das rotas OG).
 */
export function siteBase(): string {
  const raw =
    process.env.NEXT_PUBLIC_SITE_URL?.trim() ||
    process.env.WEBHOOK_PUBLIC_BASE?.trim() ||
    "";
  return raw.replace(/\/+$/, "");
}

/**
 * Base pra montar a URL do webhook de recebimento do WhatsApp.
 *
 * `WEBHOOK_PUBLIC_BASE` tem precedência: permite apontar o Evolution pra um
 * túnel/proxy sem mexer no resto do app.
 */
export function webhookBase(): string {
  const explicit = process.env.WEBHOOK_PUBLIC_BASE?.trim();
  if (explicit) return explicit.replace(/\/+$/, "");
  return siteBase();
}

/**
 * Origem pra o app chamar as próprias rotas (server-side). Nunca sai pra rede
 * externa: evita DNS, Traefik e o erro de TLS que derrubou as rotas OG.
 */
export function selfOrigin(): string {
  return `http://127.0.0.1:${process.env.PORT ?? 3000}`;
}
