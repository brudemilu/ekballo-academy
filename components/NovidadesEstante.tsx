import type { ReactNode } from "react";
import { DIAS_EM_DESTAQUE } from "@/lib/novidades";

// Faixa dos livros recém-chegados (issue #157).
//
// Assim como a busca, recebe os cards já montados no servidor em `node` — quem
// sabe desenhar o card é a página (o do discípulo e o do painel são
// diferentes), e esta faixa só cuida da moldura de destaque e do rótulo de
// quando cada livro chegou.
//
// Quando a lista vem vazia, a faixa não renderiza nada: acervo sem novidade na
// semana não deve ocupar espaço dizendo que não há novidade.

export type ItemNovidade = {
  id: string;
  /** O card já renderizado no servidor. */
  node: ReactNode;
  /** "chegou hoje", "há 3 dias"… */
  rotulo: string;
};

type Props = {
  itens: ItemNovidade[];
  /** Mesma densidade das vitrines: "amplo" no discípulo, "compacto" no painel. */
  estilo?: "amplo" | "compacto";
};

const GRADES = {
  amplo: "grid grid-cols-2 gap-5 sm:grid-cols-3 md:gap-6 lg:grid-cols-4 xl:grid-cols-5",
  compacto: "grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5",
} as const;

export function NovidadesEstante({ itens, estilo = "amplo" }: Props) {
  if (itens.length === 0) return null;

  return (
    <section className="mb-14 overflow-hidden rounded-3xl border border-laranja-200 bg-gradient-to-br from-laranja-50 via-bege-50 to-white p-6 shadow-[0_4px_16px_-4px_rgba(38,35,32,0.08)] sm:p-8">
      <div className="mb-2 flex flex-wrap items-baseline gap-3">
        <h2 className="font-serif text-2xl font-semibold text-mesa-900">
          Adicionados recentemente
        </h2>
        <span className="rounded-full bg-laranja-500 px-2.5 py-0.5 text-xs font-semibold text-white shadow-sm">
          {itens.length} {itens.length === 1 ? "novo" : "novos"}
        </span>
      </div>
      <p className="mb-7 max-w-2xl text-sm leading-relaxed text-mesa-600">
        Chegaram à estante nos últimos {DIAS_EM_DESTAQUE} dias. Cada livro fica aqui por
        uma semana a partir da entrada dele e depois segue só na vitrine.
      </p>
      <div className={GRADES[estilo]}>
        {itens.map((item) => (
          // h-full + mt-auto no rótulo: com título de uma ou duas linhas, a
          // data de chegada fica na mesma altura em todos os cards da fila.
          <div key={item.id} className="flex h-full flex-col gap-1.5">
            {item.node}
            {item.rotulo && (
              <p className="mt-auto text-[11px] font-semibold uppercase tracking-[0.12em] text-laranja-700">
                {item.rotulo}
              </p>
            )}
          </div>
        ))}
      </div>
    </section>
  );
}
