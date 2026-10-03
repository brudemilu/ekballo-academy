import { type NextRequest, NextResponse } from "next/server";
import {
  atualizarExecucaoPiloto,
  criarExecucaoPiloto,
  desagendarCarrosselInstagram,
  getCurrentSession,
  listExecucoesPiloto,
  salvarPilotoConfig,
} from "@/lib/db";
import { podeVetar, validarPiloto } from "@/lib/piloto";
import { executarPiloto } from "@/lib/piloto-executar";

export const runtime = "nodejs";

/**
 * Piloto automático (aba Piloto em /admin/instagram). Admin-only.
 *  - GET                                  → as execuções recentes (a tela consulta enquanto prepara)
 *  - PUT  { ...configuração }             → salva e liga/desliga
 *  - POST { rodar: true }                 → prepara a semana agora
 *  - POST { vetar: { execucaoId, indice } } → cancela a publicação de uma peça
 */

async function exigirAdmin() {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

function recusa(erro: string, status = 400) {
  return NextResponse.json({ error: erro }, { status });
}

export async function GET() {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  try {
    return NextResponse.json({ execucoes: await listExecucoesPiloto() });
  } catch (e) {
    return recusa(e instanceof Error ? e.message : "Falha ao ler o piloto.", 500);
  }
}

export async function PUT(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const v = validarPiloto(await req.json().catch(() => null));
  if (!v.ok) return recusa(v.erro);
  try {
    await salvarPilotoConfig(v.valor);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return recusa(e instanceof Error ? e.message : "Falha ao salvar.", 500);
  }
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const corpo = await req.json().catch(() => null);

  if (corpo?.vetar) {
    const { execucaoId, indice } = corpo.vetar as {
      execucaoId?: string;
      indice?: number;
    };
    if (!execucaoId || typeof indice !== "number") return recusa("Pedido inválido.");
    try {
      const execucao = (await listExecucoesPiloto()).find((e) => e.id === execucaoId);
      const peca = execucao?.pecas[indice];
      if (!execucao || !peca) return recusa("Peça não encontrada.", 404);
      if (!podeVetar(peca, new Date())) {
        return recusa("Essa peça já foi ao ar ou já estava cancelada.");
      }
      // Primeiro tira da fila de publicação; só depois marca como vetada. Se a
      // segunda parte falhar, o que importa (não publicar) já está garantido.
      if (peca.post_id) await desagendarCarrosselInstagram(peca.post_id);
      const pecas = execucao.pecas.map((p, i) =>
        i === indice ? { ...p, estado: "vetado" as const } : p,
      );
      await atualizarExecucaoPiloto(execucaoId, { pecas });
      return NextResponse.json({ ok: true, pecas });
    } catch (e) {
      return recusa(e instanceof Error ? e.message : "Falha ao cancelar.", 500);
    }
  }

  if (corpo?.rodar) {
    try {
      const [ultima] = await listExecucoesPiloto();
      if (
        ultima?.status === "preparando" &&
        Date.now() - new Date(ultima.criado_em).getTime() < 10 * 60_000
      ) {
        return recusa("O piloto já está preparando uma semana. Aguarde terminar.");
      }
      const execucao = await criarExecucaoPiloto();
      void executarPiloto(execucao.id);
      return NextResponse.json({ ok: true, execucao });
    } catch (e) {
      return recusa(e instanceof Error ? e.message : "Falha ao começar.", 500);
    }
  }

  return recusa("Pedido inválido.");
}
