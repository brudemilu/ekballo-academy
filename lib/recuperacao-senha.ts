import { createHmac } from "crypto";
import type { SupabaseClient } from "@supabase/supabase-js";

// Helpers compartilhados do reset de senha por WhatsApp.
// Usado por /api/recuperar-senha e /api/recuperar-senha/confirmar.

export function soDigitos(s: string): string {
  return (s || "").replace(/\D+/g, "");
}

// Número nacional (DDD + assinante), sem o DDI 55. Permite comparar telefones
// independente de terem sido cadastrados com ou sem o 55 na frente.
export function nacional(s: string): string {
  const d = soDigitos(s);
  if ((d.length === 12 || d.length === 13) && d.startsWith("55")) return d.slice(2);
  return d;
}

export function hashCodigo(codigo: string, secret: string): string {
  return createHmac("sha256", secret).update(codigo).digest("hex");
}

export type PerfilRec = {
  id: string;
  nome: string | null;
  telefone: string | null;
};

export type LookupResult =
  | { tipo: "achado"; perfil: PerfilRec }
  | { tipo: "nenhum" }
  | { tipo: "ambiguo" }; // telefone compartilhado por mais de uma conta

// Acha o perfil pelo identificador (e-mail OU telefone).
// - E-mail: único, sempre desambiguado.
// - Telefone: pode bater em VÁRIAS contas (ex.: família no mesmo WhatsApp).
//   Nesse caso retorna "ambiguo" — quem chamar deve pedir o e-mail, pra não
//   resetar/avisar a conta errada.
export async function acharPerfil(
  admin: SupabaseClient,
  identificador: string
): Promise<LookupResult> {
  const id = (identificador || "").trim();

  if (id.includes("@")) {
    const { data } = await admin
      .from("profiles")
      .select("id, nome, telefone")
      .ilike("email", id)
      .maybeSingle();
    return data ? { tipo: "achado", perfil: data as PerfilRec } : { tipo: "nenhum" };
  }

  const alvo = nacional(id);
  if (alvo.length < 10) return { tipo: "nenhum" };

  const { data } = await admin
    .from("profiles")
    .select("id, nome, telefone")
    .not("telefone", "is", null);

  const matches = ((data as PerfilRec[]) || []).filter(
    (p) => nacional(p.telefone || "") === alvo
  );

  if (matches.length === 0) return { tipo: "nenhum" };
  if (matches.length > 1) return { tipo: "ambiguo" };
  return { tipo: "achado", perfil: matches[0] };
}

export const MSG_AMBIGUO =
  "Há mais de uma conta usando esse WhatsApp. Para recuperar a senha, use o e-mail da conta que você quer acessar.";
