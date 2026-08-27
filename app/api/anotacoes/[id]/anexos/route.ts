import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { podeUsarCaderno } from "@/lib/permissoes";
import { getAnotacao } from "@/lib/anotacoes";
import { listAnexos, registrarAnexo } from "@/lib/anotacoes-anexos";

type Ctx = { params: Promise<{ id: string }> };

async function guarda(id: string) {
  const session = await getCurrentSession();
  if (!session) {
    return { erro: NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 }) };
  }
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return { erro: NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 }) };
  }
  // A anotação tem de ser desta pessoa: sem isso daria pra pendurar arquivo
  // no caderno alheio só sabendo o id.
  const anotacao = await getAnotacao(id, session.userId);
  if (!anotacao) {
    return { erro: NextResponse.json({ ok: false, erro: "não encontrada" }, { status: 404 }) };
  }
  return { session };
}

export async function GET(_req: Request, { params }: Ctx) {
  const { id } = await params;
  const { session, erro } = await guarda(id);
  if (erro || !session) return erro;
  return NextResponse.json({ ok: true, anexos: await listAnexos(id, session.userId) });
}

// Chamado DEPOIS que o navegador subiu o arquivo direto para o storage.
export async function POST(req: Request, { params }: Ctx) {
  const { id } = await params;
  const { session, erro } = await guarda(id);
  if (erro || !session) return erro;

  let corpo: { nome?: string; caminho?: string; tipo?: string; tamanho?: number };
  try {
    corpo = await req.json();
  } catch {
    return NextResponse.json({ ok: false, erro: "corpo inválido" }, { status: 400 });
  }
  if (!corpo.nome || !corpo.caminho) {
    return NextResponse.json({ ok: false, erro: "nome e caminho são obrigatórios" }, { status: 400 });
  }

  const anexo = await registrarAnexo(session.userId, {
    anotacao_id: id,
    nome: corpo.nome,
    caminho: corpo.caminho,
    tipo: corpo.tipo || "application/octet-stream",
    tamanho: corpo.tamanho || 0,
  });
  if (!anexo) {
    return NextResponse.json({ ok: false, erro: "falha ao registrar" }, { status: 400 });
  }
  return NextResponse.json({ ok: true, anexo }, { status: 201 });
}
