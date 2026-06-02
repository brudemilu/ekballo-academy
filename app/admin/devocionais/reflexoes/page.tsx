import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession } from "@/lib/db";
import { listReflexoesAnualAdmin } from "@/lib/devocionais";

const MESES = [
  "janeiro", "fevereiro", "março", "abril", "maio", "junho",
  "julho", "agosto", "setembro", "outubro", "novembro", "dezembro",
];

function dataLabel(mes: number | null, dia: number | null, diaAno: number): string {
  if (mes && dia) return `${dia} de ${MESES[mes - 1]}`;
  return `Dia ${diaAno}`;
}

export default async function AdminDevocionaisReflexoesPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const reflexoes = await listReflexoesAnualAdmin(300);

  // Quantos discípulos diferentes escreveram
  const autores = new Set(reflexoes.map((r) => r.aluno_id)).size;

  return (
    <AdminShell current="devocionais" session={session}>
      <div className="mb-6">
        <Link
          href="/admin/devocionais"
          className="text-sm text-mesa-500 hover:text-mesa-700"
        >
          ← Devocionais
        </Link>
      </div>

      <div className="mb-8">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Devolutiva pastoral · Devocional anual
        </p>
        <h1 className="font-serif text-4xl font-semibold text-mesa-800">
          Reflexões dos discípulos
        </h1>
        <p className="mt-3 text-sm text-mesa-600">
          O que cada pessoa escreveu ao ler o devocional do dia.{" "}
          {reflexoes.length > 0 && (
            <>
              {reflexoes.length}{" "}
              {reflexoes.length === 1 ? "reflexão" : "reflexões"} de {autores}{" "}
              {autores === 1 ? "discípulo" : "discípulos"}.
            </>
          )}
        </p>
      </div>

      {reflexoes.length === 0 ? (
        <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
          <p className="font-serif text-lg text-mesa-500">
            Ninguém escreveu reflexões ainda.
          </p>
          <p className="mt-2 text-sm text-mesa-400">
            Quando os discípulos comentarem nos devocionais, tudo aparece aqui.
          </p>
        </div>
      ) : (
        <ul className="space-y-4">
          {reflexoes.map((r) => (
            <li
              key={`${r.aluno_id}-${r.dia_ano}`}
              className="rounded-2xl border border-mesa-200 bg-white p-5"
            >
              <div className="mb-3 flex flex-wrap items-start justify-between gap-3">
                <div className="min-w-0">
                  <p className="font-medium text-mesa-800">
                    {r.aluno_nome || r.aluno_email}
                  </p>
                  {r.aluno_nome && (
                    <p className="text-xs text-mesa-500">{r.aluno_email}</p>
                  )}
                </div>
                <div className="flex flex-none flex-wrap items-center gap-2">
                  <span className="rounded-full bg-mesa-100 px-2.5 py-0.5 text-xs font-medium text-mesa-700">
                    {dataLabel(r.mes, r.dia, r.dia_ano)}
                  </span>
                  {r.devocional_tema && (
                    <span className="rounded-full bg-oliveira-100 px-2.5 py-0.5 text-xs font-medium text-oliveira-700">
                      {r.devocional_tema}
                    </span>
                  )}
                </div>
              </div>

              {r.devocional_titulo && (
                <p className="mb-2 font-serif text-base font-semibold text-mesa-700">
                  {r.devocional_titulo}
                </p>
              )}

              <p
                lang="pt-BR"
                className="whitespace-pre-wrap text-justify text-sm leading-relaxed text-mesa-700 hyphens-auto"
              >
                {r.texto}
              </p>

              <p className="mt-3 text-xs text-mesa-400">
                Atualizado em{" "}
                {new Date(r.atualizado_em).toLocaleDateString("pt-BR", {
                  day: "2-digit",
                  month: "2-digit",
                  year: "numeric",
                  hour: "2-digit",
                  minute: "2-digit",
                })}
              </p>
            </li>
          ))}
        </ul>
      )}
    </AdminShell>
  );
}
