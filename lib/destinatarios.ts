import type { SupabaseClient } from "@supabase/supabase-js";

// Regra de envio (Bruno, jun/2026): não disparar mensagens/emails de broadcast
// pra quem está SÓ nas temáticas abertas (Bíblia, Devocional, planos de leitura).
// Esses cursos têm `external_path` e o cadastro auto-matricula todo mundo neles
// (ver trigger handle_new_user), então estar neles não significa engajamento.
//
// "Aluno real" = perfil com ao menos uma matrícula numa temática real
// (curso com `external_path IS NULL`). O conjunto é usado pra filtrar os
// destinatários de "todos"/campanhas. Cursos abertos novos entram na regra
// automaticamente (o critério é external_path, não uma lista fixa).
export async function idsAlunosReais(admin: SupabaseClient): Promise<Set<string>> {
  const { data: abertos } = await admin
    .from("cursos")
    .select("id")
    .not("external_path", "is", null);
  const abertosIds = (abertos || []).map((c) => c.id as string);

  let q = admin.from("matriculas").select("aluno_id");
  if (abertosIds.length) {
    // matrículas que NÃO são nos cursos abertos = engajamento em temática real
    q = q.not("curso_id", "in", `(${abertosIds.join(",")})`);
  }
  const { data } = await q;
  return new Set((data || []).map((r) => r.aluno_id as string));
}

// Pro envio direto de WhatsApp (número/grupo avulso digitado pelo admin):
// retorna true se o destinatário é um cadastrado que NÃO é aluno real (está
// só nas temáticas abertas). Grupos e números sem perfil passam — não dá pra
// aplicar a regra e o envio é explícito. Compara pelos últimos 8 dígitos
// (número do assinante), tolerando DDI/9º dígito e formatações diferentes.
export async function telefoneBloqueadoBroadcast(
  admin: SupabaseClient,
  destinatario: string
): Promise<boolean> {
  const raw = String(destinatario || "");
  if (/@?g\.us|@g(?![a-z])/i.test(raw)) return false; // grupo do WhatsApp
  const digits = raw.replace(/\D+/g, "");
  if (digits.length < 8) return false;
  const nucleo = digits.slice(-8);

  const { data: profs } = await admin.from("profiles").select("id, telefone");
  const match = (profs || []).find(
    (p) => (p.telefone || "").replace(/\D+/g, "").endsWith(nucleo)
  );
  if (!match) return false; // número não cadastrado → envio explícito passa

  const reais = await idsAlunosReais(admin);
  return !reais.has(match.id as string); // cadastrado, mas só nas abertas → bloqueia
}
