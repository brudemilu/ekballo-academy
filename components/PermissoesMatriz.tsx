"use client";

import { useState } from "react";
import { PERMISSOES, PAPEIS, PAPEIS_CONFIGURAVEIS, type Permissao, type Papel } from "@/lib/permissoes";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

export function PermissoesMatriz({
  inicial,
}: {
  inicial: Record<string, Permissao[]>;
}) {
  const [matriz, setMatriz] = useState<Record<string, Set<Permissao>>>(() => {
    const m: Record<string, Set<Permissao>> = {};
    for (const papel of PAPEIS_CONFIGURAVEIS) {
      m[papel] = new Set(inicial[papel] || []);
    }
    return m;
  });
  const [status, setStatus] = useState<Record<string, "salvo" | "salvando" | "erro" | null>>({});

  async function toggle(papel: Papel, permissao: Permissao) {
    const atual = new Set(matriz[papel]);
    if (atual.has(permissao)) atual.delete(permissao);
    else atual.add(permissao);
    setMatriz((m) => ({ ...m, [papel]: atual }));
    setStatus((s) => ({ ...s, [papel]: "salvando" }));

    if (MOCK) {
      await new Promise((r) => setTimeout(r, 300));
      setStatus((s) => ({ ...s, [papel]: "salvo" }));
      return;
    }

    const res = await fetch("/api/admin/permissoes", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ papel, permissoes: [...atual] }),
    });
    setStatus((s) => ({ ...s, [papel]: res.ok ? "salvo" : "erro" }));
  }

  return (
    <div className="space-y-6">
      {/* Master — informativo */}
      <div className="rounded-2xl border border-oliveira-200 bg-oliveira-50 p-5">
        <div className="flex items-center gap-2">
          <span className="rounded-full bg-oliveira-600 px-2.5 py-0.5 text-xs font-semibold text-white">
            Master
          </span>
          <p className="text-sm text-oliveira-800">
            Acesso total a tudo, incluindo esta tela de papéis e permissões.
          </p>
        </div>
      </div>

      {PAPEIS_CONFIGURAVEIS.map((papel) => {
        const info = PAPEIS.find((p) => p.chave === papel)!;
        const st = status[papel];
        return (
          <div key={papel} className="rounded-2xl border border-mesa-200 bg-white p-5">
            <div className="mb-4 flex items-center justify-between">
              <div>
                <h3 className="font-serif text-xl font-semibold text-mesa-800">{info.nome}</h3>
                <p className="text-sm text-mesa-500">{info.descricao}</p>
              </div>
              <span className="text-xs text-mesa-400">
                {st === "salvando" && "Salvando…"}
                {st === "salvo" && "✓ Salvo"}
                {st === "erro" && <span className="text-red-600">Erro ao salvar</span>}
              </span>
            </div>

            <div className="grid gap-2 sm:grid-cols-2">
              {PERMISSOES.map((perm) => {
                const ativo = matriz[papel].has(perm.chave);
                return (
                  <label
                    key={perm.chave}
                    className={`flex cursor-pointer items-start gap-3 rounded-xl border p-3 transition ${
                      ativo
                        ? "border-mesa-400 bg-mesa-50"
                        : "border-mesa-200 bg-white hover:bg-mesa-50/50"
                    }`}
                  >
                    <input
                      type="checkbox"
                      checked={ativo}
                      onChange={() => toggle(papel, perm.chave)}
                      className="mt-0.5 h-4 w-4 accent-mesa-700"
                    />
                    <span className="min-w-0">
                      <span className="block text-sm font-medium text-mesa-800">{perm.nome}</span>
                      <span className="block text-xs text-mesa-500">{perm.descricao}</span>
                    </span>
                  </label>
                );
              })}
            </div>
          </div>
        );
      })}

      <p className="text-xs text-mesa-500">
        O <strong>Painel</strong> (visão geral) fica sempre disponível para qualquer papel com
        acesso administrativo. O papel <strong>Discípulo</strong> não acessa o painel.
      </p>
    </div>
  );
}
