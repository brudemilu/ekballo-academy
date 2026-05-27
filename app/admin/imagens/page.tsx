import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession } from "@/lib/db";
import { GeradorImagemForm } from "@/components/GeradorImagemForm";

export default async function AdminImagensPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const iaAtiva = Boolean(process.env.GEMINI_API_KEY);

  return (
    <AdminShell current="imagens" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Ferramentas
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Gerador de imagens
      </h1>
      <p className="mb-8 max-w-2xl text-sm text-mesa-600 text-justify hyphens-auto">
        Template <strong>Cinematográfico Sacro</strong>: foto de fundo gerada por
        IA (Google Imagen), tipografia editorial (Cormorant Garamond Italic),
        overlay com vinheta e divisor dourado. Saída em PNG pronto pra Instagram
        (feed/story) ou WhatsApp.
      </p>

      {!iaAtiva && (
        <div className="mb-6 rounded-2xl border border-amber-300 bg-amber-50 p-4 text-sm text-amber-900">
          <p className="font-medium">⚠ Modo fallback (sem IA)</p>
          <p className="mt-1">
            <code className="rounded bg-amber-100 px-1.5 py-0.5 text-xs">
              GEMINI_API_KEY
            </code>{" "}
            não está configurada. O gerador funciona, mas o fundo vai sair como
            gradiente CSS (sem foto IA). Configure em{" "}
            <code className="rounded bg-amber-100 px-1.5 py-0.5 text-xs">.env.local</code>{" "}
            (local) e nas variáveis de ambiente da Vercel (produção). Chave grátis
            em{" "}
            <a
              href="https://aistudio.google.com/apikey"
              target="_blank"
              rel="noreferrer"
              className="underline"
            >
              aistudio.google.com/apikey
            </a>
            .
          </p>
        </div>
      )}

      <GeradorImagemForm iaAtiva={iaAtiva} />
    </AdminShell>
  );
}
