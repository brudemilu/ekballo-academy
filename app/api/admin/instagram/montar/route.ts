import { type NextRequest, NextResponse } from "next/server";
import { systemCarrosselDaIdeia, validarIdeia } from "@/lib/carrossel-ideia";
import { contextoDoPerfil } from "@/lib/conteudo-perfil";
import { getCurrentSession, getPerfilConteudo } from "@/lib/db";
import { gerarCarrosselIA, systemCarrosselPadrao } from "@/lib/instagram";
import { instrucaoDoModelo, lerModelo } from "@/lib/instagram-modelos";

export const runtime = "nodejs";
export const maxDuration = 60;

/**
 * POST /api/admin/instagram/montar  { conteudo, tipo?, modo?, modelo? }
 * Usa a IA (Cloudflare/Llama) pra quebrar o conteúdo em slides + legenda.
 * Admin-only. Não gera imagens aqui — só o "esqueleto" do carrossel.
 */
export async function POST(req: NextRequest) {
  const session = await getCurrentSession();
  if (!session?.profile?.is_admin) {
    return NextResponse.json({ error: "não autorizado" }, { status: 401 });
  }

  if (!process.env.CLOUDFLARE_ACCOUNT_ID || !process.env.CLOUDFLARE_API_TOKEN) {
    return NextResponse.json(
      {
        error: "Geração de imagem/IA não configurada (faltam credenciais Cloudflare).",
      },
      { status: 503 },
    );
  }

  let conteudo = "";
  let tipo: "carrossel" | "unico" = "carrossel";
  let modo: "conteudo" | "ideia" = "conteudo";
  // O modelo do slide muda o FORMATO do texto pedido (uma lista para o
  // checklist, poucas palavras para a manchete). Vazio no de foto.
  let formato = "";
  try {
    const body = await req.json();
    conteudo = typeof body?.conteudo === "string" ? body.conteudo : "";
    if (body?.tipo === "unico") tipo = "unico";
    if (body?.modo === "ideia") modo = "ideia";
    formato = instrucaoDoModelo(lerModelo(body?.modelo));
  } catch {
    return NextResponse.json({ error: "JSON inválido" }, { status: 400 });
  }

  // "Só tenho a ideia": a IA escreve o post, com a voz e os limites do Perfil.
  if (modo === "ideia") {
    const v = validarIdeia(conteudo);
    if (!v.ok) return NextResponse.json({ error: v.erro }, { status: 400 });
    try {
      const perfil = await getPerfilConteudo().catch(() => null);
      const system = `${systemCarrosselDaIdeia(
        tipo,
        perfil ? contextoDoPerfil(perfil) : "",
      )}${formato ? `\n\n${formato}` : ""}`;
      return NextResponse.json(
        await gerarCarrosselIA(`IDEIA DO PASTOR: ${v.valor}`, tipo, system),
      );
    } catch (e) {
      return NextResponse.json(
        { error: e instanceof Error ? e.message : "Falha ao montar o carrossel." },
        { status: 502 },
      );
    }
  }

  if (conteudo.trim().length < 8) {
    return NextResponse.json(
      { error: "Cole um conteúdo um pouco maior." },
      { status: 400 },
    );
  }

  try {
    const carrossel = await gerarCarrosselIA(
      conteudo,
      tipo,
      formato ? `${systemCarrosselPadrao(tipo)}\n\n${formato}` : undefined,
    );
    return NextResponse.json(carrossel);
  } catch (e) {
    return NextResponse.json(
      { error: e instanceof Error ? e.message : "Falha ao montar o carrossel." },
      { status: 502 },
    );
  }
}
