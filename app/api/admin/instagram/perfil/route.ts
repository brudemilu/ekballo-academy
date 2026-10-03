import { type NextRequest, NextResponse } from "next/server";
import {
  limparPreferencias,
  normalizarVozDNA,
  SYSTEM_ANALISE_VOZ,
  validarPerfil,
} from "@/lib/conteudo-perfil";
import { getCurrentSession, getPerfilConteudo, salvarPerfilConteudo } from "@/lib/db";
import { chamarLLM } from "@/lib/llm";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * Perfil de conteúdo do ministério (aba Perfil em /admin/instagram). Admin-only.
 *  - PUT  { objetivo, publico, pilares, voz_amostras, temas_proibidos, chamada_padrao } → salva
 *  - POST {}  → analisa as amostras de voz já salvas e guarda o resultado
 *  - PATCH { preferencias } → troca a lista do que a IA aprendeu (a tela acrescenta e remove)
 */

async function exigirAdmin() {
  const session = await getCurrentSession();
  return Boolean(session?.profile?.is_admin);
}

export async function PUT(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const v = validarPerfil(await req.json().catch(() => null));
  if (!v.ok) return NextResponse.json({ error: v.erro }, { status: 400 });
  try {
    const atual = await getPerfilConteudo();
    // Mudou a amostra, a análise antiga deixa de valer: some até analisar de novo.
    const vozMudou = atual.voz_amostras.trim() !== v.valor.voz_amostras.trim();
    await salvarPerfilConteudo(vozMudou ? { ...v.valor, voz_dna: null } : v.valor);
    return NextResponse.json({ ok: true, vozMudou });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao salvar." },
      { status: 500 },
    );
  }
}

export async function PATCH(req: NextRequest) {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  const corpo = await req.json().catch(() => null);
  if (!Array.isArray(corpo?.preferencias))
    return NextResponse.json({ error: "Pedido inválido." }, { status: 400 });
  try {
    const preferencias = limparPreferencias(corpo.preferencias);
    await salvarPerfilConteudo({ preferencias });
    return NextResponse.json({ ok: true, preferencias });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao salvar." },
      { status: 500 },
    );
  }
}

export async function POST() {
  if (!(await exigirAdmin()))
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  try {
    const perfil = await getPerfilConteudo();
    if (perfil.voz_amostras.trim().length < 200) {
      return NextResponse.json(
        {
          error:
            "Cole pelo menos uns dois parágrafos seus (e salve) antes de analisar a voz.",
        },
        { status: 400 },
      );
    }
    const bruto = await chamarLLM(
      SYSTEM_ANALISE_VOZ,
      `AMOSTRAS:\n${perfil.voz_amostras.trim()}`,
      900,
    );
    const voz_dna = normalizarVozDNA(bruto);
    await salvarPerfilConteudo({ voz_dna });
    return NextResponse.json({ ok: true, voz_dna });
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao analisar." },
      { status: 500 },
    );
  }
}
