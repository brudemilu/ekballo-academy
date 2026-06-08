"use client";

import { useState } from "react";
import { GeradorInstagram, type RoteiroInicial } from "@/components/GeradorInstagram";
import { SugestoesInstagram, type IdeiaEscolhida } from "@/components/SugestoesInstagram";

/**
 * Junta o "cérebro" (SugestoesInstagram) com o editor (GeradorInstagram).
 * Quando o Bruno clica "Usar essa ideia", o roteiro da sugestão é injetado no
 * editor (sem rechamar a IA) e a tela rola até ele. Nada é publicado aqui —
 * publicar/agendar continua sendo ação explícita dentro do editor.
 */
export function InstagramStudio() {
  const [roteiro, setRoteiro] = useState<RoteiroInicial | undefined>(undefined);

  function usarIdeia(ideia: IdeiaEscolhida) {
    setRoteiro({
      nonce: Date.now(),
      conteudo: ideia.conteudo,
      legenda: ideia.legenda,
      slides: ideia.slides,
    });
    // rola pro editor depois do render
    setTimeout(() => {
      document.getElementById("ig-editor")?.scrollIntoView({ behavior: "smooth", block: "start" });
    }, 80);
  }

  return (
    <>
      <SugestoesInstagram onUsarIdeia={usarIdeia} />
      <div id="ig-editor">
        <GeradorInstagram roteiroInicial={roteiro} />
      </div>
    </>
  );
}
