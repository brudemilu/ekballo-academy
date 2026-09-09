"use client";

import { useEffect, useState } from "react";

// Aparece quando o discípulo termina TODAS as mesas de um livro.
// A arte não é um troféu de conclusão: é a INDICAÇÃO do livro — capa em
// destaque, título, autor e a frase que ele escreve pra recomendar. Quem leu
// assina embaixo, pequeno.
//
// Sai pelo compartilhamento nativo do celular (cada um posta no SEU Story,
// sem API do Instagram e sem conta conectada). No desktop, onde o Web Share
// não aceita arquivo, vira download — que é como se posta pelo computador.
export function StoryIndicacaoLivro({
  slug,
  titulo,
  autor,
  nome,
}: {
  slug: string;
  titulo: string;
  autor?: string | null;
  nome?: string | null;
}) {
  // Começa vazio de propósito: a indicação é dele, não um texto pronto da
  // plataforma. Sem frase, a arte fica só com a capa — e continua bonita.
  const [frase, setFrase] = useState("");
  // A prévia só acompanha a digitação depois de uma pausa — cada mudança é
  // uma imagem 1080x1920 gerada no servidor.
  const [fraseDebounced, setFraseDebounced] = useState(frase);
  const [compartilhando, setCompartilhando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  useEffect(() => {
    const t = setTimeout(() => setFraseDebounced(frase), 600);
    return () => clearTimeout(t);
  }, [frase]);

  function montarUrl(texto: string) {
    const params = new URLSearchParams({ slug, titulo, f: "story" });
    if (autor) params.set("autor", autor);
    if (nome) params.set("nome", nome);
    if (texto.trim()) params.set("frase", texto.trim());
    return `/api/og/indicacao-livro?${params.toString()}`;
  }

  const previaUrl = montarUrl(fraseDebounced);
  const arquivo = `${slug}-indicacao-story.png`;

  function baixar() {
    const a = document.createElement("a");
    a.href = `${montarUrl(frase)}&dl=1`;
    a.download = arquivo;
    document.body.appendChild(a);
    a.click();
    a.remove();
  }

  async function compartilhar() {
    setErro(null);
    setCompartilhando(true);
    try {
      const r = await fetch(`${montarUrl(frase)}&dl=1`);
      if (!r.ok) throw new Error("falha ao gerar a imagem");
      const blob = await r.blob();
      const file = new File([blob], arquivo, { type: "image/png" });
      const nav = navigator as Navigator & {
        canShare?: (d: { files: File[] }) => boolean;
        share?: (d: { files: File[]; title?: string }) => Promise<void>;
      };
      if (nav.canShare && nav.share && nav.canShare({ files: [file] })) {
        await nav.share({ files: [file], title: titulo });
      } else {
        baixar();
      }
    } catch (e) {
      if (e instanceof DOMException && e.name === "AbortError") return; // cancelou
      setErro("Não consegui compartilhar. Tente baixar a imagem.");
    } finally {
      setCompartilhando(false);
    }
  }

  return (
    <div className="mt-6 rounded-2xl border border-mesa-200 bg-mesa-50/70 p-5">
      <p className="font-serif text-lg font-semibold text-mesa-800">
        Indique este livro
      </p>
      <p className="mt-1 text-sm leading-relaxed text-mesa-600 text-justify hyphens-auto">
        Você terminou a leitura. Montamos um card com a capa no tamanho do Stories —
        escreva abaixo por que vale a pena ler e compartilhe.
      </p>

      <div className="mt-5 flex flex-col gap-5 sm:flex-row">
        {/* Prévia: exatamente a imagem que vai pro Story. */}
        {/* biome-ignore lint/performance/noImgElement: a prévia é um PNG gerado sob demanda; next/image não otimiza rota OG */}
        <img
          src={previaUrl}
          alt={`Prévia do card de indicação de ${titulo}`}
          width={135}
          height={240}
          className="hidden w-[135px] flex-none self-start rounded-lg border border-mesa-200 shadow-sm sm:block"
        />

        <div className="flex-1">
          <label
            htmlFor="indicacao-livro"
            className="text-xs font-semibold uppercase tracking-[0.14em] text-mesa-500"
          >
            Sua indicação
          </label>
          <textarea
            id="indicacao-livro"
            value={frase}
            onChange={(e) => setFrase(e.target.value.slice(0, 220))}
            rows={3}
            maxLength={220}
            placeholder="Ex.: Mudou o jeito como eu enxergo a graça. Leia devagar."
            className="mt-2 w-full rounded-xl border border-mesa-200 bg-white p-3 text-sm text-mesa-800 outline-none transition focus:border-laranja-400"
          />
          <p className="mt-1 text-xs text-mesa-400">{frase.length}/220</p>

          <div className="mt-3 flex flex-wrap gap-2">
            <button
              type="button"
              onClick={compartilhar}
              disabled={compartilhando}
              className="rounded-full bg-gradient-to-r from-pink-600 to-purple-600 px-5 py-2.5 text-sm font-semibold text-white transition hover:opacity-90 disabled:opacity-50"
            >
              {compartilhando ? "Gerando…" : "📲 Compartilhar no Stories"}
            </button>
            <button
              type="button"
              onClick={baixar}
              className="rounded-full border border-mesa-300 bg-white px-5 py-2.5 text-sm font-medium text-mesa-700 transition hover:bg-mesa-100"
            >
              Baixar imagem
            </button>
          </div>
          {erro && <p className="mt-3 text-sm text-laranja-700">{erro}</p>}
        </div>
      </div>
    </div>
  );
}
