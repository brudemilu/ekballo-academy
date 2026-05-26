import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { getCurrentSession } from "@/lib/db";
import {
  listDevocionalAnualResumo,
  listProgressoAnualDoAluno,
  diaAnoFromDateStr,
  hojeDateStr,
  DevocionalAnualResumo,
} from "@/lib/devocionais";

const MESES_NOMES = [
  "Janeiro","Fevereiro","Março","Abril","Maio","Junho",
  "Julho","Agosto","Setembro","Outubro","Novembro","Dezembro",
];

export default async function DevocionalPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const [todos, marcados] = await Promise.all([
    listDevocionalAnualResumo(),
    listProgressoAnualDoAluno(session.userId),
  ]);

  const hoje = hojeDateStr();
  const diaAnoHoje = diaAnoFromDateStr(hoje);
  const devHoje = todos.find((d) => d.dia_ano === diaAnoHoje) || null;

  const totalPublicado = todos.length;
  const totalMarcado = marcados.size;
  const pct =
    totalPublicado > 0 ? Math.round((totalMarcado / totalPublicado) * 100) : 0;

  // Agrupa por mês
  const porMes = new Map<number, DevocionalAnualResumo[]>();
  for (const d of todos) {
    const arr = porMes.get(d.mes) || [];
    arr.push(d);
    porMes.set(d.mes, arr);
  }
  const mesesOrdenados = Array.from(porMes.keys()).sort((a, b) => a - b);

  // Próximo a ler = primeiro dia_ano não marcado
  const todosOrdenados = [...todos].sort((a, b) => a.dia_ano - b.dia_ano);
  const proximo = todosOrdenados.find((d) => !marcados.has(d.dia_ano)) || null;

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-5xl items-center justify-between px-6 py-4">
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

      <div className="mx-auto max-w-5xl px-6 py-12 pb-32">
        <Link
          href={session.profile?.is_admin ? "/admin" : "/dashboard"}
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Voltar
        </Link>

        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Devocional Anual
        </p>
        <h1 className="mb-3 font-serif text-4xl font-semibold text-mesa-800">
          365 dias com Cristo
        </h1>
        <p className="mb-8 max-w-2xl text-mesa-700 text-justify hyphens-auto">
          Um devocional por dia, organizados em 12 temas mensais. Leia no seu
          ritmo e marque cada um conforme for fazendo. Escrito pelo Pr. Bruno
          Fernandes.
        </p>

        {/* Barra de progresso geral */}
        <div className="mb-8 rounded-2xl border border-mesa-200 bg-white p-6">
          <div className="mb-3 flex flex-wrap items-end justify-between gap-2">
            <div>
              <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
                Seu progresso
              </p>
              <p className="mt-1 font-serif text-3xl font-semibold text-mesa-800">
                {totalMarcado}{" "}
                <span className="text-mesa-400">/ {totalPublicado} dias</span>
              </p>
            </div>
            <p className="font-serif text-2xl font-semibold text-oliveira-700">
              {pct}%
            </p>
          </div>
          <div className="mb-4 h-2 overflow-hidden rounded-full bg-mesa-100">
            <div
              className="h-full rounded-full bg-gradient-to-r from-laranja-500 to-oliveira-500 transition-all"
              style={{ width: `${pct}%` }}
            />
          </div>
          {proximo ? (
            <Link
              href={`/devocional/dia/${proximo.dia_ano}`}
              className="inline-block rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
            >
              {totalMarcado === 0
                ? "Começar pelo dia 1 →"
                : `Continuar — dia ${proximo.dia_ano} →`}
            </Link>
          ) : (
            <div className="rounded-lg border border-oliveira-300 bg-oliveira-50 px-4 py-3 text-sm font-medium text-oliveira-800">
              🎉 Você completou todos os devocionais do ciclo!
            </div>
          )}
        </div>

        {/* Devocional de hoje em destaque (se existir) */}
        {devHoje && (
          <Link
            href={`/devocional/dia/${devHoje.dia_ano}`}
            className="mb-10 block rounded-2xl border border-laranja-200 bg-gradient-to-br from-laranja-50 to-mesa-50 p-6 shadow-sm transition hover:shadow-md"
          >
            <p className="text-xs font-medium uppercase tracking-[0.2em] text-laranja-700">
              Hoje · {devHoje.tema}
            </p>
            <h2 className="mt-2 font-serif text-2xl font-semibold text-mesa-800">
              {devHoje.titulo}
            </h2>
            <p className="mt-1 text-sm text-mesa-600">
              {devHoje.versiculo_ref}
            </p>
            <p className="mt-3 text-sm font-medium text-laranja-700">
              Ler agora →
            </p>
          </Link>
        )}

        {/* Lista por mês */}
        <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
          Todos os devocionais
        </h2>

        {totalPublicado === 0 ? (
          <p className="rounded-xl border border-dashed border-mesa-200 bg-white p-6 text-center text-mesa-500">
            Nenhum devocional publicado ainda.
          </p>
        ) : (
          <div className="space-y-8">
            {mesesOrdenados.map((mes) => {
              const itens = porMes.get(mes) || [];
              const tema = itens[0]?.tema || "";
              const marcadosMes = itens.filter((d) =>
                marcados.has(d.dia_ano)
              ).length;
              return (
                <section key={mes}>
                  <div className="mb-3 flex items-baseline justify-between">
                    <h3 className="font-serif text-xl font-semibold text-mesa-800">
                      {MESES_NOMES[mes - 1]}
                      <span className="ml-2 text-sm font-normal text-mesa-500">
                        · {tema}
                      </span>
                    </h3>
                    <span className="text-xs font-medium text-mesa-500">
                      {marcadosMes}/{itens.length}
                    </span>
                  </div>
                  <ul className="grid grid-cols-1 gap-2 sm:grid-cols-2">
                    {itens.map((d) => {
                      const ok = marcados.has(d.dia_ano);
                      const isHoje = d.dia_ano === diaAnoHoje;
                      return (
                        <li key={d.dia_ano}>
                          <Link
                            href={`/devocional/dia/${d.dia_ano}`}
                            className={`flex items-center justify-between gap-3 rounded-lg border px-3 py-2.5 text-sm transition ${
                              ok
                                ? "border-oliveira-200 bg-oliveira-50 text-oliveira-800 hover:bg-oliveira-100"
                                : isHoje
                                  ? "border-laranja-300 bg-laranja-50 text-mesa-800 hover:bg-laranja-100"
                                  : "border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-50"
                            }`}
                          >
                            <div className="min-w-0">
                              <p className="text-[10px] font-medium uppercase tracking-wider text-mesa-500">
                                Dia {d.dia} {isHoje && "· Hoje"}
                              </p>
                              <p className="truncate font-medium">
                                {d.titulo}
                              </p>
                              <p className="truncate text-xs text-mesa-500">
                                {d.versiculo_ref}
                              </p>
                            </div>
                            <span
                              className={`flex-none text-lg ${
                                ok ? "text-oliveira-600" : "text-mesa-300"
                              }`}
                              aria-label={ok ? "Concluído" : "Não lido"}
                            >
                              {ok ? "✓" : "○"}
                            </span>
                          </Link>
                        </li>
                      );
                    })}
                  </ul>
                </section>
              );
            })}
          </div>
        )}
      </div>
    </main>
  );
}
