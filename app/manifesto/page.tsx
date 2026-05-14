import Link from "next/link";
import { Logo } from "@/components/Logo";

export default function Manifesto() {
  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="border-b border-mesa-200">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-5">
          <Link href="/">
            <Logo />
          </Link>
          <Link
            href="/cadastro"
            className="rounded-full bg-mesa-700 px-5 py-2 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800"
          >
            Comece agora
          </Link>
        </nav>
      </header>

      <article className="mx-auto max-w-3xl px-6 py-20">
        <p className="mb-3 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Manifesto
        </p>
        <h1 className="mb-12 font-serif text-5xl font-semibold leading-tight text-mesa-800">
          A mesa é o método.
        </h1>

        <div className="prose-mesa text-mesa-800">
          <p>
            Discipulado não acontece num auditório. Acontece numa mesa. Onde se
            quebra o pão, onde se escuta a história do outro, onde se ora pelo
            que dói e se celebra o que floresce. A formação que transforma é
            sempre relacional.
          </p>

          <p>
            Por isso a Ekballo Academy não é apenas uma plataforma de cursos. É
            uma extensão da mesa. Um espaço onde os encontros presenciais
            continuam — através de reflexões escritas, devolutivas pastorais,
            comunidade que ora junta, materiais que aprofundam o que já foi
            partilhado.
          </p>

          <h2>Famílias fortes</h2>
          <p>
            Tudo começa em casa. Discipulado que não chega na mesa do café da
            manhã não é discipulado, é palestra. Aqui, cada conteúdo foi pensado
            para virar conversa de família, oração antes de dormir, decisão de
            casal.
          </p>

          <h2>Discípulos maduros</h2>
          <p>
            Maturidade não é tempo de igreja. É profundidade de raiz. É saber
            chorar com os que choram e alegrar-se com os que se alegram. É
            permanecer quando é mais fácil ir embora. A formação aqui mira raiz,
            não folha.
          </p>

          <h2>Mais que encontros</h2>
          <p>
            Encontros são bons. Mas encontros sem caminhada viram nostalgia. O
            que oferecemos é caminhada — semana a semana, módulo a módulo,
            discípulo a discípulo. Não é evento, é jornada.
          </p>

          <h2>Uma transformação</h2>
          <p>
            O Espírito que nos forma é o mesmo que nos envia. A transformação não
            é o fim, é o caminho. E ela não acontece sozinha — acontece em
            comunidade, à mesa, debaixo da Palavra.
          </p>

          <blockquote>
            &ldquo;Na mesa somos formados pelo Espírito, somos enviados.&rdquo;
          </blockquote>

          <p>
            Bem-vindo à mesa. Sente-se. Há lugar para você.
          </p>
        </div>

        <div className="mt-16 flex flex-col items-center gap-4 border-t border-mesa-200 pt-12 sm:flex-row sm:justify-between">
          <p className="font-serif text-lg italic text-mesa-700">
            Quer entrar na caminhada?
          </p>
          <Link
            href="/cadastro"
            className="rounded-full bg-mesa-700 px-7 py-3 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800"
          >
            Criar minha conta
          </Link>
        </div>
      </article>
    </main>
  );
}
