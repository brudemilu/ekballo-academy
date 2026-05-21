import { NextResponse } from "next/server";
import { getCurrentSession, listAllRespostas } from "@/lib/db";

export async function GET() {
  const session = await getCurrentSession();
  if (!session) return NextResponse.json({ erro: "Não autenticado" }, { status: 401 });
  if (!session.profile?.is_admin)
    return NextResponse.json({ erro: "Sem permissão" }, { status: 403 });

  const data = await listAllRespostas();

  const headers = [
    "Data",
    "Aluno",
    "Email",
    "Turma",
    "Curso",
    "Aula",
    "Pergunta",
    "Resposta",
    "Comentario_Lider",
    "Data_Comentario",
  ];

  const escape = (v: unknown) => {
    if (v === null || v === undefined) return "";
    const s = String(v).replace(/"/g, '""');
    return `"${s}"`;
  };

  const linhas = data.map((r) => [
    new Date(r.created_at).toLocaleString("pt-BR"),
    r.alunoNome || "",
    r.alunoEmail || "",
    r.alunoTurma || "",
    r.cursoTitulo || "",
    r.aulaTitulo || "",
    r.pergunta || "",
    r.texto,
    r.comentario_lider || "",
    r.comentario_lider_em ? new Date(r.comentario_lider_em).toLocaleString("pt-BR") : "",
  ]);

  const csv =
    "﻿" + // BOM para Excel reconhecer UTF-8
    [headers.map(escape).join(","), ...linhas.map((l) => l.map(escape).join(","))].join("\n");

  return new NextResponse(csv, {
    headers: {
      "Content-Type": "text/csv; charset=utf-8",
      "Content-Disposition": `attachment; filename="ekballo-respostas-${new Date().toISOString().slice(0, 10)}.csv"`,
    },
  });
}
