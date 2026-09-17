"use client";

import { type ReactNode, useEffect, useMemo, useRef, useState } from "react";
import { combinaBusca } from "@/lib/busca";

// Campo de busca da vitrine de livros (issue #116).
//
// O card de cada livro continua sendo montado no servidor, onde já estavam as
// capas assinadas e o progresso de leitura; este componente recebe os cards
// prontos em `node` e só decide QUAIS aparecem. Assim o filtro não duplica o
// visual do card nem obriga a mandar dado de leitura pro cliente.
//
// Sem nada digitado, a vitrine fica exatamente como era: seções na ordem de
// `lib/categorias.ts`. Com busca, as seções somem e vira uma lista única — na
// hora de achar "Keller", saber em que prateleira ele estava não ajuda.

export type ItemBuscavel = {
  id: string;
  /** Texto pesquisável do item: título, autor, descrição, seção. */
  busca: string;
  /** O card já renderizado no servidor. */
  node: ReactNode;
};

export type GrupoBuscavel = {
  label: string;
  itens: ItemBuscavel[];
};

type Props = {
  grupos: GrupoBuscavel[];
  /** "grade" = vitrine de capas (aluno); "lista" = linhas do painel (master). */
  layout?: "grade" | "lista";
  placeholder?: string;
  /** Singular/plural do que está sendo contado. */
  substantivo?: { singular: string; plural: string };
  /**
   * Conteúdo que fica ENTRE o campo e a vitrine (atalhos, leitura em
   * andamento, estante de lidos). Some enquanto a busca está ativa: quem
   * digitou precisa ver o resultado logo abaixo do campo, não três telas
   * adiante. Fora da busca, a página fica na ordem de sempre.
   */
  antes?: ReactNode;
  /**
   * Densidade da grade. "amplo" é a vitrine do discípulo; "compacto" é a do
   * painel pastoral, que tem card e rótulo menores. Existe pra busca entrar
   * no /admin sem restilizar a vitrine que já estava lá (issue #154).
   */
  estilo?: "amplo" | "compacto";
};

// Cada tela tem a sua densidade; o componente não impõe uma.
const ESTILOS = {
  amplo: {
    grade:
      "grid grid-cols-2 gap-5 sm:grid-cols-3 md:gap-6 lg:grid-cols-4 xl:grid-cols-5",
    entreSecoes: "space-y-14",
    rotulo: "mb-6 font-serif text-2xl font-semibold text-mesa-900",
    tag: "h2",
  },
  compacto: {
    grade: "grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5",
    entreSecoes: "space-y-8",
    rotulo: "mb-3 font-serif text-lg font-semibold text-mesa-700",
    tag: "h3",
  },
} as const;

const CLASSES_LISTA = "space-y-3";

export function BuscaLivros({
  grupos,
  layout = "grade",
  placeholder = "Buscar livro por título ou autor…",
  substantivo = { singular: "livro", plural: "livros" },
  antes,
  estilo = "amplo",
}: Props) {
  const [consulta, setConsulta] = useState("");
  const campo = useRef<HTMLInputElement>(null);

  const total = useMemo(
    () => grupos.reduce((soma, g) => soma + g.itens.length, 0),
    [grupos],
  );

  const buscando = consulta.trim().length > 0;
  const encontrados = useMemo(() => {
    if (!buscando) return [];
    return grupos.flatMap((g) =>
      g.itens.filter((i) => combinaBusca(i.busca, consulta)),
    );
  }, [grupos, consulta, buscando]);

  // "/" põe o cursor no campo, como em qualquer lugar que tem busca. Só quando
  // a pessoa não está digitando em outro campo — senão a barra sumiria do texto.
  useEffect(() => {
    function atalho(e: KeyboardEvent) {
      if (e.key !== "/" || e.metaKey || e.ctrlKey || e.altKey) return;
      const alvo = e.target as HTMLElement | null;
      const tag = alvo?.tagName;
      if (tag === "INPUT" || tag === "TEXTAREA" || alvo?.isContentEditable) return;
      e.preventDefault();
      campo.current?.focus();
    }
    window.addEventListener("keydown", atalho);
    return () => window.removeEventListener("keydown", atalho);
  }, []);

  const aparencia = ESTILOS[estilo];
  const classesContainer = layout === "lista" ? CLASSES_LISTA : aparencia.grade;
  const Container = layout === "lista" ? "ul" : "div";
  const Rotulo = aparencia.tag;
  const classesEntreSecoes = layout === "lista" ? "space-y-10" : aparencia.entreSecoes;

  const contagem = buscando
    ? `${encontrados.length} ${
        encontrados.length === 1 ? substantivo.singular : substantivo.plural
      }`
    : `${total} ${total === 1 ? substantivo.singular : substantivo.plural} no acervo`;

  return (
    <div>
      <div className="mb-8 flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between">
        <div className="relative w-full sm:max-w-md">
          <span
            className="pointer-events-none absolute left-3.5 top-1/2 -translate-y-1/2 text-mesa-400"
            aria-hidden
          >
            🔎
          </span>
          <input
            ref={campo}
            type="search"
            value={consulta}
            onChange={(e) => setConsulta(e.target.value)}
            onKeyDown={(e) => {
              if (e.key === "Escape") setConsulta("");
            }}
            placeholder={placeholder}
            aria-label={placeholder}
            // O ✕ nativo do type="search" (WebKit) sai de cena: o botão de
            // limpar aqui do lado já faz isso, e os dois juntos viram dois ✕
            // colados no mesmo campo.
            className="w-full rounded-xl border border-mesa-200 bg-white py-2.5 pl-10 pr-10 text-sm text-mesa-800 outline-none transition placeholder:text-mesa-400 focus:border-laranja-400 focus:ring-2 focus:ring-laranja-100 [&::-webkit-search-cancel-button]:appearance-none"
          />
          {buscando && (
            <button
              type="button"
              onClick={() => {
                setConsulta("");
                campo.current?.focus();
              }}
              aria-label="Limpar busca"
              className="absolute right-3 top-1/2 -translate-y-1/2 text-mesa-400 transition hover:text-laranja-600"
            >
              ✕
            </button>
          )}
        </div>
        <p className="text-xs text-mesa-500" aria-live="polite">
          {contagem}
        </p>
      </div>

      {buscando ? (
        encontrados.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-300 bg-white/60 px-6 py-16 text-center">
            <p className="font-serif text-xl text-mesa-700">
              Nenhum livro com “{consulta.trim()}”.
            </p>
            <p className="mx-auto mt-2 max-w-sm text-sm leading-relaxed text-mesa-500">
              Tente parte do título ou o nome do autor — a busca ignora acento e
              maiúscula.
            </p>
          </div>
        ) : (
          <Container className={classesContainer}>
            {/* O card já vem do servidor com a `key` dele; envolver aqui só
                acrescentaria um elemento que quebraria o grid e o <ul>. */}
            {encontrados.map((item) => item.node)}
          </Container>
        )
      ) : (
        <>
          {antes}
          <div className={classesEntreSecoes}>
            {grupos.map((grupo) => (
              <section key={grupo.label}>
                {/* Rótulo vazio = lista sem seção (o painel do master já tem o
                  título da página logo acima; repetir viraria eco). */}
                {grupo.label && (
                  <Rotulo className={aparencia.rotulo}>{grupo.label}</Rotulo>
                )}
                <Container className={classesContainer}>
                  {grupo.itens.map((item) => item.node)}
                </Container>
              </section>
            ))}
          </div>
        </>
      )}
    </div>
  );
}
