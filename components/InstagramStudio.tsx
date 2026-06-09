"use client";

import { useState } from "react";
import { GeradorInstagram, type RoteiroInicial } from "@/components/GeradorInstagram";
import { SugestoesInstagram, type IdeiaEscolhida } from "@/components/SugestoesInstagram";
import { GeradorReel } from "@/components/GeradorReel";

/**
 * Estúdio do Instagram com sub-abas: Carrossel (gerador + sugestões IA) e Reel
 * (upload de vídeo → publicar/agendar). Nada publica sem ação explícita.
 */
export function InstagramStudio() {
  const [aba, setAba] = useState<"carrossel" | "reel">("carrossel");
  const [roteiro, setRoteiro] = useState<RoteiroInicial | undefined>(undefined);

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
