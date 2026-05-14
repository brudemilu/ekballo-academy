import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";

export async function GET() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return NextResponse.json({ erro: "Não autenticado" }, { status: 401 });

  const { data: profile } = await supabase
    .from("profiles")
    .select("is_admin")
    .eq("id", user.id)
    .single();
  if (!profile?.is_admin)
    return NextResponse.json({ erro: "Sem permissão" }, { status: 403 });

  const { data } = await supabase
    .from("respostas")
    .select(
      "id, texto, comentario_lider, comentario_lider_em, created_at, updated_at, atividade:atividades(pergunta, aula:aulas(titulo, curso:cursos(titulo, slug))), aluno:profiles(nome, email, turma)"
    )
    .order("created_at", { ascending: false });

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

  const escape = (v: any) => {
    if (v === null || v === undefined) return "";
    const s = String(v).replace(/"/g, '""');
    return `"${s}"`;
  };

  const linhas = (data || []).map((r: any) => [
    new Date(r.created_at).toLocaleString("pt-BR"),
    r.aluno?.nome || "",
    r.aluno?.email || "",
    r.aluno?.turma || "",
    r.atividade?.aula?.curso?.titulo || "",
    r.atividade?.aula?.titulo || "",
    r.atividade?.pergunta || "",
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
