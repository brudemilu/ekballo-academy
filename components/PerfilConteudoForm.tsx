"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import {
  adicionarPreferencia,
  MAX_PILARES,
  MAX_PREFERENCIAS,
  MAX_REFERENCIAS,
  MIN_EXEMPLOS,
  type PerfilConteudo,
  type Pilar,
  type Preferencia,
  podeAnalisar,
  progressoDoPerfil,
  type ReferenciaConteudo,
  type ReferenciaDNA,
  type VozDNA,
} from "@/lib/conteudo-perfil";

/**
 * Aba Perfil do Instagram (issue #189): o "cadastro inicial" do copiloto.
 * Tudo o que se preenche aqui vira contexto dos roteiros e posts — objetivo,
 * pilares, a voz do pastor e a FORMA dos criadores que ele admira.
 */

const CAMPO =
  "w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500";
const ROTULO = "mb-1 block text-sm font-medium text-mesa-700";
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

function Etiquetas({
  itens,
  cor = "mesa",
}: {
  itens: string[];
  cor?: "mesa" | "laranja";
}) {
  if (!itens.length) return null;
  const cls =
    cor === "laranja"
      ? "border-laranja-200 bg-laranja-50 text-laranja-700"
      : "border-mesa-200 bg-mesa-50 text-mesa-700";
  return (
    <ul className="flex flex-wrap gap-1.5">
      {itens.map((t) => (
        <li key={t} className={`rounded-full border px-2.5 py-1 text-xs ${cls}`}>
          {t}
        </li>
      ))}
    </ul>
  );
}

export function PerfilConteudoForm({
  perfilInicial,
  referenciasIniciais,
}: {
  perfilInicial: PerfilConteudo;
  referenciasIniciais: ReferenciaConteudo[];
}) {
  const router = useRouter();
  const [perfil, setPerfil] = useState(perfilInicial);
  const [referencias, setReferencias] = useState(referenciasIniciais);
  const [salvando, setSalvando] = useState(false);
  const [salvo, setSalvo] = useState(false);
  const [analisandoVoz, setAnalisandoVoz] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  const progresso = progressoDoPerfil(perfil, referencias);

  function mudar<K extends keyof PerfilConteudo>(campo: K, valor: PerfilConteudo[K]) {
    setPerfil((p) => ({ ...p, [campo]: valor }));
    setSalvo(false);
  }

  function mudarPilar(i: number, patch: Partial<Pilar>) {
    mudar(
      "pilares",
      perfil.pilares.map((p, idx) => (idx === i ? { ...p, ...patch } : p)),
    );
  }

  async function salvar(): Promise<boolean> {
    setSalvando(true);
    setErro(null);
    try {
      const d = await chamar("/api/admin/instagram/perfil", "PUT", perfil);
      if (d.vozMudou) setPerfil((p) => ({ ...p, voz_dna: null }));
      setSalvo(true);
      router.refresh();
      return true;
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao salvar.");
      return false;
    } finally {
      setSalvando(false);
    }
  }

  async function analisarVoz() {
    setAnalisandoVoz(true);
    setErro(null);
    try {
      // A análise lê o que está SALVO: grava antes para não analisar texto velho.
      if (!(await salvar())) return;
      const d = await chamar("/api/admin/instagram/perfil", "POST");
      setPerfil((p) => ({ ...p, voz_dna: d.voz_dna as VozDNA }));
      router.refresh();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao analisar.");
    } finally {
      setAnalisandoVoz(false);
    }
  }

  return (
    <div className="space-y-8">
      {/* Progresso do cadastro */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-5">
        <div className="mb-3 flex items-baseline justify-between gap-3">
          <h2 className="font-serif text-xl font-semibold text-mesa-800">
            Seu copiloto conhece o ministério?
          </h2>
          <span className="text-sm text-mesa-600">
            <strong className="text-mesa-800">
              {progresso.feitos} de {progresso.total}
            </strong>{" "}
            prontos
          </span>
        </div>
        <ul className="grid gap-2 sm:grid-cols-2">
          {progresso.passos.map((p) => (
            <li key={p.chave} className="flex items-center gap-2 text-sm text-mesa-700">
              <span
                aria-hidden="true"
                className={`flex h-5 w-5 flex-none items-center justify-center rounded-full text-[11px] ${
                  p.feito
                    ? "bg-oliveira-600 text-white"
                    : "border border-mesa-300 text-mesa-400"
                }`}
              >
                {p.feito ? "✓" : ""}
              </span>
              <span className={p.feito ? "" : "text-mesa-500"}>{p.rotulo}</span>
            </li>
          ))}
        </ul>
      </section>

      {erro && (
        <div
          className="rounded-xl border border-red-200 bg-red-50 p-3 text-sm text-red-700"
          role="alert"
        >
          {erro}
        </div>
      )}

      {/* O ministério */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-5">
        <h2 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
          O ministério
        </h2>
        <p className="mb-4 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
          É o que a IA lê antes de escrever qualquer roteiro ou post. Quanto mais
          concreto, menos o texto sai com cara de genérico.
        </p>

        <div className="grid gap-4 md:grid-cols-2">
          <div>
            <label className={ROTULO} htmlFor="perfil-objetivo">
              Objetivo do perfil
            </label>
            <textarea
              id="perfil-objetivo"
              rows={3}
              maxLength={600}
              value={perfil.objetivo}
              onChange={(e) => mudar("objetivo", e.target.value)}
              placeholder="Ex.: levar quem segue o perfil para uma mesa de discipulado."
              className={CAMPO}
            />
          </div>
          <div>
            <label className={ROTULO} htmlFor="perfil-publico">
              Para quem você fala
            </label>
            <textarea
              id="perfil-publico"
              rows={3}
              maxLength={600}
              value={perfil.publico}
              onChange={(e) => mudar("publico", e.target.value)}
              placeholder="Ex.: jovens adultos da igreja local que leem pouco e querem crescer na fé."
              className={CAMPO}
            />
          </div>
        </div>

        <fieldset className="mt-5">
          <legend className={ROTULO}>
            Pilares de conteúdo{" "}
            <span className="font-normal text-mesa-400">
              (os 2 a 4 assuntos em que o perfil sempre volta)
            </span>
          </legend>
          <div className="space-y-2">
            {perfil.pilares.map((p, i) => (
              // A lista é editada no lugar: a posição é a identidade do pilar.
              <div key={i} className="flex flex-wrap gap-2">
                <input
                  aria-label={`Nome do pilar ${i + 1}`}
                  maxLength={60}
                  value={p.nome}
                  onChange={(e) => mudarPilar(i, { nome: e.target.value })}
                  placeholder="Nome (ex.: Mesa)"
                  className={`${CAMPO} sm:w-44`}
                />
                <input
                  aria-label={`Descrição do pilar ${i + 1}`}
                  maxLength={300}
                  value={p.descricao}
                  onChange={(e) => mudarPilar(i, { descricao: e.target.value })}
                  placeholder="O que entra nele"
                  className={`${CAMPO} min-w-0 flex-1`}
                />
                <button
                  type="button"
                  onClick={() =>
                    mudar(
                      "pilares",
                      perfil.pilares.filter((_, idx) => idx !== i),
                    )
                  }
                  className="rounded-full px-3 text-sm text-red-600 hover:bg-red-50"
                  aria-label={`Remover pilar ${i + 1}`}
                >
                  Remover
                </button>
              </div>
            ))}
          </div>
          {perfil.pilares.length < MAX_PILARES && (
            <button
              type="button"
              onClick={() =>
                mudar("pilares", [...perfil.pilares, { nome: "", descricao: "" }])
              }
              className={`${BOTAO_SECUNDARIO} mt-2`}
            >
              + Pilar
            </button>
          )}
        </fieldset>

        <div className="mt-5 grid gap-4 md:grid-cols-2">
          <div>
            <label className={ROTULO} htmlFor="perfil-chamada">
              Chamada final preferida
            </label>
            <input
              id="perfil-chamada"
              maxLength={300}
              value={perfil.chamada_padrao}
              onChange={(e) => mudar("chamada_padrao", e.target.value)}
              placeholder='Ex.: "Comente MESA que eu te mando o link."'
              className={CAMPO}
            />
          </div>
          <div>
            <label className={ROTULO} htmlFor="perfil-proibidos">
              Assuntos em que a IA não deve entrar
            </label>
            <input
              id="perfil-proibidos"
              maxLength={1500}
              value={perfil.temas_proibidos}
              onChange={(e) => mudar("temas_proibidos", e.target.value)}
              placeholder="Ex.: política partidária; promessa de prosperidade; polêmica entre denominações."
              className={CAMPO}
            />
          </div>
        </div>
      </section>

      {/* A voz */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-5">
        <h2 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
          A sua voz
        </h2>
        <p className="mb-4 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
          Cole textos que você mesmo escreveu ou falou: legendas antigas, um trecho de
          pregação, uma mensagem para a igreja. A IA aprende o seu jeito e passa a
          escrever como você, não como um robô.
        </p>
        <label className={ROTULO} htmlFor="perfil-voz">
          Amostras suas
        </label>
        <textarea
          id="perfil-voz"
          rows={7}
          maxLength={8000}
          value={perfil.voz_amostras}
          onChange={(e) => mudar("voz_amostras", e.target.value)}
          placeholder="Cole aqui 3 ou 4 textos seus, um embaixo do outro."
          className={CAMPO}
        />
        <div className="mt-3 flex flex-wrap items-center gap-2">
          <button
            type="button"
            onClick={analisarVoz}
            disabled={analisandoVoz || salvando}
            className={BOTAO_SECUNDARIO}
          >
            {analisandoVoz
              ? "Analisando…"
              : perfil.voz_dna
                ? "Analisar de novo"
                : "✨ Analisar minha voz"}
          </button>
          {!perfil.voz_dna && (
            <span className="text-xs text-mesa-500">
              Salva o perfil e lê as amostras.
            </span>
          )}
        </div>

        {perfil.voz_dna && (
          <div className="mt-4 space-y-3 rounded-xl border border-oliveira-200 bg-oliveira-50/50 p-4">
            <p className="text-sm leading-relaxed text-mesa-800">
              {perfil.voz_dna.tom}
            </p>
            {perfil.voz_dna.vocabulario.length > 0 && (
              <div>
                <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-mesa-500">
                  Expressões suas
                </p>
                <Etiquetas itens={perfil.voz_dna.vocabulario} />
              </div>
            )}
            {perfil.voz_dna.evitar.length > 0 && (
              <div>
                <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-mesa-500">
                  O que você não faz
                </p>
                <Etiquetas itens={perfil.voz_dna.evitar} cor="laranja" />
              </div>
            )}
          </div>
        )}
      </section>

      <div className="flex flex-wrap items-center gap-3">
        <button
          type="button"
          onClick={salvar}
          disabled={salvando}
          className={BOTAO_PRIMARIO}
        >
          {salvando ? "Salvando…" : "Salvar perfil"}
        </button>
        {salvo && (
          <span className="text-sm text-oliveira-700" role="status">
            ✓ Perfil salvo
          </span>
        )}
      </div>

      <PreferenciasAprendidas
        preferencias={perfil.preferencias ?? []}
        onMudar={(preferencias) => setPerfil((p) => ({ ...p, preferencias }))}
        onErro={setErro}
      />

      <ReferenciasConteudo
        referencias={referencias}
        onMudar={setReferencias}
        onErro={setErro}
      />
    </div>
  );
}

/**
 * O que a IA aprendeu com as recusas. Cada item grava na hora (não depende do
 * "Salvar perfil"): é uma lista à parte, que também cresce sozinha quando o
 * pastor cancela uma peça dizendo por quê.
 */
function PreferenciasAprendidas({
  preferencias,
  onMudar,
  onErro,
}: {
  preferencias: Preferencia[];
  onMudar: (lista: Preferencia[]) => void;
  onErro: (erro: string | null) => void;
}) {
  const router = useRouter();
  const [nova, setNova] = useState("");
  const [gravando, setGravando] = useState(false);

  async function gravar(lista: Preferencia[]) {
    setGravando(true);
    onErro(null);
    try {
      const d = await chamar("/api/admin/instagram/perfil", "PATCH", {
        preferencias: lista,
      });
      onMudar(d.preferencias as Preferencia[]);
      router.refresh();
      return true;
    } catch (e) {
      onErro(e instanceof Error ? e.message : "Falha ao salvar.");
      return false;
    } finally {
      setGravando(false);
    }
  }

  async function adicionar(e: React.FormEvent) {
    e.preventDefault();
    const lista = adicionarPreferencia(preferencias, nova, new Date().toISOString());
    if (lista === preferencias) return;
    if (await gravar(lista)) setNova("");
  }

  return (
    <section className="rounded-2xl border border-mesa-200 bg-white p-5">
      <h2 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
        O que a IA já aprendeu com você
      </h2>
      <p className="mb-4 text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
        Quando você cancela uma peça e diz o motivo — aqui no site ou respondendo
        “cancelar porque…” no WhatsApp —, a IA guarda a correção e passa a segui-la em
        tudo o que escreve. Você também pode ensinar direto, e apagar o que não vale
        mais. Ficam as {MAX_PREFERENCIAS} mais recentes.
      </p>

      {preferencias.length === 0 ? (
        <p className="mb-4 rounded-lg border border-dashed border-mesa-200 p-4 text-sm text-mesa-500">
          Ainda não há nada anotado.
        </p>
      ) : (
        <ul className="mb-4 space-y-2">
          {preferencias.map((p) => (
            <li
              key={p.texto}
              className="flex items-start justify-between gap-3 rounded-lg border border-mesa-200 bg-bege-50 p-3"
            >
              <p className="min-w-0 text-sm text-mesa-800">{p.texto}</p>
              <button
                type="button"
                disabled={gravando}
                onClick={() => gravar(preferencias.filter((x) => x.texto !== p.texto))}
                aria-label={`Apagar: ${p.texto}`}
                className="shrink-0 rounded-full border border-mesa-200 bg-white px-3 py-1 text-xs font-medium text-mesa-700 hover:bg-mesa-100 disabled:opacity-60"
              >
                Apagar
              </button>
            </li>
          ))}
        </ul>
      )}

      <form onSubmit={adicionar} className="flex flex-wrap items-end gap-2">
        <div className="min-w-0 flex-1 basis-64">
          <label htmlFor="preferencia-nova" className={ROTULO}>
            Ensinar uma regra
          </label>
          <input
            id="preferencia-nova"
            value={nova}
            onChange={(e) => setNova(e.target.value)}
            maxLength={300}
            placeholder="Ex.: nunca terminar com pergunta; sempre citar o versículo por extenso."
            className={CAMPO}
          />
        </div>
        <button
          type="submit"
          disabled={gravando || !nova.trim()}
          className={BOTAO_SECUNDARIO}
        >
          {gravando ? "Gravando…" : "Ensinar"}
        </button>
      </form>
    </section>
  );
}

function ReferenciasConteudo({
  referencias,
  onMudar,
  onErro,
}: {
  referencias: ReferenciaConteudo[];
  onMudar: (r: ReferenciaConteudo[]) => void;
  onErro: (e: string | null) => void;
}) {
  const router = useRouter();
  const [nome, setNome] = useState("");
  const [link, setLink] = useState("");
  const [adicionando, setAdicionando] = useState(false);
  const [ocupado, setOcupado] = useState<string | null>(null);

  function trocar(id: string, patch: Partial<ReferenciaConteudo>) {
    onMudar(referencias.map((r) => (r.id === id ? { ...r, ...patch } : r)));
  }

  async function adicionar(e: React.FormEvent) {
    e.preventDefault();
    setAdicionando(true);
    onErro(null);
    try {
      const d = await chamar("/api/admin/instagram/referencias", "POST", {
        nome,
        link,
      });
      onMudar([...referencias, d.referencia as ReferenciaConteudo]);
      setNome("");
      setLink("");
      router.refresh();
    } catch (err) {
      onErro(err instanceof Error ? err.message : "Falha ao adicionar.");
    } finally {
      setAdicionando(false);
    }
  }

  async function analisar(ref: ReferenciaConteudo) {
    setOcupado(ref.id);
    onErro(null);
    try {
      // A análise lê os exemplos SALVOS: grava antes.
      await chamar("/api/admin/instagram/referencias", "PATCH", {
        id: ref.id,
        exemplos: ref.exemplos,
      });
      const d = await chamar("/api/admin/instagram/referencias", "POST", {
        analisar: ref.id,
      });
      trocar(ref.id, {
        dna: d.dna as ReferenciaDNA,
        analisado_em: d.analisado_em as string,
      });
      router.refresh();
    } catch (err) {
      onErro(err instanceof Error ? err.message : "Falha ao analisar.");
    } finally {
      setOcupado(null);
    }
  }

  async function excluir(ref: ReferenciaConteudo) {
    if (!confirm(`Remover ${ref.nome} das referências?`)) return;
    setOcupado(ref.id);
    onErro(null);
    try {
      await chamar(`/api/admin/instagram/referencias?id=${ref.id}`, "DELETE");
      onMudar(referencias.filter((r) => r.id !== ref.id));
      router.refresh();
    } catch (err) {
      onErro(err instanceof Error ? err.message : "Falha ao remover.");
    } finally {
      setOcupado(null);
    }
  }

  return (
    <section className="rounded-2xl border border-mesa-200 bg-white p-5">
      <h2 className="mb-1 font-serif text-xl font-semibold text-mesa-800">
        Criadores que você admira
      </h2>
      <p className="mb-4 max-w-2xl text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
        Escolha até {MAX_REFERENCIAS} (três é o ideal). De cada um a IA aprende a{" "}
        <strong>forma</strong>: como abre, como conduz, como encerra. O conteúdo, os
        bordões e a doutrina deles ficam com eles; a mensagem continua sendo a do
        ministério. Como o Instagram não deixa ler o perfil de outra pessoa, cole aqui
        alguns exemplos.
      </p>

      <div className="space-y-4">
        {referencias.map((ref) => (
          <article
            key={ref.id}
            className="rounded-xl border border-mesa-200 bg-bege-50 p-4"
          >
            <header className="mb-3 flex flex-wrap items-baseline justify-between gap-2">
              <div>
                <h3 className="font-serif text-lg font-semibold text-mesa-800">
                  {ref.nome}
                </h3>
                {ref.link && (
                  <p className="break-all text-xs text-mesa-500">{ref.link}</p>
                )}
              </div>
              <button
                type="button"
                onClick={() => excluir(ref)}
                disabled={ocupado === ref.id}
                className="rounded-full px-3 py-1 text-sm text-red-600 hover:bg-red-50"
              >
                Remover
              </button>
            </header>

            <label className={ROTULO} htmlFor={`ref-exemplos-${ref.id}`}>
              Exemplos{" "}
              <span className="font-normal text-mesa-400">
                (3 a 5 legendas ou transcrições de vídeos dele, um embaixo do outro)
              </span>
            </label>
            <textarea
              id={`ref-exemplos-${ref.id}`}
              rows={5}
              maxLength={12000}
              value={ref.exemplos}
              onChange={(e) => trocar(ref.id, { exemplos: e.target.value })}
              placeholder="Cole aqui o texto dos posts que você mais gosta dele."
              className={CAMPO}
            />
            <div className="mt-2 flex flex-wrap items-center gap-2">
              <button
                type="button"
                onClick={() => analisar(ref)}
                disabled={ocupado === ref.id || !podeAnalisar(ref.exemplos)}
                className={BOTAO_SECUNDARIO}
              >
                {ocupado === ref.id
                  ? "Analisando…"
                  : ref.dna
                    ? "Analisar de novo"
                    : "✨ Analisar a forma"}
              </button>
              {!podeAnalisar(ref.exemplos) && (
                <span className="text-xs text-mesa-500">
                  Faltam {Math.max(0, MIN_EXEMPLOS - ref.exemplos.trim().length)}{" "}
                  caracteres de exemplo.
                </span>
              )}
            </div>

            {ref.dna && <DNA dna={ref.dna} />}
          </article>
        ))}
      </div>

      {referencias.length < MAX_REFERENCIAS && (
        <form onSubmit={adicionar} className="mt-4 flex flex-wrap items-end gap-2">
          <div className="min-w-0 flex-1 sm:max-w-xs">
            <label className={ROTULO} htmlFor="ref-nome">
              Nome ou @
            </label>
            <input
              id="ref-nome"
              required
              maxLength={80}
              value={nome}
              onChange={(e) => setNome(e.target.value)}
              placeholder="Ex.: @fulano"
              className={CAMPO}
            />
          </div>
          <div className="min-w-0 flex-1">
            <label className={ROTULO} htmlFor="ref-link">
              Link <span className="font-normal text-mesa-400">(opcional)</span>
            </label>
            <input
              id="ref-link"
              maxLength={300}
              value={link}
              onChange={(e) => setLink(e.target.value)}
              placeholder="instagram.com/… ou youtube.com/…"
              className={CAMPO}
            />
          </div>
          <button type="submit" disabled={adicionando} className={BOTAO_SECUNDARIO}>
            {adicionando ? "Adicionando…" : "+ Adicionar criador"}
          </button>
        </form>
      )}
    </section>
  );
}

function DNA({ dna }: { dna: ReferenciaDNA }) {
  return (
    <div className="mt-4 space-y-3 rounded-xl border border-oliveira-200 bg-white p-4">
      {dna.resumo && (
        <p className="text-sm font-medium leading-relaxed text-mesa-800">
          {dna.resumo}
        </p>
      )}
      <div className="grid gap-4 md:grid-cols-2">
        {dna.ganchos.length > 0 && (
          <div>
            <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-mesa-500">
              Como abre
            </p>
            <ul className="list-disc space-y-1 pl-5 text-sm text-mesa-700">
              {dna.ganchos.map((g) => (
                <li key={g}>{g}</li>
              ))}
            </ul>
          </div>
        )}
        {dna.estrutura.length > 0 && (
          <div>
            <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-mesa-500">
              Como conduz
            </p>
            <ol className="list-decimal space-y-1 pl-5 text-sm text-mesa-700">
              {dna.estrutura.map((b) => (
                <li key={b}>{b}</li>
              ))}
            </ol>
          </div>
        )}
      </div>
      <dl className="grid gap-x-6 gap-y-2 text-sm text-mesa-700 md:grid-cols-3">
        {dna.tom && (
          <div>
            <dt className="text-xs font-semibold uppercase tracking-wider text-mesa-500">
              Tom
            </dt>
            <dd>{dna.tom}</dd>
          </div>
        )}
        {dna.ritmo && (
          <div>
            <dt className="text-xs font-semibold uppercase tracking-wider text-mesa-500">
              Ritmo
            </dt>
            <dd>{dna.ritmo}</dd>
          </div>
        )}
        {dna.chamada && (
          <div>
            <dt className="text-xs font-semibold uppercase tracking-wider text-mesa-500">
              Como encerra
            </dt>
            <dd>{dna.chamada}</dd>
          </div>
        )}
      </dl>
      {dna.aproveitar.length > 0 && (
        <div>
          <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-mesa-500">
            O que vale trazer
          </p>
          <Etiquetas itens={dna.aproveitar} />
        </div>
      )}
      {dna.nao_copiar.length > 0 && (
        <div>
          <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-mesa-500">
            O que fica com ele
          </p>
          <Etiquetas itens={dna.nao_copiar} cor="laranja" />
        </div>
      )}
    </div>
  );
}
