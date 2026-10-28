import { NextResponse } from "next/server";
import { getCapitulo, getLivro } from "@/lib/biblia";
import { listVersoesComBusca } from "@/lib/biblia-busca";
import { getCurrentSession } from "@/lib/db";
import { lerTrechos } from "@/lib/referencia-biblica";

// Trecho da Bíblia para o popup do versículo (issue #282): o discípulo clica
// numa referência dentro do texto e lê ali mesmo, sem sair da página.
//   GET /api/biblia/trecho?livro=1&t=12:1-3;18:18-18&versao=NVT
// `t` sai de lib/referencia-biblica.ts (trechosDosNumeros). O pedido chega
// pela rede, então é lido de novo com as travas de lerTrechos.

const MAX_VERSICULOS = 60;

export async function GET(req: Request) {
  const session = await getCurrentSession();
  if (!session) {
    return NextResponse.json({ ok: false, erro: "não autenticado" }, { status: 401 });
  }

  const url = new URL(req.url);
  const livroId = Number(url.searchParams.get("livro"));
  const trechos = lerTrechos(url.searchParams.get("t") || "");
  if (!Number.isInteger(livroId) || livroId < 1 || livroId > 66 || !trechos) {
    return NextResponse.json(
      { ok: false, erro: "referência inválida" },
      { status: 400 },
    );
  }

  // Versões que de fato têm texto, já na ordem de preferência do Bruno
  // (NVT, NAA, NVI…). Sem versão pedida, vai a primeira.
  const versoes = await listVersoesComBusca();
  const pedida = url.searchParams.get("versao") || "";
  const versao = versoes.includes(pedida) ? pedida : versoes[0];

  const livro = await getLivro(livroId);
  if (!livro) {
    return NextResponse.json(
      { ok: false, erro: "livro não encontrado" },
      { status: 404 },
    );
  }

  // Um capítulo por busca, mesmo que o trecho volte a ele ("3.16,18").
  const capitulos = [...new Set(trechos.map((t) => t.capitulo))];
  const porCapitulo = new Map(
    await Promise.all(
      capitulos.map(async (c) => [c, await getCapitulo(livroId, c, versao)] as const),
    ),
  );

  const versiculos: { capitulo: number; versiculo: number; texto: string }[] = [];
  for (const t of trechos) {
    for (const v of porCapitulo.get(t.capitulo) ?? []) {
      const dentro =
        t.de === undefined ||
        (v.versiculo >= t.de && (t.ate === undefined || v.versiculo <= t.ate));
      if (dentro)
        versiculos.push({
          capitulo: v.capitulo,
          versiculo: v.versiculo,
          texto: v.texto,
        });
    }
  }

  return NextResponse.json(
    {
      ok: true,
      livro: { id: livro.id, nome: livro.nome },
      versao,
      versoes,
      cortado: versiculos.length > MAX_VERSICULOS,
      versiculos: versiculos.slice(0, MAX_VERSICULOS),
    },
    // O texto da Bíblia não muda; a mesma referência repetida no livro não
    // precisa ir ao banco de novo.
    { headers: { "Cache-Control": "private, max-age=86400" } },
  );
}
