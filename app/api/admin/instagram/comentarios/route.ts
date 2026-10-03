import { type NextRequest, NextResponse } from "next/server";
import { MAX_REGRAS, palavraRepetida, validarRegra } from "@/lib/comentarios-auto";
import {
  criarRegraComentario,
  excluirRegraComentario,
  getCurrentSession,
  listRegrasComentario,
  salvarComentariosAtivo,
} from "@/lib/db";

export const runtime = "nodejs";

/**
 * Resposta automática a comentários (aba Respostas em /admin/instagram). Admin-only.
 *  - PUT    { ativo }                                        → liga/desliga
 *  - POST   { palavra, resposta_publica, mensagem_privada }  → cria uma regra
 *  - DELETE ?id=                                             → apaga uma regra
 */

async function exigirAdmin() {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

function recusa(erro: string, status = 400) {
  return NextResponse.json({ error: erro }, { status });
}

export async function PUT(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const corpo = await req.json().catch(() => null);
  if (typeof corpo?.ativo !== "boolean") return recusa("Pedido inválido.");
  try {
    // Ligar sem regra não faria nada — e pareceria ligado.
    if (corpo.ativo && !(await listRegrasComentario()).length)
      return recusa("Crie pelo menos uma regra antes de ligar.");
    await salvarComentariosAtivo(corpo.ativo);
    return NextResponse.json({ ok: true, ativo: corpo.ativo });
  } catch (e) {
    return recusa(e instanceof Error ? e.message : "Falha ao salvar.", 500);
  }
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const v = validarRegra(await req.json().catch(() => null));
  if (!v.ok) return recusa(v.erro);
  try {
    const regras = await listRegrasComentario();
    if (regras.length >= MAX_REGRAS)
      return recusa(`São no máximo ${MAX_REGRAS} regras. Apague uma para criar outra.`);
    if (palavraRepetida(v.valor.palavra, regras))
      return recusa("Já existe uma regra para essa palavra.");
    return NextResponse.json({ ok: true, regra: await criarRegraComentario(v.valor) });
  } catch (e) {
    return recusa(e instanceof Error ? e.message : "Falha ao criar a regra.", 500);
  }
}

export async function DELETE(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const id = req.nextUrl.searchParams.get("id") || "";
  if (!id) return recusa("Pedido inválido.");
  try {
    await excluirRegraComentario(id);
    // Sem regra nenhuma, ligado não significa nada: desliga junto.
    if (!(await listRegrasComentario()).length) await salvarComentariosAtivo(false);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return recusa(e instanceof Error ? e.message : "Falha ao apagar.", 500);
  }
}
