import { type NextRequest, NextResponse } from "next/server";
import {
  conversaParaIA,
  normalizarResposta,
  systemAssistente,
  validarConversa,
} from "@/lib/assistente";
import { contextoDoPerfil } from "@/lib/conteudo-perfil";
import { getCurrentSession, getPerfilConteudo } from "@/lib/db";
import { chamarLLMLendo } from "@/lib/llm";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * Assistente de conteúdo (aba Assistente em /admin/instagram). Admin-only.
 *  POST { mensagens: [{ papel: "pastor" | "assistente", texto }] } → { resposta, ideias }
 * A conversa não é guardada no servidor: o navegador manda o histórico.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin)
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });

  const corpo = await req.json().catch(() => null);
  const v = validarConversa(corpo?.mensagens);
  if (!v.ok) return NextResponse.json({ error: v.erro }, { status: 400 });

  try {
    const perfil = await getPerfilConteudo().catch(() => null);
    const hoje = new Date().toLocaleDateString("pt-BR", {
      weekday: "long",
      day: "numeric",
      month: "long",
      year: "numeric",
      timeZone: "America/Sao_Paulo",
    });
    const resposta = await chamarLLMLendo(
      systemAssistente(perfil ? contextoDoPerfil(perfil) : "", hoje),
      conversaParaIA(v.valor),
      1800,
      normalizarResposta,
    );
    return NextResponse.json({ ok: true, ...resposta });
  } catch (e) {
    return NextResponse.json(
      {
        error: e instanceof Error ? e.message : "O assistente não conseguiu responder.",
      },
      { status: 502 },
    );
  }
}
