import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { DevocionalForm } from "@/components/DevocionalForm";
import { getCurrentSession } from "@/lib/db";
import { hojeDateStr } from "@/lib/devocionais";

export default async function NovoDevocionalPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  return (
    <AdminShell current="devocionais" session={session}>
      <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
        Devocional · Novo
      </p>
      <h1 className="mb-8 font-serif text-3xl font-semibold text-mesa-800">
        Novo devocional
      </h1>

      <DevocionalForm
        inicial={{
          id: null,
          data: hojeDateStr(),
          titulo: "",
          versiculo_ref: "",
          versiculo_texto: "",
          versiculo_versao: "NVT",
          reflexao: "",
          autor: session.profile?.nome || "Liderança Ekballo",
          publicado: true,
        }}
      />
    </AdminShell>
  );
}
