import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { DevocionalForm } from "@/components/DevocionalForm";
import { getCurrentSession } from "@/lib/db";
import { getDevocionalById, formatDataPt } from "@/lib/devocionais";

export default async function EditarDevocionalPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const d = await getDevocionalById(id);
  if (!d) notFound();

  return (
    <AdminShell current="devocionais" session={session}>
      <Link
        href="/admin/devocionais"
        className="mb-6 inline-block text-sm text-mesa-600 hover:text-mesa-800"
      >
        ← Devocionais
      </Link>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Devocional · {formatDataPt(d.data, true)}
      </p>
      <h1 className="mb-8 font-serif text-3xl font-semibold text-mesa-800">
        Editar
      </h1>

      <DevocionalForm
        inicial={{
          id: d.id,
          data: d.data,
          titulo: d.titulo || "",
          versiculo_ref: d.versiculo_ref,
          versiculo_texto: d.versiculo_texto,
          versiculo_versao: d.versiculo_versao || "ACF",
          reflexao: d.reflexao,
          autor: d.autor || "",
          publicado: d.publicado,
        }}
      />
    </AdminShell>
  );
}
