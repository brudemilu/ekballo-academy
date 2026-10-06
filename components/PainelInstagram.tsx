import Link from "next/link";
import type { Acao, Destaque, Indicador, SemanaConstancia } from "@/lib/painel";
import { nomeDoFormato } from "@/lib/painel";
import type { ContaInstagram } from "@/lib/painel-dados";

/**
 * Aba Painel do Instagram (issue #189): o que fazer hoje, como o perfil andou
 * nos últimos 90 dias e o que foi diferente nos posts que saíram do normal.
 * Componente de servidor: só mostra o que lib/painel.ts calculou.
 */

const numero = new Intl.NumberFormat("pt-BR");

function rotuloSemana(segunda: string) {
  const [, m, d] = segunda.split("-");
  return `${d}/${m}`;
}

function primeiraLinha(t: string) {
  const l =
    (t || "")
      .split("\n")
      .find((x) => x.trim())
      ?.trim() || "(sem legenda)";
  return l.length > 110 ? `${l.slice(0, 110)}…` : l;
}

function Variacao({ v }: { v: number | null }) {
  if (v === null)
    return <span className="text-xs text-mesa-400">sem base para comparar</span>;
  if (v === 0)
    return <span className="text-xs text-mesa-500">igual aos 45 dias anteriores</span>;
  // Seta + palavra: a direção nunca depende só da cor.
  return (
    <span className="text-xs text-mesa-600">
      <span aria-hidden="true">{v > 0 ? "▲" : "▼"}</span> {v > 0 ? "subiu" : "caiu"}{" "}
      {Math.abs(v)}% <span className="text-mesa-400">vs. 45 dias antes</span>
    </span>
  );
}

function Constancia({ semanas }: { semanas: SemanaConstancia[] }) {
  const max = Math.max(1, ...semanas.map((s) => s.posts));
  const total = semanas.reduce((n, s) => n + s.posts, 0);
  const comPost = semanas.filter((s) => s.posts > 0).length;
  const ALTURA = 96;

  return (
    <section className="rounded-2xl border border-mesa-200 bg-white p-5">
      <h2 className="font-serif text-xl font-semibold text-mesa-800">Constância</h2>
      <p className="mt-1 text-sm text-mesa-600">
        Posts por semana nas últimas {semanas.length} semanas.{" "}
        <strong className="text-mesa-800">
          {comPost} de {semanas.length}
        </strong>{" "}
        tiveram pelo menos um post.
      </p>

      {/* Gráfico: uma série, uma cor. O valor aparece ao passar o mouse ou focar a barra. */}
      <div className="mt-5" aria-hidden="true">
        <div
          className="flex items-end gap-0.5 border-b border-mesa-200"
          style={{ height: ALTURA }}
        >
          {semanas.map((s) => (
            <div
              key={s.segunda}
              className="group relative flex h-full flex-1 items-end justify-center"
            >
              <div
                className={`w-full max-w-[28px] rounded-t ${s.posts ? "bg-mesa-700 group-hover:bg-mesa-900" : "bg-transparent"}`}
                style={{
                  height: s.posts
                    ? Math.max(6, Math.round((s.posts / max) * ALTURA))
                    : 0,
                }}
              />
              <div className="pointer-events-none absolute -top-1 left-1/2 z-10 hidden -translate-x-1/2 -translate-y-full whitespace-nowrap rounded-md bg-mesa-900 px-2 py-1 text-xs text-white group-hover:block">
                Semana de {rotuloSemana(s.segunda)}: {s.posts}{" "}
                {s.posts === 1 ? "post" : "posts"}
              </div>
            </div>
          ))}
        </div>
        <div className="mt-1 flex gap-0.5">
          {semanas.map((s, i) => (
            <div
              key={s.segunda}
              className="flex-1 text-center text-[10px] text-mesa-400"
            >
              {/* Rótulo em semanas alternadas: doze datas lado a lado se atropelam no celular. */}
              {i % 2 === 0 || i === semanas.length - 1 ? rotuloSemana(s.segunda) : ""}
            </div>
          ))}
        </div>
      </div>

      {/* Os mesmos números em tabela, para leitor de tela. */}
      <table className="sr-only">
        <caption>Posts por semana ({total} no total)</caption>
        <thead>
          <tr>
            <th scope="col">Semana de</th>
            <th scope="col">Posts</th>
          </tr>
        </thead>
        <tbody>
          {semanas.map((s) => (
            <tr key={s.segunda}>
              <td>{rotuloSemana(s.segunda)}</td>
              <td>{s.posts}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </section>
  );
}

export function PainelInstagram({
  conectado,
  erro,
  conta,
  acoes,
  indicadores,
  semanas,
  destaques,
  melhorMomento,
  formatoTop,
  totalPosts,
  crescimento,
}: {
  conectado: boolean;
  erro: string | null;
  conta: ContaInstagram | null;
  acoes: Acao[];
  indicadores: Indicador[];
  semanas: SemanaConstancia[];
  destaques: Destaque[];
  /** "Domingo, noite (18h–21h)" — do perfil, pelos dados dele. */
  melhorMomento: string;
  formatoTop: string;
  totalPosts: number;
  /** A seção de crescimento, já montada (só quando há dados do Instagram). */
  crescimento?: React.ReactNode;
}) {
  return (
    <div className="space-y-6">
      {/* O que fazer hoje */}
      <section className="rounded-2xl border border-laranja-200 bg-laranja-50/50 p-5">
        <h2 className="font-serif text-xl font-semibold text-mesa-800">
          O que fazer hoje
        </h2>
        {acoes.length === 0 ? (
          <p className="mt-2 text-sm text-mesa-600">
            Nada pendente: a semana está planejada e não há post esperando por você.
          </p>
        ) : (
          <ol className="mt-3 grid gap-3 md:grid-cols-3">
            {acoes.map((a, i) => (
              <li
                key={a.chave}
                className="flex flex-col rounded-xl border border-mesa-200 bg-white p-4"
              >
                <span className="text-xs font-semibold uppercase tracking-wider text-laranja-700">
                  {i + 1}ª prioridade
                </span>
                <p className="mt-1 font-medium leading-snug text-mesa-800">
                  {a.titulo}
                </p>
                <p className="mt-1 flex-1 text-sm leading-relaxed text-mesa-600">
                  {a.detalhe}
                </p>
                <Link
                  href={a.href}
                  className="mt-3 self-start rounded-full bg-laranja-600 px-4 py-1.5 text-sm font-semibold text-white hover:bg-laranja-700"
                >
                  {a.rotulo} →
                </Link>
              </li>
            ))}
          </ol>
        )}
      </section>

      {!conectado && (
        <div
          className="rounded-xl border border-amber-300 bg-amber-50 p-4 text-sm text-amber-800"
          role="status"
        >
          O Instagram não está conectado a esta plataforma, então os números do perfil
          não aparecem. As ações acima continuam valendo: elas vêm do calendário.
        </div>
      )}
      {erro && (
        <div
          className="rounded-xl border border-red-200 bg-red-50 p-4 text-sm text-red-700"
          role="alert"
        >
          Não consegui ler os números do Instagram: {erro} Se o token venceu, é preciso
          gerar outro no painel da Meta.
        </div>
      )}

      {conectado && !erro && (
        <>
          {/* Crescimento vem primeiro: é o objetivo, o resto é meio. */}
          {crescimento}

          <section>
            <div className="mb-3 flex flex-wrap items-baseline justify-between gap-2">
              <h2 className="font-serif text-xl font-semibold text-mesa-800">
                Últimos 90 dias
              </h2>
              {conta && (
                <p className="text-sm text-mesa-600">
                  @{conta.usuario}
                  {conta.seguidores !== null && (
                    <>
                      {" · "}
                      <strong className="text-mesa-800">
                        {numero.format(conta.seguidores)}
                      </strong>{" "}
                      seguidores
                    </>
                  )}
                </p>
              )}
            </div>
            <dl className="grid grid-cols-2 gap-3 lg:grid-cols-4">
              {indicadores.map((ind) => (
                <div
                  key={ind.rotulo}
                  className="rounded-2xl border border-mesa-200 bg-white p-4"
                >
                  <dt className="text-sm text-mesa-600">{ind.rotulo}</dt>
                  <dd className="mt-1">
                    <span className="block font-serif text-3xl font-semibold text-mesa-800">
                      {ind.valor === null ? "—" : numero.format(ind.valor)}
                    </span>
                    {ind.valor === null ? (
                      <span className="text-xs text-mesa-400">
                        o Instagram não liberou este número
                      </span>
                    ) : (
                      <Variacao v={ind.variacao} />
                    )}
                  </dd>
                </div>
              ))}
            </dl>
          </section>

          <Constancia semanas={semanas} />

          <section className="rounded-2xl border border-mesa-200 bg-white p-5">
            <h2 className="font-serif text-xl font-semibold text-mesa-800">
              O que saiu do seu normal
            </h2>
            {destaques.length === 0 ? (
              <p className="mt-2 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
                {totalPosts < 4
                  ? "Ainda há poucos posts nos últimos 90 dias para saber qual é o seu normal. Com quatro ou mais, os que se destacarem aparecem aqui."
                  : "Nenhum post passou de uma vez e meia o seu resultado típico nos últimos 90 dias. O perfil está estável."}
              </p>
            ) : (
              <>
                <p className="mt-1 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
                  Posts que tiveram pelo menos uma vez e meia as interações do seu post
                  típico. Abaixo de cada um, o que ele tinha de diferente. São fatos,
                  não a causa: com poucos posts ninguém sabe a causa.
                </p>
                <ul className="mt-4 grid gap-3 md:grid-cols-3">
                  {destaques.map((d) => (
                    <li
                      key={d.post.id}
                      className="flex flex-col rounded-xl border border-mesa-200 bg-bege-50 p-4"
                    >
                      <span className="text-xs font-semibold uppercase tracking-wider text-oliveira-700">
                        {String(d.vezes).replace(".", ",")}× o seu normal
                      </span>
                      <p className="mt-1 text-sm font-medium leading-snug text-mesa-800">
                        {primeiraLinha(d.post.caption)}
                      </p>
                      <p className="mt-1 text-xs text-mesa-500">
                        {nomeDoFormato(d.post.mediaType)} ·{" "}
                        {numero.format(d.post.likes)} curtidas ·{" "}
                        {numero.format(d.post.comments)} comentários
                      </p>
                      <ul className="mt-3 flex-1 list-disc space-y-1 pl-5 text-sm text-mesa-700">
                        {d.porque.map((f) => (
                          <li key={f}>{f}</li>
                        ))}
                      </ul>
                      {d.post.permalink && (
                        <a
                          href={d.post.permalink}
                          target="_blank"
                          rel="noreferrer"
                          className="mt-3 self-start text-sm font-medium text-laranja-700 underline-offset-2 hover:underline"
                        >
                          Ver no Instagram
                        </a>
                      )}
                    </li>
                  ))}
                </ul>
              </>
            )}
          </section>

          {totalPosts >= 4 && (
            <section className="rounded-2xl border border-mesa-200 bg-white p-5">
              <h2 className="font-serif text-xl font-semibold text-mesa-800">
                Quando e como o seu público responde
              </h2>
              <dl className="mt-3 grid gap-4 sm:grid-cols-2">
                <div>
                  <dt className="text-sm text-mesa-600">Melhor momento para postar</dt>
                  <dd className="mt-0.5 font-medium text-mesa-800">{melhorMomento}</dd>
                </div>
                <div>
                  <dt className="text-sm text-mesa-600">
                    Formato que mais gera interação
                  </dt>
                  <dd className="mt-0.5 font-medium text-mesa-800">{formatoTop}</dd>
                </div>
              </dl>
              <p className="mt-3 text-xs text-mesa-500">
                Pela média de interações dos seus posts recentes. Com poucos posts, um
                resultado isolado pesa muito.
              </p>
            </section>
          )}
        </>
      )}
    </div>
  );
}
