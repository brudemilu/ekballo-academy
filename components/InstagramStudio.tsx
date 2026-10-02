"use client";

import { useEffect, useState } from "react";
import { GeradorInstagram, type RoteiroInicial } from "@/components/GeradorInstagram";
import { SugestoesInstagram, type IdeiaEscolhida } from "@/components/SugestoesInstagram";
import { GeradorReel } from "@/components/GeradorReel";

/**
 * Estúdio do Instagram com sub-abas: Carrossel (gerador + sugestões IA) e Reel
 * (upload de vídeo → publicar/agendar). Nada publica sem ação explícita.
 */
/** Ideia do calendário aberta na aba Criar via ?ideia=<id>. */
export type IdeiaNoEstudio = { id: string; titulo: string; nota: string; formato: string };

export function InstagramStudio({ ideia }: { ideia?: IdeiaNoEstudio | null } = {}) {
  const [aba, setAba] = useState<"carrossel" | "reel">(ideia?.formato === "reel" ? "reel" : "carrossel");
  const [roteiro, setRoteiro] = useState<RoteiroInicial | undefined>(undefined);

  // A ideia chega só com título e nota: preenche o texto-base e deixa a IA
  // montar os slides quando a pessoa pedir. O id segue junto para o post
  // salvo ficar ligado à ideia (ela sai do calendário e o post entra).
  useEffect(() => {
    if (!ideia || ideia.formato === "reel") return;
    setRoteiro({
      nonce: Date.now(),
      conteudo: [ideia.titulo, ideia.nota].filter(Boolean).join("\n\n"),
      legenda: "",
      slides: [],
      ideiaId: ideia.id,
    });
    // Só o id: o objeto `ideia` é recriado a cada router.refresh() (que o
    // gerador chama ao salvar) e reaplicar aqui apagaria os slides montados.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [ideia?.id]);

  function usarIdeia(ideia: IdeiaEscolhida) {
    setRoteiro({
      nonce: Date.now(),
      conteudo: ideia.conteudo,
      legenda: ideia.legenda,
      slides: ideia.slides,
    });
    setTimeout(() => {
      document.getElementById("ig-editor")?.scrollIntoView({ behavior: "smooth", block: "start" });
    }, 80);
  }

  return (
    <>
      {ideia && (
        <div className="mb-6 rounded-xl border border-laranja-200 bg-laranja-50 p-4 text-sm text-mesa-700">
          <p className="font-semibold text-laranja-700">💡 Trabalhando na ideia: {ideia.titulo}</p>
          {ideia.nota && <p className="mt-1 whitespace-pre-line text-mesa-600">{ideia.nota}</p>}
          {ideia.formato === "reel" && (
            <p className="mt-2 text-xs text-mesa-500">
              Reel ainda não fica ligado à ideia automaticamente: depois de salvar, exclua a ideia no calendário.
            </p>
          )}
        </div>
      )}
      <div className="mb-6 flex gap-2">
        {([
          { v: "carrossel", label: "📚 Carrossel" },
          { v: "reel", label: "🎬 Reel" },
        ] as { v: "carrossel" | "reel"; label: string }[]).map((opt) => (
          <button
            key={opt.v}
            onClick={() => setAba(opt.v)}
            className={`rounded-full border px-5 py-2 text-sm font-semibold transition ${
              aba === opt.v
                ? "border-laranja-600 bg-laranja-50 text-laranja-700"
                : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
            }`}
          >
            {opt.label}
          </button>
        ))}
      </div>

      {aba === "carrossel" ? (
        <>
          <SugestoesInstagram onUsarIdeia={usarIdeia} />
          <div id="ig-editor">
            <GeradorInstagram roteiroInicial={roteiro} />
          </div>
        </>
      ) : (
        <GeradorReel />
      )}
    </>
  );
}
