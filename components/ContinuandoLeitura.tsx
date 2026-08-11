import Link from "next/link";
import { Logo } from "@/components/Logo";
import { DispensarLeitura } from "@/components/DispensarLeitura";
import { rotuloNumeroAula } from "@/lib/aula-numero";

export type ItemLeitura = {
  cursoId: string;
  titulo: string;
  href: string;
  capa: string | null;
  concluidas: number;
  total: number;
  proxima: { titulo: string; ordem: number } | null;
};

// Barra fina de progresso — usada aqui e no rodapé da capa dos cards da vitrine.
export function BarraProgresso({
  concluidas,
  total,
  className = "",
}: {
  concluidas: number;
  total: number;
  className?: string;
}) {
  const pct = total > 0 ? Math.round((concluidas / total) * 100) : 0;
  return (
    <div
      role="progressbar"
      aria-valuenow={pct}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-label={`${concluidas} de ${total} mesas lidas`}
      className={`h-1.5 w-full overflow-hidden rounded-full bg-mesa-200 ${className}`}
    >
      <div
        className="h-full rounded-full bg-laranja-500 transition-[width] duration-500"
        style={{ width: `${Math.max(pct, 2)}%` }}
      />
    </div>
  );
}

// "Continuando a leitura": os livros que o discípulo começou e ainda não fechou,
// do mais recente pro mais antigo. Nasceu de um problema concreto — quem lê
// vários ao mesmo tempo perdia os livros em andamento no meio de ~190 capas.
export function ContinuandoLeitura({ itens }: { itens: ItemLeitura[] }) {
  if (itens.length === 0) return null;

  return (
    <section className="mb-14">
      <div className="mb-2 flex items-baseline gap-3">
        <h2 className="font-serif text-2xl font-semibold text-mesa-900">
          Continuando a leitura
        </h2>
        <span className="rounded-full bg-laranja-100 px-2.5 py-0.5 text-xs font-semibold text-laranja-700">
          {itens.length}
        </span>
      </div>
      <p className="mb-6 text-sm leading-relaxed text-mesa-600">
        Os livros que você abriu e ainda não terminou. Toque para voltar exatamente
        de onde parou.
      </p>

      <div className="grid gap-4 sm:grid-cols-2">
        {itens.map((item) => {
          const pct =
            item.total > 0 ? Math.round((item.concluidas / item.total) * 100) : 0;
          return (
            <div key={item.cursoId} className="relative">
              <DispensarLeitura cursoId={item.cursoId} titulo={item.titulo} />
              <Link
                href={item.href}
                className="lift group relative flex items-center gap-4 overflow-hidden rounded-2xl border border-laranja-200 bg-white p-4 shadow-[0_4px_16px_-4px_rgba(38,35,32,0.08)] transition hover:border-laranja-400"
              >
                <span className="absolute inset-y-0 left-0 w-1 bg-laranja-500" aria-hidden />
                <div className="ml-1 aspect-[3/4] w-[72px] flex-none overflow-hidden rounded-lg bg-gradient-to-br from-laranja-100 via-bege-100 to-oliveira-100 ring-1 ring-mesa-200/70">
                  {item.capa ? (
                    // eslint-disable-next-line @next/next/no-img-element
                    <img
                      src={item.capa}
                      alt={item.titulo}
                      loading="lazy"
                      decoding="async"
                      className="h-full w-full object-cover"
                    />
                  ) : (
                    <div className="flex h-full items-center justify-center p-1">
                      <Logo />
                    </div>
                  )}
                </div>

                <div className="min-w-0 flex-1">
                  <h3 className="line-clamp-2 pr-6 font-serif text-[15px] font-semibold leading-snug text-mesa-900 transition-colors group-hover:text-laranja-600">
                    {item.titulo}
                  </h3>
                  {item.proxima && (
                    <p className="mt-1 line-clamp-1 text-xs text-mesa-500">
                      Retomar na mesa {rotuloNumeroAula(item.proxima)} ·{" "}
                      {item.proxima.titulo}
                    </p>
                  )}
                  <div className="mt-3">
                    <BarraProgresso concluidas={item.concluidas} total={item.total} />
                    <p className="mt-1.5 text-[11px] font-medium text-mesa-600">
                      {item.concluidas} de {item.total} mesas
                      <span className="text-mesa-400"> · </span>
                      <span className="text-laranja-700">{pct}%</span>
                    </p>
                  </div>
                </div>

                <span className="flex h-10 w-10 flex-none items-center justify-center rounded-full bg-mesa-100 text-lg text-laranja-600 transition-colors group-hover:bg-laranja-500 group-hover:text-white">
                  →
                </span>
              </Link>
            </div>
          );
        })}
      </div>
    </section>
  );
}
