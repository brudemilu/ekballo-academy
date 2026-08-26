import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { podeUsarCaderno } from "@/lib/permissoes";
import { listAnotacoes, criarAnotacao, type EntradaAnotacao } from "@/lib/anotacoes";

// Caderno do discípulo. Sempre no escopo da sessão — o corpo da requisição
// nunca escolhe de quem é a anotação.

export async function GET(req: Request) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 });
  }
  const url = new URL(req.url);
  const anotacoes = await listAnotacoes(session.userId, {
    incluirArquivadas: url.searchParams.get("arquivadas") === "1",
    cursoId: url.searchParams.get("curso") || undefined,
    aulaId: url.searchParams.get("aula") || undefined,
  });
  return NextResponse.json({ ok: true, anotacoes });
}

export async function POST(req: Request) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 });
  }

  let corpo: EntradaAnotacao = {};
  try {
    corpo = (await req.json()) as EntradaAnotacao;
  } catch {
    // corpo vazio é válido: "Nova anotação" cria a folha em branco
  }

  const anotacao = await criarAnotacao(session.userId, corpo);
  if (!anotacao) {
    return NextResponse.json({ ok: false, erro: "falha ao criar" }, { status: 500 });
  }
  return NextResponse.json({ ok: true, anotacao }, { status: 201 });
}
