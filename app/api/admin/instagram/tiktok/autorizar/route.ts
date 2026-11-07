import { type NextRequest, NextResponse } from "next/server";
import { getCurrentSession, salvarAutorizacaoTikTok } from "@/lib/db";
import { CONTA_PRINCIPAL_ID } from "@/lib/instagram-contas";
import { isMockMode } from "@/lib/mock-data";
import {
  type AutorizacaoTikTok,
  type CriadorTikTok,
  validarAutorizacao,
} from "@/lib/tiktok";
import { lerCriador } from "@/lib/tiktok-api";
import { contaTikTok, tokenTikTok } from "@/lib/tiktok-credenciais";

export const runtime = "nodejs";

/**
 * Autorização de publicação direta no TikTok, por vídeo (issue #275).
 *
 *  GET                         dados da conta agora (nome, privacidades, bloqueios, duração máxima)
 *  POST { id, autorizacao }    confere com a conta e grava no post
 *  DELETE ?id=                 tira a autorização (o Reel volta a ir para os rascunhos)
 *
 * O TikTok exige ler os dados da conta a cada post e só aceitar as opções
 * que ela devolve — por isso o POST confere de novo antes de gravar.
 */

const CRIADOR_MOCK: CriadorTikTok = {
  nome: "Bruno Fernandes",
  usuario: "brunofesantos",
  privacidades: ["PUBLIC_TO_EVERYONE", "MUTUAL_FOLLOW_FRIENDS", "SELF_ONLY"],
  comentarioBloqueado: false,
  duetoBloqueado: false,
  costuraBloqueada: false,
  duracaoMaximaSeg: 600,
};

async function exigirAdmin() {
  const s = await getCurrentSession();
  return Boolean(s?.profile?.is_admin);
}

async function criadorAgora(): Promise<CriadorTikTok> {
  if (isMockMode()) return CRIADOR_MOCK;
  const token = await tokenTikTok(CONTA_PRINCIPAL_ID);
  if (!token)
    throw new Error("Conecte a conta do TikTok no painel antes de autorizar.");
  return lerCriador(token);
}

export async function GET() {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  try {
    const conectado = isMockMode() || Boolean(await contaTikTok(CONTA_PRINCIPAL_ID));
    if (!conectado) return NextResponse.json({ conectado: false });
    return NextResponse.json({ conectado: true, criador: await criadorAgora() });
  } catch (e) {
    // "Não dá para publicar agora" também cai aqui: a tela avisa e não deixa autorizar.
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "não consegui ler a conta do TikTok" },
      { status: 502 },
    );
  }
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const body = (await req.json().catch(() => null)) as {
    id?: unknown;
    autorizacao?: Partial<AutorizacaoTikTok>;
    duracaoSeg?: unknown;
  } | null;
  if (typeof body?.id !== "string" || !body.autorizacao)
    return NextResponse.json(
      { error: "informe o post e as escolhas" },
      { status: 400 },
    );
  try {
    const criador = await criadorAgora();
    const a = body.autorizacao;
    const duracao = typeof body.duracaoSeg === "number" ? body.duracaoSeg : undefined;
    const problemas = validarAutorizacao(a, criador, duracao);
    if (problemas.length)
      return NextResponse.json({ error: problemas.join(" ") }, { status: 400 });
    const gravada: AutorizacaoTikTok = {
      privacidade: String(a.privacidade),
      comentarios: a.comentarios === true,
      dueto: a.dueto === true,
      costura: a.costura === true,
      comercial: a.comercial === true,
      suaMarca: a.comercial === true && a.suaMarca === true,
      conteudoDeMarca: a.comercial === true && a.conteudoDeMarca === true,
      legenda: String(a.legenda ?? ""),
      autorizadoEm: new Date().toISOString(),
      conta: criador.nome || criador.usuario,
    };
    await salvarAutorizacaoTikTok(body.id, gravada);
    return NextResponse.json({ ok: true, autorizacao: gravada });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "falha ao autorizar" },
      { status: 500 },
    );
  }
}

export async function DELETE(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const id = req.nextUrl.searchParams.get("id") || "";
  if (!id) return NextResponse.json({ error: "informe o post" }, { status: 400 });
  try {
    await salvarAutorizacaoTikTok(id, null);
    return NextResponse.json({ ok: true });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "falha" },
      { status: 500 },
    );
  }
}
