import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { MarcarDevocionalForm } from "@/components/MarcarDevocionalForm";
import { getCurrentSession } from "@/lib/db";
import {
  getDevocionalAnualByDia,
  isDevocionalAnualMarcado,
} from "@/lib/devocionais";

const MESES = [
  "janeiro","fevereiro","março","abril","maio","junho",
  "julho","agosto","setembro","outubro","novembro","dezembro",
];

export default async function DevocionalDiaPage({
  params,
}: {
  params: Promise<{ diaAno: string }>;
}) {
  const { diaAno: diaAnoStr } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const diaAno = Number(diaAnoStr);
  if (!Number.isInteger(diaAno) || diaAno < 1 || diaAno > 365) notFound();

  const devocional = await getDevocionalAnualByDia(diaAno);
  if (!devocional) notFound();

  const marcado = await isDevocionalAnualMarcado(session.userId, diaAno);

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

      <div className="mx-auto max-w-3xl px-6 py-12 pb-32">
        <Link
          href="/devocional"
          className="mb-6 inline-flex items-center gap-2 text-sm text-mesa-600 hover:text-mesa-800"
        >
          ← Todos os devocionais
        </Link>

        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          {devocional.tema} · Dia {devocional.dia} de {MESES[devocional.mes - 1]}
        </p>
        <h1 className="mb-1 font-serif text-4xl font-semibold text-mesa-800">
          {devocional.titulo}
        </h1>
        <p className="mb-8 text-sm text-mesa-500">
          Dia {diaAno} de 365 do ciclo anual
        </p>

        <article className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-10 shadow-xl shadow-mesa-700/5">
          <blockquote className="border-l-4 border-laranja-400 bg-laranja-50/40 px-5 py-4">
            <p className="font-serif text-xl italic leading-relaxed text-mesa-800 text-justify hyphens-auto">
              &ldquo;{devocional.versiculo_texto}&rdquo;
            </p>
            <footer className="mt-2 text-sm font-medium text-mesa-700">
              {devocional.versiculo_ref}{" "}
              <span className="text-xs uppercase tracking-wider text-mesa-500">
                · {devocional.versiculo_versao}
              </span>
            </footer>
          </blockquote>

          <div className="prose-mesa mt-6 text-mesa-800">
            {devocional.reflexao.split("\n\n").map((p, i) => (
              <p
                key={i}
                className="whitespace-pre-wrap text-justify hyphens-auto"
              >
                {p}
              </p>
            ))}
          </div>

          <p className="mt-6 border-t border-mesa-100 pt-4 text-sm text-mesa-500">
            — {devocional.autor}
          </p>
        </article>

        {/* Barra de marcar concluído */}
        <div
          className={`mt-6 rounded-2xl border p-6 ${
            marcado
              ? "border-oliveira-200 bg-oliveira-50"
              : "border-mesa-200 bg-white"
          }`}
        >
          <MarcarDevocionalForm
            diaAno={diaAno}
            totalDias={365}
            concluidoInicial={marcado}
          />
        </div>

        {/* Gerador de imagem pra compartilhar */}
        <div className="mt-6 rounded-2xl border border-mesa-200 bg-white p-6">
          <p className="mb-1 font-serif text-lg font-semibold text-mesa-800">
            Compartilhar como imagem
          </p>
          <p className="mb-4 text-sm text-mesa-600">
            Escolha um modelo. Clique pra baixar e mandar no Insta, status do
            WhatsApp ou story.
          </p>

          {/* Templates: Moderno (foto) em destaque, depois os de cor sólida */}
          {(
            ["cinematografico", "pergaminho", "bloco", "reflexao"] as const
          ).map((tema) => (
            <div key={tema} className="mb-4 last:mb-0">
              <p className="mb-2 text-xs font-medium uppercase tracking-wider text-mesa-500">
                {tema === "cinematografico"
                  ? "Moderno · com foto"
                  : tema === "pergaminho"
                    ? "Pergaminho · clássico"
                    : tema === "bloco"
                      ? "Bloco · cor sólida"
                      : "Reflexão · suave"}
              </p>
              <div className="flex flex-wrap items-center gap-2">
                <a
                  href={`/api/og/devocional?dia=${diaAno}&f=feed&tema=${tema}&dl=1`}
                  download
                  className="rounded-full bg-laranja-600 px-4 py-2 text-xs font-medium text-white hover:bg-laranja-700"
                >
                  Feed 1080×1080
                </a>
                <a
                  href={`/api/og/devocional?dia=${diaAno}&f=story&tema=${tema}&dl=1`}
                  download
                  className="rounded-full bg-mesa-700 px-4 py-2 text-xs font-medium text-white hover:bg-mesa-800"
                >
                  Story 1080×1920
                </a>
                <a
                  href={`/api/og/devocional?dia=${diaAno}&f=feed&tema=${tema}`}
                  target="_blank"
                  rel="noreferrer"
                  className="rounded-full border border-mesa-300 bg-white px-3 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
                  title="Abrir preview em nova aba"
                >
                  👁 Ver
                </a>
              </div>
            </div>
          ))}
        </div>

        {/* Nav anterior/próximo */}
        <div className="mt-6 flex items-center justify-between gap-3">
          {diaAno > 1 ? (
            <Link
              href={`/devocional/dia/${diaAno - 1}`}
              className="text-sm text-mesa-600 hover:text-mesa-800"
            >
              ← Dia {diaAno - 1}
            </Link>
          ) : (
            <span />
          )}
          {diaAno < 365 && (
            <Link
              href={`/devocional/dia/${diaAno + 1}`}
              className="text-sm text-mesa-600 hover:text-mesa-800"
            >
              Dia {diaAno + 1} →
            </Link>
          )}
        </div>
      </div>
    </main>
  );
}
