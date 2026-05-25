import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import {
  getCurrentSession,
  listCursosPublicados,
  listMatriculasByAluno,
  getMaterialUrl,
} from "@/lib/db";

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

  const [todosCursos, matriculas] = await Promise.all([
    listCursosPublicados(),
    listMatriculasByAluno(session.userId),
  ]);

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
        <div className="mb-12">
          <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
            Bem-vindo de volta
          </p>
          <h1 className="font-serif text-4xl font-semibold text-mesa-800">
            Olá, {greetingName(session.profile?.nome)}.
          </h1>
          <p className="mt-3 max-w-2xl text-mesa-700">
            Aqui está sua trilha. Escolha um curso, faça no seu ritmo, deixe sua
            reflexão. O líder vai ler e te responder.
          </p>
        </div>


        {cursos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-20 text-center">
            <p className="font-serif text-xl text-mesa-500">
              Sua matrícula ainda não foi liberada.
            </p>
            <p className="mt-2 mx-auto max-w-md text-sm text-mesa-500">
              Seu líder pastoral vai te matricular nos cursos da sua trilha. Quando isso acontecer, eles aparecem aqui.
            </p>
          </div>
        ) : (
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {cursos.map((curso) => {
              const matricula = matriculasMap.get(curso.id);
              const concluido = matricula?.concluido_em;
              const href = curso.external_path ?? `/cursos/${curso.slug}`;
              return (
                <Link
                  key={curso.id}
                  href={href}
                  className="lift group block overflow-hidden rounded-2xl border border-bege-200 bg-white transition hover:border-laranja-300"
                >
                  <div className="aspect-[16/9] bg-gradient-to-br from-laranja-100 via-bege-100 to-oliveira-100 transition duration-700 group-hover:from-laranja-200 group-hover:to-oliveira-200">
                    {imagemMap.get(curso.id) ? (
                      // eslint-disable-next-line @next/next/no-img-element
                      <img
                        src={imagemMap.get(curso.id) || undefined}
                        alt={curso.titulo}
                        className="h-full w-full object-cover"
                      />
                    ) : (
                      <div className="flex h-full items-center justify-center">
                        <Logo />
                      </div>
                    )}
                  </div>
                  <div className="p-6">
                    <div className="mb-3 flex items-center gap-2">
                      {curso.is_pago ? (
                        <span className="rounded-full bg-mesa-100 px-2.5 py-0.5 text-xs font-medium text-mesa-700">
                          Pago
                        </span>
                      ) : (
                        <span className="rounded-full bg-oliveira-100 px-2.5 py-0.5 text-xs font-medium text-oliveira-700">
                          Gratuito
                        </span>
                      )}
                      {matricula && !concluido && (
                        <span className="rounded-full bg-mesa-50 px-2.5 py-0.5 text-xs font-medium text-mesa-600">
                          Em andamento
                        </span>
                      )}
                      {concluido && (
                        <span className="rounded-full bg-oliveira-100 px-2.5 py-0.5 text-xs font-medium text-oliveira-700">
                          Concluído
                        </span>
                      )}
                    </div>
                    <h3 className="mb-2 font-serif text-xl font-semibold text-mesa-800 group-hover:text-mesa-900">
                      {curso.titulo}
                    </h3>
                    {curso.descricao && (
                      <p className="line-clamp-3 text-sm text-mesa-600">
                        {curso.descricao}
                      </p>
                    )}
                  </div>
                </Link>
              );
            })}
          </div>
        )}
      </div>
    </main>
  );
}
