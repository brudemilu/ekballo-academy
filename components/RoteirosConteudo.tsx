"use client";

import { useRouter } from "next/navigation";
import { useEffect, useRef, useState } from "react";
import {
  type CursoOpcao,
  fonteInicial,
  fontePronta,
  pedidoDaFonte,
  SeletorFonteConteudo,
} from "@/components/SeletorFonteConteudo";
import {
  type BlocoRoteiro,
  DURACOES,
  type Duracao,
  type OrigemRoteiro,
  PALAVRAS_POR_DURACAO,
  palavrasFaladas,
  type Roteiro,
  type RoteiroSalvo,
  roteiroEmTexto,
  situacaoDoTamanho,
  usarGancho,
} from "@/lib/roteiro";

/**
 * Aba Roteiros do Instagram (issue #189): de uma mesa, um devocional ou um
 * texto colado sai um roteiro de Reel para o pastor gravar — o que falar, o
 * que aparece na tela e o que mostrar. A IA só usa o que está na fonte; os
 * trechos que sustentam o roteiro ficam à vista para conferência.
 */

type ReferenciaOpcao = { id: string; nome: string };

type EmEdicao = {
  /** id quando já está guardado. */
  id?: string;
  roteiro: Roteiro;
  duracao: Duracao;
  fonte: OrigemRoteiro;
  cortado?: boolean;
};

const CAMPO =
  "w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500";
const ROTULO = "mb-1 block text-sm font-medium text-mesa-700";
const BOTAO_PRIMARIO =
  "rounded-full bg-laranja-600 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-700 disabled:opacity-60";
const BOTAO_SECUNDARIO =
  "rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-100 disabled:opacity-60";

const NOME_MOMENTO: Record<BlocoRoteiro["momento"], string> = {
  gancho: "Gancho",
  corpo: "Corpo",
  chamada: "Chamada final",
};

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

export function RoteirosConteudo({
  cursos,
  referencias,
  roteirosIniciais,
  hoje,
  abrirId,
}: {
  cursos: CursoOpcao[];
  /** Só as referências já analisadas (as outras não têm forma para emprestar). */
  referencias: ReferenciaOpcao[];
  roteirosIniciais: RoteiroSalvo[];
  /** "YYYY-MM-DD" de hoje em SP, do servidor. */
  hoje: string;
  /** Roteiro guardado a abrir ao entrar (vindo do calendário: ?roteiro=<id>). */
  abrirId?: string;
}) {
  const router = useRouter();
  const [fonteEscolhida, setFonteEscolhida] = useState(() => fonteInicial(hoje));
  const [duracao, setDuracao] = useState<Duracao>(30);
  const [referenciaId, setReferenciaId] = useState("");
  const [foco, setFoco] = useState("");

  const [gerando, setGerando] = useState(false);
  const [salvando, setSalvando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [aviso, setAviso] = useState<string | null>(null);
  const [edicao, setEdicao] = useState<EmEdicao | null>(() => {
    const r = abrirId ? roteirosIniciais.find((x) => x.id === abrirId) : undefined;
    return r
      ? { id: r.id, roteiro: r.roteiro, duracao: r.duracao, fonte: r.fonte }
      : null;
  });
  const [salvos, setSalvos] = useState(roteirosIniciais);
  const [teleprompter, setTeleprompter] = useState(false);
  const resultado = useRef<HTMLDivElement>(null);

  const podeGerar = fontePronta(fonteEscolhida);

  async function gerar() {
    setGerando(true);
    setErro(null);
    setAviso(null);
    try {
      const d = await chamar("/api/admin/instagram/roteiros", "POST", {
        gerar: {
          fonte: pedidoDaFonte(fonteEscolhida),
          duracao,
          referenciaId: referenciaId || undefined,
          foco,
        },
      });
      setEdicao({
        roteiro: d.roteiro as Roteiro,
        duracao,
        fonte: d.fonte as OrigemRoteiro,
        cortado: Boolean(d.cortado),
      });
      setTimeout(
        () => resultado.current?.scrollIntoView({ behavior: "smooth", block: "start" }),
        60,
      );
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao gerar o roteiro.");
    } finally {
      setGerando(false);
    }
  }

  function mudarRoteiro(patch: Partial<Roteiro>) {
    setEdicao((e) => (e ? { ...e, roteiro: { ...e.roteiro, ...patch } } : e));
    setAviso(null);
  }

  function mudarBloco(i: number, patch: Partial<BlocoRoteiro>) {
    if (!edicao) return;
    mudarRoteiro({
      blocos: edicao.roteiro.blocos.map((b, idx) =>
        idx === i ? { ...b, ...patch } : b,
      ),
    });
  }

  async function salvar() {
    if (!edicao) return;
    setSalvando(true);
    setErro(null);
    try {
      if (edicao.id) {
        await chamar("/api/admin/instagram/roteiros", "PATCH", {
          id: edicao.id,
          roteiro: edicao.roteiro,
        });
        setSalvos((l) =>
          l.map((r) =>
            r.id === edicao.id
              ? { ...r, roteiro: edicao.roteiro, titulo: edicao.roteiro.titulo }
              : r,
          ),
        );
      } else {
        const d = await chamar("/api/admin/instagram/roteiros", "POST", {
          salvar: {
            roteiro: edicao.roteiro,
            duracao: edicao.duracao,
            fonte: edicao.fonte,
          },
        });
        const salvo = d.salvo as RoteiroSalvo;
        setSalvos((l) => [salvo, ...l]);
        setEdicao((e) => (e ? { ...e, id: salvo.id } : e));
      }
      setAviso("Roteiro guardado.");
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao salvar.");
    } finally {
      setSalvando(false);
    }
  }

  async function copiar() {
    if (!edicao) return;
    try {
      await navigator.clipboard.writeText(
        roteiroEmTexto(edicao.roteiro, edicao.duracao),
      );
      setAviso("Roteiro copiado.");
    } catch {
      setErro("Não consegui copiar. Selecione o texto e copie à mão.");
    }
  }

  async function excluir(r: RoteiroSalvo) {
    if (!confirm(`Excluir o roteiro "${r.titulo}"?`)) return;
    setErro(null);
    try {
      await chamar(`/api/admin/instagram/roteiros?id=${r.id}`, "DELETE");
      setSalvos((l) => l.filter((x) => x.id !== r.id));
      if (edicao?.id === r.id) setEdicao(null);
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao excluir.");
    }
  }

  function abrir(r: RoteiroSalvo) {
    setEdicao({ id: r.id, roteiro: r.roteiro, duracao: r.duracao, fonte: r.fonte });
    setAviso(null);
    setTimeout(
      () => resultado.current?.scrollIntoView({ behavior: "smooth", block: "start" }),
      60,
    );
  }

  return (
    <div className="space-y-8">
      {/* De onde sai o roteiro */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-5">
        <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
          De onde sai o roteiro?
        </h2>

        <SeletorFonteConteudo
          cursos={cursos}
          valor={fonteEscolhida}
          onMudar={setFonteEscolhida}
          onErro={setErro}
        />

        <div className="mt-5 grid gap-4 md:grid-cols-3">
          <fieldset>
            <legend className={ROTULO}>Duração</legend>
            <div className="flex flex-wrap gap-2">
              {DURACOES.map((d) => (
                <button
                  type="button"
                  key={d}
                  onClick={() => setDuracao(d)}
                  aria-pressed={duracao === d}
                  className={`rounded-full border px-3 py-1.5 text-sm font-medium transition ${
                    duracao === d
                      ? "border-mesa-700 bg-mesa-700 text-mesa-50"
                      : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
                  }`}
                >
                  {d}s
                </button>
              ))}
            </div>
            <p className="mt-1 text-xs text-mesa-500">
              {PALAVRAS_POR_DURACAO[duracao].min} a {PALAVRAS_POR_DURACAO[duracao].max}{" "}
              palavras faladas
            </p>
          </fieldset>
          <div>
            <label className={ROTULO} htmlFor="rot-referencia">
              No formato de
            </label>
            <select
              id="rot-referencia"
              value={referenciaId}
              onChange={(e) => setReferenciaId(e.target.value)}
              className={CAMPO}
            >
              <option value="">Só o meu jeito</option>
              {referencias.map((r) => (
                <option key={r.id} value={r.id}>
                  {r.nome}
                </option>
              ))}
            </select>
            {referencias.length === 0 && (
              <p className="mt-1 text-xs text-mesa-500">
                Cadastre e analise um criador na aba Perfil.
              </p>
            )}
          </div>
          <div>
            <label className={ROTULO} htmlFor="rot-foco">
              Quero falar de…{" "}
              <span className="font-normal text-mesa-400">(opcional)</span>
            </label>
            <input
              id="rot-foco"
              maxLength={400}
              value={foco}
              onChange={(e) => setFoco(e.target.value)}
              placeholder="Ex.: a parte sobre descanso"
              className={CAMPO}
            />
          </div>
        </div>

        <div className="mt-5">
          <button
            type="button"
            onClick={gerar}
            disabled={gerando || !podeGerar}
            className={BOTAO_PRIMARIO}
          >
            {gerando ? "Escrevendo o roteiro…" : "✨ Gerar roteiro"}
          </button>
        </div>
      </section>

      {erro && (
        <div
          className="rounded-xl border border-red-200 bg-red-50 p-3 text-sm text-red-700"
          role="alert"
        >
          {erro}
        </div>
      )}

      {/* O roteiro */}
      {edicao && (
        <section
          ref={resultado}
          className="scroll-mt-6 rounded-2xl border border-mesa-200 bg-white p-5"
        >
          <Editor
            edicao={edicao}
            onRoteiro={mudarRoteiro}
            onBloco={mudarBloco}
            onGancho={(g) =>
              setEdicao((e) => (e ? { ...e, roteiro: usarGancho(e.roteiro, g) } : e))
            }
          />
          <div className="mt-5 flex flex-wrap items-center gap-2">
            <button
              type="button"
              onClick={salvar}
              disabled={salvando}
              className={BOTAO_PRIMARIO}
            >
              {salvando
                ? "Salvando…"
                : edicao.id
                  ? "Salvar alterações"
                  : "Guardar roteiro"}
            </button>
            <button
              type="button"
              onClick={() => setTeleprompter(true)}
              className={BOTAO_SECUNDARIO}
            >
              🎥 Teleprompter
            </button>
            <button type="button" onClick={copiar} className={BOTAO_SECUNDARIO}>
              Copiar
            </button>
            {aviso && (
              <span className="text-sm text-oliveira-700" role="status">
                ✓ {aviso}
              </span>
            )}
          </div>
        </section>
      )}

      {/* Guardados */}
      <section>
        <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
          Roteiros guardados
        </h2>
        {salvos.length === 0 ? (
          <p className="rounded-xl border border-mesa-200 bg-white/70 p-4 text-sm text-mesa-500">
            Nenhum ainda. Gere um roteiro acima e guarde o que valer a pena gravar.
          </p>
        ) : (
          <ul className="grid gap-3 sm:grid-cols-2">
            {salvos.map((r) => (
              <li key={r.id} className="rounded-xl border border-mesa-200 bg-white p-4">
                <p className="font-medium text-mesa-800">{r.titulo}</p>
                <p className="mt-1 text-xs text-mesa-500">
                  {r.duracao}s · {r.fonte?.titulo || "Texto colado"}
                </p>
                <div className="mt-3 flex gap-2">
                  <button
                    type="button"
                    onClick={() => abrir(r)}
                    className={BOTAO_SECUNDARIO}
                  >
                    Abrir
                  </button>
                  <button
                    type="button"
                    onClick={() => excluir(r)}
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

      {teleprompter && edicao && (
        <Teleprompter
          roteiro={edicao.roteiro}
          onFechar={() => setTeleprompter(false)}
        />
      )}
    </div>
  );
}

function Editor({
  edicao,
  onRoteiro,
  onBloco,
  onGancho,
}: {
  edicao: EmEdicao;
  onRoteiro: (patch: Partial<Roteiro>) => void;
  onBloco: (i: number, patch: Partial<BlocoRoteiro>) => void;
  onGancho: (gancho: string) => void;
}) {
  const { roteiro, duracao, fonte } = edicao;
  const palavras = palavrasFaladas(roteiro);
  const situacao = situacaoDoTamanho(palavras, duracao);
  const abertura = roteiro.blocos.find((b) => b.momento === "gancho")?.falar;
  const { min, max } = PALAVRAS_POR_DURACAO[duracao];

  const SITUACAO = {
    ok: {
      txt: `cabe em ${duracao}s`,
      cls: "border-oliveira-200 bg-oliveira-50 text-oliveira-700",
    },
    curto: {
      txt: `curto para ${duracao}s (ideal: ${min} a ${max})`,
      cls: "border-amber-200 bg-amber-50 text-amber-800",
    },
    longo: {
      txt: `passa de ${duracao}s (ideal: ${min} a ${max})`,
      cls: "border-red-200 bg-red-50 text-red-700",
    },
  }[situacao];

  return (
    <>
      <div className="mb-4 flex flex-wrap items-start justify-between gap-3">
        <div className="min-w-0 flex-1">
          <label className="sr-only" htmlFor="rot-titulo">
            Título do roteiro
          </label>
          <input
            id="rot-titulo"
            value={roteiro.titulo}
            maxLength={120}
            onChange={(e) => onRoteiro({ titulo: e.target.value })}
            className="w-full border-0 border-b border-transparent bg-transparent p-0 font-serif text-2xl font-semibold text-mesa-800 outline-none focus:border-mesa-300"
          />
          <p className="mt-1 text-xs text-mesa-500">
            De: {fonte.titulo}
            {fonte.autor ? ` (${fonte.autor})` : ""}
          </p>
        </div>
        <span
          className={`rounded-full border px-3 py-1 text-xs font-semibold ${SITUACAO.cls}`}
        >
          {palavras} palavras · {SITUACAO.txt}
        </span>
      </div>

      {edicao.cortado && (
        <p className="mb-4 rounded-lg border border-amber-200 bg-amber-50 p-3 text-sm text-amber-800">
          O texto era longo e só o começo foi lido. Para falar de outra parte, use o
          campo “Quero falar de…” ou cole o trecho em “Um texto meu”.
        </p>
      )}

      {roteiro.ganchos.length > 1 && (
        <fieldset className="mb-5">
          <legend className={ROTULO}>Escolha a abertura</legend>
          <div className="space-y-2">
            {roteiro.ganchos.map((g) => (
              <label
                key={g}
                className={`flex cursor-pointer items-start gap-2 rounded-lg border p-3 text-sm transition ${
                  g === abertura
                    ? "border-laranja-400 bg-laranja-50 text-mesa-800"
                    : "border-mesa-200 text-mesa-700 hover:bg-mesa-50"
                }`}
              >
                <input
                  type="radio"
                  name="gancho"
                  checked={g === abertura}
                  onChange={() => onGancho(g)}
                  className="mt-0.5 accent-laranja-600"
                />
                <span>{g}</span>
              </label>
            ))}
          </div>
        </fieldset>
      )}

      <div className="space-y-3">
        {roteiro.blocos.map((b, i) => (
          // A lista é editada no lugar: a posição é a identidade do bloco.
          <div key={i} className="rounded-xl border border-mesa-200 bg-bege-50 p-3">
            <p className="mb-2 text-xs font-semibold uppercase tracking-wider text-mesa-500">
              {NOME_MOMENTO[b.momento]}
              {b.tempo ? ` · ${b.tempo}` : ""}
            </p>
            <label className="sr-only" htmlFor={`rot-falar-${i}`}>
              O que falar ({NOME_MOMENTO[b.momento]})
            </label>
            <textarea
              id={`rot-falar-${i}`}
              rows={Math.min(8, Math.max(2, Math.ceil(b.falar.length / 80)))}
              value={b.falar}
              onChange={(e) => onBloco(i, { falar: e.target.value })}
              className={`${CAMPO} text-base leading-relaxed`}
            />
            <div className="mt-2 grid gap-2 md:grid-cols-2">
              <div>
                <label
                  className="mb-1 block text-xs font-medium text-mesa-500"
                  htmlFor={`rot-tela-${i}`}
                >
                  Na tela
                </label>
                <input
                  id={`rot-tela-${i}`}
                  value={b.tela}
                  maxLength={80}
                  onChange={(e) => onBloco(i, { tela: e.target.value })}
                  className={`${CAMPO} text-sm`}
                />
              </div>
              <div>
                <label
                  className="mb-1 block text-xs font-medium text-mesa-500"
                  htmlFor={`rot-mostrar-${i}`}
                >
                  Mostrar
                </label>
                <input
                  id={`rot-mostrar-${i}`}
                  value={b.mostrar}
                  maxLength={240}
                  onChange={(e) => onBloco(i, { mostrar: e.target.value })}
                  className={`${CAMPO} text-sm`}
                />
              </div>
            </div>
          </div>
        ))}
      </div>

      {roteiro.base.length > 0 && (
        <details className="mt-5 rounded-xl border border-mesa-200 bg-white p-4" open>
          <summary className="cursor-pointer text-sm font-semibold text-mesa-700">
            De onde saiu{" "}
            <span className="font-normal text-mesa-500">
              (trechos da fonte, para você conferir)
            </span>
          </summary>
          <ul className="mt-3 space-y-2">
            {roteiro.base.map((t) => (
              <li
                key={t}
                className="border-l-2 border-mesa-300 pl-3 text-sm italic leading-relaxed text-mesa-600"
              >
                “{t}”
              </li>
            ))}
          </ul>
        </details>
      )}

      <div className="mt-5">
        <label className={ROTULO} htmlFor="rot-legenda">
          Legenda do post
        </label>
        <textarea
          id="rot-legenda"
          rows={4}
          value={roteiro.legenda}
          maxLength={2200}
          onChange={(e) => onRoteiro({ legenda: e.target.value })}
          className={CAMPO}
        />
      </div>
    </>
  );
}

/** Tela cheia com o texto falado rolando — para gravar lendo. */
function Teleprompter({
  roteiro,
  onFechar,
}: {
  roteiro: Roteiro;
  onFechar: () => void;
}) {
  const [rolando, setRolando] = useState(false);
  const [velocidade, setVelocidade] = useState(40); // pixels por segundo
  const area = useRef<HTMLDivElement>(null);
  const fechar = useRef(onFechar);
  fechar.current = onFechar;

  useEffect(() => {
    const tecla = (e: KeyboardEvent) => {
      if (e.key === "Escape") fechar.current();
      if (e.key === " ") {
        e.preventDefault();
        setRolando((r) => !r);
      }
    };
    window.addEventListener("keydown", tecla);
    return () => window.removeEventListener("keydown", tecla);
  }, []);

  useEffect(() => {
    if (!rolando) return;
    let quadro = 0;
    let antes = performance.now();
    let resto = 0;
    const passo = (agora: number) => {
      const el = area.current;
      if (!el) return;
      resto += ((agora - antes) / 1000) * velocidade;
      antes = agora;
      const inteiro = Math.floor(resto);
      if (inteiro > 0) {
        el.scrollTop += inteiro;
        resto -= inteiro;
      }
      if (el.scrollTop + el.clientHeight >= el.scrollHeight - 2) {
        setRolando(false);
        return;
      }
      quadro = requestAnimationFrame(passo);
    };
    quadro = requestAnimationFrame(passo);
    return () => cancelAnimationFrame(quadro);
  }, [rolando, velocidade]);

  return (
    <div
      className="fixed inset-0 z-50 flex flex-col bg-black text-white"
      role="dialog"
      aria-modal="true"
      aria-label="Teleprompter"
    >
      <div className="flex flex-wrap items-center justify-between gap-3 border-b border-white/15 px-4 py-3">
        <div className="flex items-center gap-2">
          <button
            type="button"
            onClick={() => setRolando((r) => !r)}
            className="rounded-full bg-white px-5 py-2 text-sm font-semibold text-black"
          >
            {rolando ? "Pausar" : "Rolar"}
          </button>
          <label className="flex items-center gap-2 text-sm text-white/80">
            Velocidade
            <input
              type="range"
              min={15}
              max={120}
              value={velocidade}
              onChange={(e) => setVelocidade(Number(e.target.value))}
            />
          </label>
        </div>
        <button
          type="button"
          onClick={onFechar}
          className="rounded-full border border-white/40 px-4 py-2 text-sm"
        >
          Fechar
        </button>
      </div>
      <div ref={area} className="flex-1 overflow-y-auto px-6">
        <div className="mx-auto max-w-3xl py-[40vh] text-center text-3xl font-medium leading-snug sm:text-5xl sm:leading-tight">
          {roteiro.blocos.map((b, i) => (
            // A ordem dos blocos não muda enquanto o teleprompter está aberto.
            <p key={i} className="mb-12">
              {b.falar}
            </p>
          ))}
        </div>
      </div>
    </div>
  );
}
