import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { GeradorImagemForm } from "@/components/GeradorImagemForm";
import { getCurrentSession } from "@/lib/db";

export default async function AdminImagensPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  // O editorial busca fotografia real no Pexels e só cai na IA se o Pexels não
  // devolver nada. O rótulo mostra quem é a reserva nesse caso.
  const temPexels = Boolean(process.env.PEXELS_API_KEY);
  const backend = (process.env.IMAGE_BACKEND || "cloudflare").toLowerCase();
  const reserva =
    backend === "gemini"
      ? "Google Imagen"
      : backend === "pollinations"
        ? "Pollinations.ai"
        : "Cloudflare Flux";
  const backendLabel = temPexels
    ? `Pexels (fotografia real) · reserva: ${reserva}`
    : `${reserva} — Pexels sem chave (defina PEXELS_API_KEY)`;

  return (
    <AdminShell current="imagens" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Ferramentas
      </p>
      <h1 className="mb-2 font-serif text-4xl font-semibold text-mesa-800">
        Gerador de imagens
      </h1>
      <p className="mb-3 max-w-2xl text-sm text-mesa-600 text-justify hyphens-auto">
        Template <strong>Editorial</strong>: fotografia real pedida já no tamanho final
        (sem esticar), moldura dourada com cantos ornamentados desenhada no Canva,
        tipografia Cormorant Garamond Italic e escurecimento repartido — a foto continua
        visível em vez de virar fundo preto. Saída em PNG pronto pra Instagram (feed 4:5
        ou story) e WhatsApp. O template <strong>Cinematográfico</strong> antigo segue
        disponível.
      </p>
      <p className="mb-8 text-xs text-mesa-500">
        Backend ativo: <strong className="text-mesa-700">{backendLabel}</strong>
      </p>

      <GeradorImagemForm iaAtiva={true} />
    </AdminShell>
  );
}
