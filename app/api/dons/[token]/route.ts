import { NextResponse } from "next/server";
import { registrarRespostaPublica } from "@/lib/dons-db";
import { chaveDoPedido, limitar, respostaExcedida } from "@/lib/rate-limit";

// Quem abriu o link do Teste de Dons envia as 160 respostas — sem conta,
// sem sessão (issue #289). O token do link é a única credencial; a
// pontuação é refeita no servidor a partir das notas.
//
// Limite por IP: uma pessoa de verdade envia uma vez. Vinte por hora cobre
// um grupo inteiro respondendo no mesmo Wi-Fi da igreja e ainda impede
// alguém de encher o banco de respostas falsas pelo link aberto.
export async function POST(
  req: Request,
  { params }: { params: Promise<{ token: string }> },
) {
  const veredito = limitar(chaveDoPedido(req, "dons-envio"), 20, 3_600_000);
  if (!veredito.permitido)
    return respostaExcedida(veredito, "Muitos envios seguidos. Tente daqui a pouco.");

  const { token } = await params;
  let body: Record<string, unknown>;
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ ok: false, erro: "corpo inválido" }, { status: 400 });
  }

  try {
    const r = await registrarRespostaPublica(token, {
      nome: body.nome,
      idade: body.idade,
      telefone: body.telefone,
      respostas: body.respostas,
    });
    if (!r.ok)
      return NextResponse.json({ ok: false, erro: r.erro }, { status: r.status });
    return NextResponse.json({ ok: true, resultado: r.resultado });
  } catch (e) {
    console.error("[dons] envio público:", e);
    return NextResponse.json(
      { ok: false, erro: "Não foi possível salvar. Tente de novo." },
      { status: 500 },
    );
  }
}
