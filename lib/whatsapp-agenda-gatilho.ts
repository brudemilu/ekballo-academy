/**
 * Agenda pelo WhatsApp (issue #252): decidir se um texto do chat "Você" é um
 * pedido para a agenda. Só a parte pura — o webhook
 * (app/api/webhook/whatsapp-agenda) decide o que fazer. Testado em
 * testes/whatsapp-agenda-gatilho.test.ts.
 *
 * O chat "Você" também é bloco de notas e canal do Instagram, então nem todo
 * texto é compromisso: exige-se a palavra "agenda". O que mudou foi ONDE ela
 * pode estar — antes só valia no começo, e "Colocar na agenda: …" era
 * ignorado em silêncio.
 */

// "agenda …", "agendar: …", "agende - …"
const RE_DIRETO = /^\s*(?:agenda|agendar|agende)\b[:,\s-]+([\s\S]+)/i;

// "colocar na agenda: …", "põe na minha agenda …", "marca pra agenda …"
const RE_COM_VERBO =
  /^\s*(?:coloc(?:ar|a|que)|p[oõ]e|p[oô]r|bot(?:ar|a|e)|marc(?:ar|a)|marque|anot(?:ar|a|e)|adicion(?:ar|a|e)|salv(?:ar|a|e)|inclu(?:ir|i|a)|lan[cç](?:ar|a|e))\s+(?:(?:isso|a[ií])\s+)?(?:na|em|pra|para(?:\s+a)?)\s+(?:minha\s+)?agenda(?![\p{L}\d])[:,\s-]+([\s\S]+)/iu;

/** O que vem depois do gatilho da agenda, ou null se o texto não é um pedido. */
export function pedidoDaAgenda(texto: string): string | null {
  const t = texto || "";
  const m = t.match(RE_DIRETO) || t.match(RE_COM_VERBO);
  const pedido = m?.[1].trim();
  return pedido ? pedido : null;
}

/** Sem o gatilho no começo, sobra o que a legenda acrescenta ao convite. */
export function semGatilhoDaAgenda(texto: string): string {
  return (
    pedidoDaAgenda(texto) ??
    (texto || "").replace(/^\s*(?:agenda|agendar|agende)\b[:,\s-]*/i, "").trim()
  );
}

const LIMITE_DICA = 140;
// data ("03/01", "dia 3") ou hora ("15h", "15h30", "15:30")
const RE_DATA_OU_HORA =
  /(?:^|\D)\d{1,2}\/\d{1,2}(?:\D|$)|\bdia\s+\d{1,2}\b|\b\d{1,2}\s?h(?:\d{2})?\b|\b\d{1,2}:\d{2}\b/i;

/**
 * Texto curto, de uma linha, com data ou hora: tem cara de compromisso que
 * veio sem o gatilho. Serve só para decidir se vale mandar uma dica — nunca
 * para agendar. As travas (uma linha, curto, começa com letra ou número)
 * existem porque os avisos que o próprio sistema manda nesse chat — resumo do
 * dia, confirmações — também trazem data e hora, mas são longos e começam
 * com emoji.
 */
export function pareceCompromisso(texto: string): boolean {
  const t = (texto || "").trim();
  if (!t || t.length > LIMITE_DICA || t.includes("\n")) return false;
  if (!/^[\p{L}\d]/u.test(t)) return false;
  if (/https?:\/\//i.test(t)) return false;
  return RE_DATA_OU_HORA.test(t);
}
