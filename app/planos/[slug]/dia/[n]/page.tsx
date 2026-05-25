import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { MarcarDiaForm } from "@/components/MarcarDiaForm";
import { getCurrentSession, getCursoBySlug, isMatriculado } from "@/lib/db";
import {
  getPlanoBySlug,
  getDiaDoPlano,
  listProgressoDoAluno,
  enriquecerComLivros,
} from "@/lib/planos";

export default async function DiaPlanoPage({
  params,
}: {
  params: Promise<{ slug: string; n: string }>;
}) {
  const { slug, n } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  if (!session.profile?.is_admin) {
    const curso = await getCursoBySlug(slug);
    if (!curso) redirect("/dashboard");
    const matriculado = await isMatriculado(session.userId, curso.id);
    if (!matriculado) redirect("/dashboard");
  }

  const plano = await getPlanoBySlug(slug);
  if (!plano) notFound();

  const dia = Number(n);
  if (!Number.isInteger(dia) || dia < 1 || dia > plano.dias_total) notFound();

  const [diaRow, concluidos] = await Promise.all([
    getDiaDoPlano(plano.id, dia),
    listProgressoDoAluno(plano.id, session.userId),
  ]);
  if (!diaRow) notFound();

  const passagensEnriquecidas = await enriquecerComLivros(diaRow.passagens);
  const concluido = concluidos.has(dia);

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-3xl items-center justify-between px-6 py-4">
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

      <div className="mx-auto max-w-3xl px-6 py-12">
        <Link
          href={`/planos/${slug}`}
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← {plano.nome}
        </Link>

        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Dia {dia}{" "}
          {diaRow.data_sugerida && (
            <span className="text-mesa-400">· {diaRow.data_sugerida}</span>
          )}
        </p>
        <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
          {diaRow.referencia_texto}
        </h1>
        <p className="mb-8 text-sm text-mesa-600">
          Toque em uma passagem pra abrir no leitor da Bíblia. Quando terminar
          tudo, marque o dia como concluído.
        </p>

        {/* Lista de passagens com cards e botões pra abrir cada capítulo */}
        <ul className="mb-10 space-y-3">
          {passagensEnriquecidas.map((p, i) => {
            const total = p.cap_fim - p.cap_inicio + 1;
            const caps = Array.from(
              { length: total },
              (_, idx) => p.cap_inicio + idx
            );
            return (
              <li
                key={i}
                className="rounded-xl border border-mesa-200 bg-white p-5"
              >
                <div className="mb-3 flex flex-wrap items-baseline justify-between gap-2">
                  <h3 className="font-serif text-xl font-semibold text-mesa-800">
                    {p.livro_nome}{" "}
                    <span className="text-mesa-500">
                      {p.cap_inicio === p.cap_fim
                        ? p.cap_inicio
                        : `${p.cap_inicio}–${p.cap_fim}`}
                    </span>
                  </h3>
                  <span className="text-xs text-mesa-500">
                    {total} {total === 1 ? "capítulo" : "capítulos"}
                  </span>
                </div>
                <div className="flex flex-wrap gap-1.5">
                  {caps.map((c) => (
                    <Link
                      key={c}
                      href={`/biblia/${p.livro_id}/${c}`}
                      className="rounded-md border border-mesa-200 bg-mesa-50 px-3 py-1.5 text-sm font-medium text-mesa-700 hover:border-mesa-400 hover:bg-mesa-100"
                    >
                      Cap. {c}
                    </Link>
                  ))}
                </div>
              </li>
            );
          })}
        </ul>

        {/* Marcar como concluído / desmarcar */}
        <div className="rounded-2xl border border-oliveira-200 bg-oliveira-50/30 p-6">
          <MarcarDiaForm
            slug={slug}
            dia={dia}
            diasTotal={plano.dias_total}
            concluidoInicial={concluido}
          />
        </div>

        {/* Navegação ←/→ entre dias */}
        <div className="mt-8 flex items-center justify-between">
          {dia > 1 ? (
            <Link
              href={`/planos/${slug}/dia/${dia - 1}`}
              className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm text-mesa-700 hover:bg-mesa-50"
            >
              ← Dia {dia - 1}
            </Link>
          ) : (
            <span />
          )}
          {dia < plano.dias_total ? (
            <Link
              href={`/planos/${slug}/dia/${dia + 1}`}
              className="rounded-full bg-mesa-700 px-4 py-2 text-sm text-mesa-50 hover:bg-mesa-800"
            >
              Dia {dia + 1} →
            </Link>
          ) : (
            <span />
          )}
        </div>
      </div>
    </main>
  );
}
