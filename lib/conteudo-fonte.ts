/**
 * Busca o texto de onde o conteúdo vai sair: uma mesa, o devocional de um dia
 * ou um texto colado. Usado pelos roteiros e pelo pacote da semana — os dois
 * partem da mesma escolha de fonte (issue #189).
 */
import { getAula, listAulasByCurso, listCursosPublicados } from "@/lib/db";
import { getDevocionalDoDia } from "@/lib/devocionais";
import type { FonteRoteiro } from "@/lib/roteiro";

// Aulas que são prova, não leitura: não servem de fonte.
const MARCA_AVALIACAO = "[[AVALIACAO_PARACH]]";

export type PedidoFonte =
  | { tipo: "mesa"; cursoId?: string; aulaId?: string }
  | { tipo: "devocional"; data?: string }
  | { tipo: "livre"; titulo?: string; texto?: string };

/** As mesas de um livro que têm texto de leitura, para o seletor. */
export async function listarMesasComLeitura(cursoId: string) {
  return (await listAulasByCurso(cursoId))
    .filter((a) => a.conteudo && !a.conteudo.startsWith(MARCA_AVALIACAO))
    .map((a) => ({ id: a.id, titulo: a.titulo, ordem: a.ordem }));
}

/** Devolve a fonte pronta, ou a mensagem de erro para a tela se não der. */
export async function montarFonte(
  pedido: PedidoFonte | undefined,
): Promise<FonteRoteiro | string> {
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
    return {
      tipo: "livre",
      titulo:
        (typeof pedido.titulo === "string" && pedido.titulo.trim().slice(0, 120)) ||
        "Texto colado",
      texto: typeof pedido.texto === "string" ? pedido.texto : "",
    };
  }
  return "Escolha de onde o conteúdo vai sair.";
}
