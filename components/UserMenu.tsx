"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export function UserMenu({
  nome,
  email,
  isAdmin,
}: {
  nome: string | null;
  email: string;
  isAdmin: boolean;
}) {
  const router = useRouter();

  async function handleSair() {
    const supabase = createClient();
    await supabase.auth.signOut();
    router.push("/");
    router.refresh();
  }

  return (
    <div className="flex items-center gap-3">
      {isAdmin && (
        <Link
          href="/admin"
          className="hidden rounded-full border border-oliveira-300 bg-oliveira-50 px-3 py-1.5 text-xs font-medium text-oliveira-700 hover:bg-oliveira-100 sm:inline-block"
        >
          Painel admin
        </Link>
      )}
      <Link
        href="/perfil"
        className="hidden text-right sm:block hover:opacity-80"
        title="Editar meu perfil"
      >
        <p className="text-sm font-medium text-mesa-800">{nome || "Discípulo"}</p>
        <p className="text-xs text-mesa-500">{email}</p>
      </Link>
      <Link
        href="/perfil"
        className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-100 sm:hidden"
      >
        Perfil
      </Link>
      <button
        onClick={handleSair}
        className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
      >
        Sair
      </button>
    </div>
  );
}
