"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import { coresDaLogo } from "@/lib/cores-da-logo";
import {
  type ContaCadastrada,
  diasAteVencer,
  rotuloDaConta,
} from "@/lib/instagram-contas";

/**
 * Aba Contas do Instagram (issue #264): os perfis que o painel opera. Cada um
 * tem o seu calendário, os seus posts, o seu perfil de conteúdo e o seu piloto.
 * Conectar é colar o token: o sistema confere no Instagram e descobre o @.
 */

const CAMPO =
  "w-full rounded-lg border border-mesa-200 bg-white px-3 py-2 text-mesa-800 outline-none focus:border-laranja-500";
const ROTULO = "mb-1 block text-sm font-medium text-mesa-700";
const BOTAO_PRIMARIO =
  "rounded-full bg-laranja-600 px-5 py-2 text-sm font-semibold text-white hover:bg-laranja-700 disabled:opacity-60";
const BOTAO_SECUNDARIO =
  "rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-100 disabled:opacity-60";

/** Abaixo disso, a tela avisa que o token está para vencer. */
const AVISAR_COM_DIAS = 10;

async function chamar(metodo: "POST" | "PATCH", corpo: object) {
  const res = await fetch("/api/admin/instagram/contas", {
    method: metodo,
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(corpo),
  });
  const d = await res.json().catch(() => ({}));
  if (!res.ok) throw new Error(d?.error || "Algo deu errado. Tente de novo.");
  return d as { contas: ContaCadastrada[] };
}

function Situacao({ conta, hoje }: { conta: ContaCadastrada; hoje: string }) {
  if (!conta.conectada) {
    return (
      <span className="rounded-full border border-amber-300 bg-amber-50 px-3 py-1 text-xs font-medium text-amber-800">
        Sem token: ainda não publica
      </span>
    );
  }
  const dias = diasAteVencer(conta.expira_em, new Date(hoje));
  if (dias !== null && dias < 0) {
    return (
      <span className="rounded-full border border-red-200 bg-red-50 px-3 py-1 text-xs font-medium text-red-700">
        O token deve ter vencido: cole um novo
      </span>
    );
  }
  if (dias !== null && dias <= AVISAR_COM_DIAS) {
    return (
      <span className="rounded-full border border-amber-300 bg-amber-50 px-3 py-1 text-xs font-medium text-amber-800">
        Conectada · o token vence em cerca de {dias} {dias === 1 ? "dia" : "dias"}
      </span>
    );
  }
  return (
    <span className="rounded-full border border-oliveira-300 bg-oliveira-50 px-3 py-1 text-xs font-medium text-oliveira-800">
      Conectada
      {dias !== null && ` · token vale por mais uns ${dias} dias`}
    </span>
  );
}

function CartaoDaConta({
  conta,
  emUso,
  hoje,
  aoMudar,
}: {
  conta: ContaCadastrada;
  emUso: boolean;
  hoje: string;
  aoMudar: (contas: ContaCadastrada[]) => void;
}) {
  const [nome, setNome] = useState(conta.nome);
  const [assinatura, setAssinatura] = useState(conta.assinatura);
  const [legendaLogo, setLegendaLogo] = useState(conta.logo_legenda);
  const temCores = Boolean(conta.cor_destaque && conta.cor_fundo && conta.cor_texto);
  const [cores, setCores] = useState({
    destaque: conta.cor_destaque || "#C0562B",
    fundo: conta.cor_fundo || "#14203A",
    texto: conta.cor_texto || "#FBF5E6",
  });
  const mudouCores =
    cores.destaque.toUpperCase() !== (conta.cor_destaque || "").toUpperCase() ||
    cores.fundo.toUpperCase() !== (conta.cor_fundo || "").toUpperCase() ||
    cores.texto.toUpperCase() !== (conta.cor_texto || "").toUpperCase();

  // Lê a logo num quadro invisível e tira dela as cores (lib/cores-da-logo.ts).
  async function usarCoresDaLogo() {
    setErro("");
    setFeito("");
    try {
      const img = new Image();
      img.crossOrigin = "anonymous";
      await new Promise<void>((ok, falhou) => {
        img.onload = () => ok();
        img.onerror = () => falhou(new Error("Não consegui abrir a logo."));
        img.src = conta.logo_url;
      });
      const quadro = document.createElement("canvas");
      // Pequeno de propósito: as cores são as mesmas e a leitura é imediata.
      quadro.width = 160;
      quadro.height = Math.max(1, Math.round((160 * img.height) / img.width));
      const ctx = quadro.getContext("2d");
      if (!ctx) throw new Error("Este navegador não deixa ler a imagem.");
      ctx.drawImage(img, 0, 0, quadro.width, quadro.height);
      const lidas = coresDaLogo(
        ctx.getImageData(0, 0, quadro.width, quadro.height).data,
      );
      if (!lidas) {
        throw new Error(
          "Não achei na logo uma cor escura e uma cor viva. Escolha as cores à mão.",
        );
      }
      setCores(lidas);
      setFeito("Cores tiradas da logo. Confira e clique em Salvar as cores.");
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Não consegui ler as cores da logo.");
    }
  }
  const [token, setToken] = useState("");
  const [trocandoToken, setTrocandoToken] = useState(false);
  const [ocupado, setOcupado] = useState(false);
  const [erro, setErro] = useState("");
  const [feito, setFeito] = useState("");

  const mudouDados =
    nome.trim() !== conta.nome ||
    assinatura.trim() !== conta.assinatura ||
    legendaLogo.trim() !== conta.logo_legenda;

  // Envia o arquivo para o nosso Storage e grava o endereço na conta.
  async function enviarLogo(arquivo: File) {
    setOcupado(true);
    setErro("");
    setFeito("");
    try {
      const form = new FormData();
      form.append("file", arquivo);
      form.append("id", conta.id);
      const res = await fetch("/api/admin/instagram/contas/logo", {
        method: "POST",
        body: form,
      });
      const d = await res.json().catch(() => ({}));
      if (!res.ok || !d?.contas) {
        throw new Error(d?.error || "Não consegui enviar a logo.");
      }
      aoMudar(d.contas as ContaCadastrada[]);
      setFeito("Logo gravada. Ela entra em todas as artes desta conta.");
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Não consegui enviar a logo.");
    } finally {
      setOcupado(false);
    }
  }

  async function enviar(corpo: object, mensagem: string) {
    setOcupado(true);
    setErro("");
    setFeito("");
    try {
      const { contas } = await chamar("PATCH", { id: conta.id, ...corpo });
      aoMudar(contas);
      setToken("");
      setTrocandoToken(false);
      setFeito(mensagem);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao salvar.");
    } finally {
      setOcupado(false);
    }
  }

  // Sem data de vencimento, a conta principal está de pé pela configuração
  // antiga do servidor, e não por um token colado aqui.
  const peloServidor = conta.principal && conta.conectada && !conta.expira_em;

  return (
    <li className="rounded-xl border border-mesa-200 bg-white p-5">
      <div className="mb-4 flex flex-wrap items-center gap-2">
        <h3 className="font-serif text-xl font-semibold text-mesa-800">
          {rotuloDaConta(conta)}
        </h3>
        {emUso && (
          <span className="rounded-full bg-mesa-700 px-3 py-1 text-xs font-medium text-mesa-50">
            em uso agora
          </span>
        )}
        <Situacao conta={conta} hoje={hoje} />
      </div>

      <div className="grid gap-4 sm:grid-cols-2">
        <div>
          <label className={ROTULO} htmlFor={`nome-${conta.id}`}>
            Nome no painel
          </label>
          <input
            id={`nome-${conta.id}`}
            className={CAMPO}
            value={nome}
            maxLength={80}
            onChange={(e) => setNome(e.target.value)}
          />
        </div>
        <div>
          <label className={ROTULO} htmlFor={`assinatura-${conta.id}`}>
            Assinatura
          </label>
          <input
            id={`assinatura-${conta.id}`}
            className={CAMPO}
            value={assinatura}
            maxLength={40}
            onChange={(e) => setAssinatura(e.target.value)}
          />
        </div>
      </div>

      <div className="mt-4 flex flex-wrap items-end gap-4">
        <div>
          <span className={ROTULO}>Logo nas artes</span>
          <div className="flex items-center gap-3">
            {conta.logo_url ? (
              // biome-ignore lint/performance/noImgElement: miniatura da logo enviada, no Storage; next/image exigiria liberar o domínio
              <img
                src={conta.logo_url}
                alt={`Logo de ${rotuloDaConta(conta)}`}
                className="h-14 w-24 rounded-lg border border-mesa-200 bg-white object-contain p-1"
              />
            ) : (
              <span className="flex h-14 w-24 items-center justify-center rounded-lg border border-dashed border-mesa-300 text-xs text-mesa-500">
                sem logo
              </span>
            )}
            <label className={`${BOTAO_SECUNDARIO} cursor-pointer`}>
              {conta.logo_url ? "Trocar a logo" : "Enviar a logo"}
              <input
                type="file"
                accept="image/png,image/jpeg"
                className="sr-only"
                disabled={ocupado}
                onChange={(e) => {
                  const arquivo = e.target.files?.[0];
                  e.target.value = "";
                  if (arquivo) void enviarLogo(arquivo);
                }}
              />
            </label>
            {conta.logo_url && (
              <button
                type="button"
                className={BOTAO_SECUNDARIO}
                disabled={ocupado}
                onClick={() => enviar({ removerLogo: true }, "Logo removida.")}
              >
                Tirar
              </button>
            )}
          </div>
        </div>
        <div className="min-w-[12rem] flex-1">
          <label className={ROTULO} htmlFor={`legenda-logo-${conta.id}`}>
            Texto embaixo da logo
          </label>
          <input
            id={`legenda-logo-${conta.id}`}
            className={CAMPO}
            value={legendaLogo}
            maxLength={24}
            onChange={(e) => setLegendaLogo(e.target.value)}
            placeholder="Ex.: 2ª Região"
          />
        </div>
      </div>
      <p className="mt-2 text-sm leading-relaxed text-mesa-600">
        A logo entra no canto de toda arte gerada para esta conta, direto sobre o fundo.
        Envie em PNG com fundo transparente; a versão para fundo escuro é feita sozinha.
      </p>

      <div className="mt-5">
        <span className={ROTULO}>Cores das artes</span>
        <div className="flex flex-wrap items-end gap-4">
          {(
            [
              ["destaque", "Destaque"],
              ["fundo", "Fundo"],
              ["texto", "Texto"],
            ] as const
          ).map(([chave, rotulo]) => (
            <label
              key={chave}
              className="flex items-center gap-2 text-sm text-mesa-700"
            >
              <input
                type="color"
                value={cores[chave]}
                onChange={(e) => setCores((c) => ({ ...c, [chave]: e.target.value }))}
                className="h-10 w-14 cursor-pointer rounded-lg border border-mesa-200 bg-white p-1"
                aria-label={`Cor de ${rotulo.toLowerCase()}`}
              />
              {rotulo}
            </label>
          ))}
          {conta.logo_url && (
            <button
              type="button"
              className={BOTAO_SECUNDARIO}
              disabled={ocupado}
              onClick={() => void usarCoresDaLogo()}
            >
              Usar as cores da logo
            </button>
          )}
          {(mudouCores || !temCores) && (
            <button
              type="button"
              className={BOTAO_PRIMARIO}
              disabled={ocupado}
              onClick={() =>
                enviar({ cores }, "Cores salvas. Valem para todas as artes.")
              }
            >
              Salvar as cores
            </button>
          )}
          {temCores && (
            <button
              type="button"
              className={BOTAO_SECUNDARIO}
              disabled={ocupado}
              onClick={() =>
                enviar({ cores: null }, "A conta voltou às cores de sempre.")
              }
            >
              Voltar às cores de sempre
            </button>
          )}
        </div>
        <p className="mt-2 text-sm leading-relaxed text-mesa-600">
          {temCores
            ? "Estas cores valem para todas as artes desta conta, no lugar da cor escolhida em cada post."
            : "Sem cores próprias, a conta usa as de sempre, com a cor escolhida em cada post."}
        </p>
      </div>

      {peloServidor && (
        <p className="mt-4 text-sm leading-relaxed text-mesa-600">
          Esta conta está conectada pela configuração antiga do servidor. Quando o token
          vencer, cole o novo aqui: passa a valer na hora, sem mexer no servidor.
        </p>
      )}

      {trocandoToken && (
        <div className="mt-4">
          <label className={ROTULO} htmlFor={`token-${conta.id}`}>
            Token do Instagram
          </label>
          <textarea
            id={`token-${conta.id}`}
            className={`${CAMPO} font-mono text-xs`}
            rows={3}
            value={token}
            onChange={(e) => setToken(e.target.value)}
            placeholder="IGAA…"
            autoComplete="off"
            spellCheck={false}
          />
        </div>
      )}

      <div className="mt-4 flex flex-wrap items-center gap-2">
        {mudouDados && (
          <button
            type="button"
            className={BOTAO_PRIMARIO}
            disabled={ocupado || !nome.trim()}
            onClick={() =>
              enviar({ nome, assinatura, logo_legenda: legendaLogo }, "Salvo.")
            }
          >
            Salvar
          </button>
        )}
        {trocandoToken ? (
          <>
            <button
              type="button"
              className={BOTAO_PRIMARIO}
              disabled={ocupado || !token.trim()}
              onClick={() =>
                enviar({ token }, "Token conferido no Instagram e gravado.")
              }
            >
              {ocupado ? "Conferindo no Instagram…" : "Conferir e gravar o token"}
            </button>
            <button
              type="button"
              className={BOTAO_SECUNDARIO}
              disabled={ocupado}
              onClick={() => {
                setTrocandoToken(false);
                setToken("");
              }}
            >
              Cancelar
            </button>
          </>
        ) : (
          <button
            type="button"
            className={BOTAO_SECUNDARIO}
            disabled={ocupado}
            onClick={() => setTrocandoToken(true)}
          >
            {conta.conectada ? "Trocar o token" : "Conectar com um token"}
          </button>
        )}
        {conta.conectada && !peloServidor && !trocandoToken && (
          <button
            type="button"
            className={BOTAO_SECUNDARIO}
            disabled={ocupado}
            onClick={() => {
              if (
                window.confirm(
                  `Desconectar ${rotuloDaConta(conta)}? Os posts e o calendário ficam guardados, mas nada mais é publicado nesta conta até colar um token novo.`,
                )
              ) {
                void enviar({ desconectar: true }, "Conta desconectada.");
              }
            }}
          >
            Desconectar
          </button>
        )}
      </div>

      {erro && (
        <p className="mt-3 text-sm text-red-700" role="alert">
          {erro}
        </p>
      )}
      {feito && (
        <p className="mt-3 text-sm text-oliveira-800" role="status">
          {feito}
        </p>
      )}
    </li>
  );
}

export function ContasInstagram({
  contasIniciais,
  emUsoId,
  hoje,
}: {
  contasIniciais: ContaCadastrada[];
  emUsoId: string;
  /** Agora, lido no servidor (ISO): a conta dos dias não muda entre servidor e tela. */
  hoje: string;
}) {
  const router = useRouter();
  const [contas, setContas] = useState(contasIniciais);
  const [nome, setNome] = useState("");
  const [assinatura, setAssinatura] = useState("");
  const [token, setToken] = useState("");
  const [ocupado, setOcupado] = useState(false);
  const [erro, setErro] = useState("");

  function aoMudar(novas: ContaCadastrada[]) {
    setContas(novas);
    // O seletor do topo vem do servidor: atualiza junto.
    router.refresh();
  }

  async function criar(e: React.FormEvent) {
    e.preventDefault();
    setOcupado(true);
    setErro("");
    try {
      const { contas: novas } = await chamar("POST", { nome, assinatura, token });
      setNome("");
      setAssinatura("");
      setToken("");
      aoMudar(novas);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Falha ao criar a conta.");
    } finally {
      setOcupado(false);
    }
  }

  return (
    <div className="max-w-3xl">
      <ul className="mb-10 grid gap-4">
        {contas.map((c) => (
          <CartaoDaConta
            key={c.id}
            conta={c}
            emUso={c.id === emUsoId}
            hoje={hoje}
            aoMudar={aoMudar}
          />
        ))}
      </ul>

      <form
        onSubmit={criar}
        className="rounded-xl border border-mesa-200 bg-mesa-50 p-5"
      >
        <h2 className="mb-1 font-serif text-2xl font-semibold text-mesa-800">
          Adicionar uma conta
        </h2>
        <p className="mb-5 text-justify leading-relaxed text-mesa-600 hyphens-auto">
          A conta nova começa vazia, com o seu próprio calendário, perfil de conteúdo e
          piloto, sem misturar com as outras. O token pode ser colado agora ou depois;
          ao gravar, o sistema pergunta ao Instagram de quem ele é e preenche o @
          sozinho.
        </p>

        <div className="grid gap-4 sm:grid-cols-2">
          <div>
            <label className={ROTULO} htmlFor="conta-nova-nome">
              Nome no painel
            </label>
            <input
              id="conta-nova-nome"
              className={CAMPO}
              value={nome}
              maxLength={80}
              onChange={(e) => setNome(e.target.value)}
              placeholder="Ex.: 2ª Região"
              required
            />
          </div>
          <div>
            <label className={ROTULO} htmlFor="conta-nova-assinatura">
              Assinatura
            </label>
            <input
              id="conta-nova-assinatura"
              className={CAMPO}
              value={assinatura}
              maxLength={40}
              onChange={(e) => setAssinatura(e.target.value)}
              placeholder="Se ficar vazio, usa o nome"
            />
          </div>
        </div>

        <div className="mt-4">
          <label className={ROTULO} htmlFor="conta-nova-token">
            Token do Instagram (opcional agora)
          </label>
          <textarea
            id="conta-nova-token"
            className={`${CAMPO} font-mono text-xs`}
            rows={3}
            value={token}
            onChange={(e) => setToken(e.target.value)}
            placeholder="IGAA…"
            autoComplete="off"
            spellCheck={false}
          />
        </div>

        <details className="mt-4 text-sm text-mesa-600">
          <summary className="cursor-pointer font-medium text-mesa-700">
            Onde pego o token?
          </summary>
          <ol className="mt-3 list-decimal space-y-1 pl-5 leading-relaxed">
            <li>
              O perfil precisa ser profissional (Criador de conteúdo ou Comercial). Isso
              se muda no próprio aplicativo do Instagram, em Configurações.
            </li>
            <li>
              Em developers.facebook.com, abra o aplicativo que já usamos e vá em
              Instagram → Configuração da API com login do Instagram.
            </li>
            <li>
              Adicione o perfil em “Gerar tokens de acesso”, entre com a conta dele e
              autorize.
            </li>
            <li>Copie o token gerado (é longo e começa com “IG”) e cole aqui.</li>
          </ol>
          <p className="mt-3 leading-relaxed">
            Os nomes dos menus mudam de tempos em tempos. Se o Instagram recusar o
            perfil, pode faltar convidá-lo como testador do aplicativo e aceitar o
            convite na conta dele.
          </p>
          <p className="mt-3 leading-relaxed">
            O token vale cerca de 60 dias. Quando estiver perto de vencer, esta tela
            avisa.
          </p>
        </details>

        <div className="mt-5 flex flex-wrap items-center gap-3">
          <button
            type="submit"
            className={BOTAO_PRIMARIO}
            disabled={ocupado || !nome.trim()}
          >
            {ocupado
              ? token.trim()
                ? "Conferindo no Instagram…"
                : "Criando…"
              : "Adicionar conta"}
          </button>
          {erro && (
            <p className="text-sm text-red-700" role="alert">
              {erro}
            </p>
          )}
        </div>
      </form>
    </div>
  );
}
