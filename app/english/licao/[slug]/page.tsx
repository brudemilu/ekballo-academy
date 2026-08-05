import { notFound, redirect } from "next/navigation";
import { EnglishLicaoPlayer } from "@/components/EnglishLicaoPlayer";
import { getCurrentSession } from "@/lib/db";
import { getLicaoBySlug, listExerciciosByLicao, listTrilha } from "@/lib/english";

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const achado = await getLicaoBySlug(slug);
  return { title: achado ? `${achado.licao.titulo} · Ekballo English` : "Ekballo English" };
}

export default async function EnglishLicaoPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;

  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const achado = await getLicaoBySlug(slug);
  if (!achado || !achado.licao.publicado) notFound();

  const { licao, modulo } = achado;

  const [exercicios, trilha] = await Promise.all([
    listExerciciosByLicao(licao.id),
    listTrilha(session.userId),
  ]);

  // Próxima lição na ordem da trilha (mesmo módulo primeiro, depois o seguinte).
  const emOrdem = trilha.filter((m) => m.publicado).flatMap((m) => m.licoes);
  const atual = emOrdem.findIndex((l) => l.id === licao.id);
  const proximaSlug = atual >= 0 ? emOrdem[atual + 1]?.slug ?? null : null;

  return (
    <EnglishLicaoPlayer
      modulo={modulo}
      licao={licao}
      exercicios={exercicios}
      proximaSlug={proximaSlug}
    />
  );
}
