import { type NextRequest, NextResponse } from "next/server";
import { montarFonte, type PedidoFonte } from "@/lib/conteudo-fonte";
import {
  criarIdeiaConteudo,
  getCurrentSession,
  getPerfilConteudo,
  getReferenciaConteudo,
  salvarCarrosselInstagram,
  salvarRoteiroConteudo,
} from "@/lib/db";
import { storyEmTexto, validarDias } from "@/lib/pacote";
import { gerarPecasDaFonte, slidesParaSalvar } from "@/lib/pacote-gerar";
import { MIN_FONTE, recortarFonte } from "@/lib/roteiro";

export const runtime = "nodejs";
export const maxDuration = 60;

// O Reel do pacote sai sempre em 30 s: é o tamanho que mais se grava. Quem
// quiser outro, gera de novo na aba Roteiros.
const DURACAO_REEL = 30;

/**
 * Pacote da semana (aba Calendário em /admin/instagram). Admin-only.
 *  POST { fonte, dias: { carrossel, reel, story }, referenciaId?, foco? }
 * De uma fonte monta carrossel (rascunho no estúdio), roteiro de Reel
 * (guardado) e story com pergunta — e põe os três no calendário.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin)
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });

  const corpo = (await req.json().catch(() => null)) as {
    fonte?: PedidoFonte;
    dias?: unknown;
    referenciaId?: string;
    foco?: string;
  } | null;
  if (!corpo) return NextResponse.json({ error: "Pedido inválido." }, { status: 400 });

  const dias = validarDias(corpo.dias);
  if (typeof dias === "string")
    return NextResponse.json({ error: dias }, { status: 400 });

  try {
    const fonte = await montarFonte(corpo.fonte);
    if (typeof fonte === "string")
      return NextResponse.json({ error: fonte }, { status: 400 });
    const { texto, cortado } = recortarFonte(fonte.texto);
    if (texto.length < MIN_FONTE) {
      return NextResponse.json(
        {
          error:
            "A fonte é curta demais para uma semana de conteúdo. Cole ou escolha um texto maior.",
        },
        { status: 400 },
      );
    }

    const [perfil, referencia] = await Promise.all([
      getPerfilConteudo(),
      corpo.referenciaId
        ? getReferenciaConteudo(corpo.referenciaId)
        : Promise.resolve(null),
    ]);
    const foco = typeof corpo.foco === "string" ? corpo.foco.slice(0, 400) : undefined;
    const fonteIA = { ...fonte, texto };

    const gerado = await gerarPecasDaFonte(fonteIA, {
      perfil,
      referencia,
      foco,
      duracaoReel: DURACAO_REEL,
    });
    if (!gerado.pecas && !gerado.roteiro) {
      throw new Error(
        gerado.erros.pecas || gerado.erros.roteiro || "Falha ao montar o pacote.",
      );
    }

    const origem = { tipo: fonte.tipo, titulo: fonte.titulo, autor: fonte.autor };
    const criadas: string[] = [];
    const falhas: string[] = [];

    if (gerado.pecas) {
      const pecas = gerado.pecas;
      const { id: carrosselId } = await salvarCarrosselInstagram({
        conteudo: `${fonte.titulo}\n\n${pecas.tema}`.trim(),
        slides: slidesParaSalvar(pecas) as never,
        legenda: pecas.carrossel.legenda,
      });
      await criarIdeiaConteudo(
        {
          titulo: pecas.tema || fonte.titulo,
          nota: `Rascunho do carrossel pronto no estúdio (${pecas.carrossel.slides.length} slides).\nDe: ${fonte.titulo}`,
          formato: "carrossel",
          data_planejada: dias.carrossel,
        },
        { carrossel_id: carrosselId },
      );
      criadas.push("carrossel");

      if (pecas.story.pergunta) {
        await criarIdeiaConteudo({
          titulo: pecas.story.pergunta,
          nota: `${storyEmTexto(pecas.story)}\nDe: ${fonte.titulo}`,
          formato: "story",
          data_planejada: dias.story,
        });
        criadas.push("story");
      } else {
        falhas.push("story");
      }
    } else {
      falhas.push("carrossel", "story");
    }

    if (gerado.roteiro) {
      const salvo = await salvarRoteiroConteudo({
        roteiro: gerado.roteiro,
        duracao: DURACAO_REEL,
        fonte: origem,
      });
      await criarIdeiaConteudo(
        {
          titulo: salvo.titulo,
          nota: `Roteiro de ${DURACAO_REEL}s guardado.\nDe: ${fonte.titulo}`,
          formato: "roteiro",
          data_planejada: dias.reel,
        },
        { roteiro_id: salvo.id },
      );
      criadas.push("reel");
    } else {
      falhas.push("reel");
    }

    return NextResponse.json({
      ok: true,
      criadas,
      falhas,
      cortado,
      fonte: fonte.titulo,
    });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao montar o pacote." },
      { status: 500 },
    );
  }
}
