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
    <div className="flex items-center gap-4">
      {isAdmin && (
        <Link
          href="/admin"
          className="hidden rounded-full border border-oliveira-300 bg-oliveira-50 px-3 py-1.5 text-xs font-medium text-oliveira-700 hover:bg-oliveira-100 sm:inline-block"
        >
          Painel admin
        </Link>
      )}
      <div className="hidden text-right sm:block">
        <p className="text-sm font-medium text-mesa-800">{nome || "Aluno"}</p>
        <p className="text-xs text-mesa-500">{email}</p>
      </div>
      <button
        onClick={handleSair}
        className="rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
      >
        Sair
      </button>
    </div>
  );
}
