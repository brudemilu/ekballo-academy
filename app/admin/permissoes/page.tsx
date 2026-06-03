import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { PermissoesMatriz } from "@/components/PermissoesMatriz";
import { getCurrentSession, getMatrizPermissoes } from "@/lib/db";

export default async function PermissoesPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  // Só master. Registros antigos com is_admin e sem papel contam como master.
  const ehMaster =
    session.profile?.papel === "master" ||
    (!!session.profile?.is_admin && !session.profile?.papel);
  if (!ehMaster) redirect("/admin");

  const matriz = await getMatrizPermissoes();

  return (
    <AdminShell current="permissoes" session={session}>
      <div className="mb-8">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Acesso · Papéis e permissões
        </p>
        <h1 className="font-serif text-4xl font-semibold text-mesa-800">
          Permissões de acesso
        </h1>
        <p className="mt-3 text-sm text-mesa-600">
          Marque quais áreas do painel cada papel pode acessar. As mudanças valem
          na hora. Para definir o papel de uma pessoa, abra o cadastro dela em{" "}
          <strong>Discípulos</strong>.
        </p>
      </div>

      <PermissoesMatriz inicial={matriz} />
    </AdminShell>
  );
}
