import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { podeUsarCaderno } from "@/lib/permissoes";
import { listPastas, criarPasta } from "@/lib/anotacoes";
import type { CorAnotacao } from "@/lib/anotacoes-meta";

async function guarda() {
  const session = await getCurrentSession();
  if (!session) return { erro: NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 }) };
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    return { erro: NextResponse.json({ ok: false, erro: "sem acesso ao caderno" }, { status: 403 }) };
  }
  return { session };
}

export async function GET() {
  const { session, erro } = await guarda();
  if (erro || !session) return erro;
  return NextResponse.json({ ok: true, pastas: await listPastas(session.userId) });
}

export async function POST(req: Request) {
  const { session, erro } = await guarda();
  if (erro || !session) return erro;

  let corpo: { nome?: string; cor?: CorAnotacao } = {};
  try {
    corpo = (await req.json()) as { nome?: string; cor?: CorAnotacao };
  } catch {
    // sem corpo → nome vazio → 400 abaixo
  }
  if (!corpo.nome?.trim()) {
    return NextResponse.json({ ok: false, erro: "nome é obrigatório" }, { status: 400 });
  }

  const pasta = await criarPasta(session.userId, corpo.nome, corpo.cor);
  if (!pasta) {
    return NextResponse.json({ ok: false, erro: "falha ao criar pasta" }, { status: 500 });
  }
  return NextResponse.json({ ok: true, pasta }, { status: 201 });
}
