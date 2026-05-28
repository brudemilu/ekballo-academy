import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession } from "@/lib/db";
import { YouTubeBaixarForm } from "@/components/YouTubeBaixarForm";
import { apiConfigurada } from "@/lib/youtube";

export default async function AdminYouTubePage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const temApi = apiConfigurada();

  return (
    <AdminShell current="youtube" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Ferramentas
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Baixar áudio do YouTube
      </h1>
      <p className="mb-6 max-w-2xl text-sm text-mesa-600 text-justify hyphens-auto">
        Cole o link de um vídeo do YouTube e converta em MP3. Funciona direto
        aqui no site — o download é feito por um serviço externo.
      </p>

      {!temApi && (
        <div className="mb-6 rounded-2xl border border-amber-300 bg-amber-50 p-4 text-sm text-amber-900">
          <p className="font-medium">⚙ Falta configurar a chave</p>
          <p className="mt-1 text-justify hyphens-auto">
            O servidor ainda não tem a variável{" "}
            <code className="rounded bg-amber-100 px-1.5 py-0.5 text-xs">
              YOUTUBE_MP3_API_KEY
            </code>
            . Sem ela o botão de converter vai dar erro. Configure no{" "}
            <code className="rounded bg-amber-100 px-1.5 py-0.5 text-xs">.env.local</code>{" "}
            (local) e nas variáveis da Vercel (produção).
          </p>
        </div>
      )}

      <div className="mb-6 rounded-2xl border border-mesa-200 bg-mesa-50 p-4 text-sm text-mesa-700">
        <p className="font-medium">⚠ Uso responsável</p>
        <p className="mt-1 text-justify hyphens-auto">
          O download pode infringir direitos autorais e os Termos do YouTube.
          Use apenas conteúdo próprio, em domínio público, com licença Creative
          Commons, ou com permissão do autor. Você é responsável pelo uso.
        </p>
      </div>

      <YouTubeBaixarForm />
    </AdminShell>
  );
}
