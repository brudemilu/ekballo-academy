import { NextResponse } from "next/server";
import {
  addMockMatricula,
  MOCK_MATRICULAS,
  removeMockMatricula,
} from "@/lib/mock-data";

// Endpoint só usado em modo mock para persistir alterações de matrícula no
// estado server-side. Aceita um discípulo (`alunoId`) ou vários (`alunoIds`),
// espelhando as duas rotas reais: /api/admin/matricular e .../matricular-lote.
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
  const lista = Array.isArray((body as { alunoIds?: unknown }).alunoIds)
    ? (body as { alunoIds: unknown[] }).alunoIds.filter(
        (id): id is string => typeof id === "string" && !!id,
      )
    : [];
  const alunoIds = alunoId ? [alunoId, ...lista] : lista;

  if (
    alunoIds.length === 0 ||
    !cursoId ||
    (acao !== "matricular" && acao !== "desmatricular")
  ) {
    return NextResponse.json({ erro: "Faltam campos" }, { status: 400 });
  }
  // Conta antes de escrever: depois do add, todo mundo "já estava".
  const novos = alunoIds.filter(
    (id) => !MOCK_MATRICULAS.some((m) => m.aluno_id === id && m.curso_id === cursoId),
  );
  for (const id of alunoIds) {
    if (acao === "matricular") {
      addMockMatricula(id, cursoId);
    } else {
      removeMockMatricula(id, cursoId);
    }
  }
  return NextResponse.json({
    ok: true,
    entraram: acao === "matricular" ? novos.length : 0,
    jaEstavam: acao === "matricular" ? alunoIds.length - novos.length : 0,
    removidos: acao === "desmatricular" ? alunoIds.length : 0,
    whatsapp: { enfileirados: 0, semTelefone: 0, erros: 0 },
  });
}
