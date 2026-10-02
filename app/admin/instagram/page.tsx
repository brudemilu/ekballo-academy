import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { CalendarioConteudo } from "@/components/CalendarioConteudo";
import { InstagramStudio } from "@/components/InstagramStudio";
import { ListaCarrosseisInstagram } from "@/components/ListaCarrosseisInstagram";
import { diaSP } from "@/lib/conteudo-calendario";
import {
  getCurrentSession,
  getIdeiaConteudo,
  listCarrosseisInstagram,
  listIdeiasConteudo,
} from "@/lib/db";

export const metadata = { title: "Instagram — Ekballo" };
export const dynamic = "force-dynamic";

/**
 * Central do Instagram do ministério (issue #189). Tudo o que é Instagram vive
 * aqui, em abas — planejar (Calendário) e produzir (Criar). As próximas
 * frentes do copiloto (roteiros, painel, referências) entram como abas novas.
 */
const ABAS = [
  { v: "calendario", label: "🗓️ Calendário" },
  { v: "criar", label: "✨ Criar e postar" },
] as const;
type Aba = (typeof ABAS)[number]["v"];

export default async function AdminInstagramPage({
  searchParams,
}: {
  searchParams: Promise<{ aba?: string; ideia?: string }>;
}) {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const { aba: abaParam, ideia: ideiaId } = await searchParams;
  // Abrir uma ideia no estúdio implica a aba Criar.
  const aba: Aba = ideiaId
    ? "criar"
    : ABAS.some((a) => a.v === abaParam)
      ? (abaParam as Aba)
      : "calendario";

  const [carrosseis, ideias, ideia] = await Promise.all([
    listCarrosseisInstagram().catch(() => []),
    aba === "calendario" ? listIdeiasConteudo().catch(() => []) : Promise.resolve([]),
    ideiaId ? getIdeiaConteudo(ideiaId).catch(() => null) : Promise.resolve(null),
  ]);

  const configurado = Boolean(
    process.env.CLOUDFLARE_ACCOUNT_ID && process.env.CLOUDFLARE_API_TOKEN,
  );

  return (
    <AdminShell current="instagram" session={session}>
      <div className="mb-6">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Conteúdo → Instagram
        </p>
        <h1 className="font-serif text-4xl font-semibold text-mesa-800">
          Instagram do ministério
        </h1>
        <p className="mt-3 max-w-2xl text-justify leading-relaxed text-mesa-600 hyphens-auto">
          {aba === "calendario"
            ? "A semana num lugar só. Guarde a ideia quando ela vier, arraste para o dia em que pretende postar e leve ao estúdio para virar post. Os posts agendados e publicados aparecem aqui sozinhos."
            : "Cole qualquer conteúdo (trecho de mensagem, frase de livro, reflexão, versículo). A IA monta os slides, sugere a imagem que conversa com o texto, a palavra-chave e a legenda. Você edita tudo e aprova."}
        </p>
      </div>

      <nav
        className="mb-8 flex flex-wrap gap-2 border-b border-mesa-200 pb-3"
        aria-label="Seções do Instagram"
      >
        {ABAS.map((a) => (
          <Link
            key={a.v}
            href={`/admin/instagram?aba=${a.v}`}
            aria-current={aba === a.v ? "page" : undefined}
            className={`rounded-full border px-5 py-2 text-sm font-semibold transition ${
              aba === a.v
                ? "border-mesa-700 bg-mesa-700 text-mesa-50"
                : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
            }`}
          >
            {a.label}
          </Link>
        ))}
      </nav>

      {aba === "calendario" ? (
        <CalendarioConteudo
          ideiasIniciais={ideias}
          posts={carrosseis.map((c) => ({
            id: c.id,
            status: c.status,
            tipo: c.tipo,
            legenda: c.legenda,
            agendado_para: c.agendado_para ?? null,
            publicado_em: c.publicado_em ?? null,
          }))}
          hoje={diaSP(new Date())}
        />
      ) : (
        <>
          {!configurado && (
            <div className="mb-6 rounded-xl border border-amber-300 bg-amber-50 p-4 text-sm text-amber-800">
              ⚠️ A geração por IA ainda não está configurada (faltam credenciais
              Cloudflare). Avise o desenvolvedor.
            </div>
          )}

          <InstagramStudio ideia={ideia} />

          <div id="posts" className="mt-12 scroll-mt-6">
            <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
              Agendados e rascunhos
            </h2>
            <ListaCarrosseisInstagram itens={carrosseis} />
          </div>
        </>
      )}
    </AdminShell>
  );
}
