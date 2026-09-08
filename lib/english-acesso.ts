// =============================================================
// EKBALLO ENGLISH · Quem pode praticar
//
// O English é liberado pessoa a pessoa (flag `english_liberado` em
// profiles, marcada pelo master). Esconder o card no dashboard não
// basta: sem esta checagem, quem descobrisse a URL da lição ainda
// gravaria progresso e entraria nas listas do painel.
// =============================================================

import type { SupabaseClient } from "@supabase/supabase-js";
import { podeUsarEnglish } from "@/lib/permissoes";

export async function temAcessoEnglish(
  supabase: SupabaseClient,
  userId: string,
): Promise<boolean> {
  const { data } = await supabase
    .from("profiles")
    .select("is_admin, papel, english_liberado")
    .eq("id", userId)
    .maybeSingle();
  return podeUsarEnglish(data?.papel, data?.is_admin, data?.english_liberado);
}
