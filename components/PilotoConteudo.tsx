"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import { MOTIVOS_RECUSA, type MotivoRecusa } from "@/lib/conteudo-perfil";
import {
  type ExecucaoPiloto,
  JANELA_VETO_HORAS,
  type Momento,
  NOME_DIA,
  type PecaPiloto,
  type PilotoConfig,
  podeVetar,
  quandoPorExtenso,
  rotuloMomento,
  type TipoFontePiloto,
} from "@/lib/piloto";

/**
 * Aba Piloto do Instagram (issue #189): a IA prepara a semana sozinha, agenda
 * e avisa no WhatsApp. O pastor só entra aqui para ligar, ajustar ou vetar.
 */

const CAMPO =
  "rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500";
const ROTULO = "mb-1 block text-sm font-medium text-mesa-700";
const BOTAO_PRIMARIO =
  "rounded-full bg-laranja-600 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-700 disabled:opacity-60";
const BOTAO_SECUNDARIO =
  "rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-100 disabled:opacity-60";

const FONTES: { v: TipoFontePiloto; rotulo: string; detalhe: string }[] = [
  {
    v: "pregacao",
    rotulo: "Minha última pregação",
    detalhe:
      "Usa a pregação mais recente que você analisou na aba Cortes. Tem prioridade quando há uma nova.",
  },
  {
    v: "livro",
    rotulo: "Um livro, mesa a mesa",
    detalhe: "Avança uma mesa por vez, na ordem do livro.",
  },
  {
    v: "devocional",
    rotulo: "O devocional do dia",
    detalhe: "O mesmo que os discípulos recebem.",
  },
];

const NOME_PECA: Record<PecaPiloto["tipo"], string> = {
  carrossel: "Carrossel",
  reel_ia: "Reel feito pela IA",
  roteiro: "Roteiro para você gravar",
};

const ESTADO: Record<PecaPiloto["estado"], { txt: string; cls: string }> = {
  agendado: { txt: "Agendado", cls: "border-blue-200 bg-blue-50 text-blue-700" },
  pronto: {
    txt: "Esperando você",
    cls: "border-oliveira-200 bg-oliveira-50 text-oliveira-700",
  },
  vetado: {
    txt: "Cancelado por você",
    cls: "border-mesa-200 bg-mesa-100 text-mesa-600",
  },
  falhou: { txt: "Não saiu", cls: "border-amber-200 bg-amber-50 text-amber-800" },
};

async function chamar(metodo: string, corpo?: object) {
  const res = await fetch("/api/admin/instagram/piloto", {
    method: metodo,
    headers: corpo ? { "Content-Type": "application/json" } : undefined,
    body: corpo ? JSON.stringify(corpo) : undefined,
  });
  const d = await res.json().catch(() => ({}));
  if (!res.ok) throw new Error(d?.error || "Algo deu errado. Tente de novo.");
  return d;
}

function EscolhaMomento({
  id,
  rotulo,
  valor,
  onMudar,
}: {
  id: string;
  rotulo: string;
  valor: Momento;
  onMudar: (m: Momento) => void;
}) {
  return (
    <fieldset>
      <legend className={ROTULO}>{rotulo}</legend>
      <div className="flex gap-2">
        <label className="sr-only" htmlFor={`${id}-dia`}>
          {rotulo}: dia da semana
        </label>
        <select
          id={`${id}-dia`}
          value={valor.dia}
          onChange={(e) => onMudar({ ...valor, dia: Number(e.target.value) })}
          className={CAMPO}
        >
          {NOME_DIA.map((n, i) => (
            <option key={n} value={i}>
              {n}
            </option>
          ))}
        </select>
        <label className="sr-only" htmlFor={`${id}-hora`}>
          {rotulo}: hora
        </label>
        <select
          id={`${id}-hora`}
          value={valor.hora}
          onChange={(e) => onMudar({ ...valor, hora: Number(e.target.value) })}
          className={CAMPO}
        >
          {Array.from({ length: 24 }, (_, h) => (
            <option key={h} value={h}>
              {h}h
            </option>
          ))}
        </select>
      </div>
    </fieldset>
  );
}

export function PilotoConteudo({
  configInicial,
  execucoesIniciais,
  cursos,
}: {
  configInicial: PilotoConfig;
  execucoesIniciais: ExecucaoPiloto[];
  cursos: { id: string; titulo: string; autor?: string | null }[];
}) {
  const router = useRouter();
  const [config, setConfig] = useState(configInicial);
  const [execucoes, setExecucoes] = useState(execucoesIniciais);
  const [salvando, setSalvando] = useState(false);
  const [rodando, setRodando] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [aviso, setAviso] = useState<string | null>(null);

  // Enquanto a execução mais recente estiver preparando, acompanha.
  const preparando = execucoes[0]?.status === "preparando";
  useEffect(() => {
    if (!preparando) return;
    let vivo = true;
    const t = setInterval(async () => {
      try {
        const d = await chamar("GET");
        if (vivo) setExecucoes(d.execucoes as ExecucaoPiloto[]);
      } catch {
        // falha passageira: a próxima consulta tenta de novo
      }
    }, 4000);
    return () => {
      vivo = false;
      clearInterval(t);
    };
  }, [preparando]);

  function mudar<K extends keyof PilotoConfig>(campo: K, valor: PilotoConfig[K]) {
    setConfig((c) => ({ ...c, [campo]: valor }));
    setAviso(null);
  }

  function alternarFonte(f: TipoFontePiloto) {
    mudar(
      "fontes",
      config.fontes.includes(f)
        ? config.fontes.filter((x) => x !== f)
        : [...config.fontes, f],
    );
  }

  async function salvar(proximo: PilotoConfig = config) {
    setSalvando(true);
    setErro(null);
    setAviso(null);
    try {
      await chamar("PUT", proximo);
      setConfig(proximo);
      setAviso(
        proximo.ativo ? "Piloto ligado e salvo." : "Salvo. O piloto está desligado.",
      );
      router.refresh();
      return true;
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao salvar.");
      return false;
    } finally {
      setSalvando(false);
    }
  }

  async function rodarAgora() {
    setRodando(true);
    setErro(null);
    try {
      // Roda com o que está na tela: salva antes para não usar configuração velha.
      if (!(await salvar())) return;
      const d = await chamar("POST", { rodar: true });
      setExecucoes((l) => [d.execucao as ExecucaoPiloto, ...l]);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao começar.");
    } finally {
      setRodando(false);
    }
  }

  async function vetar(
    execucaoId: string,
    indice: number,
    motivo: MotivoRecusa | null,
    detalhe: string,
  ) {
    setErro(null);
    setAviso(null);
    try {
      const d = await chamar("POST", {
        vetar: { execucaoId, indice, motivo: motivo ?? undefined, detalhe },
      });
      setExecucoes((l) =>
        l.map((e) =>
          e.id === execucaoId ? { ...e, pecas: d.pecas as PecaPiloto[] } : e,
        ),
      );
      setAviso(
        d.aprendeu
          ? "Publicação cancelada. Anotei o motivo: a IA leva em conta nas próximas (veja na aba Perfil)."
          : "Publicação cancelada. A peça voltou a ser rascunho.",
      );
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao cancelar.");
    }
  }

  return (
    <div className="space-y-8">
      {/* Ligado / desligado */}
      <section
        className={`rounded-2xl border p-5 ${config.ativo ? "border-oliveira-300 bg-oliveira-50/60" : "border-mesa-200 bg-white"}`}
      >
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div className="min-w-0">
            <h2 className="font-serif text-xl font-semibold text-mesa-800">
              {config.ativo ? "O piloto está ligado" : "O piloto está desligado"}
            </h2>
            <p className="mt-1 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
              {config.ativo
                ? `Todo ${rotuloMomento(config.preparo)} eu preparo a semana, agendo e te aviso no WhatsApp. Se você não cancelar, vai ao ar no horário.`
                : "Ligado, a IA escolhe o assunto, cria as peças, agenda a publicação e te avisa no WhatsApp toda semana. Você só entra para cancelar o que não gostar."}
            </p>
          </div>
          <button
            type="button"
            onClick={() => salvar({ ...config, ativo: !config.ativo })}
            disabled={salvando}
            aria-pressed={config.ativo}
            className={config.ativo ? BOTAO_SECUNDARIO : BOTAO_PRIMARIO}
          >
            {config.ativo ? "Desligar o piloto" : "Ligar o piloto"}
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

      {/* Configuração */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-5">
        <h2 className="mb-4 font-serif text-xl font-semibold text-mesa-800">
          Como o piloto trabalha
        </h2>

        <fieldset>
          <legend className={ROTULO}>De onde ele tira o assunto</legend>
          <div className="space-y-2">
            {FONTES.map((f) => (
              <label
                key={f.v}
                className="flex cursor-pointer items-start gap-2 rounded-lg border border-mesa-200 p-3"
              >
                <input
                  type="checkbox"
                  checked={config.fontes.includes(f.v)}
                  onChange={() => alternarFonte(f.v)}
                  className="mt-0.5 accent-laranja-600"
                />
                <span className="min-w-0">
                  <span className="block text-sm font-medium text-mesa-800">
                    {f.rotulo}
                  </span>
                  <span className="block text-xs text-mesa-500">{f.detalhe}</span>
                </span>
              </label>
            ))}
          </div>
        </fieldset>

        {config.fontes.includes("livro") && (
          <div className="mt-4 max-w-md">
            <label className={ROTULO} htmlFor="piloto-livro">
              Qual livro seguir
            </label>
            <select
              id="piloto-livro"
              value={config.curso_id || ""}
              onChange={(e) => mudar("curso_id", e.target.value || null)}
              className={`${CAMPO} w-full`}
            >
              <option value="">Escolha…</option>
              {cursos.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.titulo}
                  {c.autor ? ` — ${c.autor}` : ""}
                </option>
              ))}
            </select>
          </div>
        )}

        <fieldset className="mt-5">
          <legend className={ROTULO}>O que ele produz</legend>
          <div className="space-y-2">
            {(
              [
                [
                  "carrossel",
                  "Carrossel",
                  "Slides com imagem e legenda. Publicado sozinho no horário.",
                ],
                [
                  "roteiro",
                  "Roteiro para você gravar",
                  "Fica na aba Roteiros, com teleprompter. A gravação é sua.",
                ],
                [
                  "reel_ia",
                  "Reel feito pela IA",
                  "Vídeo com narração em voz sintética (não é você falando), texto na tela e vídeo de fundo. Publicado sozinho no dia do Reel.",
                ],
              ] as const
            ).map(([chave, rotulo, detalhe]) => (
              <label
                key={chave}
                className="flex cursor-pointer items-start gap-2 rounded-lg border border-mesa-200 p-3"
              >
                <input
                  type="checkbox"
                  checked={config.pecas[chave]}
                  onChange={() =>
                    mudar("pecas", { ...config.pecas, [chave]: !config.pecas[chave] })
                  }
                  className="mt-0.5 accent-laranja-600"
                />
                <span className="min-w-0">
                  <span className="block text-sm font-medium text-mesa-800">
                    {rotulo}
                  </span>
                  <span className="block text-xs text-mesa-500">{detalhe}</span>
                </span>
              </label>
            ))}
          </div>
        </fieldset>

        <div className="mt-5 grid gap-4 sm:grid-cols-3">
          <EscolhaMomento
            id="piloto-preparo"
            rotulo="Prepara e avisa"
            valor={config.preparo}
            onMudar={(m) => mudar("preparo", m)}
          />
          <EscolhaMomento
            id="piloto-carrossel"
            rotulo="Carrossel vai ao ar"
            valor={config.carrossel}
            onMudar={(m) => mudar("carrossel", m)}
          />
          <EscolhaMomento
            id="piloto-reel"
            rotulo="Dia do Reel"
            valor={config.reel}
            onMudar={(m) => mudar("reel", m)}
          />
        </div>
        <p className="mt-2 text-xs text-mesa-500">
          Horário de Brasília. Nada vai ao ar antes de {JANELA_VETO_HORAS} horas depois
          do aviso: se o horário cair dentro desse prazo, a peça fica para a semana
          seguinte.
        </p>

        <div className="mt-5 max-w-xs">
          <label className={ROTULO} htmlFor="piloto-telefone">
            WhatsApp que recebe o aviso
          </label>
          <input
            id="piloto-telefone"
            inputMode="numeric"
            value={config.telefone}
            onChange={(e) => mudar("telefone", e.target.value)}
            placeholder="5531999998888"
            className={`${CAMPO} w-full`}
          />
          <p className="mt-1 text-xs text-mesa-500">Com 55 e o DDD, só números.</p>
        </div>

        <div className="mt-5 flex flex-wrap items-center gap-3">
          <button
            type="button"
            onClick={() => salvar()}
            disabled={salvando}
            className={BOTAO_PRIMARIO}
          >
            {salvando ? "Salvando…" : "Salvar"}
          </button>
          <button
            type="button"
            onClick={rodarAgora}
            disabled={rodando || preparando}
            className={BOTAO_SECUNDARIO}
          >
            {rodando || preparando ? "Preparando…" : "Preparar a semana agora"}
          </button>
          {aviso && (
            <span className="text-sm text-oliveira-700" role="status">
              ✓ {aviso}
            </span>
          )}
        </div>
      </section>

      {/* O que o piloto fez */}
      <section>
        <h2 className="mb-3 font-serif text-xl font-semibold text-mesa-800">
          O que o piloto preparou
        </h2>
        {execucoes.length === 0 ? (
          <p className="rounded-xl border border-mesa-200 bg-white/70 p-4 text-sm text-mesa-500">
            Nada ainda. Ligue o piloto ou clique em “Preparar a semana agora” para ver
            como fica.
          </p>
        ) : (
          <ul className="space-y-3">
            {execucoes.map((e) => (
              <li key={e.id} className="rounded-xl border border-mesa-200 bg-white p-4">
                <Execucao execucao={e} onVetar={vetar} />
              </li>
            ))}
          </ul>
        )}
      </section>
    </div>
  );
}

function Execucao({
  execucao: e,
  onVetar,
}: {
  execucao: ExecucaoPiloto;
  onVetar: (
    execucaoId: string,
    indice: number,
    motivo: MotivoRecusa | null,
    detalhe: string,
  ) => Promise<void>;
}) {
  // Qual peça está com a pergunta "por quê?" aberta.
  const [vetando, setVetando] = useState<number | null>(null);
  const [motivo, setMotivo] = useState<MotivoRecusa | null>(null);
  const [detalhe, setDetalhe] = useState("");
  const [enviando, setEnviando] = useState(false);

  function abrirVeto(i: number) {
    setVetando(i);
    setMotivo(null);
    setDetalhe("");
  }

  async function confirmarVeto(i: number) {
    setEnviando(true);
    await onVetar(e.id, i, motivo, detalhe);
    setEnviando(false);
    setVetando(null);
  }

  const quando = new Date(e.criado_em).toLocaleString("pt-BR", {
    dateStyle: "short",
    timeStyle: "short",
    timeZone: "America/Sao_Paulo",
  });

  return (
    <>
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <p className="font-medium text-mesa-800">
          {e.fonte ? e.fonte.titulo : "Preparando a semana…"}
        </p>
        <span className="text-xs text-mesa-500">{quando}</span>
      </div>

      {e.status === "preparando" && (
        <p className="mt-2 flex items-center gap-2 text-sm text-mesa-600" role="status">
          <span
            className="inline-block h-3 w-3 animate-pulse rounded-full bg-laranja-500"
            aria-hidden="true"
          />
          Escolhendo a fonte e criando as peças. Leva menos de um minuto.
        </p>
      )}

      {e.erro && (
        <p
          className={`mt-2 text-sm ${e.status === "erro" ? "text-red-700" : "text-amber-800"}`}
          role="alert"
        >
          {e.erro}
        </p>
      )}

      {e.pecas.length > 0 && (
        <ul className="mt-3 space-y-2">
          {e.pecas.map((p, i) => {
            const st = ESTADO[p.estado];
            return (
              // A ordem das peças de uma execução não muda depois de gravada.
              <li
                key={`${p.tipo}-${i}`}
                className="rounded-lg border border-mesa-200 bg-bege-50 p-3"
              >
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <div className="min-w-0">
                    <p className="text-sm font-medium text-mesa-800">
                      {NOME_PECA[p.tipo]}
                      {p.titulo ? `: ${p.titulo}` : ""}
                    </p>
                    <p className="mt-0.5 text-xs text-mesa-500">
                      <span
                        className={`mr-2 inline-block rounded-full border px-2 py-0.5 font-semibold ${st.cls}`}
                      >
                        {st.txt}
                      </span>
                      {p.estado === "agendado" && p.quando
                        ? `vai ao ar ${quandoPorExtenso(p.quando)}`
                        : ""}
                      {p.estado === "falhou" && p.detalhe ? p.detalhe : ""}
                    </p>
                  </div>
                  <div className="flex flex-wrap gap-2">
                    {p.post_id && (
                      <Link
                        href="/admin/instagram?aba=criar#posts"
                        className={BOTAO_SECUNDARIO}
                      >
                        Ver o post
                      </Link>
                    )}
                    {p.roteiro_id && (
                      <Link
                        href={`/admin/instagram?aba=roteiros&roteiro=${p.roteiro_id}`}
                        className={BOTAO_SECUNDARIO}
                      >
                        Abrir o roteiro
                      </Link>
                    )}
                    {podeVetar(p, new Date()) && vetando !== i && (
                      <button
                        type="button"
                        onClick={() => abrirVeto(i)}
                        className="rounded-full border border-red-200 px-4 py-2 text-sm font-medium text-red-700 hover:bg-red-50"
                      >
                        Cancelar publicação
                      </button>
                    )}
                  </div>
                </div>

                {vetando === i && (
                  <fieldset className="mt-3 border-t border-mesa-200 pt-3">
                    <legend className="sr-only">Por que cancelar esta peça</legend>
                    <p className="text-sm font-medium text-mesa-800">
                      Por que não serve?{" "}
                      <span className="font-normal text-mesa-500">
                        (opcional — a IA aprende com a resposta)
                      </span>
                    </p>
                    <div className="mt-2 flex flex-wrap gap-2">
                      {(Object.keys(MOTIVOS_RECUSA) as MotivoRecusa[]).map((m) => (
                        <button
                          key={m}
                          type="button"
                          aria-pressed={motivo === m}
                          onClick={() => setMotivo(motivo === m ? null : m)}
                          className={`rounded-full border px-3 py-1.5 text-sm ${
                            motivo === m
                              ? "border-laranja-600 bg-laranja-50 font-semibold text-laranja-700"
                              : "border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-100"
                          }`}
                        >
                          {MOTIVOS_RECUSA[m]}
                        </button>
                      ))}
                    </div>
                    {motivo && motivo !== "fora_de_hora" && (
                      <div className="mt-2">
                        <label
                          htmlFor={`veto-detalhe-${e.id}-${i}`}
                          className="mb-1 block text-xs text-mesa-600"
                        >
                          {motivo === "outro"
                            ? "O que foi? (é isto que a IA vai guardar)"
                            : "Quer explicar? (ajuda a IA a acertar)"}
                        </label>
                        <input
                          id={`veto-detalhe-${e.id}-${i}`}
                          value={detalhe}
                          onChange={(ev) => setDetalhe(ev.target.value)}
                          maxLength={200}
                          placeholder="Ex.: formal demais, eu não falo assim"
                          className="w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800"
                        />
                      </div>
                    )}
                    <div className="mt-3 flex flex-wrap gap-2">
                      <button
                        type="button"
                        disabled={enviando}
                        onClick={() => confirmarVeto(i)}
                        className="rounded-full bg-red-700 px-4 py-2 text-sm font-semibold text-white hover:bg-red-800 disabled:opacity-60"
                      >
                        {enviando ? "Cancelando…" : "Confirmar cancelamento"}
                      </button>
                      <button
                        type="button"
                        disabled={enviando}
                        onClick={() => setVetando(null)}
                        className={BOTAO_SECUNDARIO}
                      >
                        Manter agendada
                      </button>
                    </div>
                  </fieldset>
                )}
              </li>
            );
          })}
        </ul>
      )}

      {e.status === "pronto" && !e.aviso_enviado && !e.erro && (
        <p className="mt-2 text-xs text-amber-800">
          O aviso no WhatsApp não foi enviado.
        </p>
      )}
    </>
  );
}
