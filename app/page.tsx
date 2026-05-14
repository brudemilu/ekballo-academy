import Link from "next/link";
import { Logo } from "@/components/Logo";

export default function Home() {
  return (
    <main className="min-h-screen bg-mesa-50">
      {/* Nav */}
      <header className="absolute inset-x-0 top-0 z-10">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-6">
          <Logo />
          <div className="flex items-center gap-3">
            <Link
              href="/login"
              className="hidden text-sm text-mesa-700 hover:text-mesa-900 sm:inline"
            >
              Entrar
            </Link>
            <Link
              href="/cadastro"
              className="rounded-full bg-mesa-700 px-5 py-2 text-sm font-medium text-mesa-50 transition hover:bg-mesa-800"
            >
              Comece agora
            </Link>
          </div>
        </nav>
      </header>

      {/* Hero */}
      <section className="relative overflow-hidden">
        <div
          aria-hidden
          className="absolute inset-0 -z-10 bg-gradient-to-b from-mesa-50 via-mesa-100 to-mesa-50"
        />
        <div
          aria-hidden
          className="absolute -right-32 top-32 -z-10 h-96 w-96 rounded-full bg-mesa-300/30 blur-3xl"
        />
        <div
          aria-hidden
          className="absolute -left-32 bottom-0 -z-10 h-96 w-96 rounded-full bg-oliveira-200/40 blur-3xl"
        />

        <div className="mx-auto max-w-6xl px-6 pb-20 pt-40 sm:pt-48 lg:pt-56">
          <div className="mx-auto max-w-3xl text-center">
            <p className="mb-6 inline-block rounded-full border border-mesa-300 bg-mesa-100/60 px-4 py-1.5 text-xs font-medium uppercase tracking-[0.2em] text-mesa-700 animate-fade-in">
              Discipulado · Formação · Envio
            </p>
            <h1 className="font-serif text-5xl font-semibold leading-[1.05] text-mesa-800 sm:text-6xl lg:text-7xl animate-fade-up">
              Famílias fortes.
              <br />
              <span className="text-mesa-700">Discípulos maduros.</span>
            </h1>
            <p className="mx-auto mt-8 max-w-2xl font-serif text-xl italic leading-relaxed text-mesa-700 sm:text-2xl animate-fade-up">
              Mais que encontros. Uma transformação. Na mesa somos formados pelo
              Espírito, somos enviados.
            </p>
            <div className="mt-12 flex flex-col items-center justify-center gap-4 sm:flex-row animate-fade-up">
              <Link
                href="/cadastro"
                className="rounded-full bg-mesa-700 px-8 py-3.5 text-base font-medium text-mesa-50 shadow-lg shadow-mesa-700/20 transition hover:bg-mesa-800"
              >
                Quero começar a caminhada
              </Link>
              <Link
                href="/manifesto"
                className="rounded-full border border-mesa-300 bg-white/60 px-8 py-3.5 text-base font-medium text-mesa-700 backdrop-blur transition hover:bg-white"
              >
                Conhecer a mesa
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* Três pilares */}
      <section className="border-t border-mesa-200 bg-white/50">
        <div className="mx-auto max-w-6xl px-6 py-24">
          <div className="mx-auto mb-16 max-w-2xl text-center">
            <p className="mb-3 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
              Três passos da formação
            </p>
            <h2 className="font-serif text-3xl font-semibold text-mesa-800 sm:text-4xl">
              Mesa, Formação, Envio
            </h2>
          </div>

          <div className="grid gap-6 md:grid-cols-3">
            {[
              {
                num: "01",
                title: "Mesa",
                text: "O encontro começa onde sempre começou: na mesa. Comunidade, escuta, partilha do pão, oração. Aqui não há aluno e professor — há discípulos diante do Mestre.",
              },
              {
                num: "02",
                title: "Formação",
                text: "Cursos, livros, atividades de reflexão escrita com devolutiva pastoral. Cada resposta é lida, cada caminhada acompanhada. A formação não é informação — é transformação.",
              },
              {
                num: "03",
                title: "Envio",
                text: "Quem é formado é enviado. A maturidade não é destino, é envio. Cada disciplado se torna fonte. Cada família, multiplicação. Cada encontro, semente.",
              },
            ].map((p) => (
              <article
                key={p.num}
                className="group rounded-2xl border border-mesa-200 bg-mesa-50/60 p-8 transition hover:border-mesa-300 hover:bg-white hover:shadow-lg hover:shadow-mesa-700/5"
              >
                <div className="mb-6 font-serif text-sm font-medium tracking-wider text-mesa-400">
                  {p.num}
                </div>
                <h3 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
                  {p.title}
                </h3>
                <p className="text-[15px] leading-relaxed text-mesa-700">
                  {p.text}
                </p>
              </article>
            ))}
          </div>
        </div>
      </section>

      {/* O que tem na plataforma */}
      <section className="bg-mesa-50">
        <div className="mx-auto max-w-6xl px-6 py-24">
          <div className="grid gap-16 lg:grid-cols-2 lg:items-center">
            <div>
              <p className="mb-3 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
                Como funciona
              </p>
              <h2 className="mb-6 font-serif text-3xl font-semibold text-mesa-800 sm:text-4xl">
                Uma plataforma para a caminhada inteira.
              </h2>
              <p className="mb-8 text-lg leading-relaxed text-mesa-700">
                Cursos de discipulado, livros com questões de reflexão, atividades
                escritas com devolutiva do líder. Tudo num só lugar, no seu ritmo,
                com a comunidade Ekballo ao redor.
              </p>
              <ul className="space-y-4">
                {[
                  "Cursos gratuitos para entrar na mesa, cursos profundos para quem quer ir além",
                  "Atividades de reflexão escrita — você responde, seu líder lê e devolve",
                  "Acompanhamento por turma, no seu ritmo, no seu tempo",
                  "Acesso pelo celular ou computador, sem instalar nada",
                ].map((item, i) => (
                  <li key={i} className="flex items-start gap-3">
                    <svg
                      className="mt-1 h-5 w-5 flex-none text-mesa-400"
                      viewBox="0 0 20 20"
                      fill="currentColor"
                    >
                      <path
                        fillRule="evenodd"
                        d="M16.704 5.296a1 1 0 010 1.414l-7.5 7.5a1 1 0 01-1.414 0l-3.5-3.5a1 1 0 111.414-1.414L8.5 12.086l6.79-6.79a1 1 0 011.414 0z"
                        clipRule="evenodd"
                      />
                    </svg>
                    <span className="text-mesa-700">{item}</span>
                  </li>
                ))}
              </ul>
            </div>

            <div className="relative">
              <div className="absolute inset-0 -m-2 rounded-3xl bg-gradient-to-br from-mesa-300/20 via-oliveira-200/20 to-mesa-100 blur-2xl" />
              <div className="relative overflow-hidden rounded-2xl border border-mesa-200 bg-white shadow-2xl shadow-mesa-700/10">
                <div className="border-b border-mesa-100 bg-mesa-50 px-6 py-4">
                  <div className="flex items-center gap-2">
                    <div className="h-2.5 w-2.5 rounded-full bg-mesa-300" />
                    <div className="h-2.5 w-2.5 rounded-full bg-mesa-200" />
                    <div className="h-2.5 w-2.5 rounded-full bg-mesa-200" />
                    <div className="ml-3 text-xs text-mesa-500">
                      academy.ekballo.com.br/cursos/fundamentos
                    </div>
                  </div>
                </div>
                <div className="space-y-5 p-8">
                  <div>
                    <p className="mb-1 text-xs font-medium uppercase tracking-wider text-mesa-500">
                      Aula 03 · Reflexão
                    </p>
                    <h4 className="font-serif text-xl font-semibold text-mesa-800">
                      O que significa para você &ldquo;ser enviado&rdquo;?
                    </h4>
                  </div>
                  <div className="rounded-lg border border-mesa-100 bg-mesa-50/50 p-4 text-sm text-mesa-700">
                    Sua resposta aqui... O líder vai ler e te responder em até 48h.
                  </div>
                  <div className="flex items-center justify-between text-xs text-mesa-500">
                    <span>Atividade salva automaticamente</span>
                    <span className="text-oliveira-600">● Sua jornada continua</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA final */}
      <section className="border-t border-mesa-200 bg-gradient-to-b from-mesa-100 to-mesa-200">
        <div className="mx-auto max-w-3xl px-6 py-24 text-center">
          <h2 className="mb-6 font-serif text-4xl font-semibold leading-tight text-mesa-800 sm:text-5xl">
            A mesa está posta.
          </h2>
          <p className="mx-auto mb-10 max-w-xl text-lg text-mesa-700">
            Crie sua conta gratuita, escolha seu primeiro curso, sente-se à mesa.
            O Espírito faz o resto.
          </p>
          <Link
            href="/cadastro"
            className="inline-block rounded-full bg-mesa-700 px-10 py-4 text-base font-medium text-mesa-50 shadow-xl shadow-mesa-700/20 transition hover:bg-mesa-800"
          >
            Criar minha conta gratuita
          </Link>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-mesa-200 bg-mesa-50">
        <div className="mx-auto flex max-w-6xl flex-col items-center justify-between gap-4 px-6 py-10 sm:flex-row">
          <Logo />
          <p className="text-center text-xs text-mesa-500 sm:text-right">
            © {new Date().getFullYear()} Ekballo Academy. Feito com fé e código.
          </p>
        </div>
      </footer>
    </main>
  );
}
