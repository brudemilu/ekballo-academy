import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getCurrentSession } from "@/lib/db";
import {
  getProximaLicao,
  getStreak,
  listConquistas,
  listTrilha,
  nomeConquista,
} from "@/lib/english";

export const metadata = { title: "Trilha · Ekballo English" };

const NIVEL_ROTULO: Record<string, string> = {
  iniciante: "Iniciante",
  basico: "Básico",
  intermediario: "Intermediário",
};

export default async function EnglishJornadaPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const [trilha, streak, conquistas, proxima] = await Promise.all([
    listTrilha(session.userId),
    getStreak(session.userId),
    listConquistas(session.userId),
    getProximaLicao(session.userId),
  ]);

  const totalLicoes = trilha.reduce((s, m) => s + m.licoes.length, 0);
  const totalConcluidas = trilha.reduce((s, m) => s + m.concluidas, 0);
  const primeiroNome = (session.profile?.nome || "").trim().split(/\s+/)[0] || "discípulo";

  return (
    <main className="min-h-screen bg-bege-50 text-mesa-800">
      <header className="border-b border-mesa-200 bg-white/90 backdrop-blur">
        <nav className="mx-auto flex max-w-5xl items-center justify-between gap-4 px-4 py-4 sm:px-6">
          <Logo />
          <div className="flex items-center gap-3">
            <Link href="/dashboard" className="text-sm font-medium text-mesa-600 transition hover:text-laranja-600">
              Dashboard
            </Link>
            <UserMenu
              nome={session.profile?.nome ?? null}
              email={session.email}
              isAdmin={Boolean(session.profile?.is_admin)}
            />
          </div>
        </nav>
      </header>

      <div className="mx-auto max-w-5xl px-4 py-8 sm:px-6 sm:py-12">
        {/* ---------- cabeçalho + streak ---------- */}
        <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-600">Ekballo English</p>
        <h1 className="mt-2 font-serif text-3xl font-semibold text-mesa-900 sm:text-4xl">
          Hello, {primeiroNome}!
        </h1>
        <p className="mt-3 max-w-2xl text-lg leading-relaxed text-mesa-600">
          Um pouco por dia, todo dia. É assim que a fala vem.
        </p>

        <div className="mt-8 grid gap-3 sm:grid-cols-3">
          <div className="rounded-2xl border border-laranja-200 bg-laranja-50 p-5">
            <p className="text-3xl font-semibold text-laranja-700">🔥 {streak.dias_seguidos}</p>
            <p className="mt-1 text-xs font-semibold uppercase tracking-[0.15em] text-laranja-700">
              {streak.dias_seguidos === 1 ? "Dia seguido" : "Dias seguidos"}
            </p>
            {streak.recorde > streak.dias_seguidos && (
              <p className="mt-1 text-xs text-mesa-600">Seu recorde: {streak.recorde}</p>
            )}
          </div>
          <div className="rounded-2xl border border-mesa-200 bg-white p-5">
            <p className="text-3xl font-semibold text-mesa-900">
              {totalConcluidas}<span className="text-lg text-mesa-400">/{totalLicoes}</span>
            </p>
            <p className="mt-1 text-xs font-semibold uppercase tracking-[0.15em] text-mesa-500">
              Lições concluídas
            </p>
          </div>
          <div className="rounded-2xl border border-mesa-200 bg-white p-5">
            <p className="text-3xl font-semibold text-mesa-900">{conquistas.length}</p>
            <p className="mt-1 text-xs font-semibold uppercase tracking-[0.15em] text-mesa-500">
              Conquistas
            </p>
          </div>
        </div>

        {/* ---------- chamada da lição do dia ---------- */}
        {proxima && (
          <div className="mt-6 rounded-[2rem] border border-mesa-200 bg-gradient-to-br from-laranja-50 to-white p-6 shadow-sm shadow-mesa-800/5 sm:p-8">
            <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-600">
              {totalConcluidas === 0 ? "Comece por aqui" : "Sua próxima lição"}
            </p>
            <h2 lang="en" className="mt-2 font-serif text-2xl font-semibold text-mesa-900 sm:text-3xl">
              {proxima.titulo}
            </h2>
            <p className="mt-1 text-mesa-600">{proxima.titulo_pt}</p>
            {proxima.objetivo && (
              <p className="mt-3 max-w-2xl leading-relaxed text-mesa-700">{proxima.objetivo}</p>
            )}
            <Link
              href={`/english/licao/${proxima.slug}`}
              className="mt-6 inline-block rounded-full bg-laranja-500 px-7 py-3 font-semibold text-white shadow-lg shadow-laranja-500/20 transition hover:bg-laranja-600"
            >
              {totalConcluidas === 0 ? "Começar agora" : "Continuar"} →
            </Link>
          </div>
        )}

        {/* ---------- conquistas ---------- */}
        {conquistas.length > 0 && (
          <section className="mt-10">
            <h2 className="font-serif text-xl font-semibold text-mesa-900">Suas conquistas</h2>
            <div className="mt-4 flex flex-wrap gap-3">
              {conquistas.map((c) => {
                const info = nomeConquista(c.chave);
                return (
                  <div
                    key={c.chave}
                    title={info.descricao}
                    className="flex items-center gap-2 rounded-full border border-laranja-200 bg-laranja-50 px-4 py-2"
                  >
                    <span className="text-lg">{info.emoji}</span>
                    <span className="text-sm font-semibold text-mesa-800">{info.nome}</span>
                  </div>
                );
              })}
            </div>
          </section>
        )}

        {/* ---------- trilha de módulos ---------- */}
        <section className="mt-12 space-y-6">
          <h2 className="font-serif text-2xl font-semibold text-mesa-900">A trilha</h2>

          {trilha.map((modulo) => {
            const emPreparo = !modulo.publicado || modulo.licoes.length === 0;
            const completo = modulo.licoes.length > 0 && modulo.concluidas === modulo.licoes.length;

            return (
              <article
                key={modulo.id}
                className={`rounded-3xl border p-6 ${
                  emPreparo ? "border-mesa-200 bg-mesa-100/60" : "border-mesa-200 bg-white shadow-sm shadow-mesa-800/5"
                }`}
              >
                <div className="flex flex-wrap items-start justify-between gap-3">
                  <div>
                    <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-600">
                      Módulo {modulo.numero} · {NIVEL_ROTULO[modulo.nivel] || modulo.nivel}
                    </p>
                    <h3 className="mt-1 font-serif text-xl font-semibold text-mesa-900">
                      {modulo.titulo}
                      {modulo.titulo_en && (
                        <span lang="en" className="ml-2 text-base font-normal text-mesa-500">
                          {modulo.titulo_en}
                        </span>
                      )}
                    </h3>
                  </div>
                  <span
                    className={`rounded-full px-3 py-1 text-xs font-semibold ${
                      emPreparo
                        ? "bg-mesa-200 text-mesa-600"
                        : completo
                          ? "bg-oliveira-200 text-mesa-800"
                          : "bg-laranja-100 text-laranja-700"
                    }`}
                  >
                    {emPreparo
                      ? "Em preparação"
                      : completo
                        ? "Concluído ✓"
                        : `${modulo.concluidas}/${modulo.licoes.length}`}
                  </span>
                </div>

                {modulo.descricao && (
                  <p className="mt-3 leading-relaxed text-mesa-600">{modulo.descricao}</p>
                )}

                {!emPreparo && (
                  <ol className="mt-5 space-y-2">
                    {modulo.licoes.map((licao) => (
                      <li key={licao.id}>
                        <Link
                          href={`/english/licao/${licao.slug}`}
                          className="flex items-center gap-4 rounded-2xl border border-mesa-200 bg-bege-50 px-4 py-3 transition hover:border-laranja-300 hover:bg-laranja-50"
                        >
                          <span
                            className={`flex h-9 w-9 shrink-0 items-center justify-center rounded-full text-sm font-semibold ${
                              licao.concluida
                                ? "bg-oliveira-600 text-white"
                                : "border-2 border-mesa-300 text-mesa-500"
                            }`}
                          >
                            {licao.concluida ? "✓" : licao.numero}
                          </span>
                          <span className="min-w-0 flex-1">
                            <span lang="en" className="block font-semibold text-mesa-900">
                              {licao.titulo}
                            </span>
                            <span className="block text-sm text-mesa-500">{licao.titulo_pt}</span>
                          </span>
                          {licao.concluida && licao.total > 0 && (
                            <span className="shrink-0 text-sm tabular-nums text-mesa-500">
                              {licao.acertos}/{licao.total}
                            </span>
                          )}
                        </Link>
                      </li>
                    ))}
                  </ol>
                )}
              </article>
            );
          })}
        </section>
      </div>
    </main>
  );
}
