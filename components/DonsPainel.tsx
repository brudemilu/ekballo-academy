"use client";

import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import { formatTelefoneBR } from "@/lib/telefone";

// Peças interativas do painel do Teste de Dons (/admin/dons, issue #289).
// Tudo grava por /api/admin/dons, que confere se é o master.

async function acao(corpo: Record<string, unknown>): Promise<Record<string, unknown>> {
  const r = await fetch("/api/admin/dons", {
    method: "POST",
    headers: { "content-type": "application/json" },
    body: JSON.stringify(corpo),
  });
  const dados = (await r.json().catch(() => ({}))) as Record<string, unknown>;
  if (!r.ok || !dados.ok)
    throw new Error(String(dados.erro ?? "Não foi possível concluir."));
  return dados;
}

function primeiroNome(nome: string | null | undefined): string {
  const p = (nome ?? "").trim().split(/\s+/)[0] ?? "";
  return p.charAt(0).toLocaleUpperCase("pt-BR") + p.slice(1).toLocaleLowerCase("pt-BR");
}

function mensagemConvite(nome: string | null, url: string): string {
  const saudacao = nome ? `Olá, ${primeiroNome(nome)}!` : "Olá!";
  return `${saudacao} Preparei para você o Teste de Dons Ministeriais (Efésios 4.11). São 160 frases, leva uns 20 minutos. Responda com calma, pelo que você vive hoje:\n\n${url}`;
}

function useOrigem(): string {
  const [origem, setOrigem] = useState("");
  useEffect(() => setOrigem(window.location.origin), []);
  return origem;
}

/** Endereço do link + copiar + mandar pelo WhatsApp. */
export function DonsCompartilhar({
  token,
  nome,
  telefone,
}: {
  token: string;
  nome: string | null;
  telefone: string | null;
}) {
  const origem = useOrigem();
  const url = `${origem}/dons/${token}`;
  const [copiado, setCopiado] = useState(false);

  async function copiar() {
    try {
      await navigator.clipboard.writeText(url);
      setCopiado(true);
      setTimeout(() => setCopiado(false), 2000);
    } catch {
      window.prompt("Copie o link:", url);
    }
  }

  const wa = `https://wa.me/${telefone ?? ""}?text=${encodeURIComponent(mensagemConvite(nome, url))}`;

  return (
    <div className="flex flex-wrap items-center gap-2">
      <code className="min-w-0 max-w-full truncate rounded-lg bg-bege-100 px-2 py-1 text-xs text-mesa-700">
        {url}
      </code>
      <button
        type="button"
        onClick={copiar}
        className="rounded-full border border-mesa-300 bg-white px-3 py-1 text-xs font-medium text-mesa-800 hover:border-laranja-400"
      >
        {copiado ? "Copiado ✓" : "Copiar link"}
      </button>
      <a
        href={wa}
        target="_blank"
        rel="noreferrer"
        className="rounded-full bg-[#25D366] px-3 py-1 text-xs font-semibold text-white hover:brightness-95"
      >
        Enviar pelo WhatsApp
      </a>
    </div>
  );
}

/** Gera link. Com `pessoaId`: novo teste para quem já está na lista. */
export function DonsGerarLink({
  pessoaId,
  nome,
  telefone,
}: {
  pessoaId?: string;
  nome?: string;
  telefone?: string | null;
}) {
  const router = useRouter();
  const [modo, setModo] = useState<"pessoa" | "grupo">("pessoa");
  const [nomeNovo, setNomeNovo] = useState("");
  const [telNovo, setTelNovo] = useState("");
  const [titulo, setTitulo] = useState("");
  const [ocupado, setOcupado] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  const [gerado, setGerado] = useState<{
    token: string;
    nome: string | null;
    telefone: string | null;
  } | null>(null);

  async function gerar(e: React.FormEvent) {
    e.preventDefault();
    setOcupado(true);
    setErro(null);
    try {
      const corpo = pessoaId
        ? { acao: "gerar-link", tipo: "pessoal", pessoaId }
        : modo === "pessoa"
          ? {
              acao: "gerar-link",
              tipo: "pessoal-novo",
              nome: nomeNovo,
              telefone: telNovo,
            }
          : { acao: "gerar-link", tipo: "aberto", titulo };
      const r = (await acao(corpo)) as { convite: { token: string } };
      setGerado({
        token: r.convite.token,
        nome: pessoaId ? (nome ?? null) : modo === "pessoa" ? nomeNovo : null,
        telefone: pessoaId
          ? (telefone ?? null)
          : modo === "pessoa" && telNovo
            ? `55${telNovo.replace(/\D+/g, "")}`
            : null,
      });
      setNomeNovo("");
      setTelNovo("");
      setTitulo("");
      router.refresh();
    } catch (err) {
      setErro((err as Error).message);
    } finally {
      setOcupado(false);
    }
  }

  const campo =
    "w-full rounded-xl border border-mesa-300 bg-white px-3 py-2 text-sm text-mesa-900 focus:border-laranja-400 focus:outline-none";

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-5">
      <form onSubmit={gerar} className="space-y-3">
        {!pessoaId && (
          <div
            className="flex gap-1 rounded-full bg-bege-100 p-1 text-sm"
            role="tablist"
          >
            {(
              [
                ["pessoa", "Para uma pessoa"],
                ["grupo", "Para um grupo"],
              ] as const
            ).map(([m, rotulo]) => (
              <button
                key={m}
                type="button"
                role="tab"
                aria-selected={modo === m}
                onClick={() => setModo(m)}
                className={`flex-1 rounded-full px-3 py-1.5 font-medium transition ${
                  modo === m ? "bg-white text-mesa-900 shadow-sm" : "text-mesa-600"
                }`}
              >
                {rotulo}
              </button>
            ))}
          </div>
        )}

        {!pessoaId && modo === "pessoa" && (
          <div className="grid gap-3 sm:grid-cols-[1fr_12rem]">
            <input
              value={nomeNovo}
              onChange={(e) => setNomeNovo(e.target.value)}
              placeholder="Nome da pessoa"
              aria-label="Nome da pessoa"
              className={campo}
            />
            <input
              value={telNovo}
              onChange={(e) => setTelNovo(formatTelefoneBR(e.target.value))}
              placeholder="WhatsApp (opcional)"
              aria-label="WhatsApp da pessoa"
              inputMode="tel"
              className={campo}
            />
          </div>
        )}
        {!pessoaId && modo === "grupo" && (
          <input
            value={titulo}
            onChange={(e) => setTitulo(e.target.value)}
            placeholder="Nome do grupo (ex.: Turma EFL março)"
            aria-label="Nome do grupo"
            className={campo}
          />
        )}

        <p className="text-xs text-mesa-500">
          {pessoaId
            ? "Gera um link novo só desta pessoa. O resultado entra no histórico dela, ao lado dos anteriores."
            : modo === "pessoa"
              ? "Link pessoal: vale uma resposta e já chega com o nome preenchido."
              : "Link aberto: várias pessoas respondem; cada uma informa nome e WhatsApp, e quem já fez o teste antes cai no próprio histórico."}
        </p>

        {erro && <p className="text-sm text-erro-600">{erro}</p>}
        <button
          type="submit"
          disabled={ocupado}
          className="rounded-full bg-laranja-500 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-600 disabled:opacity-60"
        >
          {ocupado
            ? "Gerando…"
            : pessoaId
              ? "Gerar novo link para refazer o teste"
              : "Gerar link"}
        </button>
      </form>

      {gerado && (
        <div className="mt-4 rounded-xl border border-acerto-200 bg-acerto-50 p-3">
          <p className="mb-2 text-sm font-medium text-acerto-700">
            Link pronto{gerado.nome ? ` para ${primeiroNome(gerado.nome)}` : ""}:
          </p>
          <DonsCompartilhar
            token={gerado.token}
            nome={gerado.nome}
            telefone={gerado.telefone}
          />
        </div>
      )}
    </div>
  );
}

/** Encerrar / reabrir um link. */
export function DonsAlternarLink({ id, ativo }: { id: string; ativo: boolean }) {
  const router = useRouter();
  const [ocupado, setOcupado] = useState(false);
  return (
    <button
      type="button"
      disabled={ocupado}
      onClick={async () => {
        if (
          ativo &&
          !window.confirm(
            "Encerrar este link? Quem abrir não conseguirá mais responder.",
          )
        )
          return;
        setOcupado(true);
        try {
          await acao({ acao: "ativar-link", id, ativo: !ativo });
          router.refresh();
        } catch (e) {
          window.alert((e as Error).message);
        } finally {
          setOcupado(false);
        }
      }}
      className="text-xs font-medium text-mesa-600 underline-offset-2 hover:text-laranja-700 hover:underline disabled:opacity-60"
    >
      {ativo ? "Encerrar link" : "Reabrir link"}
    </button>
  );
}

type Anotacao = { id: string; texto: string; criado_em: string };

function dataHora(iso: string): string {
  return new Intl.DateTimeFormat("pt-BR", {
    timeZone: "America/Sao_Paulo",
    day: "2-digit",
    month: "short",
    year: "numeric",
    hour: "2-digit",
    minute: "2-digit",
  }).format(new Date(iso));
}

/** Acompanhamento: o que você vai registrando com a pessoa. */
export function DonsAnotacoes({
  pessoaId,
  iniciais,
}: {
  pessoaId: string;
  iniciais: Anotacao[];
}) {
  const [lista, setLista] = useState(iniciais);
  const [texto, setTexto] = useState("");
  const [ocupado, setOcupado] = useState(false);
  const [erro, setErro] = useState<string | null>(null);

  async function salvar(e: React.FormEvent) {
    e.preventDefault();
    if (!texto.trim()) return;
    setOcupado(true);
    setErro(null);
    try {
      const r = (await acao({ acao: "anotar", pessoaId, texto })) as {
        anotacao: Anotacao;
      };
      setLista((l) => [r.anotacao, ...l]);
      setTexto("");
    } catch (err) {
      setErro((err as Error).message);
    } finally {
      setOcupado(false);
    }
  }

  async function apagar(id: string) {
    if (!window.confirm("Apagar esta anotação?")) return;
    try {
      await acao({ acao: "apagar-anotacao", id });
      setLista((l) => l.filter((a) => a.id !== id));
    } catch (err) {
      window.alert((err as Error).message);
    }
  }

  return (
    <div>
      <form onSubmit={salvar} className="mb-4">
        <textarea
          value={texto}
          onChange={(e) => setTexto(e.target.value)}
          rows={3}
          placeholder="O que conversaram, o que combinaram, onde ela pode servir…"
          aria-label="Nova anotação de acompanhamento"
          className="w-full rounded-xl border border-mesa-300 bg-white px-3 py-2 text-sm text-mesa-900 focus:border-laranja-400 focus:outline-none"
        />
        {erro && <p className="mt-1 text-sm text-erro-600">{erro}</p>}
        <button
          type="submit"
          disabled={ocupado || !texto.trim()}
          className="mt-2 rounded-full bg-mesa-800 px-4 py-2 text-sm font-semibold text-white hover:bg-mesa-900 disabled:opacity-50"
        >
          {ocupado ? "Salvando…" : "Registrar"}
        </button>
      </form>
      {lista.length === 0 ? (
        <p className="text-sm text-mesa-500">Nenhuma anotação ainda.</p>
      ) : (
        <ul className="space-y-3">
          {lista.map((a) => (
            <li key={a.id} className="rounded-xl border border-mesa-200 bg-white p-3">
              <div className="mb-1 flex items-center justify-between gap-2 text-xs text-mesa-500">
                <time dateTime={a.criado_em}>{dataHora(a.criado_em)}</time>
                <button
                  type="button"
                  onClick={() => apagar(a.id)}
                  className="hover:text-erro-600"
                  aria-label="Apagar anotação"
                >
                  Apagar
                </button>
              </div>
              <p className="whitespace-pre-line text-justify hyphens-auto text-sm leading-relaxed text-mesa-800">
                {a.texto}
              </p>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

/** Corrigir nome/WhatsApp ou apagar a pessoa com todo o histórico. */
export function DonsPessoaAcoes({
  id,
  nome,
  telefone,
}: {
  id: string;
  nome: string;
  telefone: string | null;
}) {
  const router = useRouter();
  const [editando, setEditando] = useState(false);
  const [n, setN] = useState(nome);
  const [t, setT] = useState(telefone ? formatTelefoneBR(telefone) : "");
  const [erro, setErro] = useState<string | null>(null);

  async function salvar(e: React.FormEvent) {
    e.preventDefault();
    setErro(null);
    try {
      await acao({ acao: "editar-pessoa", id, nome: n, telefone: t });
      setEditando(false);
      router.refresh();
    } catch (err) {
      setErro((err as Error).message);
    }
  }

  async function apagar() {
    if (
      !window.confirm(
        `Apagar ${nome} e TODO o histórico (testes, anotações e links)? Não dá para desfazer.`,
      )
    )
      return;
    try {
      await acao({ acao: "apagar-pessoa", id });
      router.push("/admin/dons");
      router.refresh();
    } catch (err) {
      window.alert((err as Error).message);
    }
  }

  if (!editando) {
    return (
      <div className="flex gap-3 text-sm">
        <button
          type="button"
          onClick={() => setEditando(true)}
          className="font-medium text-mesa-700 hover:text-laranja-700"
        >
          Editar
        </button>
        <button
          type="button"
          onClick={apagar}
          className="font-medium text-mesa-500 hover:text-erro-600"
        >
          Apagar pessoa
        </button>
      </div>
    );
  }

  return (
    <form onSubmit={salvar} className="flex flex-wrap items-center gap-2">
      <input
        value={n}
        onChange={(e) => setN(e.target.value)}
        aria-label="Nome"
        className="rounded-xl border border-mesa-300 px-3 py-1.5 text-sm"
      />
      <input
        value={t}
        onChange={(e) => setT(formatTelefoneBR(e.target.value))}
        aria-label="WhatsApp"
        placeholder="WhatsApp"
        inputMode="tel"
        className="w-40 rounded-xl border border-mesa-300 px-3 py-1.5 text-sm"
      />
      <button
        type="submit"
        className="rounded-full bg-mesa-800 px-3 py-1.5 text-sm font-semibold text-white"
      >
        Salvar
      </button>
      <button
        type="button"
        onClick={() => setEditando(false)}
        className="text-sm text-mesa-600"
      >
        Cancelar
      </button>
      {erro && <p className="w-full text-sm text-erro-600">{erro}</p>}
    </form>
  );
}

export function DonsApagarTeste({ id }: { id: string }) {
  const router = useRouter();
  return (
    <button
      type="button"
      onClick={async () => {
        if (!window.confirm("Apagar este teste do histórico? Não dá para desfazer."))
          return;
        try {
          await acao({ acao: "apagar-teste", id });
          router.refresh();
        } catch (e) {
          window.alert((e as Error).message);
        }
      }}
      className="text-xs font-medium text-mesa-500 hover:text-erro-600"
    >
      Apagar este teste
    </button>
  );
}
