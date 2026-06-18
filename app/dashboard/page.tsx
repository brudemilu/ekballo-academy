import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { CompletarTelefoneBanner } from "@/components/CompletarTelefoneBanner";
import {
  getCurrentSession,
  listCursosPublicados,
  listMatriculasByAluno,
  getMaterialUrl,
} from "@/lib/db";
import { getDevocionalDoDia } from "@/lib/devocionais";
import { podeVerAgenda } from "@/lib/permissoes";
import { agruparPorCategoria } from "@/lib/categorias";

// Mostra "Pr. Bruno" para "Pr. Bruno Fernandes" / "Maria" para "Maria Helena Andrade"
function greetingName(nome?: string | null): string {
  if (!nome) return "discípulo";
  const parts = nome.trim().split(/\s+/);
  if (parts[0]?.endsWith(".") && parts[1]) return `${parts[0]} ${parts[1]}`;
  return parts[0];
}

export default async function DashboardPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const [todosCursos, matriculas, devocional] = await Promise.all([
    listCursosPublicados(),
    listMatriculasByAluno(session.userId),
    getDevocionalDoDia(),
  ]);

  const mostrarAgenda = podeVerAgenda(
    session.profile?.papel,
    session.profile?.is_admin,
    session.profile?.email ?? session.email,
  );

  // Pede o WhatsApp pra quem está sem telefone no cadastro (recuperação de senha).
  const semTelefone =
    (session.profile?.telefone || "").replace(/\D+/g, "").length < 10;

  const matriculasMap = new Map(matriculas.map((m) => [m.curso_id, m]));
  // Admin vê todos os cursos publicados; aluno comum só os que foi matriculado.
  const cursos = session.profile?.is_admin
    ? todosCursos
    : todosCursos.filter((c) => matriculasMap.has(c.id));

  // Resolve imagens (path do bucket privado vira signed URL)
  const imagensResolvidas = await Promise.all(
    cursos.map((c) => getMaterialUrl(c.imagem_url))
  );
  const imagemMap = new Map(
    cursos.map((c, i) => [c.id, imagensResolvidas[i]])
  );

  // Vitrine agrupada por seção (Liderança, Discipulado, …). Se só existe
  // uma seção, não vale mostrar título — cai no grid simples de antes.
  const grupos = agruparPorCategoria(cursos);
  const mostrarSecoes = grupos.length > 1;

  const renderCard = (curso: (typeof cursos)[number]) => {
    const matricula = matriculasMap.get(curso.id);
    const concluido = matricula?.concluido_em;
    const href = curso.external_path ?? `/cursos/${curso.slug}`;
    const ogUrl = imagemMap.get(curso.id);
    // Card padronizado: todos usam a versão retrato gerada pela rota OG
    // (capa do livro emoldurada de forma idêntica, ou tipografia).
    const capa = ogUrl?.startsWith("/api/og/curso/")
      ? `${ogUrl}?formato=retrato&v=4`
      : ogUrl ?? null;
    return (
      <Link
        key={curso.id}
        href={href}
        className="lift group flex flex-col overflow-hidden rounded-2xl border border-bege-200 bg-white transition hover:border-laranja-300 hover:shadow-md"
      >
        <div className="relative aspect-[3/4] overflow-hidden bg-gradient-to-br from-laranja-100 via-bege-100 to-oliveira-100">
          {capa ? (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={capa}
              alt={curso.titulo}
              className="h-full w-full object-cover transition duration-500 group-hover:scale-[1.03]"
            />
          ) : (
            <div className="flex h-full items-center justify-center">
              <Logo />
            </div>
          )}
          {concluido ? (
            <span className="absolute left-2 top-2 rounded-full bg-oliveira-600/95 px-2 py-0.5 text-[11px] font-medium text-white shadow-sm">
              ✓ Concluído
            </span>
          ) : matricula ? (
            <span className="absolute left-2 top-2 rounded-full bg-white/90 px-2 py-0.5 text-[11px] font-medium text-mesa-700 shadow-sm backdrop-blur">
              Em andamento
            </span>
          ) : null}
          {curso.is_pago && (
            <span className="absolute right-2 top-2 rounded-full bg-mesa-800/85 px-2 py-0.5 text-[11px] font-medium text-white shadow-sm">
              Pago
            </span>
          )}
        </div>
      </Link>
    );
  };

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/dashboard">
            <Logo />
          </Link>
          <UserMenu
            nome={session.profile?.nome || null}
            email={session.profile?.email || session.email}
            isAdmin={!!session.profile?.is_admin}
          />
        </nav>
      </header>

      <div className="mx-auto max-w-6xl px-6 py-12">
        {semTelefone && <CompletarTelefoneBanner userId={session.userId} />}

        <div className="mb-12">
          <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Bem-vindo de volta
          </p>
          <h1 className="font-serif text-4xl font-semibold text-mesa-800">
            Olá, {greetingName(session.profile?.nome)}.
          </h1>
          <p className="mt-3 max-w-2xl text-mesa-700">
            Aqui está sua trilha. Escolha uma temática, faça no seu ritmo, deixe
            sua reflexão. O líder vai ler e te responder.
          </p>
        </div>

        {/* Minha agenda (só pra quem tem acesso, ex.: Débora) */}
        {mostrarAgenda && (
          <Link
            href="/admin/agenda"
            className="mb-10 flex items-center justify-between gap-3 rounded-2xl border border-mesa-300 bg-white px-6 py-5 transition hover:border-laranja-300 hover:shadow-md"
          >
            <div className="min-w-0">
              <p className="mb-1 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
                Pessoal
              </p>
              <h2 className="font-serif text-xl font-semibold text-mesa-800">
                📅 Minha agenda
              </h2>
              <p className="mt-1 text-sm text-mesa-600">
                Seus compromissos e os do Google Calendar, num lugar só.
              </p>
            </div>
            <span className="flex-none text-2xl text-laranja-600">→</span>
          </Link>
        )}

        {/* Devocional de hoje (destaque no topo) */}
        {devocional && (
          <Link
            href="/devocional"
            className="mb-10 flex flex-col gap-3 rounded-2xl border border-laranja-200 bg-gradient-to-br from-laranja-50 to-bege-100 px-6 py-5 transition hover:border-laranja-300 hover:shadow-md sm:flex-row sm:items-center sm:justify-between"
          >
            <div className="min-w-0">
              <p className="mb-1 text-xs font-medium uppercase tracking-[0.2em] text-laranja-700">
                Devocional de hoje
              </p>
              <h2 className="font-serif text-xl font-semibold text-mesa-800">
                {devocional.titulo || devocional.versiculo_ref}
              </h2>
              <p className="mt-1 line-clamp-2 text-sm italic text-mesa-600">
                &ldquo;{devocional.versiculo_texto}&rdquo;{" "}
                <span className="not-italic text-mesa-500">
                  — {devocional.versiculo_ref}
                </span>
              </p>
            </div>
            <span className="flex-none text-2xl text-laranja-600">→</span>
          </Link>
        )}


        {cursos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-20 text-center">
            <p className="font-serif text-xl text-mesa-500">
              Sua matrícula ainda não foi liberada.
            </p>
            <p className="mt-2 mx-auto max-w-md text-sm text-mesa-500">
              Seu líder pastoral vai te matricular nas temáticas da sua trilha. Quando isso acontecer, elas aparecem aqui.
            </p>
          </div>
        ) : mostrarSecoes ? (
          <div className="space-y-10">
            {grupos.map((grupo) => (
              <section key={grupo.label}>
                <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
                  {grupo.label}
                </h2>
                <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
                  {grupo.cursos.map((curso) => renderCard(curso))}
                </div>
              </section>
            ))}
          </div>
        ) : (
          <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5">
            {cursos.map((curso) => renderCard(curso))}
          </div>
        )}
      </div>
    </main>
  );
}
