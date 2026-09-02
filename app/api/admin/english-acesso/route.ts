import { NextRequest, NextResponse } from "next/server";
import { createClient as createServerClient } from "@/lib/supabase/server";
import { createClient } from "@supabase/supabase-js";

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// =============================================================
// EKBALLO ENGLISH · Liberar / retirar o acesso de um discípulo
//
// O English é por convite: só quem o admin marca aqui vê o card no
// dashboard e entra na trilha. Grava `profiles.english_liberado`.
// =============================================================

export async function POST(req: NextRequest) {
  if (!MOCK) {
    const u = await createServerClient();
    const { data: { user } } = await u.auth.getUser();
    if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });
    const { data: perfil } = await u.from("profiles").select("is_admin").eq("id", user.id).single();
    if (!perfil?.is_admin) return NextResponse.json({ erro: "acesso negado" }, { status: 403 });
  }

  let body: { alunoId?: string; liberado?: boolean };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }

  const alunoId = body.alunoId;
  if (!alunoId || typeof body.liberado !== "boolean") {
    return NextResponse.json({ erro: "alunoId e liberado obrigatórios" }, { status: 400 });
  }

  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
  });

  const { error } = await admin
    .from("profiles")
    .update({ english_liberado: body.liberado })
    .eq("id", alunoId);

  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  return NextResponse.json({ ok: true, liberado: body.liberado });
}
