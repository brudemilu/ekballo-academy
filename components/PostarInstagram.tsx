"use client";

import { useState } from "react";

// Botão "Postar no Instagram" reutilizável (Bíblia, Devocional, etc.).
// Recebe a URL da imagem (rota OG, relativa ou absoluta) e uma legenda inicial.
// Publica via /api/admin/instagram/publicar (admin-only; posta na conta do
// ministério). O Meta busca a imagem pela URL pública — por isso só funciona
// no site publicado, não em localhost.
export function PostarInstagram({
  imageUrl,
  legendaInicial,
}: {
  imageUrl: string;
  legendaInicial: string;
}) {
  const [aberto, setAberto] = useState(false);
  const [legenda, setLegenda] = useState(legendaInicial);
  const [estado, setEstado] = useState<"idle" | "enviando" | "ok" | "erro">("idle");
  const [msg, setMsg] = useState("");

  async function publicar() {
    setEstado("enviando");
    setMsg("");
    const abs = imageUrl.startsWith("http")
      ? imageUrl
      : `${window.location.origin}${imageUrl}`;
    try {
      const res = await fetch("/api/admin/instagram/publicar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          slides: [
            { imageUrl: abs, texto: "", prompt: "", modo: "", cor: "", fonte: "", seed: 0 },
          ],
          legenda,
        }),
      });
      const j = await res.json().catch(() => ({}));
      if (!res.ok) {
        setEstado("erro");
        setMsg(j.error || "Não consegui publicar.");
        return;
      }
      setEstado("ok");
      setMsg("Publicado no Instagram! 🎉");
    } catch {
      setEstado("erro");
      setMsg("Erro de conexão.");
    }
  }

  return (
    <>
      <button
        onClick={() => {
          setAberto(true);
          setEstado("idle");
          setMsg("");
          setLegenda(legendaInicial);
        }}
        className="inline-flex items-center gap-2 rounded-full bg-gradient-to-r from-laranja-500 to-laranja-600 px-5 py-2.5 text-sm font-semibold text-white transition hover:opacity-90"
      >
        📸 Postar no Instagram
      </button>

      {aberto && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4"
          onClick={() => setAberto(false)}
        >
          <div
            onClick={(e) => e.stopPropagation()}
            className="w-full max-w-md overflow-hidden rounded-2xl bg-white shadow-xl"
          >
            <div className="border-b border-mesa-100 px-5 py-3">
              <p className="font-serif text-lg font-semibold text-mesa-800">
                Postar no Instagram
              </p>
              <p className="text-xs text-mesa-500">Vai pro feed da conta do ministério.</p>
            </div>

            <div className="max-h-[70vh] overflow-y-auto px-5 py-4">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={imageUrl}
                alt="Prévia do post"
                className="mx-auto mb-4 w-48 rounded-xl border border-mesa-200"
              />
              <label className="mb-1 block text-xs font-medium text-mesa-600">Legenda</label>
              <textarea
                value={legenda}
                onChange={(e) => setLegenda(e.target.value)}
                rows={5}
                className="w-full resize-none rounded-lg border border-mesa-200 px-3 py-2 text-sm text-mesa-800 outline-none focus:border-laranja-400"
              />
              {msg && (
                <p
                  className={`mt-3 text-sm font-medium ${
                    estado === "ok" ? "text-green-600" : "text-laranja-600"
                  }`}
                >
                  {msg}
                </p>
              )}
            </div>

            <div className="flex items-center justify-end gap-2 border-t border-mesa-100 px-5 py-3">
              <button
                onClick={() => setAberto(false)}
                className="rounded-full px-4 py-2 text-sm font-medium text-mesa-600 hover:bg-mesa-100"
              >
                {estado === "ok" ? "Fechar" : "Cancelar"}
              </button>
              {estado !== "ok" && (
                <button
                  onClick={publicar}
                  disabled={estado === "enviando" || !legenda.trim()}
                  className="rounded-full bg-laranja-500 px-5 py-2 text-sm font-semibold text-white transition hover:bg-laranja-600 disabled:opacity-60"
                >
                  {estado === "enviando" ? "Publicando…" : "Publicar"}
                </button>
              )}
            </div>
          </div>
        </div>
      )}
    </>
  );
}
