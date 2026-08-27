import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import { buscarNaBiblia, listVersoesComBusca } from "@/lib/biblia-busca";
import { VERSAO_PADRAO } from "@/lib/biblia";

// Busca da Bíblia usada pelo campo de pesquisa do caderno. Exige sessão
// (é recurso interno da plataforma), mas não exige o caderno liberado — ler a
// Bíblia vale pra qualquer discípulo logado.
export async function GET(req: Request) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }

  const url = new URL(req.url);
  const termo = (url.searchParams.get("q") || "").slice(0, 200);
  const versaoPedida = url.searchParams.get("versao") || VERSAO_PADRAO;

  if (termo.trim().length < 2) {
    return NextResponse.json({ ok: true, tipo: "vazio", achados: [] });
  }

  // Só faz sentido pesquisar em versão que tenha o texto no banco; a própria
  // busca troca e avisa se vier outra.
  const comBusca = await listVersoesComBusca();
  const versao = comBusca.includes(versaoPedida) ? versaoPedida : comBusca[0] ?? VERSAO_PADRAO;

  const resultado = await buscarNaBiblia(termo, versao);
  return NextResponse.json({ ok: true, ...resultado });
}
