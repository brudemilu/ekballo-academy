import { NextResponse } from "next/server";
import { setMockReflexao } from "@/lib/mock-data";

// Endpoint só usado em modo mock para persistir resposta de reflexão no estado server-side.
// Isso garante que a próxima aula só desbloqueie após o aluno responder de fato.
export async function POST(request: Request) {
  if (process.env.NEXT_PUBLIC_MOCK_MODE !== "true") {
    return NextResponse.json({ erro: "Modo mock desligado" }, { status: 400 });
  }
  const body = await request.json();
  const { atividadeId, alunoId, texto } = body as {
    atividadeId?: string;
    alunoId?: string;
    texto?: string;
  };
  if (!atividadeId || !alunoId || typeof texto !== "string" || !texto.trim()) {
    return NextResponse.json({ erro: "Faltam campos" }, { status: 400 });
  }
  setMockReflexao(alunoId, atividadeId, texto.trim());
  return NextResponse.json({ ok: true });
}
