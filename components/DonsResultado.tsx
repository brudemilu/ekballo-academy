import {
  FAIXAS_DOM,
  FAIXAS_VIDA,
  nivelDaFaixa,
  type Pontuacao,
  type ResultadoDons,
} from "@/lib/dons";

// Desenha o resultado do Teste de Dons a partir do retrato gravado
// (`resultado_exibido`). Serve aos dois lados: a pessoa vê isto ao
// terminar, e o master vê o MESMO desenho na ficha — o que apareceu
// para ela, não um recálculo.
//
// Sem "use client" e sem estado: funciona dentro de componente de
// servidor e de cliente.

// Cinco níveis, do mais apagado ao mais forte (faixa 0 → 4).
const COR_BARRA = [
  "bg-bege-300",
  "bg-bege-500",
  "bg-laranja-200",
  "bg-laranja-400",
  "bg-laranja-600",
];

// "Apóstolo, Profeta e Mestre" — empate entre vários fica natural.
function juntar(nomes: string[]): string {
  return new Intl.ListFormat("pt-BR", { style: "long", type: "conjunction" }).format(
    nomes,
  );
}

function Delta({ atual, anterior }: { atual: number; anterior?: number }) {
  if (anterior === undefined || anterior === atual) return null;
  const d = atual - anterior;
  return (
    <span
      className={`ml-1 text-[11px] font-medium ${d > 0 ? "text-acerto-600" : "text-erro-600"}`}
      title="Diferença para o teste anterior"
    >
      {d > 0 ? `+${d}` : d}
    </span>
  );
}

export function DonsResultado({
  resultado,
  anterior,
  compacto = false,
}: {
  resultado: ResultadoDons;
  /** Pontuação do teste anterior da mesma pessoa, para mostrar a evolução. */
  anterior?: Pontuacao | null;
  compacto?: boolean;
}) {
  const ordenados = [...resultado.dons].sort((a, b) => b.pontos - a.pontos);
  const nivelVida = nivelDaFaixa(resultado.vida.pontos, FAIXAS_VIDA);

  return (
    <div className="space-y-6">
      <div className="grid gap-3 sm:grid-cols-2">
        <div className="rounded-2xl border border-laranja-200 bg-laranja-50 p-4">
          <p className="text-xs font-medium uppercase tracking-[0.18em] text-laranja-700">
            {resultado.primarios.length > 1 ? "Dons primários" : "Dom primário"}
          </p>
          <p className="mt-1 font-serif text-2xl font-semibold text-mesa-900">
            {juntar(resultado.primarios)}
          </p>
        </div>
        <div className="rounded-2xl border border-bege-200 bg-bege-100 p-4">
          <p className="text-xs font-medium uppercase tracking-[0.18em] text-bege-600">
            {resultado.secundarios.length > 1 ? "Dons secundários" : "Dom secundário"}
          </p>
          <p className="mt-1 font-serif text-2xl font-semibold text-mesa-900">
            {resultado.secundarios.length > 0 ? juntar(resultado.secundarios) : "—"}
          </p>
        </div>
      </div>

      <section aria-label="Pontuação por dom ministerial">
        <h3 className="mb-3 text-sm font-semibold text-mesa-800">
          Dons ministeriais{" "}
          <span className="font-normal text-mesa-500">(de 0 a 120)</span>
        </h3>
        <ul className="space-y-3">
          {ordenados.map((d) => {
            const nivel = nivelDaFaixa(d.pontos, FAIXAS_DOM);
            return (
              <li key={d.dom}>
                <div className="flex items-baseline justify-between gap-3">
                  <span className="font-medium text-mesa-900">{d.nome}</span>
                  <span className="tabular-nums text-sm text-mesa-700">
                    {d.pontos}
                    <Delta atual={d.pontos} anterior={anterior?.dons[d.dom]} />
                  </span>
                </div>
                <div className="mt-1 h-2.5 overflow-hidden rounded-full bg-bege-100">
                  <div
                    className={`h-full rounded-full ${COR_BARRA[nivel]}`}
                    style={{ width: `${Math.round((d.pontos / d.maximo) * 100)}%` }}
                  />
                </div>
                {!compacto && <p className="mt-1 text-sm text-mesa-600">{d.faixa}</p>}
              </li>
            );
          })}
        </ul>
      </section>

      <section
        aria-label="Vida ministerial"
        className="rounded-2xl border border-mesa-200 bg-white p-4"
      >
        <div className="flex items-baseline justify-between gap-3">
          <h3 className="text-sm font-semibold text-mesa-800">
            Vida ministerial{" "}
            <span className="font-normal text-mesa-500">(de 0 a 40)</span>
          </h3>
          <span className="tabular-nums text-sm text-mesa-700">
            {resultado.vida.pontos}
            <Delta atual={resultado.vida.pontos} anterior={anterior?.vida} />
          </span>
        </div>
        <div className="mt-1 h-2.5 overflow-hidden rounded-full bg-bege-100">
          <div
            className={`h-full rounded-full ${COR_BARRA[nivelVida]}`}
            style={{
              width: `${Math.round((resultado.vida.pontos / resultado.vida.maximo) * 100)}%`,
            }}
          />
        </div>
        <p className="mt-1 text-sm text-mesa-600">{resultado.vida.faixa}</p>
      </section>

      {!compacto && (
        <details className="rounded-2xl border border-mesa-200 bg-white p-4 text-sm text-mesa-700">
          <summary className="cursor-pointer font-medium text-mesa-800">
            Como ler as faixas
          </summary>
          <div className="mt-3 grid gap-4 sm:grid-cols-2">
            <div>
              <p className="mb-1 font-semibold text-mesa-800">Cada dom</p>
              <ul className="space-y-1">
                {FAIXAS_DOM.map((f) => (
                  <li key={f.min}>
                    <span className="tabular-nums font-medium">
                      {f.min}–{f.max}
                    </span>{" "}
                    {f.texto}
                  </li>
                ))}
              </ul>
            </div>
            <div>
              <p className="mb-1 font-semibold text-mesa-800">Vida ministerial</p>
              <ul className="space-y-1">
                {FAIXAS_VIDA.map((f) => (
                  <li key={f.min}>
                    <span className="tabular-nums font-medium">
                      {f.min}–{f.max}
                    </span>{" "}
                    {f.texto}
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </details>
      )}
    </div>
  );
}
