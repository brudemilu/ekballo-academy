import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { Logo } from "@/components/Logo";
import UltimasRespostasLista from "@/components/UltimasRespostasLista";
import {
  getCurrentSession,
  getAdminStats,
  listRecentRespostas,
  listCursosPublicados,
  getMaterialUrl,
} from "@/lib/db";
import { agruparPorCategoria } from "@/lib/categorias";
import { SeloOffline } from "@/components/SeloOffline";
import { CAPA_LIVRO } from "@/lib/capas";

// "Pr. Bruno" para "Pr. Bruno Fernandes" / "Maria" para "Maria Helena".
function greetingName(nome?: string | null): string {
  if (!nome) return "líder";
  const parts = nome.trim().split(/\s+/);
  if (parts[0]?.endsWith(".") && parts[1]) return `${parts[0]} ${parts[1]}`;
  return parts[0];
}

export default async function AdminPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const [stats, ultimas, cursos] = await Promise.all([
    getAdminStats(),
    listRecentRespostas(8),
    listCursosPublicados(),
  ]);
  const imagensResolvidas = await Promise.all(
    cursos.map((c) => getMaterialUrl(c.imagem_url))
  );
  const imagemMap = new Map(
    cursos.map((c, i) => [c.id, imagensResolvidas[i]])
  );

  // Agrupa por seção igual à vitrine do dashboard. Só 1 seção → grid simples.
  const gruposCursos = agruparPorCategoria(cursos);
  const mostrarSecoes = gruposCursos.length > 1;

  const renderCardCurso = (curso: (typeof cursos)[number]) => {
    const ogUrl = imagemMap.get(curso.id);
    const capa = CAPA_LIVRO[curso.slug] ?? (
      ogUrl?.startsWith("/api/og/curso/")
        ? `${ogUrl}?formato=retrato&v=4`
        : ogUrl ?? null
    );
    return (
      <Link
        key={curso.id}
        href={curso.external_path ?? `/cursos/${curso.slug}`}
        className="lift group flex flex-col overflow-hidden rounded-2xl border border-bege-200 bg-white transition hover:border-laranja-300 hover:shadow-md"
      >
        <div className="relative aspect-[3/4] overflow-hidden bg-gradient-to-br from-laranja-100 via-bege-100 to-oliveira-100">
          {capa ? (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={capa}
              alt={curso.titulo}
              loading="lazy"
              decoding="async"
              className="h-full w-full object-cover transition duration-500 group-hover:scale-[1.03]"
            />
          ) : (
            <div className="flex h-full items-center justify-center">
              <Logo />
            </div>
          )}
          {curso.is_pago && (
            <span className="absolute right-2 top-2 rounded-full bg-mesa-800/85 px-2 py-0.5 text-[11px] font-medium text-white shadow-sm">
              Pago
            </span>
          )}
          <SeloOffline slug={curso.slug} />
        </div>
        <div className="flex flex-1 items-center justify-center px-2.5 py-3">
          <h3 className="line-clamp-2 text-center font-serif text-sm font-semibold leading-snug text-mesa-800">
            {curso.titulo}
          </h3>
        </div>
      </Link>
    );
  };

  const cards = [
    { label: "Discípulos", value: stats.totalAlunos, icon: "👥", href: "/admin/alunos", color: "text-mesa-800" },
    { label: "Temáticas", value: stats.totalCursos, icon: "📚", href: "/admin/cursos", color: "text-mesa-800" },
    { label: "Respostas", value: stats.totalRespostas, icon: "✍️", href: "/admin/respostas", color: "text-oliveira-700" },
    { label: "Aguardando devolutiva", value: stats.respostasSemComentario, icon: "⏳", href: "/admin/respostas?status=pendentes", color: "text-amber-700", alerta: true },
  ];

  return (
    <AdminShell current="painel" session={session}>
      <div className="mb-8">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          A mesa por dentro
        </p>
        <h1 className="font-serif text-3xl font-semibold text-mesa-800 sm:text-4xl">
          Olá, {greetingName(session.profile?.nome)}.
        </h1>
        <p className="mt-2 max-w-xl text-mesa-600">
          Quem chegou, quem respondeu e o que espera por você — a vida da mesa num relance.
        </p>
      </div>

      {/* Foco do dia: devolutivas pendentes (o trabalho pastoral que só você faz) */}
      {stats.respostasSemComentario > 0 && (
        <Link
          href="/admin/respostas?status=pendentes"
          className="lift mb-8 flex items-center justify-between gap-4 rounded-2xl border border-amber-300 bg-gradient-to-br from-amber-50 via-laranja-50 to-bege-100 p-6 transition hover:border-amber-400 hover:shadow-md"
        >
          <div className="min-w-0">
            <p className="mb-1 text-xs font-medium uppercase tracking-[0.2em] text-amber-700">
              Precisa de você hoje
            </p>
            <p className="font-serif text-2xl font-semibold leading-tight text-mesa-800">
              {stats.respostasSemComentario}{" "}
              {stats.respostasSemComentario === 1
                ? "reflexão aguardando sua devolutiva"
                : "reflexões aguardando sua devolutiva"}
            </p>
            <p className="mt-1 text-sm text-mesa-600">
              Ler e responder — a palavra do líder é o que fecha a mesa.
            </p>
          </div>
          <span className="flex h-12 w-12 flex-none items-center justify-center rounded-full bg-amber-500 text-xl text-white shadow-sm">
            →
          </span>
        </Link>
      )}

      <div className="mb-10 grid grid-cols-2 gap-3 lg:grid-cols-4">
        {cards.map((s) => {
          const destaque = s.alerta && s.value > 0;
          return (
            <Link
              key={s.label}
              href={s.href}
              className={`lift group flex flex-col justify-between gap-4 rounded-2xl border p-5 transition ${
                destaque
                  ? "border-amber-300 bg-amber-50 hover:border-amber-400"
                  : "border-mesa-200 bg-white hover:border-laranja-300 hover:shadow-md"
              }`}
            >
              <span
                className={`flex h-10 w-10 items-center justify-center rounded-xl text-lg transition ${
                  destaque ? "animate-pulse bg-amber-100" : "bg-mesa-100 group-hover:bg-laranja-100"
                }`}
              >
                {s.icon}
              </span>
              <div className="min-w-0">
                <p className={`font-serif text-3xl font-semibold leading-none ${s.color}`}>
                  {s.value}
                </p>
                <p className="mt-1.5 truncate text-sm font-medium text-mesa-500">
                  {s.label}
                </p>
              </div>
            </Link>
          );
        })}
      </div>

      {/* Atalhos rápidos */}
      <div className="mb-10 flex flex-wrap gap-3">
        <Link
          href="/admin/devocionais"
          className="rounded-full border border-mesa-200 bg-white px-5 py-2.5 text-sm font-medium text-mesa-700 transition hover:border-mesa-300 hover:bg-mesa-100"
        >
          📖 Devocionais
        </Link>
        <Link
          href="/admin/devocionais/reflexoes"
          className="rounded-full border border-mesa-200 bg-white px-5 py-2.5 text-sm font-medium text-mesa-700 transition hover:border-mesa-300 hover:bg-mesa-100"
        >
          💬 Reflexões dos devocionais
        </Link>
      </div>

      {/* Meus cursos — vista de discípulo pra revisar conteúdo */}
      {cursos.length > 0 && (
        <section className="mb-10">
          <div className="mb-4 flex items-baseline justify-between">
            <h2 className="font-serif text-2xl font-semibold text-mesa-800">
              Temáticas
            </h2>
            <Link
              href="/admin/cursos"
              className="text-sm text-mesa-600 hover:text-mesa-800"
            >
              Ver progresso e gestão →
            </Link>
          </div>
          <p className="mb-5 text-sm text-mesa-600">
            Clique em uma temática pra abrir como discípulo e revisar o conteúdo, ou
            entre em <Link href="/admin/cursos" className="underline decoration-mesa-300 hover:text-mesa-800">Temáticas</Link> pra
            ver matrículas, progresso e gargalos.
          </p>
          {mostrarSecoes ? (
            <div className="space-y-8">
              {gruposCursos.map((grupo) => (
                <div key={grupo.label}>
                  <h3 className="mb-3 font-serif text-lg font-semibold text-mesa-700">
                    {grupo.label}
                  </h3>
                  <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
                    {grupo.cursos.map((curso) => renderCardCurso(curso))}
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
              {cursos.map((curso) => renderCardCurso(curso))}
            </div>
          )}
        </section>
      )}

      <UltimasRespostasLista respostas={ultimas} />
    </AdminShell>
  );
}
