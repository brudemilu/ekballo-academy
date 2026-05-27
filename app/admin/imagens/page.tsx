import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { getCurrentSession } from "@/lib/db";
import { GeradorImagemForm } from "@/components/GeradorImagemForm";

export default async function AdminImagensPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const backend = (process.env.IMAGE_BACKEND || "pollinations").toLowerCase();
  const backendLabel =
    backend === "gemini" ? "Google Imagen" : "Pollinations.ai (Flux Schnell · grátis)";

  return (
    <AdminShell current="imagens" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Ferramentas
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Gerador de imagens
      </h1>
      <p className="mb-3 max-w-2xl text-sm text-mesa-600 text-justify hyphens-auto">
        Template <strong>Cinematográfico Sacro</strong>: foto de fundo gerada por
        IA, tipografia editorial (Cormorant Garamond Italic), overlay com vinheta
        e divisor dourado. Saída em PNG pronto pra Instagram (feed/story) ou
        WhatsApp.
      </p>
      <p className="mb-8 text-xs text-mesa-500">
        Backend ativo: <strong className="text-mesa-700">{backendLabel}</strong>
      </p>

      <GeradorImagemForm iaAtiva={true} />
    </AdminShell>
  );
}
