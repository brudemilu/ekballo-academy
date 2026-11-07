"use client";

import { useRouter } from "next/navigation";
import { useEffect } from "react";
import {
  CABECALHO_CONTA,
  COOKIE_CONTA,
  type ContaCadastrada,
  rotuloDaConta,
} from "@/lib/instagram-contas";

/**
 * A conta de Instagram em uso no painel (issue #264): mostra qual é, deixa
 * trocar e garante que toda chamada desta aba vá para a conta que ela mostra.
 */

// A conta que ESTA aba está mostrando. Toda chamada às rotas do painel leva
// esse id num cabeçalho, e o servidor o respeita antes do cookie. Sem isso,
// duas janelas abertas em contas diferentes dividiriam o mesmo cookie, e a
// janela que ficou para trás salvaria — ou publicaria — na conta da outra.
let contaDaAba: string | null = null;

const ROTAS_DO_PAINEL = "/api/admin/instagram";

if (typeof window !== "undefined") {
  const w = window as typeof window & { __igContaFetch?: boolean };
  if (!w.__igContaFetch) {
    w.__igContaFetch = true;
    const original = window.fetch.bind(window);
    window.fetch = (entrada, opcoes) => {
      const url = typeof entrada === "string" ? entrada : "";
      if (!contaDaAba || !url.startsWith(ROTAS_DO_PAINEL)) {
        return original(entrada, opcoes);
      }
      const headers = new Headers(opcoes?.headers);
      headers.set(CABECALHO_CONTA, contaDaAba);
      return original(entrada, { ...opcoes, headers });
    };
  }
}

function gravarCookie(id: string) {
  // biome-ignore lint/suspicious/noDocumentCookie: gravação síncrona — o cookie precisa existir antes do refresh que vem em seguida
  document.cookie = `${COOKIE_CONTA}=${id}; path=/; max-age=31536000; samesite=lax`;
}

function lerCookie(): string {
  const achado = document.cookie
    .split("; ")
    .find((c) => c.startsWith(`${COOKIE_CONTA}=`));
  return achado ? achado.slice(COOKIE_CONTA.length + 1) : "";
}

export function SeletorContaInstagram({
  contas,
  atualId,
}: {
  contas: ContaCadastrada[];
  /** A conta com que o servidor montou esta página. */
  atualId: string;
}) {
  const router = useRouter();
  // Durante a renderização, de propósito: precisa valer antes de qualquer
  // componente da página disparar a sua primeira chamada.
  contaDaAba = atualId;

  useEffect(() => {
    // De novo aqui: a limpeza do efeito anterior (troca de conta) zera o valor.
    contaDaAba = atualId;
    // A página pode ter aberto numa conta diferente da do cookie (link do
    // aviso do piloto, ou cookie de uma conta que não existe mais): alinha o
    // cookie ao que está na tela e tira a conta do endereço, para a próxima
    // troca pelo seletor não ser desfeita por ele.
    if (lerCookie() !== atualId) gravarCookie(atualId);
    const url = new URL(window.location.href);
    if (url.searchParams.has("conta")) {
      url.searchParams.delete("conta");
      window.history.replaceState(null, "", url.toString());
    }
    return () => {
      contaDaAba = null;
    };
  }, [atualId]);

  if (contas.length < 2) return null;

  function trocar(id: string) {
    if (id === atualId) return;
    gravarCookie(id);
    // A aba continua a mesma; a ideia ou o roteiro aberto era da outra conta.
    const url = new URL(window.location.href);
    const aba = url.searchParams.get("aba");
    router.push(aba ? `/admin/instagram?aba=${aba}` : "/admin/instagram");
    router.refresh();
  }

  return (
    <fieldset className="mb-6 rounded-xl border border-mesa-200 bg-white p-3">
      <legend className="px-1 text-xs font-medium uppercase tracking-[0.15em] text-mesa-500">
        Conta em uso
      </legend>
      <div className="flex flex-wrap gap-2">
        {contas.map((c) => {
          const ativa = c.id === atualId;
          return (
            <button
              key={c.id}
              type="button"
              onClick={() => trocar(c.id)}
              aria-pressed={ativa}
              className={`rounded-full border px-4 py-2 text-sm font-semibold transition ${
                ativa
                  ? "border-laranja-600 bg-laranja-600 text-white"
                  : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
              }`}
            >
              {rotuloDaConta(c)}
              {!c.conectada && (
                <span className="ml-2 font-normal opacity-80">· sem token</span>
              )}
            </button>
          );
        })}
      </div>
    </fieldset>
  );
}
