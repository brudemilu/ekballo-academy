import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { DashboardEngajamento } from "@/components/DashboardEngajamento";
import { getCurrentSession, getDashboardData } from "@/lib/db";

export const dynamic = "force-dynamic";

export default async function DashboardPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const data = await getDashboardData();

  return (
    <AdminShell current="dashboard" session={session}>
      <div className="mb-6">
        <h1 className="font-serif text-2xl font-semibold text-mesa-800">Dashboard de engajamento</h1>
        <p className="text-sm text-mesa-500">
          Acompanhe a vida das temáticas e dos discípulos — filtre por temática, turma e período.
        </p>
      </div>
      <DashboardEngajamento data={data} />
    </AdminShell>
  );
}
