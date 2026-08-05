import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { AdminEnglishActions } from "@/components/AdminEnglishActions";
import { getCurrentSession } from "@/lib/db";

const modules = [
  { title: "Módulo 1", subtitle: "Primeiros passos", status: "Ativo" },
  { title: "Módulo 2", subtitle: "Meu mundo", status: "Em preparação" },
  { title: "Módulo 3", subtitle: "Vida cotidiana", status: "Em preparação" },
  { title: "Módulo 4", subtitle: "Sentimentos e ações", status: "Em preparação" },
  { title: "Módulo 5", subtitle: "Perguntas e respostas", status: "Em preparação" },
  { title: "Módulo 6", subtitle: "Conversas básicas", status: "Em preparação" },
  { title: "Módulo 7", subtitle: "Fé e vida diária", status: "Em preparação" },
  { title: "Módulo 8", subtitle: "Expressão pessoal", status: "Em preparação" },
  { title: "Módulo 9", subtitle: "Situações reais", status: "Em preparação" },
  { title: "Módulo 10", subtitle: "Falar com confiança", status: "Em preparação" },
  { title: "Módulo 11", subtitle: "Discussão e opinião", status: "Em preparação" },
  { title: "Módulo 12", subtitle: "Projeto final", status: "Em preparação" },
];

export default async function AdminEnglishPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  return (
    <AdminShell current="english" session={session}>
      <div className="space-y-8">
        <div>
          <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-600">Ekballo English</p>
          <h1 className="mt-2 font-serif text-4xl font-semibold text-mesa-900">Painel pastoral · gestão e acompanhamento</h1>
          <p className="mt-3 max-w-3xl text-lg leading-relaxed text-mesa-600">
            Centralize o curso premium, acompanhe o avanço dos módulos e organize lembretes de atividade para manter a rotina viva.
          </p>
        </div>

        <div className="grid gap-4 lg:grid-cols-3">
          <div className="rounded-2xl border border-laranja-200 bg-laranja-50 p-5">
            <p className="text-sm font-semibold text-laranja-700">Curso principal</p>
            <p className="mt-2 text-sm leading-relaxed text-mesa-700">Estrutura premium com 12 módulos, foco em fala, fé e progresso diário.</p>
          </div>
          <div className="rounded-2xl border border-oliveira-200 bg-oliveira-50 p-5">
            <p className="text-sm font-semibold text-oliveira-700">Acompanhamento</p>
            <p className="mt-2 text-sm leading-relaxed text-mesa-700">Acompanhe avanço, respostas e engajamento sem sair do painel pastoral.</p>
          </div>
          <div className="rounded-2xl border border-mesa-200 bg-white p-5">
            <p className="text-sm font-semibold text-mesa-700">Lembretes</p>
            <p className="mt-2 text-sm leading-relaxed text-mesa-700">Enviando lembretes por push para reforçar atividade e disciplina cotidiana.</p>
          </div>
        </div>

        <AdminEnglishActions />

        <div className="rounded-3xl border border-mesa-200 bg-white p-6 shadow-sm shadow-mesa-700/5">
          <div className="mb-6 flex items-center justify-between gap-4">
            <div>
              <h2 className="font-serif text-2xl font-semibold text-mesa-800">Módulos</h2>
              <p className="mt-1 text-sm text-mesa-600">Estrutura inicial do curso premium, pronta para expansão.</p>
            </div>
            <Link href="/english" className="rounded-full border border-mesa-200 px-4 py-2 text-sm font-medium text-mesa-700 transition hover:border-laranja-300 hover:text-laranja-700">
              Ver público
            </Link>
          </div>

          <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
            {modules.map((module) => (
              <div key={module.title} className="rounded-2xl border border-mesa-200 bg-bege-50 p-5">
                <div className="flex items-center justify-between gap-3">
                  <p className="text-sm font-semibold text-laranja-700">{module.title}</p>
                  <span className="rounded-full bg-white px-2.5 py-1 text-xs font-semibold text-mesa-600">{module.status}</span>
                </div>
                <h3 className="mt-3 font-serif text-lg font-semibold text-mesa-800">{module.subtitle}</h3>
              </div>
            ))}
          </div>
        </div>
      </div>
    </AdminShell>
  );
}
