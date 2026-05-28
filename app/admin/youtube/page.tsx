import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession } from "@/lib/db";
import { YouTubeBaixarForm } from "@/components/YouTubeBaixarForm";

export default async function AdminYouTubePage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  // Em produção (Vercel) o YouTube bloqueia os IPs de datacenter, então a
  // ferramenta roda só em desenvolvimento local (rede residencial).
  const emProducao = Boolean(process.env.VERCEL);

  return (
    <AdminShell current="youtube" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Ferramentas
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Baixar áudio do YouTube
      </h1>
      <p className="mb-6 max-w-2xl text-sm text-mesa-600 text-justify hyphens-auto">
        Cole o link de um vídeo do YouTube e baixe como MP3 (128 kbps). O arquivo
        vem direto pro seu computador — nada fica armazenado no servidor.
      </p>

      {emProducao ? (
        <div className="rounded-2xl border border-mesa-300 bg-mesa-50 p-5 text-sm text-mesa-800">
          <p className="mb-2 font-serif text-lg font-semibold">
            Esta ferramenta roda no seu computador
          </p>
          <p className="text-justify hyphens-auto">
            O YouTube bloqueia downloads vindos de servidores (como a Vercel),
            então o gerador funciona a partir da sua máquina:
          </p>
          <ol className="mt-3 list-inside list-decimal space-y-1">
            <li>
              No Mac, uma vez:{" "}
              <code className="rounded bg-mesa-200 px-1.5 py-0.5 text-xs">
                brew install yt-dlp
              </code>
            </li>
            <li>
              Na pasta do projeto:{" "}
              <code className="rounded bg-mesa-200 px-1.5 py-0.5 text-xs">
                npm run dev
              </code>
            </li>
            <li>
              Abre{" "}
              <code className="rounded bg-mesa-200 px-1.5 py-0.5 text-xs">
                localhost:3000/admin/youtube
              </code>{" "}
              e usa daí.
            </li>
          </ol>
        </div>
      ) : (
        <>
          <div className="mb-6 rounded-2xl border border-amber-300 bg-amber-50 p-4 text-sm text-amber-900">
            <p className="font-medium">⚠ Uso responsável</p>
            <p className="mt-1 text-justify hyphens-auto">
              O download viola os Termos de Serviço do YouTube e pode infringir
              direitos autorais. Use apenas conteúdo próprio, em domínio público,
              com licença Creative Commons, ou com permissão explícita do autor.
              Você é responsável pelo uso que fizer do arquivo baixado.
            </p>
          </div>
          <YouTubeBaixarForm />
        </>
      )}
    </AdminShell>
  );
}
