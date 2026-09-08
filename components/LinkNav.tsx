"use client";

import Link from "next/link";
import { useLinkStatus } from "next/link";
import { Girador } from "@/components/Botao";

// =============================================================
// EKBALLO ACADEMY · Navegação com retorno de pendência
//
// O problema que isto resolve: as linhas de mesa, os cards de livro
// e os capítulos são a navegação principal da plataforma, e até
// agora o toque neles não produzia sinal nenhum. O aluno tocava e
// encarava a mesma tela até a próxima chegar.
//
// Isso é pior aqui do que na média: o servidor está em Paris,
// ~267ms de ida e volta do Brasil, sem CDN (issue #54). Numa rede
// de celular, "tocar e nada acontecer" dura o bastante para a
// pessoa tocar de novo — e o toque repetido não acelera nada.
//
// `useLinkStatus` é a via oficial do Next para isso (15.3+): ele
// só pode ser chamado DENTRO de um <Link>, por isso o indicador é
// um componente próprio, filho do link, e não uma prop.
//
// Cuidado deliberado: o indicador espera 120ms antes de aparecer.
// Navegação para página já em cache resolve em poucos milissegundos,
// e um girador que pisca por 40ms lê como defeito, não como
// resposta. Quem responde ao toque imediato é o afundar do
// `.pressiona` (120ms); o girador é para quando a espera é real.
// =============================================================

/**
 * Indicador de pendência. Precisa ser filho de um <Link>.
 * Troca a seta pelo girador enquanto a próxima tela é buscada.
 */
export function IndicadorLink({
  className = "",
  children,
}: {
  className?: string;
  /** O que mostrar quando NÃO está pendente (normalmente a seta). */
  children?: React.ReactNode;
}) {
  const { pending } = useLinkStatus();

  if (!pending) {
    return <span className={`linha-seta ${className}`}>{children}</span>;
  }

  return (
    <span
      className={`inline-flex animate-surgir opacity-0 ${className}`}
      style={{ animationDelay: "120ms" }}
      role="status"
      aria-label="Abrindo"
    >
      <Girador className="h-4 w-4 text-laranja-500" />
    </span>
  );
}

type Props = React.ComponentProps<typeof Link> & {
  /** Conteúdo do lado direito: seta, contador, selo. */
  indicador?: React.ReactNode;
  className?: string;
};

/**
 * Link de linha de lista (mesa, capítulo, anotação, livro).
 *
 * Junta três respostas que antes não existiam:
 * - afunda ao toque (120ms, antes de qualquer ida ao servidor);
 * - a seta avança no hover, dizendo para onde leva;
 * - vira girador enquanto a próxima tela carrega.
 */
export function LinkNav({ indicador, className = "", children, ...resto }: Props) {
  return (
    <Link className={`linha-nav pressiona ${className}`} {...resto}>
      {children}
      <IndicadorLink className="flex-none">{indicador}</IndicadorLink>
    </Link>
  );
}

/** Seta padrão das linhas de lista. */
export function Seta({ className = "" }: { className?: string }) {
  return (
    <svg
      className={`h-4 w-4 ${className}`}
      viewBox="0 0 16 16"
      fill="none"
      aria-hidden="true"
    >
      <path
        d="M3 8h10m0 0-4-4m4 4-4 4"
        stroke="currentColor"
        strokeWidth="1.6"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  );
}
