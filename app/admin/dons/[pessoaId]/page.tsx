import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import {
  DonsAlternarLink,
  DonsAnotacoes,
  DonsApagarTeste,
  DonsCompartilhar,
  DonsGerarLink,
  DonsPessoaAcoes,
} from "@/components/DonsPainel";
import { DonsResultado } from "@/components/DonsResultado";
import { getCurrentSession } from "@/lib/db";
import { DONS, domDaPergunta, ESCALA, nomeDom, QTD_VIDA } from "@/lib/dons";
import { getFichaDons, marcarRespostasVistas, type RespostaDons } from "@/lib/dons-db";
import { PERGUNTAS_DONS, PERGUNTAS_VIDA } from "@/lib/dons-perguntas";
import { ehMaster } from "@/lib/permissoes";
import { displayTelefone } from "@/lib/telefone";

// Ficha de uma pessoa no Teste de Dons (issue #289): histórico de testes
// com o resultado COMO APARECEU para ela, as 160 respostas, a evolução
// entre um teste e outro e as anotações de acompanhamento.

function data(iso: string): string {
  return new Intl.DateTimeFormat("pt-BR", {
    timeZone: "America/Sao_Paulo",
    day: "numeric",
    month: "long",
    year: "numeric",
  }).format(new Date(iso));
}

const ROTULO = new Map(ESCALA.map((e) => [e.valor, e.rotulo]));

/** Diferença entre o que a planilha antiga somou e a conta correta. */
function avisoPlanilha(r: RespostaDons): string | null {
  const p = r.pontuacao_planilha;
  if (!p) return null;
  const difs = DONS.filter((d) => p.dons[d.chave] !== r.pontuacao.dons[d.chave]).map(
    (d) => `${d.nome} ${p.dons[d.chave]} → ${r.pontuacao.dons[d.chave]}`,
  );
  if (difs.length === 0) return null;
  return `A planilha antiga mostrava ${difs.join(", ")}. A fórmula de Apóstolo lá somava a pergunta 148 (de Pastor) no lugar da 146; aqui vale a conta correta.`;
}

function Respostas160({ r }: { r: RespostaDons }) {
  return (
    <details className="rounded-2xl border border-mesa-200 bg-white p-4">
      <summary className="cursor-pointer text-sm font-medium text-mesa-800">
        Ver as 160 respostas
      </summary>
      <div className="mt-4 space-y-6 text-sm">
        <div>
          <p className="mb-2 font-semibold text-mesa-800">Parte 1 · Vida ministerial</p>
          <ol className="space-y-1">
            {PERGUNTAS_VIDA.map((t, i) => (
              <li key={t} className="flex gap-3 border-b border-bege-100 py-1">
                <span className="w-8 shrink-0 tabular-nums text-mesa-500">
                  {i + 1}.
                </span>
                <span className="flex-1 text-mesa-800">{t}</span>
                <span className="w-28 shrink-0 text-right font-medium tabular-nums text-mesa-900">
                  {r.respostas[i]} · {ROTULO.get(r.respostas[i])}
                </span>
              </li>
            ))}
          </ol>
        </div>
        <div>
          <p className="mb-2 font-semibold text-mesa-800">
            Parte 2 · Dons ministeriais
          </p>
          <ol className="space-y-1">
            {PERGUNTAS_DONS.map((t, i) => {
              const v = r.respostas[QTD_VIDA + i];
              return (
                <li key={t} className="flex gap-3 border-b border-bege-100 py-1">
                  <span className="w-8 shrink-0 tabular-nums text-mesa-500">
                    {i + 1}.
                  </span>
                  <span className="flex-1 text-mesa-800">
                    {t}{" "}
                    <span className="whitespace-nowrap text-xs text-mesa-500">
                      ({nomeDom(domDaPergunta(i + 1))})
                    </span>
                  </span>
                  <span
                    className={`w-28 shrink-0 text-right font-medium tabular-nums ${v === 4 ? "text-laranja-700" : "text-mesa-900"}`}
                  >
                    {v} · {ROTULO.get(v)}
                  </span>
                </li>
              );
            })}
          </ol>
        </div>
      </div>
    </details>
  );
}

export default async function FichaDonsPage({
  params,
}: {
  params: Promise<{ pessoaId: string }>;
}) {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!ehMaster(session.profile?.papel, session.profile?.is_admin)) redirect("/admin");

  const { pessoaId } = await params;
  const ficha = await getFichaDons(pessoaId);
  if (!ficha) notFound();
  const { pessoa, respostas, anotacoes, convites } = ficha;

  // O selo "novo" aparece nesta visita e some na próxima.
  const novas = new Set(respostas.filter((r) => !r.vista_em).map((r) => r.id));
  if (novas.size > 0) await marcarRespostasVistas(pessoa.id);

  const respondidos = new Set(respostas.map((r) => r.convite_id).filter(Boolean));
  const pendentes = convites.filter((c) => !respondidos.has(c.id));

  return (
    <AdminShell current="dons" session={session}>
      <Link
        href="/admin/dons"
        className="mb-4 inline-block text-sm text-mesa-600 hover:text-laranja-700"
      >
        ← Dons ministeriais
      </Link>

      <div className="mb-8 flex flex-wrap items-end justify-between gap-4">
        <div>
          <h1 className="font-serif text-4xl font-semibold text-mesa-800">
            {pessoa.nome}
          </h1>
          <p className="mt-1 text-sm text-mesa-600">
            {pessoa.telefone ? (
              <a
                href={`https://wa.me/${pessoa.telefone}`}
                target="_blank"
                rel="noreferrer"
                className="hover:text-laranja-700 hover:underline"
              >
                {displayTelefone(pessoa.telefone)}
              </a>
            ) : (
              "Sem WhatsApp"
            )}
            {" · "}
            {respostas.length === 0
              ? "nenhum teste ainda"
              : respostas.length === 1
                ? "1 teste"
                : `${respostas.length} testes`}
          </p>
        </div>
        <DonsPessoaAcoes id={pessoa.id} nome={pessoa.nome} telefone={pessoa.telefone} />
      </div>

      <div className="grid gap-10 xl:grid-cols-[minmax(0,1fr)_22rem]">
        <section aria-label="Histórico de testes" className="min-w-0">
          <h2 className="mb-4 font-serif text-xl font-semibold text-mesa-800">
            Histórico de testes
          </h2>

          {respostas.length > 1 && (
            <div className="mb-6 overflow-x-auto rounded-2xl border border-mesa-200 bg-white">
              <table className="w-full text-sm">
                <caption className="sr-only">Evolução entre os testes</caption>
                <thead className="bg-bege-100 text-xs text-mesa-600">
                  <tr>
                    <th className="px-3 py-2 text-left font-medium">Data</th>
                    {DONS.map((d) => (
                      <th key={d.chave} className="px-2 py-2 text-right font-medium">
                        {d.nome.slice(0, 4)}.
                      </th>
                    ))}
                    <th className="px-3 py-2 text-right font-medium">Vida</th>
                  </tr>
                </thead>
                <tbody>
                  {respostas.map((r) => (
                    <tr key={r.id} className="border-t border-bege-100">
                      <td className="whitespace-nowrap px-3 py-2 text-mesa-700">
                        {data(r.respondido_em)}
                      </td>
                      {DONS.map((d) => (
                        <td
                          key={d.chave}
                          className={`px-2 py-2 text-right tabular-nums ${r.resultado_exibido.primarios.includes(d.nome) ? "font-semibold text-laranja-700" : "text-mesa-800"}`}
                        >
                          {r.pontuacao.dons[d.chave]}
                        </td>
                      ))}
                      <td className="px-3 py-2 text-right tabular-nums text-mesa-800">
                        {r.pontuacao.vida}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}

          {respostas.length === 0 ? (
            <p className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white p-8 text-center text-mesa-500">
              Ainda sem resposta. O link pessoal está ao lado.
            </p>
          ) : (
            <ol className="space-y-8">
              {respostas.map((r, i) => {
                const aviso = avisoPlanilha(r);
                return (
                  <li
                    key={r.id}
                    className="rounded-3xl border border-mesa-200 bg-bege-50 p-5"
                  >
                    {/* O mais recente (e o que ainda não foi visto) vem aberto;
                        os anteriores ficam recolhidos para a ficha não virar um
                        rolo — a tabela acima já mostra a evolução. */}
                    <details open={i === 0 || novas.has(r.id)} className="group">
                      <summary className="flex cursor-pointer list-none flex-wrap items-baseline justify-between gap-2 [&::-webkit-details-marker]:hidden">
                        <p className="font-serif text-lg font-semibold text-mesa-900">
                          {data(r.respondido_em)}
                          {novas.has(r.id) && (
                            <span className="ml-2 rounded-full bg-laranja-500 px-2 py-0.5 align-middle font-sans text-[11px] font-semibold text-white">
                              Novo
                            </span>
                          )}
                        </p>
                        <p className="text-xs text-mesa-500">
                          {r.origem === "planilha"
                            ? "Planilha antiga (Google Forms)"
                            : "Pelo link"}
                          {r.idade ? ` · ${r.idade} anos` : ""}
                          {r.nome_informado !== pessoa.nome
                            ? ` · respondeu como “${r.nome_informado}”`
                            : ""}
                        </p>
                        <p className="w-full text-sm text-mesa-700 group-open:hidden">
                          {r.resultado_exibido.primarios.join(" / ")}
                          {r.resultado_exibido.secundarios.length > 0
                            ? ` · ${r.resultado_exibido.secundarios.join(" / ")}`
                            : ""}{" "}
                          <span className="text-laranja-700">— ver detalhes</span>
                        </p>
                      </summary>
                      <p className="mb-3 mt-4 text-xs text-mesa-500">
                        O que apareceu para a pessoa
                        {respostas[i + 1]
                          ? " (os números pequenos comparam com o teste anterior)"
                          : ""}
                        :
                      </p>
                      <DonsResultado
                        resultado={r.resultado_exibido}
                        anterior={respostas[i + 1]?.pontuacao ?? null}
                      />
                      {aviso && (
                        <p className="mt-4 rounded-xl bg-bege-100 px-3 py-2 text-xs text-mesa-600">
                          {aviso}
                        </p>
                      )}
                      <div className="mt-4">
                        <Respostas160 r={r} />
                      </div>
                      <div className="mt-3 text-right">
                        <DonsApagarTeste id={r.id} />
                      </div>
                    </details>
                  </li>
                );
              })}
            </ol>
          )}
        </section>

        <aside className="space-y-10">
          <section aria-label="Acompanhamento">
            <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
              Acompanhamento
            </h2>
            <DonsAnotacoes pessoaId={pessoa.id} iniciais={anotacoes} />
          </section>

          <section aria-label="Links desta pessoa">
            <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
              {respostas.length > 0 ? "Refazer o teste" : "Link do teste"}
            </h2>
            {pendentes.length > 0 && (
              <ul className="mb-4 space-y-3">
                {pendentes.map((c) => (
                  <li
                    key={c.id}
                    className="rounded-2xl border border-mesa-200 bg-white p-3"
                  >
                    <p className="mb-2 flex items-center justify-between text-xs text-mesa-500">
                      <span>
                        {c.ativo ? "Aguardando resposta" : "Encerrado"} · criado em{" "}
                        {data(c.criado_em)}
                      </span>
                      <DonsAlternarLink id={c.id} ativo={c.ativo} />
                    </p>
                    {c.ativo && (
                      <DonsCompartilhar
                        token={c.token}
                        nome={pessoa.nome}
                        telefone={pessoa.telefone}
                      />
                    )}
                  </li>
                ))}
              </ul>
            )}
            <DonsGerarLink
              pessoaId={pessoa.id}
              nome={pessoa.nome}
              telefone={pessoa.telefone}
            />
          </section>
        </aside>
      </div>
    </AdminShell>
  );
}
