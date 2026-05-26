import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Aluno marca/desmarca um dia (1..365) do Devocional Anual.
// Body: { dia_ano, acao: "marcar" | "desmarcar" }
export async function POST(req: NextRequest) {
  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  let body: { dia_ano?: number; acao?: "marcar" | "desmarcar" };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }
  const { dia_ano, acao } = body;
  if (
    !Number.isInteger(dia_ano) ||
    (dia_ano as number) < 1 ||
    (dia_ano as number) > 365 ||
    (acao !== "marcar" && acao !== "desmarcar")
  ) {
    return NextResponse.json(
      { erro: "dia_ano (1..365) e acao válidos obrigatórios" },
      { status: 400 }
    );
  }

  if (acao === "marcar") {
    const { error } = await supabase
      .from("devocional_anual_progresso")
      .upsert(
        { aluno_id: user.id, dia_ano },
        { onConflict: "aluno_id,dia_ano" }
      );
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  } else {
    const { error } = await supabase
      .from("devocional_anual_progresso")
      .delete()
      .eq("aluno_id", user.id)
      .eq("dia_ano", dia_ano);
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  }

  return NextResponse.json({ ok: true });
}
