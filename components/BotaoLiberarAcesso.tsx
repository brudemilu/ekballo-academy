"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import { Botao } from "@/components/Botao";

export function BotaoLiberarAcesso({
  alunoId,
  nome,
}: {
  alunoId: string;
  nome: string;
}) {
  const router = useRouter();
  const [ocupado, setOcupado] = useState(false);
  const [liberado, setLiberado] = useState(false);
  const [erro, setErro] = useState("");

  async function liberar() {
    setOcupado(true);
    setErro("");
    try {
      const res = await fetch("/api/admin/liberar-acesso", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ alunoId }),
      });
      const json = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(json.erro || "não foi possível liberar");
      setLiberado(true);
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "não foi possível liberar");
    } finally {
      setOcupado(false);
    }
  }

  if (liberado) {
    return (
      <span role="status" className="text-sm font-medium text-oliveira-700">
        ✓ Acesso liberado
      </span>
    );
  }

  return (
    <span className="inline-flex flex-col items-end gap-1">
      <Botao
        tamanho="pequeno"
        ocupado={ocupado}
        rotuloOcupado="Liberando…"
        onClick={liberar}
        aria-label={`Liberar acesso de ${nome}`}
      >
        Liberar acesso
      </Botao>
      {erro && (
        <span role="alert" className="text-xs text-red-700">
          {erro}
        </span>
      )}
    </span>
  );
}
