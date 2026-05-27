import { existsSync } from "node:fs";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession } from "@/lib/db";
import { YouTubeBaixarForm } from "@/components/YouTubeBaixarForm";

function ytDlpDisponivel(): boolean {
  if (process.env.YT_DLP_PATH) return existsSync(process.env.YT_DLP_PATH);
  return [
    "/opt/homebrew/bin/yt-dlp",
    "/usr/local/bin/yt-dlp",
    "/usr/bin/yt-dlp",
  ].some((p) => existsSync(p));
}

export default async function AdminYouTubePage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const disponivel = ytDlpDisponivel();
  const emVercel = Boolean(process.env.VERCEL);

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

      {!disponivel ? (
        <div className="mb-6 rounded-2xl border border-mesa-300 bg-mesa-50 p-5 text-sm text-mesa-800">
          <p className="mb-2 font-serif text-lg font-semibold">
            Esta ferramenta roda só no seu computador
          </p>
          <p className="text-justify hyphens-auto">
            O binário <code className="rounded bg-mesa-200 px-1.5 py-0.5 text-xs">yt-dlp</code>{" "}
            não está disponível neste ambiente
            {emVercel ? " (Vercel)" : ""}. Pra usar o gerador:
          </p>
          <ol className="mt-3 list-inside list-decimal space-y-1 text-sm">
            <li>
              No terminal do seu Mac:{" "}
              <code className="rounded bg-mesa-200 px-1.5 py-0.5 text-xs">brew install yt-dlp</code>
            </li>
            <li>
              Na pasta do projeto:{" "}
              <code className="rounded bg-mesa-200 px-1.5 py-0.5 text-xs">npm run dev</code>
            </li>
            <li>
              Acessa{" "}
              <code className="rounded bg-mesa-200 px-1.5 py-0.5 text-xs">
                http://localhost:3000/admin/youtube
              </code>{" "}
              e usa daí.
            </li>
          </ol>
          <p className="mt-3 text-xs text-mesa-600">
            Decisão arquitetural: YouTube bloqueia IPs da Vercel agressivamente,
            então rodar no seu Mac é mais confiável que tentar em produção.
          </p>
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
