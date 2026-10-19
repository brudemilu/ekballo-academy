import { type NextRequest, NextResponse } from "next/server";
import {
  getCurrentSession,
  getTikTokConfig,
  listTikTokEnvios,
  repetirTikTokEnvio,
  salvarTikTokConfig,
} from "@/lib/db";
import { CONTA_PRINCIPAL_ID } from "@/lib/instagram-contas";
import { isMockMode } from "@/lib/mock-data";
import { ehModoTikTok } from "@/lib/tiktok";
import { credenciaisDoApp } from "@/lib/tiktok-api";
import { contaTikTok, desconectarTikTok } from "@/lib/tiktok-credenciais";

export const runtime = "nodejs";

/**
 * Instagram → TikTok (issue #273). Admin-only.
 *
 *  GET                                     estado do painel
 *  POST { ativo?, modo?, repetir? }        liga/desliga, troca o modo, tenta de novo
 *  DELETE                                  desconecta a conta do TikTok
 *
 * O token nunca volta numa resposta: a tela só sabe quem está conectado.
 */

async function exigirAdmin(): Promise<boolean> {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

function falha(e: unknown, padrao: string) {
  return NextResponse.json(
    { error: e instanceof Error ? e.message : padrao },
    { status: 500 },
  );
}

export async function GET() {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  try {
    const [config, envios, conta] = await Promise.all([
      getTikTokConfig(),
      listTikTokEnvios(),
      isMockMode() ? Promise.resolve(null) : contaTikTok(CONTA_PRINCIPAL_ID),
    ]);
    return NextResponse.json({
      configurado: Boolean(credenciaisDoApp()),
      conta,
      ...config,
      envios,
    });
  } catch (e) {
    return falha(e, "falha ao ler");
  }
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const body = (await req.json().catch(() => null)) as {
    ativo?: unknown;
    modo?: unknown;
    repetir?: unknown;
  } | null;
  try {
    if (typeof body?.repetir === "string" && body.repetir) {
      await repetirTikTokEnvio(body.repetir);
      return NextResponse.json({ ok: true });
    }
    const dados: { ativo?: boolean; modo?: "rascunho" | "direto" } = {};
    if (typeof body?.ativo === "boolean") dados.ativo = body.ativo;
    if (ehModoTikTok(body?.modo)) dados.modo = body.modo;
    if (!Object.keys(dados).length)
      return NextResponse.json(
        { error: "informe ativo, modo ou repetir" },
        { status: 400 },
      );
    if (dados.ativo && !isMockMode() && !(await contaTikTok(CONTA_PRINCIPAL_ID)))
      return NextResponse.json(
        { error: "conecte a conta do TikTok antes de ligar" },
        { status: 400 },
      );
    await salvarTikTokConfig(dados);
    return NextResponse.json({ ok: true, ...(await getTikTokConfig()) });
  } catch (e) {
    return falha(e, "falha ao salvar");
  }
}

export async function DELETE() {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  try {
    if (!isMockMode()) {
      await salvarTikTokConfig({ ativo: false });
      await desconectarTikTok(CONTA_PRINCIPAL_ID);
    }
    return NextResponse.json({ ok: true });
  } catch (e) {
    return falha(e, "falha ao desconectar");
  }
}
