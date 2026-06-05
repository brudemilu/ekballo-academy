import { createClient } from "@supabase/supabase-js";

/**
 * Client Supabase com service_role — IGNORA RLS. Usar SOMENTE em contexto de
 * servidor confiável (ex.: rota de cron protegida por segredo), NUNCA exposto
 * ao cliente. Requer SUPABASE_SERVICE_ROLE_KEY no ambiente.
 */
export function createServiceClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !key) throw new Error("Supabase service role não configurado.");
  return createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } });
}
