"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";

// =============================================================
// EKBALLO ENGLISH · Quem tem acesso
//
// O curso é por convite: aqui o master escolhe, nome a nome, quem
// enxerga o card no dashboard e entra na trilha. Sem isso, a única
// forma de liberar alguém seria mexer em código.
// =============================================================

type Discipulo = { id: string; nome: string; email: string; liberado: boolean };

export function AdminEnglishAcesso({ discipulos }: { discipulos: Discipulo[] }) {
  const router = useRouter();
  const [lista, setLista] = useState(discipulos);
  const [busca, setBusca] = useState("");
  const [salvando, setSalvando] = useState<string | null>(null);
  const [erro, setErro] = useState<string | null>(null);

  const filtrados = useMemo(() => {
    const termo = busca.trim().toLowerCase();
    if (!termo) return lista;
    return lista.filter(
      (d) => d.nome.toLowerCase().includes(termo) || d.email.toLowerCase().includes(termo),
    );
  }, [lista, busca]);

  const liberados = lista.filter((d) => d.liberado).length;

  async function alternar(d: Discipulo) {
    setSalvando(d.id);
    setErro(null);
    const alvo = !d.liberado;

    // Otimista: o clique responde na hora; se o servidor recusar, volta.
    setLista((atual) => atual.map((x) => (x.id === d.id ? { ...x, liberado: alvo } : x)));

    const res = await fetch("/api/admin/english-acesso", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ alunoId: d.id, liberado: alvo }),
    });

    if (!res.ok) {
      setLista((atual) => atual.map((x) => (x.id === d.id ? { ...x, liberado: !alvo } : x)));
      setErro(`Não foi possível salvar o acesso de ${d.nome}. Tente de novo.`);
    } else {
      router.refresh();
    }
    setSalvando(null);
  }

  return (
    <div className="rounded-3xl border border-mesa-200 bg-white p-6 shadow-sm shadow-mesa-700/5">
      <div className="flex flex-wrap items-start justify-between gap-4">
        <div>
          <h2 className="font-serif text-2xl font-semibold text-mesa-800">Quem tem acesso</h2>
          <p className="mt-1 max-w-2xl text-sm text-mesa-600">
            O English é por convite: o card no painel do discípulo e a trilha só
            aparecem para quem estiver liberado aqui. Você e os outros
            administradores têm acesso sempre.
          </p>
        </div>
        <span className="rounded-full bg-laranja-50 px-3 py-1 text-sm font-semibold text-laranja-700">
          {liberados} de {lista.length} liberados
        </span>
      </div>

      {lista.length === 0 ? (
        <p className="mt-6 rounded-2xl border border-dashed border-mesa-300 bg-bege-50 p-6 text-center text-mesa-600">
          Nenhum discípulo cadastrado ainda.
        </p>
      ) : (
        <>
          <input
            type="search"
            value={busca}
            onChange={(e) => setBusca(e.target.value)}
            placeholder="Buscar por nome ou e-mail"
            className="mt-5 w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-laranja-400 focus:bg-white focus:ring-2 focus:ring-laranja-100 sm:max-w-sm"
          />

          {erro && (
            <p className="mt-4 rounded-lg bg-amber-50 px-4 py-3 text-sm text-amber-800">{erro}</p>
          )}

          <ul className="mt-5 divide-y divide-mesa-100">
            {filtrados.map((d) => (
              <li key={d.id} className="flex flex-wrap items-center justify-between gap-3 py-3">
                <div className="min-w-0">
                  <p className="truncate font-medium text-mesa-900">{d.nome}</p>
                  <p className="truncate text-sm text-mesa-500">{d.email}</p>
                </div>
                <div className="flex items-center gap-3">
                  <span
                    className={`rounded-full px-3 py-1 text-xs font-semibold ${
                      d.liberado
                        ? "bg-oliveira-100 text-oliveira-700"
                        : "bg-mesa-100 text-mesa-500"
                    }`}
                  >
                    {d.liberado ? "Com acesso" : "Sem acesso"}
                  </span>
                  <button
                    type="button"
                    onClick={() => alternar(d)}
                    disabled={salvando === d.id}
                    className={`rounded-full px-4 py-2 text-sm font-semibold transition disabled:opacity-60 ${
                      d.liberado
                        ? "border border-mesa-200 text-mesa-700 hover:border-laranja-300 hover:text-laranja-700"
                        : "bg-laranja-500 text-white hover:bg-laranja-600"
                    }`}
                  >
                    {salvando === d.id ? "Salvando..." : d.liberado ? "Retirar" : "Liberar"}
                  </button>
                </div>
              </li>
            ))}
          </ul>

          {filtrados.length === 0 && (
            <p className="mt-5 text-sm text-mesa-500">Ninguém encontrado com esse termo.</p>
          )}
        </>
      )}
    </div>
  );
}
