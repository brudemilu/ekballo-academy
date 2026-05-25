import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Aluno marca/desmarca um dia do plano como concluído.
// Body: { slug, dia, acao: "marcar" | "desmarcar" }
export async function POST(req: NextRequest) {
  if (MOCK) return NextResponse.json({ ok: true, mock: true });

  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "não autenticado" }, { status: 401 });

  let body: { slug?: string; dia?: number; acao?: "marcar" | "desmarcar" };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ erro: "body inválido" }, { status: 400 });
  }
  const { slug, dia, acao } = body;
  if (!slug || !dia || (acao !== "marcar" && acao !== "desmarcar")) {
    return NextResponse.json(
      { erro: "slug, dia e acao válidos obrigatórios" },
      { status: 400 }
    );
  }

  // Resolve plano_id pelo slug
  const { data: plano } = await supabase
    .from("planos_leitura")
    .select("id, dias_total")
    .eq("slug", slug)
    .maybeSingle();
  if (!plano) return NextResponse.json({ erro: "plano não encontrado" }, { status: 404 });
  if (dia < 1 || dia > plano.dias_total) {
    return NextResponse.json({ erro: "dia fora do plano" }, { status: 400 });
  }

  if (acao === "marcar") {
    const { error } = await supabase.from("plano_progresso").upsert(
      { aluno_id: user.id, plano_id: plano.id, dia },
      { onConflict: "aluno_id,plano_id,dia" }
    );
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  } else {
    const { error } = await supabase
      .from("plano_progresso")
      .delete()
      .eq("aluno_id", user.id)
      .eq("plano_id", plano.id)
      .eq("dia", dia);
    if (error) return NextResponse.json({ erro: error.message }, { status: 500 });
  }

  return NextResponse.json({ ok: true });
}
