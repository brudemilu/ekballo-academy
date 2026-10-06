// Camada que pisca atrás do conteúdo de um card enquanto há algo esperando
// (aviso de novos cadastros, issue #217).
//
// Pisca o fundo e o contorno, nunca o texto: o que está escrito precisa
// continuar legível no meio do pisca. O card que a recebe precisa de
// `relative`, e o conteúdo dele de `relative` também, para ficar por cima.
// Quem pediu menos movimento no sistema fica com a camada parada — a regra
// geral de `prefers-reduced-motion` no globals.css já cuida disso.
export function PiscaAtencao() {
  return (
    <span
      aria-hidden="true"
      className="pointer-events-none absolute inset-0 animate-pulse rounded-2xl bg-amber-200/70 ring-4 ring-amber-400/70"
    />
  );
}

/** Bolinha com onda, para o canto do card: "tem novidade aqui". */
export function PontoAtencao() {
  return (
    <span aria-hidden="true" className="relative flex h-3 w-3 flex-none">
      <span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-amber-500 opacity-75" />
      <span className="relative inline-flex h-3 w-3 rounded-full bg-amber-500" />
    </span>
  );
}
