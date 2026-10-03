import { type NextRequest, NextResponse } from "next/server";
import {
  MAX_REFERENCIAS,
  normalizarDNAReferencia,
  podeAnalisar,
  SYSTEM_ANALISE_REFERENCIA,
  usuarioAnaliseReferencia,
  validarReferencia,
} from "@/lib/conteudo-perfil";
import {
  atualizarReferenciaConteudo,
  criarReferenciaConteudo,
  deletarReferenciaConteudo,
  getCurrentSession,
  getReferenciaConteudo,
  listReferenciasConteudo,
} from "@/lib/db";
import { chamarLLM } from "@/lib/llm";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * Criadores de referência (aba Perfil em /admin/instagram). Admin-only.
 *  - POST   { nome, link?, exemplos? }        → cadastra
 *  - POST   { analisar: id }                  → extrai o DNA dos exemplos salvos
 *  - PATCH  { id, nome?, link?, exemplos?, dna? } → edita (dna editado à mão vale)
 *  - DELETE ?id=<uuid>                        → exclui
 */

async function exigirAdmin() {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

function falha(e: unknown, padrao: string) {
  return NextResponse.json(
    { error: e instanceof Error ? e.message : padrao },
    { status: 500 },
  );
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const corpo = await req.json().catch(() => null);

  if (corpo && typeof corpo.analisar === "string") {
    try {
      const ref = await getReferenciaConteudo(corpo.analisar);
      if (!ref)
        return NextResponse.json(
          { error: "Referência não encontrada." },
          { status: 404 },
        );
      if (!podeAnalisar(ref.exemplos)) {
        return NextResponse.json(
          {
            error:
              "Cole (e salve) alguns exemplos desse criador antes de analisar — legendas ou transcrições.",
          },
          { status: 400 },
        );
      }
      const bruto = await chamarLLM(
        SYSTEM_ANALISE_REFERENCIA,
        usuarioAnaliseReferencia(ref),
        1400,
      );
      const dna = normalizarDNAReferencia(bruto);
      const analisado_em = new Date().toISOString();
      await atualizarReferenciaConteudo(ref.id, { dna, analisado_em });
      return NextResponse.json({ ok: true, dna, analisado_em });
    } catch (e) {
      return falha(e, "Falha ao analisar.");
    }
  }

  const v = validarReferencia(corpo);
  if (!v.ok) return NextResponse.json({ error: v.erro }, { status: 400 });
  try {
    if ((await listReferenciasConteudo()).length >= MAX_REFERENCIAS) {
      return NextResponse.json(
        {
          error: `No máximo ${MAX_REFERENCIAS} criadores. Poucos e bem escolhidos funcionam melhor.`,
        },
        { status: 400 },
      );
    }
    const referencia = await criarReferenciaConteudo({
      ...v.valor,
      nome: v.valor.nome as string,
    });
    return NextResponse.json({ ok: true, referencia });
  } catch (e) {
    return falha(e, "Falha ao salvar.");
  }
}

export async function PATCH(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const corpo = await req.json().catch(() => null);
  const id = corpo && typeof corpo.id === "string" ? corpo.id : "";
  if (!id) return NextResponse.json({ error: "id é obrigatório" }, { status: 400 });
  const v = validarReferencia(corpo, true);
  if (!v.ok) return NextResponse.json({ error: v.erro }, { status: 400 });
  try {
    const patch: Parameters<typeof atualizarReferenciaConteudo>[1] = { ...v.valor };
    if (corpo.dna !== undefined) {
      // DNA editado à mão passa pelo mesmo funil da resposta da IA.
      patch.dna =
        corpo.dna === null ? null : normalizarDNAReferencia(JSON.stringify(corpo.dna));
    }
    if (!Object.keys(patch).length)
      return NextResponse.json({ error: "Nada para atualizar." }, { status: 400 });
    await atualizarReferenciaConteudo(id, patch);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return falha(e, "Falha ao atualizar.");
  }
}

export async function DELETE(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const id = req.nextUrl.searchParams.get("id");
  if (!id) return NextResponse.json({ error: "id é obrigatório" }, { status: 400 });
  try {
    await deletarReferenciaConteudo(id);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return falha(e, "Falha ao excluir.");
  }
}
