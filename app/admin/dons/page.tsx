import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import {
  DonsAlternarLink,
  DonsCompartilhar,
  DonsGerarLink,
} from "@/components/DonsPainel";
import { getCurrentSession } from "@/lib/db";
import { DONS, type Dom } from "@/lib/dons";
import { listConvitesAbertos, listPessoasDons } from "@/lib/dons-db";
import { ehMaster } from "@/lib/permissoes";
import { displayTelefone } from "@/lib/telefone";

// Teste de Dons Ministeriais (issue #289) — painel do master.
// Busca e filtro por GET: funciona sem JavaScript e o endereço guarda a
// consulta (dá para voltar a ela).

function semAcento(s: string): string {
  return s.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase();
}

function data(iso: string): string {
  return new Intl.DateTimeFormat("pt-BR", {
    timeZone: "America/Sao_Paulo",
    day: "2-digit",
    month: "short",
    year: "numeric",
  }).format(new Date(iso));
}

export default async function DonsPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string; dom?: string }>;
}) {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!ehMaster(session.profile?.papel, session.profile?.is_admin)) redirect("/admin");

  const { q = "", dom = "" } = await searchParams;
  const [pessoas, links] = await Promise.all([
    listPessoasDons(),
    listConvitesAbertos(),
  ]);

  const domFiltro = DONS.find((d) => d.chave === dom)?.chave as Dom | undefined;
  const nomeDomFiltro = DONS.find((d) => d.chave === domFiltro)?.nome;
  const busca = semAcento(q.trim());
  const filtradas = pessoas.filter((p) => {
    if (busca && !semAcento(p.nome).includes(busca)) return false;
    if (domFiltro) {
      const prim = p.ultima?.resultado_exibido.primarios ?? [];
      if (!nomeDomFiltro || !prim.includes(nomeDomFiltro)) return false;
    }
    return true;
  });

  const totalTestes = pessoas.reduce((s, p) => s + p.total_testes, 0);
  const novas = pessoas.reduce((s, p) => s + p.novas, 0);
  const aguardando = pessoas.filter((p) => p.total_testes === 0).length;

  return (
    <AdminShell current="dons" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Discipulado · Efésios 4.11
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Dons ministeriais
      </h1>
      <p className="mb-8 max-w-2xl text-mesa-600">
        Mande o link, a pessoa responde sem cadastro e o resultado — exatamente como
        apareceu para ela — fica aqui, no histórico dela. Só você vê esta área.
      </p>

      <dl className="mb-8 grid grid-cols-2 gap-3 sm:grid-cols-4">
        {[
          ["Pessoas", pessoas.length],
          ["Testes respondidos", totalTestes],
          ["Novos para ver", novas],
          ["Aguardando resposta", aguardando],
        ].map(([rotulo, valor]) => (
          <div key={rotulo} className="rounded-2xl border border-mesa-200 bg-white p-4">
            <dt className="text-xs text-mesa-500">{rotulo}</dt>
            <dd className="mt-1 font-serif text-3xl font-semibold tabular-nums text-mesa-800">
              {valor}
            </dd>
          </div>
        ))}
      </dl>

      <section className="mb-10">
        <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
          Gerar link
        </h2>
        <DonsGerarLink />
      </section>

      {links.length > 0 && (
        <section className="mb-10">
          <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
            Links de grupo
          </h2>
          <ul className="space-y-3">
            {links.map((l) => (
              <li
                key={l.id}
                className={`rounded-2xl border bg-white p-4 ${l.ativo ? "border-mesa-200" : "border-dashed border-mesa-300 opacity-70"}`}
              >
                <div className="mb-2 flex flex-wrap items-baseline justify-between gap-2">
                  <p className="font-medium text-mesa-900">
                    {l.titulo || "Link aberto"}
                    {!l.ativo && (
                      <span className="ml-2 rounded-full bg-bege-200 px-2 py-0.5 text-[11px] text-mesa-600">
                        Encerrado
                      </span>
                    )}
                  </p>
                  <p className="text-xs text-mesa-500">
                    {l.usos} {l.usos === 1 ? "resposta" : "respostas"} · criado em{" "}
                    {data(l.criado_em)} · <DonsAlternarLink id={l.id} ativo={l.ativo} />
                  </p>
                </div>
                {l.ativo && (
                  <DonsCompartilhar token={l.token} nome={null} telefone={null} />
                )}
              </li>
            ))}
          </ul>
        </section>
      )}

      <section>
        <div className="mb-4 flex flex-wrap items-end justify-between gap-3">
          <h2 className="font-serif text-xl font-semibold text-mesa-800">Pessoas</h2>
          <form className="flex flex-wrap gap-2" action="/admin/dons">
            <input
              name="q"
              defaultValue={q}
              placeholder="Buscar pelo nome"
              aria-label="Buscar pelo nome"
              className="rounded-xl border border-mesa-300 bg-white px-3 py-1.5 text-sm"
            />
            <select
              name="dom"
              defaultValue={domFiltro ?? ""}
              aria-label="Filtrar por dom primário"
              className="rounded-xl border border-mesa-300 bg-white px-3 py-1.5 text-sm"
            >
              <option value="">Todos os dons</option>
              {DONS.map((d) => (
                <option key={d.chave} value={d.chave}>
                  Primário: {d.nome}
                </option>
              ))}
            </select>
            <button
              type="submit"
              className="rounded-full bg-mesa-800 px-4 py-1.5 text-sm font-semibold text-white"
            >
              Filtrar
            </button>
          </form>
        </div>

        {filtradas.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-14 text-center text-mesa-500">
            {pessoas.length === 0
              ? "Ninguém respondeu ainda. Gere um link acima para começar."
              : "Ninguém com esse filtro."}
          </div>
        ) : (
          <ul className="grid gap-3 lg:grid-cols-2">
            {filtradas.map((p) => {
              const r = p.ultima?.resultado_exibido;
              return (
                <li key={p.id}>
                  <Link
                    href={`/admin/dons/${p.id}`}
                    className="lift block h-full rounded-2xl border border-mesa-200 bg-white p-4 transition hover:border-laranja-300 hover:shadow-md"
                  >
                    <div className="flex items-start justify-between gap-3">
                      <div className="min-w-0">
                        <p className="truncate font-medium text-mesa-900">
                          {p.nome}
                          {p.novas > 0 && (
                            <span className="ml-2 rounded-full bg-laranja-500 px-2 py-0.5 text-[11px] font-semibold text-white">
                              {p.novas === 1 ? "Novo" : `${p.novas} novos`}
                            </span>
                          )}
                        </p>
                        <p className="text-xs text-mesa-500">
                          {p.telefone ? displayTelefone(p.telefone) : "Sem WhatsApp"}
                          {p.ultima?.idade ? ` · ${p.ultima.idade} anos` : ""}
                        </p>
                      </div>
                      <p className="shrink-0 text-right text-xs text-mesa-500">
                        {p.ultima ? data(p.ultima.respondido_em) : "Aguardando"}
                        <br />
                        {p.total_testes > 1 ? `${p.total_testes} testes` : ""}
                      </p>
                    </div>
                    {r ? (
                      <>
                        <p className="mt-3 text-sm text-mesa-800">
                          <span className="font-semibold text-laranja-700">
                            {r.primarios.join(" / ")}
                          </span>
                          {r.secundarios.length > 0 && (
                            <span className="text-mesa-600">
                              {" "}
                              · {r.secundarios.join(" / ")}
                            </span>
                          )}
                        </p>
                        <div className="mt-2 grid grid-cols-6 gap-1 text-center text-[11px] text-mesa-600">
                          {r.dons.map((d) => (
                            <div key={d.dom} className="rounded-lg bg-bege-100 py-1">
                              <div className="font-semibold tabular-nums text-mesa-800">
                                {d.pontos}
                              </div>
                              {d.nome.slice(0, 4)}.
                            </div>
                          ))}
                          <div className="rounded-lg bg-bege-200 py-1">
                            <div className="font-semibold tabular-nums text-mesa-800">
                              {r.vida.pontos}
                            </div>
                            Vida
                          </div>
                        </div>
                      </>
                    ) : (
                      <p className="mt-3 text-sm text-mesa-500">
                        Link enviado, ainda sem resposta.
                      </p>
                    )}
                  </Link>
                </li>
              );
            })}
          </ul>
        )}
      </section>
    </AdminShell>
  );
}
