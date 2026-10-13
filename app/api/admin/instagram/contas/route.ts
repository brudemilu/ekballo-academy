import { type NextRequest, NextResponse } from "next/server";
import {
  atualizarContaInstagram,
  criarContaInstagram,
  getCurrentSession,
  listContasInstagram,
} from "@/lib/db";
import { ehIdDeConta, lerTokenColado } from "@/lib/instagram-contas";
import {
  conferirToken,
  gravarToken,
  removerToken,
  TokenRecusado,
} from "@/lib/instagram-credenciais";
import { logoPermitida, storagePublico } from "@/lib/instagram-identidade";
import { isMockMode, listMockContas } from "@/lib/mock-data";
import { createServiceClient } from "@/lib/supabase/service";

export const runtime = "nodejs";

/**
 * Cadastro das contas de Instagram do painel (issue #264). Admin-only.
 *
 *  POST  { nome, assinatura?, token? }                    cria a conta
 *  PATCH { id, nome?, assinatura?, logo_url?, logo_legenda?, token?, desconectar? }
 *
 * O token nunca volta numa resposta: a tela só fica sabendo se a conta está
 * conectada e quando o token vence.
 */

const NOME_MAX = 80;
const ASSINATURA_MAX = 40;
const LEGENDA_LOGO_MAX = 24;

function recusa(error: string, status = 400) {
  return NextResponse.json({ error }, { status });
}

async function exigirAdmin(): Promise<boolean> {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

function texto(v: unknown, max: number): string {
  return typeof v === "string" ? v.trim().slice(0, max) : "";
}

/**
 * Confere o token no Instagram e o grava na conta. No modo de demonstração
 * não há Instagram nem banco: a conta só passa a constar como conectada.
 */
async function conectar(contaId: string, token: string): Promise<void> {
  if (isMockMode()) {
    const c = listMockContas().find((x) => x.id === contaId);
    if (c) {
      c.conectada = true;
      c.usuario = c.usuario || "conta.demo";
    }
    return;
  }
  await gravarToken(contaId, token, await conferirToken(token));
}

function falha(e: unknown, padrao: string) {
  // Token recusado é erro de quem preencheu (400); o resto é nosso (500).
  if (e instanceof TokenRecusado) return recusa(e.message);
  return recusa(e instanceof Error ? e.message : padrao, 500);
}

export async function POST(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const corpo = await req.json().catch(() => null);
  const nome = texto(corpo?.nome, NOME_MAX);
  if (!nome) return recusa("Dê um nome à conta.");
  const assinatura =
    texto(corpo?.assinatura, ASSINATURA_MAX) || nome.slice(0, ASSINATURA_MAX);

  const temToken = typeof corpo?.token === "string" && corpo.token.trim() !== "";
  const lido = temToken ? lerTokenColado(corpo.token) : null;
  if (lido && !lido.ok) return recusa(lido.erro);

  try {
    const { id } = await criarContaInstagram({ nome, assinatura });
    if (lido?.ok) {
      try {
        await conectar(id, lido.token);
      } catch (e) {
        // Conta criada com um token que não serviu: desfaz, para a tela não
        // ficar com uma conta pela metade a cada tentativa.
        if (!isMockMode()) {
          await createServiceClient().from("instagram_contas").delete().eq("id", id);
        }
        throw e;
      }
    }
    return NextResponse.json({ ok: true, id, contas: await listContasInstagram() });
  } catch (e) {
    return falha(e, "Falha ao criar a conta.");
  }
}

export async function PATCH(req: NextRequest) {
  if (!(await exigirAdmin())) return recusa("não autorizado", 401);
  const corpo = await req.json().catch(() => null);
  const id = corpo?.id;
  if (!ehIdDeConta(id)) return recusa("Conta inválida.");

  try {
    if (!(await listContasInstagram()).some((c) => c.id === id)) {
      return recusa("Conta não encontrada.", 404);
    }

    if (typeof corpo.token === "string" && corpo.token.trim() !== "") {
      const lido = lerTokenColado(corpo.token);
      if (!lido.ok) return recusa(lido.erro);
      await conectar(id, lido.token);
    } else if (corpo.desconectar === true) {
      if (isMockMode()) {
        const c = listMockContas().find((x) => x.id === id);
        if (c) c.conectada = false;
      } else {
        await removerToken(id);
      }
    }

    const patch: {
      nome?: string;
      assinatura?: string;
      logo_url?: string;
      logo_legenda?: string;
    } = {};
    if (corpo.nome !== undefined) {
      const nome = texto(corpo.nome, NOME_MAX);
      if (!nome) return recusa("O nome não pode ficar vazio.");
      patch.nome = nome;
    }
    if (corpo.assinatura !== undefined) {
      patch.assinatura = texto(corpo.assinatura, ASSINATURA_MAX);
    }
    if (corpo.logo_url !== undefined) {
      const pedida = texto(corpo.logo_url, 400);
      const aceita = logoPermitida(
        pedida,
        storagePublico(process.env.NEXT_PUBLIC_SUPABASE_URL),
      );
      // Vazio tira a logo; qualquer outra coisa precisa ser um envio nosso.
      if (pedida && !aceita) return recusa("Envie a logo por aqui (PNG ou JPG).");
      patch.logo_url = aceita;
    }
    if (corpo.logo_legenda !== undefined) {
      patch.logo_legenda = texto(corpo.logo_legenda, LEGENDA_LOGO_MAX);
    }
    await atualizarContaInstagram(id, patch);

    return NextResponse.json({ ok: true, contas: await listContasInstagram() });
  } catch (e) {
    return falha(e, "Falha ao salvar a conta.");
  }
}
