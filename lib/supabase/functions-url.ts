/**
 * Base publica das Edge Functions.
 *
 * Supabase Cloud usa https://<ref>.functions.supabase.co/<funcao>, enquanto a
 * instalacao self-hosted publica as funcoes em
 * https://<host>/functions/v1/<funcao>. A variavel explicita permite tambem
 * usar um gateway/proxy separado sem acoplar o app a nenhum dos formatos.
 */
export function supabaseFunctionsBase(): string {
  const explicit = process.env.SUPABASE_FUNCTIONS_URL?.trim();
  if (explicit) return explicit.replace(/\/$/, "");

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL?.trim().replace(
    /\/$/,
    ""
  );
  if (!supabaseUrl) return "";

  if (supabaseUrl.endsWith(".supabase.co")) {
    return supabaseUrl.replace(".supabase.co", ".functions.supabase.co");
  }

  return `${supabaseUrl}/functions/v1`;
}
