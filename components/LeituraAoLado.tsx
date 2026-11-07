"use client";

import Link from "next/link";
import { useEffect, useMemo, useRef, useState } from "react";
import { Figura, Quadro } from "@/components/BlocosLivro";
import { TextoComVersiculos } from "@/components/TextoComVersiculos";
import {
  ehFigura,
  ehQuadro,
  lerParagrafos,
  nivelDoParagrafo,
  papeisDosParagrafos,
} from "@/lib/estrutura-livro";

// =============================================================
// Leitura ao lado (issue #283). O guia de estudo diz "Leia Stott (cap. 3,
// p. 33-40): …" e o texto abre numa janela à direita, sem tirar o discípulo
// do guia. Em tela larga o guia encolhe para a esquerda e os dois ficam
// visíveis (classe no <body>, ver globals.css); no celular a janela ocupa a
// tela e o × volta para o guia no mesmo ponto.
//
// Só leitura: grifo, áudio e anotação continuam na página da própria mesa —
// o link "Abrir como mesa" leva até lá.
// =============================================================

type Estado =
  | { tipo: "carregando" }
  | { tipo: "erro"; mensagem: string }
  | { tipo: "pronto"; titulo: string; conteudo: string };

export function LeituraAoLado({
  cursoSlug,
  aulaId,
  tituloInicial,
  onFechar,
}: {
  cursoSlug: string;
  aulaId: string;
  tituloInicial?: string;
  onFechar: () => void;
}) {
  const [estado, setEstado] = useState<Estado>({ tipo: "carregando" });
  const corpoRef = useRef<HTMLDivElement>(null);
  const painelRef = useRef<HTMLElement>(null);
  // O pai passa uma função nova a cada render; o efeito de abertura não pode
  // rodar de novo por isso (roubaria o foco a cada clique no guia).
  const fecharRef = useRef(onFechar);
  fecharRef.current = onFechar;

  useEffect(() => {
    let vivo = true;
    setEstado({ tipo: "carregando" });
    fetch(
      `/api/curso/${encodeURIComponent(cursoSlug)}/aulas/${encodeURIComponent(aulaId)}/texto`,
    )
      .then(async (r) => {
        const j = await r.json().catch(() => null);
        if (!vivo) return;
        if (r.ok && j?.ok) {
          setEstado({ tipo: "pronto", titulo: j.titulo, conteudo: j.conteudo });
          corpoRef.current?.scrollTo({ top: 0 });
        } else {
          setEstado({
            tipo: "erro",
            mensagem: j?.erro || "Não foi possível abrir a leitura.",
          });
        }
      })
      .catch(() => {
        if (vivo)
          setEstado({
            tipo: "erro",
            mensagem: "Sem conexão agora. Tente de novo em instantes.",
          });
      });
    return () => {
      vivo = false;
    };
  }, [cursoSlug, aulaId]);

  // Abre: guarda de onde veio o foco, abre espaço no guia, fecha com Esc.
  useEffect(() => {
    const origem = document.activeElement as HTMLElement | null;
    document.body.classList.add("com-leitura-ao-lado");
    painelRef.current?.focus({ preventScroll: true });
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") fecharRef.current();
    }
    window.addEventListener("keydown", onKey);
    return () => {
      window.removeEventListener("keydown", onKey);
      document.body.classList.remove("com-leitura-ao-lado");
      origem?.focus?.({ preventScroll: true });
    };
  }, []);

  const titulo =
    estado.tipo === "pronto" ? estado.titulo : (tituloInicial ?? "Leitura");

  return (
    <aside
      ref={painelRef}
      tabIndex={-1}
      aria-label={`Leitura ao lado: ${titulo}`}
      className="leitura-ao-lado fixed inset-y-0 right-0 z-[60] flex w-full flex-col border-l border-mesa-200 bg-white shadow-2xl outline-none lg:w-[min(42rem,48vw)]"
    >
      <header className="flex items-start gap-3 border-b border-mesa-200 bg-mesa-50/80 px-5 py-3 backdrop-blur">
        <div className="min-w-0 flex-1">
          <p className="text-[11px] font-medium uppercase tracking-[0.2em] text-mesa-500">
            Leitura ao lado
          </p>
          <h2 className="font-serif text-lg font-semibold leading-snug text-mesa-800">
            {titulo}
          </h2>
          <Link
            href={`/cursos/${cursoSlug}/aulas/${aulaId}`}
            className="mt-0.5 inline-block text-xs font-medium text-laranja-700 hover:text-laranja-800"
          >
            Abrir como mesa (grifos, áudio e anotações) →
          </Link>
        </div>
        <button
          type="button"
          onClick={onFechar}
          aria-label="Fechar a leitura e voltar ao guia"
          className="flex h-10 w-10 flex-none items-center justify-center rounded-full text-2xl text-mesa-500 hover:bg-mesa-100 hover:text-mesa-800"
        >
          ×
        </button>
      </header>

      <div ref={corpoRef} className="flex-1 overflow-y-auto px-5 py-6 sm:px-8">
        {estado.tipo === "carregando" && (
          <p className="text-sm text-mesa-500">Abrindo a leitura…</p>
        )}
        {estado.tipo === "erro" && (
          <p className="text-sm text-mesa-600">{estado.mensagem}</p>
        )}
        {estado.tipo === "pronto" && <TextoDaLeitura conteudo={estado.conteudo} />}
      </div>
    </aside>
  );
}

function TextoDaLeitura({ conteudo }: { conteudo: string }) {
  const paragrafos = useMemo(() => lerParagrafos(conteudo), [conteudo]);
  const papeis = useMemo(() => papeisDosParagrafos(paragrafos), [paragrafos]);

  return (
    <div lang="pt-BR" className="prose-mesa">
      {paragrafos.map((p, i) => {
        if (ehQuadro(p.texto)) return <Quadro key={i} bloco={p.texto} />;
        if (ehFigura(p.texto)) return <Figura key={i} bloco={p.texto} />;
        const papel = papeis[i];
        const nivel = papel
          ? null
          : nivelDoParagrafo(p.texto, paragrafos[i + 1]?.texto);
        const Tag = nivel === "titulo" ? "h3" : nivel === "subtitulo" ? "h4" : "p";
        const classe =
          nivel === "titulo"
            ? "titulo-secao"
            : nivel === "subtitulo"
              ? "subtitulo-secao"
              : papel === "cita"
                ? "cita-bloco"
                : papel === "cita-ref"
                  ? "cita-ref"
                  : "";
        return (
          <Tag key={i} className={`whitespace-pre-wrap ${classe}`}>
            {nivel ? p.texto : <TextoComVersiculos texto={p.texto} />}
          </Tag>
        );
      })}
    </div>
  );
}
