import { NextResponse } from "next/server";
import { addMockMatricula, removeMockMatricula } from "@/lib/mock-data";

// Endpoint só usado em modo mock para persistir alterações de matrícula no estado server-side.
export async function POST(request: Request) {
  if (process.env.NEXT_PUBLIC_MOCK_MODE !== "true") {
    return NextResponse.json({ erro: "Modo mock desligado" }, { status: 400 });
  }
  const body = await request.json();
  const { alunoId, cursoId, acao } = body as {
    alunoId?: string;
    cursoId?: string;
    acao?: "matricular" | "desmatricular";
  };
  if (!alunoId || !cursoId || (acao !== "matricular" && acao !== "desmatricular")) {
    return NextResponse.json({ erro: "Faltam campos" }, { status: 400 });
  }
  if (acao === "matricular") {
    addMockMatricula(alunoId, cursoId);
  } else {
    removeMockMatricula(alunoId, cursoId);
  }
  return NextResponse.json({ ok: true });
}
