import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Aluno salva (ou apaga) a reflexão pessoal de um dia (1..365) do
// Devocional Anual — "o que mais falou contigo". Preenchimento opcional.
// Body: { dia_ano, texto }. Texto vazio remove a reflexão.
export async function POST(req: NextRequest) {
  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  let body: { dia_ano?: number; texto?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }
  const { dia_ano } = body;
  const texto = (body.texto ?? "").trim();
  if (
    !Number.isInteger(dia_ano) ||
    (dia_ano as number) < 1 ||
    (dia_ano as number) > 365
  ) {
    return NextResponse.json(
      { erro: "dia_ano (1..365) obrigatório" },
      { status: 400 }
    );
  }

  if (texto === "") {
    const { error } = await supabase
      .from("devocional_anual_reflexao")
      .delete()
      .eq("aluno_id", user.id)
      .eq("dia_ano", dia_ano);
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
    return NextResponse.json({ ok: true, vazio: true });
  }

  const { error } = await supabase
    .from("devocional_anual_reflexao")
    .upsert(
      { aluno_id: user.id, dia_ano, texto, atualizado_em: new Date().toISOString() },
      { onConflict: "aluno_id,dia_ano" }
    );
  if (error) return NextResponse.json({ erro: error.message }, { status: 500 });

  return NextResponse.json({ ok: true });
}
