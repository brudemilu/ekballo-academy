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
  type EnglishModuloComLicoes,
} from "@/lib/english";

export const metadata = { title: "Trilha · Ekballo English" };

// Os três níveis são a estrutura real do curso, não enfeite: o aluno sai de
// nomear coisas (iniciante), passa a interagir (básico) e termina sustentando
// conversa (intermediário). Agrupar por eles dá ao aluno a régua do quanto
// falta — que doze módulos empilhados numa lista não davam.
const NIVEIS = [
  { chave: "iniciante", rotulo: "Iniciante", resumo: "Nomear e falar de si" },
  { chave: "basico", rotulo: "Básico", resumo: "Interagir e se posicionar" },
  { chave: "intermediario", rotulo: "Intermediário", resumo: "Sustentar conversa" },
] as const;

/** Anel de progresso — mais legível que barra quando o número é pequeno. */
function Anel({ feito, total }: { feito: number; total: number }) {
  const pct = total > 0 ? feito / total : 0;
  const raio = 16;
  const volta = 2 * Math.PI * raio;
  return (
    <span className="relative inline-flex h-11 w-11 shrink-0 items-center justify-center">
      <svg className="h-11 w-11 -rotate-90" viewBox="0 0 40 40" aria-hidden>
        <circle cx="20" cy="20" r={raio} fill="none" stroke="currentColor" strokeWidth="3.5" className="text-mesa-200" />
        <circle
          cx="20" cy="20" r={raio} fill="none" strokeWidth="3.5" strokeLinecap="round"
          stroke="currentColor"
          className={pct === 1 ? "text-acerto-500" : "text-laranja-500"}
          strokeDasharray={volta}
          strokeDashoffset={volta * (1 - pct)}
        />
      </svg>
      <span className="absolute font-ui text-[11px] font-bold tabular-nums text-mesa-700">
        {feito}
      </span>
    </span>
  );
}

function Modulo({
  modulo, aberto,
}: { modulo: EnglishModuloComLicoes; aberto: boolean }) {
  const vazio = !modulo.publicado || modulo.licoes.length === 0;
  const completo = modulo.licoes.length > 0 && modulo.concluidas === modulo.licoes.length;

  if (vazio) {
    return (
      <div className="flex items-center gap-4 rounded-2xl border border-dashed border-mesa-300 px-4 py-3.5">
        <span className="font-display text-lg font-semibold text-mesa-400">{modulo.numero}</span>
        <span className="font-ui text-sm text-mesa-500">{modulo.titulo} · em preparação</span>
      </div>
    );
  }

  return (
    // <details> nativo: abre e fecha sem JavaScript, funciona no teclado e
    // some da tela sem sumir do documento. Com 12 módulos, deixar tudo aberto
    // virava um paredão de 72 lições numa rolagem só.
    <details open={aberto} className="group rounded-2xl border border-mesa-200 bg-white open:shadow-sm open:shadow-mesa-800/5">
      <summary className="flex cursor-pointer list-none items-center gap-4 px-4 py-3.5 [&::-webkit-details-marker]:hidden">
        <Anel feito={modulo.concluidas} total={modulo.licoes.length} />
        <span className="min-w-0 flex-1">
          <span className="block font-display text-lg font-semibold leading-tight text-mesa-900">
            {modulo.titulo}
          </span>
          {modulo.titulo_en ? (
            <span lang="en" className="block font-ui text-sm text-mesa-500">{modulo.titulo_en}</span>
          ) : null}
        </span>
        {completo ? (
          <span className="shrink-0 rounded-full bg-acerto-50 px-2.5 py-1 font-ui text-xs font-semibold text-acerto-700">
            Concluído
          </span>
        ) : (
          <span className="shrink-0 font-ui text-sm tabular-nums text-mesa-400">
            {modulo.concluidas}/{modulo.licoes.length}
          </span>
        )}
        <span className="shrink-0 text-mesa-400 transition-transform group-open:rotate-90" aria-hidden>›</span>
      </summary>

      <ol className="space-y-1 px-3 pb-3">
        {modulo.licoes.map((licao) => (
          <li key={licao.id}>
            <Link
              href={`/english/licao/${licao.slug}`}
              className="flex items-center gap-3 rounded-xl px-3 py-2.5 transition hover:bg-bege-100"
            >
              <span
                className={`flex h-7 w-7 shrink-0 items-center justify-center rounded-full font-ui text-xs font-bold ${
                  licao.concluida
                    ? "bg-acerto-500 text-white"
                    : "border border-mesa-300 text-mesa-500"
                }`}
              >
                {licao.concluida ? "✓" : licao.numero}
              </span>
              <span className="min-w-0 flex-1">
                <span lang="en" className="block font-display font-semibold text-mesa-900">
                  {licao.titulo}
                </span>
                <span className="block font-ui text-sm text-mesa-500">{licao.titulo_pt}</span>
              </span>
              {licao.concluida && licao.total > 0 ? (
                <span className="shrink-0 font-ui text-xs tabular-nums text-mesa-400">
                  {licao.acertos}/{licao.total}
                </span>
              ) : null}
            </Link>
          </li>
        ))}
      </ol>
    </details>
  );
}

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
  const pct = totalLicoes ? Math.round((totalConcluidas / totalLicoes) * 100) : 0;
  const primeiroNome = (session.profile?.nome || "").trim().split(/\s+/)[0] || "discípulo";

  // Só o módulo em que o aluno está fica aberto; o resto começa fechado.
  const moduloAtual = trilha.find((m) => m.licoes.some((l) => l.id === proxima?.id));

  return (
    <main className="min-h-screen bg-bege-50 text-mesa-800">
      <header className="border-b border-mesa-200 bg-white/90 backdrop-blur">
        <nav className="mx-auto flex max-w-3xl items-center justify-between gap-4 px-4 py-4 sm:px-6">
          <Logo />
          <div className="flex items-center gap-3">
            <Link href="/dashboard" className="font-ui text-sm font-medium text-mesa-600 transition hover:text-laranja-600">
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

      <div className="mx-auto max-w-3xl px-4 py-8 sm:px-6 sm:py-12">
        {/* ---------- a chamada do dia ---------- */}
        {proxima && (
          <section className="rounded-[1.75rem] bg-mesa-900 p-6 text-white sm:p-8">
            <div className="flex items-center justify-between gap-4">
              <p className="font-ui text-xs font-semibold uppercase tracking-[0.2em] text-laranja-300">
                {totalConcluidas === 0 ? `Bem-vindo, ${primeiroNome}` : `Hello, ${primeiroNome}`}
              </p>
              {streak.dias_seguidos > 0 && (
                <span className="flex items-center gap-1.5 rounded-full bg-white/10 px-3 py-1 font-ui text-sm font-semibold">
                  🔥 {streak.dias_seguidos}
                  <span className="text-white/60">
                    {streak.dias_seguidos === 1 ? "dia" : "dias"}
                  </span>
                </span>
              )}
            </div>

            <p className="mt-5 font-ui text-sm text-white/60">
              {totalConcluidas === 0 ? "Sua primeira lição" : "Continue de onde parou"}
            </p>
            <h1 lang="en" className="mt-1 font-display text-3xl font-semibold leading-tight sm:text-4xl">
              {proxima.titulo}
            </h1>
            <p className="mt-1 font-ui text-white/70">{proxima.titulo_pt}</p>

            <Link
              href={`/english/licao/${proxima.slug}`}
              className="mt-6 inline-flex items-center gap-2 rounded-full bg-laranja-500 px-7 py-3 font-ui font-semibold text-white transition hover:bg-laranja-400"
            >
              {totalConcluidas === 0 ? "Começar" : "Continuar"} →
            </Link>
          </section>
        )}

        {/* ---------- onde ele está no curso ---------- */}
        <section className="mt-6 rounded-2xl border border-mesa-200 bg-white p-5">
          <div className="flex items-end justify-between gap-4">
            <p className="font-ui text-sm text-mesa-600">
              <span className="font-display text-2xl font-semibold text-mesa-900">{totalConcluidas}</span>
              <span className="text-mesa-400"> de {totalLicoes} lições</span>
            </p>
            <p className="font-ui text-sm tabular-nums text-mesa-500">{pct}%</p>
          </div>
          <div className="mt-3 h-2 overflow-hidden rounded-full bg-mesa-200">
            <div className="h-full rounded-full bg-laranja-500" style={{ width: `${pct}%` }} />
          </div>
          {conquistas.length > 0 && (
            <div className="mt-4 flex flex-wrap gap-2 border-t border-mesa-100 pt-4">
              {conquistas.map((c) => {
                const info = nomeConquista(c.chave);
                return (
                  <span
                    key={c.chave}
                    title={info.descricao}
                    className="flex items-center gap-1.5 rounded-full bg-bege-100 px-3 py-1 font-ui text-xs font-semibold text-mesa-700"
                  >
                    <span>{info.emoji}</span> {info.nome}
                  </span>
                );
              })}
            </div>
          )}
        </section>

        {/* ---------- a trilha, por nível ---------- */}
        {NIVEIS.map((nivel) => {
          const modulos = trilha.filter((m) => m.nivel === nivel.chave);
          if (!modulos.length) return null;
          const feitas = modulos.reduce((s, m) => s + m.concluidas, 0);
          const todas = modulos.reduce((s, m) => s + m.licoes.length, 0);

          return (
            <section key={nivel.chave} className="mt-10">
              <div className="mb-3 flex items-baseline justify-between gap-3">
                <h2 className="font-display text-xl font-semibold text-mesa-900">
                  {nivel.rotulo}
                  <span className="ml-2 font-ui text-sm font-normal text-mesa-500">{nivel.resumo}</span>
                </h2>
                <span className="font-ui text-xs tabular-nums text-mesa-400">{feitas}/{todas}</span>
              </div>
              <div className="space-y-2">
                {modulos.map((m) => (
                  <Modulo key={m.id} modulo={m} aberto={m.id === moduloAtual?.id} />
                ))}
              </div>
            </section>
          );
        })}
      </div>
    </main>
  );
}
