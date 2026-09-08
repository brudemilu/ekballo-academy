"use client";

import { useEffect, useState } from "react";
import { Botao } from "@/components/Botao";
import { useRouter } from "next/navigation";

type Status = "nenhum" | "pendente" | "gerando" | "pronto" | "erro";

export default function AudioLivroControle({
  cursoId,
  slug,
  isMaster,
  statusInicial,
  progressoInicial,
  totalInicial,
}: {
  cursoId: string;
  slug: string;
  isMaster: boolean;
  statusInicial: Status;
  progressoInicial: number;
  totalInicial: number;
}) {
  const router = useRouter();
  const [status, setStatus] = useState<Status>(statusInicial);
  const [progresso, setProgresso] = useState(progressoInicial);
  const [total, setTotal] = useState(totalInicial);
  const [erro, setErro] = useState<string | null>(null);
  const [enviando, setEnviando] = useState(false);

  // Polling enquanto está gerando/pendente.
  useEffect(() => {
    if (status !== "pendente" && status !== "gerando") return;
    let vivo = true;
    const tick = async () => {
      try {
        const r = await fetch(`/api/curso/${slug}/audio-status`, { cache: "no-store" });
        const d = await r.json();
        if (!vivo) return;
        setProgresso(d.progresso ?? 0);
        setTotal(d.total ?? 0);
        if (d.status !== status) {
          setStatus(d.status);
          if (d.status === "pronto") router.refresh(); // recarrega pra mostrar os players
        }
      } catch {
        /* ignora erro de rede pontual */
      }
    };
    const id = setInterval(tick, 5000);
    return () => {
      vivo = false;
      clearInterval(id);
    };
  }, [status, slug, router]);

  async function acionar(acao: "gerar" | "cancelar") {
    setEnviando(true);
    setErro(null);
    try {
      const r = await fetch("/api/admin/gerar-audio", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ cursoId, acao }),
      });
      const d = await r.json();
      if (!r.ok) throw new Error(d.erro || "falhou");
      if (acao === "cancelar") {
        setStatus("nenhum");
      } else {
        setStatus("pendente");
        setProgresso(d.progresso ?? 0);
        setTotal(d.total ?? 0);
      }
    } catch (e) {
      setErro(e instanceof Error ? e.message : "erro");
    } finally {
      setEnviando(false);
    }
  }

  // ---- Estados visíveis a TODOS ----
  if (status === "pronto") {
    return (
      <div className="flex flex-wrap items-center gap-3">
        <span className="inline-flex items-center gap-1.5 rounded-full bg-oliveira-100 px-3 py-1 text-sm font-medium text-oliveira-800">
          🎧 Áudio disponível — ouça em cada capítulo
        </span>
        {isMaster && (
          <button
            onClick={() => acionar("gerar")}
            disabled={enviando}
            className="text-xs text-mesa-500 underline hover:text-laranja-600 disabled:opacity-50"
          >
            regerar
          </button>
        )}
      </div>
    );
  }

  if (status === "pendente" || status === "gerando") {
    const pct = total > 0 ? Math.round((progresso / total) * 100) : 0;
    const naFila = status === "pendente" && progresso === 0;
    return (
      <div className="w-full max-w-md">
        <div className="mb-1.5 flex items-center gap-2 text-sm font-medium text-laranja-700">
          <span className="inline-block h-3 w-3 animate-pulse-soft rounded-full bg-laranja-500" />
          {naFila ? "🎧 Na fila para gerar áudio…" : `🎧 Gerando áudio… ${progresso}/${total} capítulos`}
        </div>
        <div className="h-2 overflow-hidden rounded-full bg-bege-200">
          {/* transition-[width], não transition-all: animar "tudo" faz o
              navegador vigiar propriedades que nunca mudam. */}
          <div
            className="h-full rounded-full bg-laranja-500 transition-[width] ease-saida"
            style={{ width: `${pct}%`, transitionDuration: "var(--dur-lento)" }}
          />
        </div>
        <p className="mt-1.5 text-xs text-mesa-500">
          Pode fechar a página — a geração continua no servidor.
          {isMaster && (
            <button onClick={() => acionar("cancelar")} disabled={enviando} className="ml-2 underline hover:text-laranja-600">
              cancelar
            </button>
          )}
        </p>
      </div>
    );
  }

  // ---- Estados só do MASTER (nenhum / erro) ----
  if (!isMaster) return null;

  return (
    <div className="flex flex-wrap items-center gap-3">
      {/* Gerar áudio de um livro leva minutos. Antes o botão só
          escurecia ao ser clicado, o que não distingue "recebi seu
          clique" de "a página travou". Agora mostra o girador até a
          fila responder — e a barra de progresso assume em seguida. */}
      <Botao
        onClick={() => acionar("gerar")}
        ocupado={enviando}
        rotuloOcupado="Enviando para a fila…"
        className="font-semibold"
      >
        🎧 {status === "erro" ? "Tentar gerar de novo" : "Gerar áudio do livro"}
      </Botao>
      {status === "erro" && <span className="text-xs text-red-600">A geração falhou — tente novamente.</span>}
      {erro && <span className="text-xs text-red-600">{erro}</span>}
    </div>
  );
}
