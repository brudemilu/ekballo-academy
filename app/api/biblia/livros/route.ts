import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { listLivros } from "@/lib/biblia";

// Lista dos 66 livros para o seletor do bloco "Bíblia" do caderno. Só o que a
// tela precisa (id, nome, abreviação, testamento e nº de capítulos) — o texto
// dos versículos continua vindo pela rota de busca.
export async function GET() {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }

  const livros = await listLivros();
  return NextResponse.json({
    ok: true,
    livros: livros.map((l) => ({
      id: l.id,
      nome: l.nome,
      abrev: l.abrev,
      testamento: l.testamento,
      capitulos: l.capitulos_total,
    })),
  });
}
