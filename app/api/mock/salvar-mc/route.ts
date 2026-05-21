import { NextResponse } from "next/server";
import { setMockMcAnswer } from "@/lib/mock-data";

// Endpoint só usado em modo mock para persistir resposta MC no estado server-side
export async function POST(request: Request) {
  if (process.env.NEXT_PUBLIC_MOCK_MODE !== "true") {
    return NextResponse.json({ erro: "Modo mock desligado" }, { status: 400 });
  }
  const body = await request.json();
  const { atividadeId, alunoId, alternativaId } = body;
  if (!atividadeId || !alunoId || !alternativaId) {
    return NextResponse.json({ erro: "Faltam campos" }, { status: 400 });
  }
  setMockMcAnswer(alunoId, atividadeId, alternativaId);
  return NextResponse.json({ ok: true });
}
