import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { CapituloLeitor } from "@/components/CapituloLeitor";
import { BibliaJumper } from "@/components/BibliaJumper";
import { getCurrentSession, getCursoBySlug, isMatriculado } from "@/lib/db";
import {
  getLivro,
  getCapitulo,
  listLivros,
  listVersoes,
  getVersao,
  VERSAO_PADRAO,
} from "@/lib/biblia";

export default async function CapituloPage({
  params,
  searchParams,
}: {
  params: Promise<{ livroId: string; capitulo: string }>;
  searchParams: Promise<{ v?: string }>;
}) {
  const { livroId, capitulo } = await params;
  const { v: versaoQuery } = await searchParams;
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  if (!session.profile?.is_admin) {
    const cursoBiblia = await getCursoBySlug("biblia");
    if (!cursoBiblia) redirect("/dashboard");
    const matriculado = await isMatriculado(session.userId, cursoBiblia.id);
    if (!matriculado) redirect("/dashboard");
  }

  const livroIdN = Number(livroId);
  const capN = Number(capitulo);
  if (!Number.isInteger(livroIdN) || !Number.isInteger(capN)) notFound();

  const livro = await getLivro(livroIdN);
  if (!livro) notFound();
  if (capN < 1 || capN > livro.capitulos_total) notFound();

  // Resolve versão: usa a do query string se válida e ativa, senão padrão.
  const versoes = await listVersoes();
  let versaoSigla = VERSAO_PADRAO;
  if (versaoQuery) {
    const found = versoes.find((v) => v.sigla === versaoQuery);
    if (found && found.ativa) versaoSigla = found.sigla;
  }
  const versaoAtual = await getVersao(versaoSigla);

  const [versiculos, todosLivros] = await Promise.all([
    getCapitulo(livroIdN, capN, versaoSigla),
    listLivros(),
  ]);

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href={session.profile?.is_admin ? "/admin" : "/dashboard"}>
            <Logo />
          </Link>
          <UserMenu
            nome={session.profile?.nome || null}
            email={session.profile?.email || session.email}
            isAdmin={!!session.profile?.is_admin}
          />
        </nav>
      </header>

      <div className="mx-auto max-w-3xl px-6 py-12 pb-32">
        <Link
          href="/biblia"
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Todos os livros
        </Link>

        {/* Jumper rápido: livro + capítulo */}
        <div className="mb-6 rounded-xl border border-mesa-200 bg-white p-3">
          <BibliaJumper
            livros={todosLivros.map((l) => ({
              id: l.id,
              nome: l.nome,
              testamento: l.testamento,
              capitulos: l.capitulos_total,
            }))}
            livroAtualId={livro.id}
            capituloAtual={capN}
            versaoAtual={versaoSigla}
          />
        </div>

        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          {livro.testamento === "AT" ? "Antigo Testamento" : "Novo Testamento"}
        </p>
        <h1 className="mb-1 font-serif text-4xl font-semibold text-mesa-800">
          {livro.nome} <span className="text-mesa-500">{capN}</span>
        </h1>

        {/* Seletor de versão */}
        <div className="mb-4 mt-3 flex flex-wrap items-center gap-2">
          <span className="text-xs font-medium uppercase tracking-wider text-mesa-500">
            Versão:
          </span>
          {versoes.map((v) => {
            const ativo = v.sigla === versaoSigla;
            if (v.ativa) {
              return (
                <Link
                  key={v.sigla}
                  href={`/biblia/${livroIdN}/${capN}?v=${v.sigla}`}
                  className={`rounded-full px-3 py-1 text-xs font-medium transition ${
                    ativo
                      ? "bg-mesa-700 text-white"
                      : "border border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-50"
                  }`}
                  title={v.nome}
                >
                  {v.sigla}
                </Link>
              );
            }
            return (
              <span
                key={v.sigla}
                className="inline-flex cursor-not-allowed items-center gap-1 rounded-full border border-dashed border-mesa-200 bg-mesa-50 px-3 py-1 text-xs font-medium text-mesa-400"
                title={`${v.nome} — em breve, aguardando licenciamento`}
              >
                {v.sigla}
                <span className="text-[9px] uppercase tracking-wider text-mesa-400">
                  em breve
                </span>
              </span>
            );
          })}
        </div>

        <p className="mb-8 text-sm text-mesa-500">
          {versaoAtual?.nome}. Toque nos versículos pra selecionar; depois gere
          uma imagem pra postar.
        </p>

        <CapituloLeitor
          livroId={livro.id}
          livroNome={livro.nome}
          capitulo={capN}
          capitulosTotal={livro.capitulos_total}
          versao={versaoSigla}
          versiculos={versiculos.map((v) => ({
            numero: v.versiculo,
            texto: v.texto,
          }))}
        />
      </div>
    </main>
  );
}
