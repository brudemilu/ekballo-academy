import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";

export default async function AdminCursosPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data: profile } = await supabase
    .from("profiles")
    .select("nome, email, is_admin")
    .eq("id", user.id)
    .single();
  if (!profile?.is_admin) redirect("/dashboard");

  const { data: cursos } = await supabase
    .from("cursos")
    .select("id, slug, titulo, descricao, is_pago, publicado, ordem")
    .order("ordem", { ascending: true });

  // Conta matrículas e progresso
  const { data: matriculas } = await supabase
    .from("matriculas")
    .select("curso_id, concluido_em");

  const matMap = new Map<string, { total: number; concluidas: number }>();
  (matriculas || []).forEach((m: any) => {
    const cur = matMap.get(m.curso_id) || { total: 0, concluidas: 0 };
    cur.total += 1;
    if (m.concluido_em) cur.concluidas += 1;
    matMap.set(m.curso_id, cur);
  });

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/admin">
            <Logo />
          </Link>
          <UserMenu nome={profile.nome} email={profile.email || ""} isAdmin />
        </nav>
      </header>

      <div className="mx-auto max-w-6xl px-6 py-12">
        <Link href="/admin" className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800">
          ← Painel
        </Link>
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Conteúdo
        </p>
        <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
          Cursos
        </h1>
        <p className="mb-8 text-sm text-mesa-600">
          Para criar ou editar cursos, aulas e atividades, use o painel do
          Supabase (Table Editor) — instruções no README.
        </p>

        {!cursos || cursos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-20 text-center">
            <p className="font-serif text-xl text-mesa-500">
              Nenhum curso publicado ainda.
            </p>
            <p className="mt-2 text-sm text-mesa-500">
              Crie no Supabase → Table Editor → tabela &quot;cursos&quot;.
            </p>
          </div>
        ) : (
          <ul className="space-y-3">
            {cursos.map((c) => {
              const stats = matMap.get(c.id) || { total: 0, concluidas: 0 };
              return (
                <li
                  key={c.id}
                  className="flex flex-wrap items-center justify-between gap-4 rounded-xl border border-mesa-200 bg-white p-5"
                >
                  <div className="min-w-0 flex-1">
                    <div className="mb-1 flex items-center gap-2">
                      <h3 className="font-serif text-lg font-semibold text-mesa-800">
                        {c.titulo}
                      </h3>
                      {!c.publicado && (
                        <span className="rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">
                          Rascunho
                        </span>
                      )}
                      {c.is_pago ? (
                        <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-xs font-medium text-mesa-700">
                          Pago
                        </span>
                      ) : (
                        <span className="rounded-full bg-oliveira-100 px-2 py-0.5 text-xs font-medium text-oliveira-700">
                          Gratuito
                        </span>
                      )}
                    </div>
                    <p className="text-sm text-mesa-600 line-clamp-2">
                      {c.descricao}
                    </p>
                  </div>
                  <div className="flex items-center gap-6 text-sm">
                    <div className="text-right">
                      <p className="font-serif text-2xl font-semibold text-mesa-700">
                        {stats.total}
                      </p>
                      <p className="text-xs text-mesa-500">matriculados</p>
                    </div>
                    <div className="text-right">
                      <p className="font-serif text-2xl font-semibold text-oliveira-700">
                        {stats.concluidas}
                      </p>
                      <p className="text-xs text-mesa-500">concluíram</p>
                    </div>
                    <Link
                      href={`/cursos/${c.slug}`}
                      className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
                    >
                      Ver curso
                    </Link>
                  </div>
                </li>
              );
            })}
          </ul>
        )}
      </div>
    </main>
  );
}
