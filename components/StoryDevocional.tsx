"use client";

import { useState } from "react";

// Botões de Story pro devocional:
//  - "Stories" (todos): compartilhamento nativo do celular → cada um posta no
//    SEU Story (não precisa de API nem conta conectada).
//  - "Postar (ministério)" (só admin): posta via API no perfil do ministério.
export function StoryDevocional({ dia, tema, isAdmin }: { dia: number; tema: string; isAdmin: boolean }) {
  const [compartilhando, setCompartilhando] = useState(false);
  const [postando, setPostando] = useState(false);
  const rel = `/api/og/devocional?dia=${dia}&f=story&tema=${encodeURIComponent(tema)}`;

  async function compartilhar() {
    setCompartilhando(true);
    try {
      const r = await fetch(`${rel}&dl=1`);
      const blob = await r.blob();
      const file = new File([blob], `devocional-${dia}-story.png`, { type: "image/png" });
      const nav = navigator as Navigator & {
        canShare?: (d: { files: File[] }) => boolean;
        share?: (d: { files: File[]; title?: string }) => Promise<void>;
      };
      if (nav.canShare && nav.share && nav.canShare({ files: [file] })) {
        await nav.share({ files: [file], title: "Devocional Ekballo" });
      } else {
        // sem Web Share (desktop): baixa a imagem
        const a = document.createElement("a");
        a.href = `${rel}&dl=1`;
        a.download = `devocional-${dia}-story.png`;
        document.body.appendChild(a);
        a.click();
        a.remove();
      }
    } catch (e) {
      if (!(e instanceof DOMException && e.name === "AbortError")) {
        alert("Não consegui compartilhar. Tente o botão de baixar.");
      }
    } finally {
      setCompartilhando(false);
    }
  }

  async function postarMinisterio() {
    if (!window.confirm("Postar este devocional no Story do @brunofesantos (perfil do ministério)?")) return;
    setPostando(true);
    try {
      const res = await fetch("/api/admin/instagram/story", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ dia, tema }),
      });
      const d = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(d?.error || "Falha");
      alert("Story publicado no perfil do ministério ✓");
    } catch (e) {
      alert("Não consegui postar: " + (e instanceof Error ? e.message : "erro"));
    } finally {
      setPostando(false);
    }
  }

  return (
    <>
      <button
        onClick={compartilhar}
        disabled={compartilhando}
        className="rounded-full bg-gradient-to-r from-pink-600 to-purple-600 px-4 py-2 text-xs font-semibold text-white transition hover:opacity-90 disabled:opacity-50"
        title="Compartilhar no SEU Story (pelo celular)"
      >
        {compartilhando ? "…" : "📲 Stories"}
      </button>
      {isAdmin && (
        <button
          onClick={postarMinisterio}
          disabled={postando}
          className="rounded-full border border-pink-300 bg-white px-3 py-2 text-xs font-medium text-pink-700 transition hover:bg-pink-50 disabled:opacity-50"
          title="Postar no Story do perfil do ministério (via API)"
        >
          {postando ? "Postando…" : "Postar no ministério"}
        </button>
      )}
    </>
  );
}
