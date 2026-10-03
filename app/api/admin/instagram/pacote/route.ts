import { type NextRequest, NextResponse } from "next/server";
import { montarFonte, type PedidoFonte } from "@/lib/conteudo-fonte";
import { contextoDoPerfil } from "@/lib/conteudo-perfil";
import {
  criarIdeiaConteudo,
  getCurrentSession,
  getPerfilConteudo,
  getReferenciaConteudo,
  salvarCarrosselInstagram,
  salvarRoteiroConteudo,
} from "@/lib/db";
import { TEMA_PADRAO } from "@/lib/instagram-render";
import { chamarLLM } from "@/lib/llm";
import {
  normalizarPacote,
  storyEmTexto,
  systemPacote,
  usuarioPacote,
  validarDias,
} from "@/lib/pacote";
import {
  MIN_FONTE,
  normalizarRoteiro,
  recortarFonte,
  systemRoteiro,
  usuarioRoteiro,
} from "@/lib/roteiro";

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

    // As duas chamadas saem juntas: carrossel + story numa, roteiro na outra.
    // A referência de forma só vale para o roteiro — é nele que gancho e ritmo importam.
    const [pecasR, roteiroR] = await Promise.allSettled([
      chamarLLM(
        systemPacote(contextoDoPerfil(perfil)),
        usuarioPacote(fonteIA, foco),
        2400,
      ).then(normalizarPacote),
      chamarLLM(
        systemRoteiro(DURACAO_REEL, contextoDoPerfil(perfil, referencia)),
        usuarioRoteiro(fonteIA, foco),
        2200,
      ).then(normalizarRoteiro),
    ]);

    if (pecasR.status === "rejected" && roteiroR.status === "rejected") {
      throw pecasR.reason instanceof Error
        ? pecasR.reason
        : new Error("Falha ao montar o pacote.");
    }

    const origem = { tipo: fonte.tipo, titulo: fonte.titulo, autor: fonte.autor };
    const criadas: string[] = [];
    const falhas: string[] = [];

    if (pecasR.status === "fulfilled") {
      const pecas = pecasR.value;
      const { id: carrosselId } = await salvarCarrosselInstagram({
        conteudo: `${fonte.titulo}\n\n${pecas.tema}`.trim(),
        slides: pecas.carrossel.slides.map((s) => ({
          ...s,
          cor: "#C9A961",
          fonte: "anton",
          top: "",
          ref: "",
          seed: Math.floor(Math.random() * 1_000_000),
          tema: TEMA_PADRAO,
          tom: "escuro",
        })) as never,
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

    if (roteiroR.status === "fulfilled") {
      const salvo = await salvarRoteiroConteudo({
        roteiro: roteiroR.value,
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
