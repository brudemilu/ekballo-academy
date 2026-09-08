// =============================================================
// EKBALLO ACADEMY · Esqueletos de carregamento
//
// Um esqueleto não é um "carregando" bonito: é uma PROMESSA DE
// FORMATO. Ele diz "o conteúdo está vindo e vai ocupar exatamente
// este desenho", e por isso a tela não pula quando o conteúdo chega.
// Um retângulo genérico no meio da página informa menos que a
// moldura do card que vai aparecer ali.
//
// Por que isso importa aqui em particular: o servidor está em Paris
// (~267ms de ida e volta do Brasil, sem CDN — ver issue #54). Toda
// navegação tem um vão perceptível. O esqueleto ocupa esse vão.
//
// Regra ao criar um novo: copie a estrutura do componente real,
// troque texto por `.esqueleto-linha` e imagem por bloco. Se o
// esqueleto e a tela real não tiverem a mesma altura, o conteúdo
// "pula" na chegada — que é pior do que não ter esqueleto nenhum.
// =============================================================

import { Logo } from "@/components/Logo";

/** Bloco retangular. Use para imagem, avatar, botão. */
export function Bloco({ className = "" }: { className?: string }) {
  return <div className={`esqueleto ${className}`} />;
}

/**
 * Parágrafo falso. A última linha nasce mais curta (regra no CSS),
 * como parágrafo de verdade — detalhe pequeno que evita o ar de
 * "três barras cinzas empilhadas".
 */
export function Linhas({
  quantidade = 3,
  className = "",
}: {
  quantidade?: number;
  className?: string;
}) {
  return (
    <div className={`space-y-2 ${className}`}>
      {Array.from({ length: quantidade }, (_, i) => (
        <div key={i} className="esqueleto esqueleto-linha" />
      ))}
    </div>
  );
}

/**
 * Card do painel do aluno: tarja de acento à esquerda, etiqueta,
 * título, descrição e o botão redondo de seta.
 */
export function CardPainel() {
  return (
    <div className="relative overflow-hidden rounded-2xl border border-mesa-200 bg-white p-6">
      <div className="esqueleto absolute inset-y-0 left-0 w-1 rounded-none" />
      <div className="flex items-center justify-between gap-4">
        <div className="min-w-0 flex-1">
          <div className="esqueleto h-2.5 w-20 rounded-full" />
          <div className="esqueleto mt-3 h-5 w-48 max-w-full" />
          <div className="esqueleto mt-3 h-3 w-64 max-w-full" />
        </div>
        <div className="esqueleto h-11 w-11 flex-none rounded-full" />
      </div>
    </div>
  );
}

/**
 * Linha de mesa / capítulo: o círculo com o número, o título e a seta.
 */
export function LinhaMesa() {
  return (
    <div className="flex items-center gap-4 rounded-2xl border border-mesa-200 bg-white px-5 py-4">
      <div className="esqueleto h-11 w-11 flex-none rounded-full" />
      <div className="esqueleto h-4 flex-1" style={{ maxWidth: "22rem" }} />
      <div className="esqueleto h-3 w-3 flex-none rounded-sm" />
    </div>
  );
}

/** Card de livro na estante: capa em pé (proporção de livro) e título. */
export function CardLivro() {
  return (
    <div>
      <div className="esqueleto aspect-[2/3] w-full rounded-xl" />
      <div className="esqueleto mt-3 h-3.5 w-11/12" />
      <div className="esqueleto mt-2 h-3 w-2/3" />
    </div>
  );
}

/**
 * Página de leitura: título, subtítulo e a mancha de texto.
 * As larguras variam de propósito — bloco de linhas idênticas
 * denuncia que é falso.
 */
export function Leitura() {
  return (
    <div>
      <div className="esqueleto h-2.5 w-24 rounded-full" />
      <div className="esqueleto mt-4 h-9 w-3/4" />
      <div className="esqueleto mt-3 h-4 w-1/2" />
      <div className="mt-10 space-y-6">
        {[5, 4, 6, 3].map((n, i) => (
          <Linhas key={i} quantidade={n} />
        ))}
      </div>
    </div>
  );
}

/**
 * Moldura de página: a faixa de título que quase toda tela do aluno
 * tem, para o cabeçalho não aparecer do nada depois do conteúdo.
 */
export function Cabecalho() {
  return (
    <div>
      <div className="esqueleto h-2.5 w-28 rounded-full" />
      <div className="esqueleto mt-4 h-10 w-2/3 max-w-md" />
      <div className="esqueleto mt-4 h-3.5 w-full max-w-xl" />
      <div className="esqueleto mt-2 h-3.5 w-4/5 max-w-lg" />
    </div>
  );
}

/**
 * Repetidor. Evita `Array.from` espalhado por todo `loading.tsx`.
 * `aria-hidden` porque esqueleto é ruído para leitor de tela — quem
 * anuncia o carregamento é o `role="status"` de `TelaCarregando`.
 */
export function Repete({
  vezes,
  children,
  className = "",
}: {
  vezes: number;
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <div className={className} aria-hidden="true">
      {Array.from({ length: vezes }, (_, i) => (
        <div key={i}>{children}</div>
      ))}
    </div>
  );
}

/**
 * Casca de tela carregando. Envolve qualquer conjunto de esqueletos
 * e cuida de duas coisas que se esquece com facilidade:
 *
 * 1. Anuncia o carregamento a leitor de tela (`role="status"`), com
 *    o resto marcado `aria-hidden` — sem isso, quem usa leitor ouve
 *    uma enxurrada de divs vazias.
 * 2. Entra com um atraso curto. Se a resposta chegar em 100ms, o
 *    esqueleto nunca aparece; sem o atraso ele pisca e o piscar
 *    parece defeito. É o `animation-delay` com `opacity: 0` inicial.
 */
export function TelaCarregando({
  children,
  rotulo = "Carregando",
  className = "",
}: {
  children: React.ReactNode;
  rotulo?: string;
  className?: string;
}) {
  return (
    <div className={className}>
      <span role="status" aria-live="polite" className="sr-only">
        {rotulo}
      </span>
      <div
        aria-hidden="true"
        className="animate-surgir opacity-0"
        style={{ animationDelay: "140ms" }}
      >
        {children}
      </div>
    </div>
  );
}

/**
 * Casca das telas do aluno.
 *
 * O cabeçalho (logo + menu) mora dentro de cada `page.tsx`, não num
 * layout compartilhado. Um `loading.tsx` substitui a página inteira,
 * então sem reproduzir o cabeçalho aqui ele SUMIRIA a cada navegação
 * e voltaria depois — piscada que é pior do que não ter esqueleto.
 *
 * A logo é estática, então entra de verdade. Só o menu do usuário,
 * que depende da sessão, vira bloco.
 */
export function CascaAluno({
  children,
  largura = "max-w-4xl",
  rotulo,
}: {
  children: React.ReactNode;
  largura?: string;
  rotulo?: string;
}) {
  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Logo />
          <div className="flex items-center gap-3" aria-hidden="true">
            <div className="esqueleto h-8 w-24 rounded-full" />
            <div className="esqueleto h-8 w-8 rounded-full" />
          </div>
        </nav>
      </header>
      <TelaCarregando rotulo={rotulo} className={`mx-auto ${largura} px-6 py-12`}>
        {children}
      </TelaCarregando>
    </main>
  );
}
