/**
 * Autoriza somente o chat "Você".
 *
 * Para JIDs telefônicos, compara os dígitos com AGENDA_WHATSAPP_DONOS. Um JID
 * `@lid` não contém necessariamente o telefone e, por segurança, só passa se o
 * JID completo também tiver sido incluído nessa env. Em dúvida, falha fechado.
 */
export function chatEhDoDono(chat: string, donos: string[]): boolean {
  const jid = chat.trim().toLowerCase();
  if (!jid) return false;

  if (donos.includes(jid)) return true;

  const dominio = jid.includes("@") ? jid.slice(jid.indexOf("@") + 1) : "";
  if (dominio && dominio !== "s.whatsapp.net" && dominio !== "c.us") return false;

  const chatNumero = jid.replace(/\D/g, "");
  return (
    !!chatNumero &&
    donos.some(
      (dono) => !dono.includes("@") && dono.replace(/\D/g, "") === chatNumero,
    )
  );
}
