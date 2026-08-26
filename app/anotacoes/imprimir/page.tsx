import Link from "next/link";
import { redirect } from "next/navigation";
import { BotaoImprimir } from "@/components/BotaoImprimir";
import { podeUsarCaderno } from "@/lib/permissoes";
import { getCurrentSession } from "@/lib/db";
import { listAnotacoes, getAnotacao } from "@/lib/anotacoes";
import { sanitizarHtml } from "@/lib/sanitizar-html";
import {
  CATEGORIA_MAP,
  CORES,
  dataLonga,
  dataHora,
  tituloExibido,
  type AnotacaoRich,
} from "@/lib/anotacoes-meta";

export const metadata = {
  title: "Caderno — impressão",
  robots: { index: false, follow: false },
};

// Folha de impressão do caderno. Serve pra UMA anotação (?id=) ou pro caderno
// inteiro/filtrado (?categoria=&curso=&tag=&arquivadas=1). Com ?auto=1 já abre
// o diálogo de impressão — é o caminho do botão "Salvar em PDF".
export default async function ImprimirPage({
  searchParams,
}: {
  searchParams: Promise<Record<string, string | string[] | undefined>>;
}) {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  // O caderno é liberado pessoa a pessoa (ver CADERNO_EMAILS em lib/permissoes).
  if (!podeUsarCaderno(session.profile?.papel, session.profile?.is_admin, session.profile?.email ?? session.email)) {
    redirect("/dashboard");
  }

  const sp = await searchParams;
  const um = (k: string) => (Array.isArray(sp[k]) ? sp[k][0] : sp[k]) as string | undefined;

  const id = um("id");
  const categoria = um("categoria");
  const curso = um("curso");
  const tag = um("tag");
  const arquivadas = um("arquivadas") === "1";
  const auto = um("auto") === "1";

  let anotacoes: AnotacaoRich[] = [];
  if (id) {
    const uma = await getAnotacao(id, session.userId);
    anotacoes = uma ? [uma] : [];
  } else {
    const todas = await listAnotacoes(session.userId, {
      incluirArquivadas: true,
      cursoId: curso,
    });
    anotacoes = todas.filter(
      (a) =>
        a.arquivada === arquivadas &&
        (!categoria || a.categoria === categoria) &&
        (!tag || (a.tags ?? []).includes(tag)),
    );
  }

  const umaSo = anotacoes.length === 1 && !!id;
  const autor = session.profile?.nome || session.profile?.email || session.email;

  return (
    <main className="min-h-screen bg-mesa-100 py-8 print:bg-white print:py-0">
      {/* Barra de ação — some na impressão */}
      <div className="nao-imprimir mx-auto mb-6 flex max-w-[210mm] flex-wrap items-center justify-between gap-3 px-6">
        <Link
          href="/anotacoes"
          className="inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-900"
        >
          ← Meu caderno
        </Link>
        <div className="flex items-center gap-3">
          <p className="hidden text-xs text-mesa-500 sm:block">
            No diálogo, escolha <strong>Destino: Salvar como PDF</strong>.
          </p>
          <BotaoImprimir auto={auto} />
        </div>
      </div>

      <div className="folha-impressao mx-auto max-w-[210mm] bg-white px-[18mm] py-[16mm] shadow-lg print:shadow-none">
        {/* Cabeçalho do caderno (só quando é o caderno inteiro) */}
        {!umaSo && (
          <header className="cabecalho-folha mb-10 border-b border-mesa-300 pb-6">
            <p className="text-[11px] font-semibold uppercase tracking-[0.2em] text-laranja-700">
              Ekballo Academy · Caderno de anotações
            </p>
            <h1 className="mt-2 font-serif text-3xl font-semibold text-mesa-900">
              {categoria
                ? `Anotações · ${CATEGORIA_MAP.get(categoria as never)?.rotulo ?? categoria}`
                : arquivadas
                  ? "Anotações arquivadas"
                  : "Meu caderno"}
            </h1>
            <p className="mt-2 text-sm text-mesa-600">
              {autor} · {anotacoes.length}{" "}
              {anotacoes.length === 1 ? "anotação" : "anotações"} · gerado em{" "}
              {dataLonga(new Date().toISOString())}
            </p>
          </header>
        )}

        {anotacoes.length === 0 ? (
          <p className="py-20 text-center text-mesa-500">
            Nenhuma anotação para imprimir com esses filtros.
          </p>
        ) : (
          anotacoes.map((a) => {
            const cat = CATEGORIA_MAP.get(a.categoria);
            const cor = CORES[a.cor] ?? CORES.areia;
            return (
              <article key={a.id} className="folha-anotacao mb-12">
                <div
                  className="etiqueta-folha mb-5 border-l-4 pl-4"
                  style={{ borderColor: cor.acento }}
                >
                  <p className="text-[11px] font-semibold uppercase tracking-[0.16em] text-mesa-500">
                    {cat?.emoji} {cat?.rotulo}
                    {a.curso_titulo ? ` · ${a.curso_titulo}` : ""}
                    {a.aula_titulo ? ` · ${a.aula_titulo}` : ""}
                  </p>
                  <h2 className="mt-1 font-serif text-2xl font-semibold leading-tight text-mesa-900">
                    {tituloExibido(a)}
                  </h2>
                  <p className="mt-1 text-xs text-mesa-500">
                    Atualizada em {dataHora(a.atualizado_em)}
                    {a.tags?.length ? ` · ${a.tags.map((t) => `#${t}`).join(" ")}` : ""}
                  </p>
                </div>

                {/* Conteúdo já sanitizado na gravação; sanitiza de novo aqui
                    por defesa em profundidade (custo irrisório, e blinda
                    qualquer linha que tenha entrado por fora da API). */}
                <div
                  className="prose-anotacao"
                  dangerouslySetInnerHTML={{ __html: sanitizarHtml(a.conteudo_html) }}
                />
              </article>
            );
          })
        )}

        <footer className="cabecalho-folha mt-12 border-t border-mesa-200 pt-4 text-center text-[10px] text-mesa-400">
          Ekballo Academy · escoladodiscipuloimw.com.br
        </footer>
      </div>
    </main>
  );
}
