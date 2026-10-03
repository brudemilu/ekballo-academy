"use client";

import { useRouter } from "next/navigation";
import { useEffect, useRef, useState } from "react";
import {
  type CorteSalvo,
  formatarTempo,
  linkNoTempo,
  type Momento,
  trechoFalado,
} from "@/lib/cortes";

/**
 * Aba Cortes do Instagram (issue #189): o pastor cola o link do YouTube de uma
 * pregação e a IA aponta os melhores momentos para virar vídeo curto — com
 * início, fim, gancho e legenda. Nesta fase o corte em si é feito no editor
 * que ele já usa; aqui ele descobre ONDE cortar.
 */

const CAMPO =
  "w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500";
const BOTAO_PRIMARIO =
  "rounded-full bg-laranja-600 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-700 disabled:opacity-60";
const BOTAO_SECUNDARIO =
  "rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-100 disabled:opacity-60";

async function chamar(url: string, metodo: string, corpo?: object) {
  const res = await fetch(url, {
    method: metodo,
    headers: corpo ? { "Content-Type": "application/json" } : undefined,
    body: corpo ? JSON.stringify(corpo) : undefined,
  });
  const d = await res.json().catch(() => ({}));
  if (!res.ok) throw new Error(d?.error || "Algo deu errado. Tente de novo.");
  return d;
}

export function CortesConteudo({
  cortesIniciais,
  configurado,
}: {
  cortesIniciais: CorteSalvo[];
  /** false = falta a chave do conversor do YouTube ou da transcrição no servidor. */
  configurado: boolean;
}) {
  const router = useRouter();
  const [url, setUrl] = useState("");
  const [cortes, setCortes] = useState(cortesIniciais);
  const [aberto, setAberto] = useState<CorteSalvo | null>(null);
  const [enviando, setEnviando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const resultado = useRef<HTMLDivElement>(null);

  // Enquanto a análise aberta estiver processando, consulta o andamento.
  const idEmAndamento = aberto?.status === "processando" ? aberto.id : null;
  useEffect(() => {
    if (!idEmAndamento) return;
    let vivo = true;
    const consultar = async () => {
      try {
        const d = await chamar(
          `/api/admin/instagram/cortes?id=${idEmAndamento}`,
          "GET",
        );
        if (!vivo) return;
        const corte = d.corte as CorteSalvo;
        setAberto(corte);
        setCortes((l) =>
          l.map((c) => (c.id === corte.id ? { ...corte, transcricao: [] } : c)),
        );
        if (corte.status !== "processando") router.refresh();
      } catch {
        // falha de rede passageira: a próxima consulta tenta de novo
      }
    };
    const t = setInterval(consultar, 4000);
    return () => {
      vivo = false;
      clearInterval(t);
    };
  }, [idEmAndamento, router]);

  async function analisar(e: React.FormEvent) {
    e.preventDefault();
    setEnviando(true);
    setErro(null);
    try {
      const d = await chamar("/api/admin/instagram/cortes", "POST", { url });
      const corte = d.corte as CorteSalvo;
      setCortes((l) => [corte, ...l]);
      setAberto(corte);
      setUrl("");
    } catch (err) {
      setErro(err instanceof Error ? err.message : "Falha ao começar a análise.");
    } finally {
      setEnviando(false);
    }
  }

  async function abrir(c: CorteSalvo) {
    setErro(null);
    try {
      const d = await chamar(`/api/admin/instagram/cortes?id=${c.id}`, "GET");
      setAberto(d.corte as CorteSalvo);
      setTimeout(
        () => resultado.current?.scrollIntoView({ behavior: "smooth", block: "start" }),
        60,
      );
    } catch (err) {
      setErro(err instanceof Error ? err.message : "Falha ao abrir a análise.");
    }
  }

  async function excluir(c: CorteSalvo) {
    if (!confirm(`Excluir a análise de "${c.titulo || "vídeo"}"?`)) return;
    setErro(null);
    try {
      await chamar(`/api/admin/instagram/cortes?id=${c.id}`, "DELETE");
      setCortes((l) => l.filter((x) => x.id !== c.id));
      if (aberto?.id === c.id) setAberto(null);
      router.refresh();
    } catch (err) {
      setErro(err instanceof Error ? err.message : "Falha ao excluir.");
    }
  }

  return (
    <div className="space-y-8">
      <section className="rounded-2xl border border-mesa-200 bg-white p-5">
        <h2 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
          Qual pregação?
        </h2>
        <p className="mb-4 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
          Cole o link do YouTube. A IA ouve a pregação inteira e devolve os trechos que
          funcionam sozinhos como vídeo curto, com o minuto exato de cada um. Leva um ou
          dois minutos para uma hora de vídeo.
        </p>
        {!configurado && (
          <div
            className="mb-4 rounded-xl border border-amber-300 bg-amber-50 p-3 text-sm text-amber-800"
            role="status"
          >
            Falta configurar no servidor o conversor do YouTube ou a transcrição. Avise
            o desenvolvedor.
          </div>
        )}
        <form onSubmit={analisar} className="flex flex-wrap items-end gap-2">
          <div className="min-w-0 flex-1">
            <label
              className="mb-1 block text-sm font-medium text-mesa-700"
              htmlFor="corte-url"
            >
              Link do vídeo
            </label>
            <input
              id="corte-url"
              required
              value={url}
              onChange={(e) => setUrl(e.target.value)}
              placeholder="https://www.youtube.com/watch?v=…"
              className={CAMPO}
            />
          </div>
          <button
            type="submit"
            disabled={enviando || !configurado}
            className={BOTAO_PRIMARIO}
          >
            {enviando ? "Começando…" : "✂️ Achar os melhores momentos"}
          </button>
        </form>
      </section>

      {erro && (
        <div
          className="rounded-xl border border-red-200 bg-red-50 p-3 text-sm text-red-700"
          role="alert"
        >
          {erro}
        </div>
      )}

      {aberto && (
        <section
          ref={resultado}
          className="scroll-mt-6 rounded-2xl border border-mesa-200 bg-white p-5"
        >
          <Analise corte={aberto} onErro={setErro} />
        </section>
      )}

      <section>
        <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
          Pregações analisadas
        </h2>
        {cortes.length === 0 ? (
          <p className="rounded-xl border border-mesa-200 bg-white/70 p-4 text-sm text-mesa-500">
            Nenhuma ainda. Cole o link de uma pregação acima.
          </p>
        ) : (
          <ul className="grid gap-3 sm:grid-cols-2">
            {cortes.map((c) => (
              <li key={c.id} className="rounded-xl border border-mesa-200 bg-white p-4">
                <p className="line-clamp-2 font-medium text-mesa-800">
                  {c.titulo || "Vídeo em análise"}
                </p>
                <p className="mt-1 text-xs text-mesa-500">
                  {c.status === "pronto"
                    ? `${c.momentos.length} momentos · ${formatarTempo(c.duracao_seg)} de vídeo`
                    : c.status === "erro"
                      ? "Não deu certo"
                      : "Analisando…"}
                </p>
                <div className="mt-3 flex gap-2">
                  <button
                    type="button"
                    onClick={() => abrir(c)}
                    className={BOTAO_SECUNDARIO}
                  >
                    Abrir
                  </button>
                  <button
                    type="button"
                    onClick={() => excluir(c)}
                    className="rounded-full px-3 py-2 text-sm text-red-600 hover:bg-red-50"
                  >
                    Excluir
                  </button>
                </div>
              </li>
            ))}
          </ul>
        )}
      </section>
    </div>
  );
}

function Analise({
  corte,
  onErro,
}: {
  corte: CorteSalvo;
  onErro: (e: string | null) => void;
}) {
  if (corte.status === "processando") {
    return (
      <div role="status">
        <h2 className="font-serif text-xl font-semibold text-mesa-800">
          {corte.titulo || "Analisando a pregação"}
        </h2>
        <p className="mt-2 flex items-center gap-2 text-sm text-mesa-600">
          <span
            className="inline-block h-3 w-3 animate-pulse rounded-full bg-laranja-500"
            aria-hidden="true"
          />
          {corte.etapa || "Trabalhando…"}
        </p>
        <p className="mt-2 text-xs text-mesa-500">
          Pode sair desta tela: a análise continua e fica guardada.
        </p>
      </div>
    );
  }
  if (corte.status === "erro") {
    return (
      <div role="alert">
        <h2 className="font-serif text-xl font-semibold text-mesa-800">
          {corte.titulo || "Não deu certo"}
        </h2>
        <p className="mt-2 text-sm text-red-700">{corte.erro || "A análise falhou."}</p>
        <p className="mt-1 text-xs text-mesa-500">
          Cole o link de novo para tentar outra vez.
        </p>
      </div>
    );
  }

  return (
    <>
      <h2 className="font-serif text-2xl font-semibold text-mesa-800">
        {corte.titulo}
      </h2>
      <p className="mt-1 text-sm text-mesa-600">
        {corte.momentos.length} momentos em {formatarTempo(corte.duracao_seg)} de vídeo,
        do mais forte ao menos. Abra cada um no YouTube para conferir antes de cortar.
      </p>
      <ol className="mt-4 space-y-3">
        {corte.momentos.map((m, i) => (
          <li key={`${m.inicio}-${m.fim}`}>
            <CartaoMomento corte={corte} momento={m} indice={i} onErro={onErro} />
          </li>
        ))}
      </ol>
    </>
  );
}

function CartaoMomento({
  corte,
  momento: m,
  indice,
  onErro,
}: {
  corte: CorteSalvo;
  momento: Momento;
  indice: number;
  onErro: (e: string | null) => void;
}) {
  const [dia, setDia] = useState("");
  const [enviando, setEnviando] = useState(false);
  const [aviso, setAviso] = useState<string | null>(null);
  const falado = trechoFalado(corte.transcricao, m.inicio, m.fim);

  async function copiar() {
    try {
      await navigator.clipboard.writeText(m.legenda);
      setAviso("Legenda copiada.");
    } catch {
      onErro("Não consegui copiar. Selecione o texto e copie à mão.");
    }
  }

  async function paraOCalendario() {
    setEnviando(true);
    onErro(null);
    try {
      await chamar("/api/admin/instagram/cortes", "POST", {
        calendario: { id: corte.id, indice, dia: dia || undefined },
      });
      setAviso(dia ? "Está no calendário." : "Guardado nas ideias sem data.");
    } catch (e) {
      onErro(e instanceof Error ? e.message : "Falha ao mandar para o calendário.");
    } finally {
      setEnviando(false);
    }
  }

  return (
    <article className="rounded-xl border border-mesa-200 bg-bege-50 p-4">
      <header className="flex flex-wrap items-baseline justify-between gap-2">
        <h3 className="font-serif text-lg font-semibold text-mesa-800">{m.titulo}</h3>
        <span className="text-sm text-mesa-600">
          <strong className="text-mesa-800">
            {formatarTempo(m.inicio)} – {formatarTempo(m.fim)}
          </strong>{" "}
          · {Math.round(m.fim - m.inicio)}s · nota {m.nota}
        </span>
      </header>

      {m.gancho && (
        <p className="mt-2 border-l-2 border-laranja-400 pl-3 text-base leading-relaxed text-mesa-800">
          “{m.gancho}”
        </p>
      )}
      {m.porque && (
        <p className="mt-2 text-sm leading-relaxed text-mesa-600">{m.porque}</p>
      )}

      {falado && (
        <details className="mt-3">
          <summary className="cursor-pointer text-sm font-medium text-mesa-700">
            Ler o que é dito no trecho
          </summary>
          <p className="mt-2 text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
            {falado}
          </p>
        </details>
      )}

      {m.legenda && (
        <div className="mt-3">
          <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-mesa-500">
            Legenda do post
          </p>
          <p className="whitespace-pre-line rounded-lg border border-mesa-200 bg-white p-3 text-sm leading-relaxed text-mesa-700">
            {m.legenda}
          </p>
        </div>
      )}

      <div className="mt-3 flex flex-wrap items-center gap-2">
        <a
          href={linkNoTempo(corte.video_id, m.inicio)}
          target="_blank"
          rel="noreferrer"
          className={BOTAO_SECUNDARIO}
        >
          ▶ Ver no YouTube
        </a>
        {m.legenda && (
          <button type="button" onClick={copiar} className={BOTAO_SECUNDARIO}>
            Copiar legenda
          </button>
        )}
        <label className="sr-only" htmlFor={`corte-dia-${indice}`}>
          Dia no calendário para {m.titulo}
        </label>
        <input
          id={`corte-dia-${indice}`}
          type="date"
          value={dia}
          onChange={(e) => setDia(e.target.value)}
          className="rounded-lg border border-mesa-200 bg-white px-2 py-1.5 text-sm text-mesa-700"
        />
        <button
          type="button"
          onClick={paraOCalendario}
          disabled={enviando}
          className={BOTAO_SECUNDARIO}
        >
          {enviando ? "Enviando…" : "Pôr no calendário"}
        </button>
        {aviso && (
          <span className="text-sm text-oliveira-700" role="status">
            ✓ {aviso}
          </span>
        )}
      </div>
    </article>
  );
}
