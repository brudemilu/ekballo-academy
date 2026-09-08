"use client";

import { forwardRef } from "react";

// =============================================================
// EKBALLO ACADEMY · Botão com estado de progresso
//
// Existia um botão por componente, cada um resolvendo "está
// salvando" à sua maneira. O resultado era desigual: uns trocavam
// o texto, outros só desabilitavam, e vários não davam sinal
// nenhum — o aluno clicava e a tela ficava igual.
//
// Três decisões que valem explicação:
//
// 1. A LARGURA NÃO MUDA ao entrar em progresso. "Salvar" tem 6
//    letras, "Salvando…" tem 9: trocar o texto encolhe ou estica o
//    botão e o layout dá um solavanco no momento mais sensível da
//    interação. Por isso o rótulo de progresso entra por cima, em
//    camada, com o rótulo original preso no lugar e invisível.
//
// 2. `aria-busy` + região viva. Quem usa leitor de tela precisa
//    ouvir que a ação começou; sem isso o botão fica mudo.
//
// 3. Progresso NÃO é o mesmo que desabilitado. O botão ocupado
//    continua focável (só recusa clique repetido), senão o teclado
//    perde o lugar no meio do formulário.
// =============================================================

type Variante = "primario" | "secundario" | "fantasma" | "perigo";
type Tamanho = "pequeno" | "medio" | "grande";

const VARIANTES: Record<Variante, string> = {
  primario:
    "bg-laranja-500 text-white border border-transparent hover:bg-laranja-600 shadow-sm hover:shadow-md",
  secundario:
    "bg-white text-mesa-800 border border-mesa-300 hover:border-mesa-400 hover:bg-mesa-50",
  fantasma:
    "bg-transparent text-mesa-700 border border-transparent hover:bg-mesa-100",
  perigo:
    "bg-white text-red-700 border border-red-200 hover:bg-red-50 hover:border-red-300",
};

const TAMANHOS: Record<Tamanho, string> = {
  pequeno: "px-3 py-1.5 text-xs gap-1.5",
  medio: "px-4 py-2 text-sm gap-2",
  grande: "px-6 py-3 text-base gap-2.5",
};

/** Roda-viva. `currentColor` para servir a qualquer variante. */
export function Girador({ className = "" }: { className?: string }) {
  return (
    <svg
      className={`animate-spin ${className}`}
      viewBox="0 0 16 16"
      fill="none"
      aria-hidden="true"
    >
      <circle
        cx="8"
        cy="8"
        r="6.5"
        stroke="currentColor"
        strokeWidth="2"
        opacity="0.25"
      />
      <path
        d="M14.5 8A6.5 6.5 0 0 0 8 1.5"
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
      />
    </svg>
  );
}

type Props = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  variante?: Variante;
  tamanho?: Tamanho;
  /** Em progresso: mostra o girador e recusa clique repetido. */
  ocupado?: boolean;
  /** O que dizer durante o progresso. Verbo no gerúndio, mesma família do rótulo. */
  rotuloOcupado?: string;
  /** Ocupa a largura toda do container. */
  larguraTotal?: boolean;
};

export const Botao = forwardRef<HTMLButtonElement, Props>(function Botao(
  {
    variante = "primario",
    tamanho = "medio",
    ocupado = false,
    rotuloOcupado,
    larguraTotal = false,
    className = "",
    children,
    disabled,
    onClick,
    ...resto
  },
  ref,
) {
  return (
    <button
      ref={ref}
      // Ocupado não é desabilitado: o botão segue focável para o
      // teclado não perder o lugar. O clique é recusado no handler.
      aria-busy={ocupado || undefined}
      aria-disabled={ocupado || undefined}
      disabled={disabled}
      onClick={(e) => {
        if (ocupado) {
          e.preventDefault();
          return;
        }
        onClick?.(e);
      }}
      className={[
        "pressiona relative inline-flex items-center justify-center",
        "rounded-full font-medium",
        "disabled:cursor-not-allowed disabled:opacity-50",
        ocupado ? "cursor-progress" : "",
        larguraTotal ? "w-full" : "",
        VARIANTES[variante],
        TAMANHOS[tamanho],
        className,
      ]
        .filter(Boolean)
        .join(" ")}
      {...resto}
    >
      {/* O rótulo original fica no lugar, invisível, segurando a
          largura — é ele que impede o botão de encolher. */}
      <span
        className={[
          "inline-flex items-center gap-2 transition-opacity",
          ocupado ? "opacity-0" : "opacity-100",
        ].join(" ")}
        style={{ transitionDuration: "var(--dur-rapido)" }}
      >
        {children}
      </span>

      {ocupado && (
        <span className="absolute inset-0 inline-flex items-center justify-center gap-2">
          <Girador className="h-4 w-4" />
          {rotuloOcupado && <span>{rotuloOcupado}</span>}
        </span>
      )}
    </button>
  );
});
