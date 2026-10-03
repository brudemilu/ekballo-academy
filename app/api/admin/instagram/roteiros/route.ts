import { type NextRequest, NextResponse } from "next/server";
import { contextoDoPerfil } from "@/lib/conteudo-perfil";
import {
  atualizarRoteiroConteudo,
  deletarRoteiroConteudo,
  getAula,
  getCurrentSession,
  getPerfilConteudo,
  getReferenciaConteudo,
  listAulasByCurso,
  listCursosPublicados,
  salvarRoteiroConteudo,
} from "@/lib/db";
import { getDevocionalDoDia } from "@/lib/devocionais";
import { chamarLLM } from "@/lib/llm";
import {
  duracaoValida,
  type FonteRoteiro,
  MIN_FONTE,
  normalizarRoteiro,
  type OrigemRoteiro,
  recortarFonte,
  systemRoteiro,
  usuarioRoteiro,
} from "@/lib/roteiro";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * Roteiros de vídeo (aba Roteiros em /admin/instagram). Admin-only.
 *  - GET    ?aulasDe=<cursoId>                 → mesas do livro, para o seletor
 *  - POST   { gerar: { fonte, duracao, referenciaId?, foco? } } → roteiro (não grava)
 *  - POST   { salvar: { roteiro, duracao, fonte } }             → grava
 *  - PATCH  { id, roteiro }                    → atualiza um roteiro guardado
 *  - DELETE ?id=<uuid>
 */

// Aulas que são prova, não leitura: não servem de fonte.
const MARCA_AVALIACAO = "[[AVALIACAO_PARACH]]";

async function exigirAdmin() {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

function recusa(erro: string, status = 400) {
  return NextResponse.json({ error: erro }, { status });
}

function falha(e: unknown, padrao: string) {
  return NextResponse.json(
    { error: e instanceof Error ? e.message : padrao },
    { status: 500 },
  );
}

export async function GET(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const cursoId = req.nextUrl.searchParams.get("aulasDe");
  if (!cursoId) return recusa("aulasDe é obrigatório");
  try {
    const aulas = (await listAulasByCurso(cursoId))
      .filter((a) => a.conteudo && !a.conteudo.startsWith(MARCA_AVALIACAO))
      .map((a) => ({ id: a.id, titulo: a.titulo, ordem: a.ordem }));
    return NextResponse.json({ aulas });
  } catch (e) {
    return falha(e, "Falha ao listar as mesas.");
  }
}

type PedidoFonte =
  | { tipo: "mesa"; cursoId?: string; aulaId?: string }
  | { tipo: "devocional"; data?: string }
  | { tipo: "livre"; titulo?: string; texto?: string };

/** Busca o texto da fonte escolhida; devolve a mensagem de erro para a tela se não der. */
async function montarFonte(pedido: PedidoFonte): Promise<FonteRoteiro | string> {
  if (pedido?.tipo === "mesa") {
    if (!pedido.cursoId || !pedido.aulaId) return "Escolha o livro e a mesa.";
    const [aula, cursos] = await Promise.all([
      getAula(pedido.aulaId, pedido.cursoId),
      listCursosPublicados(),
    ]);
    if (!aula?.conteudo) return "Essa mesa não tem texto de leitura.";
    const curso = cursos.find((c) => c.id === pedido.cursoId);
    return {
      tipo: "mesa",
      titulo: curso ? `${curso.titulo} · ${aula.titulo}` : aula.titulo,
      autor: curso?.autor || undefined,
      texto: aula.conteudo,
    };
  }
  if (pedido?.tipo === "devocional") {
    const dia = /^\d{4}-\d{2}-\d{2}$/.test(pedido.data || "") ? pedido.data : undefined;
    const dev = await getDevocionalDoDia(dia);
    if (!dev) return "Não há devocional para esse dia.";
    return {
      tipo: "devocional",
      titulo: `Devocional · ${dev.titulo || dev.versiculo_ref}`,
      autor: dev.autor || undefined,
      texto: `${dev.versiculo_ref} (${dev.versiculo_versao}): ${dev.versiculo_texto}\n\n${dev.reflexao}`,
    };
  }
  if (pedido?.tipo === "livre") {
    const texto = typeof pedido.texto === "string" ? pedido.texto : "";
    return {
      tipo: "livre",
      titulo:
        (typeof pedido.titulo === "string" && pedido.titulo.trim().slice(0, 120)) ||
        "Texto colado",
      texto,
    };
  }
  return "Escolha de onde o roteiro vai sair.";
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const corpo = await req.json().catch(() => null);

  if (corpo?.salvar) {
    const { roteiro, duracao, fonte } = corpo.salvar as {
      roteiro?: unknown;
      duracao?: unknown;
      fonte?: OrigemRoteiro;
    };
    if (!duracaoValida(duracao)) return recusa("Duração inválida.");
    try {
      const salvo = await salvarRoteiroConteudo({
        roteiro: normalizarRoteiro(roteiro),
        duracao,
        fonte: {
          tipo:
            fonte?.tipo === "mesa" || fonte?.tipo === "devocional"
              ? fonte.tipo
              : "livre",
          titulo: typeof fonte?.titulo === "string" ? fonte.titulo.slice(0, 200) : "",
          autor:
            typeof fonte?.autor === "string" ? fonte.autor.slice(0, 120) : undefined,
        },
      });
      return NextResponse.json({ ok: true, salvo });
    } catch (e) {
      return falha(e, "Falha ao salvar o roteiro.");
    }
  }

  const pedido = corpo?.gerar as
    | { fonte?: PedidoFonte; duracao?: unknown; referenciaId?: string; foco?: string }
    | undefined;
  if (!pedido) return recusa("Pedido inválido.");
  if (!duracaoValida(pedido.duracao)) return recusa("Escolha a duração do vídeo.");

  try {
    const fonte = await montarFonte(pedido.fonte as PedidoFonte);
    if (typeof fonte === "string") return recusa(fonte);
    const { texto, cortado } = recortarFonte(fonte.texto);
    if (texto.length < MIN_FONTE) {
      return recusa(
        "A fonte é curta demais para virar roteiro. Cole ou escolha um texto maior.",
      );
    }

    const [perfil, referencia] = await Promise.all([
      getPerfilConteudo(),
      pedido.referenciaId
        ? getReferenciaConteudo(pedido.referenciaId)
        : Promise.resolve(null),
    ]);

    const bruto = await chamarLLM(
      systemRoteiro(pedido.duracao, contextoDoPerfil(perfil, referencia)),
      usuarioRoteiro(
        { ...fonte, texto },
        typeof pedido.foco === "string" ? pedido.foco.slice(0, 400) : undefined,
      ),
      2200,
    );
    const origem: OrigemRoteiro = {
      tipo: fonte.tipo,
      titulo: fonte.titulo,
      autor: fonte.autor,
    };
    return NextResponse.json({
      ok: true,
      roteiro: normalizarRoteiro(bruto),
      fonte: origem,
      cortado,
    });
  } catch (e) {
    return falha(e, "Falha ao gerar o roteiro.");
  }
}

export async function PATCH(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const corpo = await req.json().catch(() => null);
  if (!corpo || typeof corpo.id !== "string") return recusa("id é obrigatório");
  try {
    await atualizarRoteiroConteudo(corpo.id, normalizarRoteiro(corpo.roteiro));
    return NextResponse.json({ ok: true });
  } catch (e) {
    return falha(e, "Falha ao atualizar o roteiro.");
  }
}

export async function DELETE(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const id = req.nextUrl.searchParams.get("id");
  if (!id) return recusa("id é obrigatório");
  try {
    await deletarRoteiroConteudo(id);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return falha(e, "Falha ao excluir o roteiro.");
  }
}
