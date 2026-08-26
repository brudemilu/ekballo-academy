import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { consultarVerbete, selecaoConsultavel, MAX_CARACTERES } from "@/lib/dicionario";

// Significado + sinônimos da palavra selecionada no texto da mesa.
// GET /api/dicionario?q=<palavra>&ctx=<frase do livro>
export async function GET(req: Request) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }

  const { searchParams } = new URL(req.url);
  const q = (searchParams.get("q") ?? "").trim();
  const ctx = (searchParams.get("ctx") ?? "").trim();

  if (!q) {
    return NextResponse.json({ ok: false, erro: "q é obrigatório" }, { status: 400 });
  }
  if (!selecaoConsultavel(q)) {
    return NextResponse.json(
      { ok: false, erro: `Selecione uma palavra ou expressão curta (até ${MAX_CARACTERES} caracteres).` },
      { status: 400 }
    );
  }

  try {
    const verbete = await consultarVerbete(q, ctx);
    if (!verbete.significado && !verbete.sinonimos.length) {
      return NextResponse.json(
        { ok: false, erro: "Não encontrei esta palavra no dicionário." },
        { status: 404 }
      );
    }
    return NextResponse.json({ ok: true, verbete });
  } catch (e) {
    // Sem GROQ_API_KEY nem Cloudflare, ou provedor fora do ar.
    console.error("[dicionario]", e);
    return NextResponse.json(
      { ok: false, erro: "O dicionário está indisponível agora. Tente de novo em instantes." },
      { status: 503 }
    );
  }
}
