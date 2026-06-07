import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession, listCarrosseisInstagram } from "@/lib/db";
import { InstagramStudio } from "@/components/InstagramStudio";
import { ListaCarrosseisInstagram } from "@/components/ListaCarrosseisInstagram";

export const metadata = { title: "Instagram — Ekballo" };
export const dynamic = "force-dynamic";

export default async function AdminInstagramPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const carrosseis = await listCarrosseisInstagram().catch(() => []);

  const configurado = Boolean(
    process.env.CLOUDFLARE_ACCOUNT_ID && process.env.CLOUDFLARE_API_TOKEN,
  );

  return (
    <AdminShell current="instagram" session={session}>
      <div className="mb-8">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Conteúdo → carrossel
        </p>
        <h1 className="font-serif text-4xl font-semibold text-mesa-800">
          Carrossel de Instagram
        </h1>
        <p className="mt-3 max-w-2xl text-mesa-600">
          Cole qualquer conteúdo (trecho de mensagem, frase de livro, reflexão,
          versículo). A IA monta os slides, sugere a imagem que conversa com o
          texto, a palavra-chave e a legenda. Você edita tudo e aprova.
        </p>
      </div>

      {!configurado && (
        <div className="mb-6 rounded-xl border border-amber-300 bg-amber-50 p-4 text-sm text-amber-800">
          ⚠️ A geração por IA ainda não está configurada (faltam credenciais
          Cloudflare). Avise o desenvolvedor.
        </div>
      )}

      <InstagramStudio />

      <div className="mt-12">
        <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
          Agendados e rascunhos
        </h2>
        <ListaCarrosseisInstagram itens={carrosseis} />
      </div>
    </AdminShell>
  );
}
