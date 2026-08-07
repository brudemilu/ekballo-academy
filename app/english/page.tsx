import Link from "next/link";
import { Logo } from "@/components/Logo";
import { getCurrentSession } from "@/lib/db";
import { listTrilha } from "@/lib/english";

// A vitrine mostra a coisa em vez de descrevê-la. O herói é um espécime real
// de lição — a mesma composição que o aluno vê ao praticar. Quem chega
// entende em dois segundos o que vai fazer, o que nenhum parágrafo de
// "experiência premium" entrega.
const AMOSTRA = { en: "Good morning", dica: "gud mór-nin", pt: "Bom dia" };

// Os seis tipos de exercício são o que o curso realmente faz. Listá-los é
// mais honesto e mais concreto que enumerar benefícios.
const EXERCICIOS = [
  { nome: "Vocabulário", desc: "A palavra, o som e a pronúncia aproximada." },
  { nome: "Escolha", desc: "Qual frase serve para a situação." },
  { nome: "Tradução", desc: "Escrever em inglês o que se pede." },
  { nome: "Ditado", desc: "Ouvir e escrever o que foi dito." },
  { nome: "Montar frase", desc: "Ordenar as palavras até a frase fechar." },
  { nome: "Fala", desc: "Dizer em voz alta — e o app confere." },
];

const NIVEIS = [
  { rotulo: "Iniciante", faixa: "Módulos 1 a 4", resumo: "Cumprimentar, falar da própria vida, nomear o dia a dia e dizer o que sente." },
  { rotulo: "Básico", faixa: "Módulos 5 a 8", resumo: "Responder perguntas, sustentar conversa, viver a fé em inglês e se posicionar." },
  { rotulo: "Intermediário", faixa: "Módulos 9 a 12", resumo: "Resolver situações reais, narrar, discordar com respeito e se apresentar por inteiro." },
];

export default async function EkballoEnglishPage() {
  const session = await getCurrentSession();
  const trilha = await listTrilha(session?.userId ?? null);

  const modulos = trilha.filter((m) => m.publicado && m.licoes.length > 0);
  const totalLicoes = modulos.reduce((s, m) => s + m.licoes.length, 0);

  const entrarHref = session ? "/english/jornada" : "/cadastro";
  const entrarLabel = session ? "Ir para a minha trilha" : "Começar agora";

  return (
    <main className="min-h-screen bg-bege-50 text-mesa-800">
      <header className="border-b border-mesa-200 bg-bege-50/90 backdrop-blur">
        <nav className="mx-auto flex max-w-5xl items-center justify-between px-4 py-4 sm:px-6">
          <Logo />
          <div className="flex items-center gap-4">
            <Link href="/" className="font-ui text-sm font-medium text-mesa-600 transition hover:text-laranja-600">
              Voltar ao Ekballo
            </Link>
            <Link
              href={entrarHref}
              className="rounded-full bg-laranja-500 px-4 py-2 font-ui text-sm font-semibold text-white transition hover:bg-laranja-600"
            >
              {entrarLabel}
            </Link>
          </div>
        </nav>
      </header>

      {/* ---------- herói: o espécime ---------- */}
      <section className="mx-auto max-w-5xl px-4 pb-16 pt-14 sm:px-6 sm:pb-24 sm:pt-20">
        <div className="grid items-center gap-12 lg:grid-cols-[1fr_minmax(0,26rem)]">
          <div>
            <p className="font-ui text-xs font-semibold uppercase tracking-[0.25em] text-laranja-600">
              Ekballo English
            </p>
            <h1 className="mt-4 font-display text-4xl font-semibold leading-[1.05] tracking-[-0.02em] text-mesa-900 sm:text-5xl lg:text-6xl">
              Aprender inglês com propósito, fé e confiança.
            </h1>
            <p className="mt-6 max-w-xl font-ui text-lg leading-relaxed text-mesa-600">
              Cinco minutos por dia. Uma lição de cada vez, com a pronúncia gravada em toda
              frase e prática de fala desde o primeiro módulo.
            </p>
            <div className="mt-8 flex flex-col gap-3 sm:flex-row">
              <Link
                href={entrarHref}
                className="rounded-full bg-laranja-500 px-7 py-3.5 text-center font-ui font-semibold text-white transition hover:bg-laranja-600"
              >
                {entrarLabel}
              </Link>
              <Link
                href="/manifesto"
                className="rounded-full border border-mesa-300 px-7 py-3.5 text-center font-ui font-semibold text-mesa-800 transition hover:border-laranja-400 hover:text-laranja-700"
              >
                Conhecer a visão
              </Link>
            </div>
          </div>

          {/* O cartão é a lição de verdade, na mesma composição do app. */}
          <div className="rounded-[1.75rem] border border-mesa-200 bg-white px-6 py-10 text-center shadow-xl shadow-mesa-800/5 sm:px-10">
            <p className="font-ui text-xs font-semibold uppercase tracking-[0.2em] text-mesa-400">
              Módulo 1 · Lição 1
            </p>
            <p lang="en" className="mt-6 font-display text-5xl font-semibold leading-[0.95] tracking-[-0.03em] text-mesa-900">
              {AMOSTRA.en}
            </p>
            <p className="mt-4 font-ui text-sm font-semibold uppercase tracking-[0.3em] text-laranja-600">
              {AMOSTRA.dica}
            </p>
            <p className="mt-5 font-ui text-base text-mesa-500">{AMOSTRA.pt}</p>
            <span className="mt-7 inline-flex items-center gap-2 rounded-full border border-laranja-300 bg-laranja-50 px-6 py-3 font-ui font-semibold text-laranja-700">
              🔊 Ouvir
            </span>
          </div>
        </div>
      </section>

      {/* ---------- números reais ---------- */}
      <section className="border-y border-mesa-200 bg-white">
        <dl className="mx-auto grid max-w-5xl grid-cols-2 gap-y-8 px-4 py-12 sm:grid-cols-4 sm:px-6">
          {[
            { n: modulos.length || 12, r: "módulos" },
            { n: totalLicoes || 72, r: "lições" },
            { n: 6, r: "tipos de exercício" },
            { n: "100%", r: "das frases com áudio" },
          ].map((item) => (
            <div key={item.r} className="text-center">
              <dt className="font-display text-4xl font-semibold text-mesa-900">{item.n}</dt>
              <dd className="mt-1 font-ui text-sm text-mesa-500">{item.r}</dd>
            </div>
          ))}
        </dl>
      </section>

      {/* ---------- o que se faz numa lição ---------- */}
      <section className="mx-auto max-w-5xl px-4 py-16 sm:px-6 sm:py-24">
        <h2 className="font-display text-3xl font-semibold tracking-[-0.02em] text-mesa-900 sm:text-4xl">
          O que você faz numa lição
        </h2>
        <p className="mt-3 max-w-2xl font-ui text-lg leading-relaxed text-mesa-600">
          Cada lição mistura seis tipos de exercício. Vocabulário ensina e não pontua; os
          outros cinco corrigem na hora.
        </p>
        <ul className="mt-10 grid gap-x-10 gap-y-6 sm:grid-cols-2">
          {EXERCICIOS.map((e) => (
            <li key={e.nome} className="flex gap-4 border-t border-mesa-200 pt-5">
              <span className="mt-1 h-2 w-2 shrink-0 rounded-full bg-laranja-500" aria-hidden />
              <span>
                <span className="block font-display text-lg font-semibold text-mesa-900">{e.nome}</span>
                <span className="block font-ui text-mesa-600">{e.desc}</span>
              </span>
            </li>
          ))}
        </ul>
      </section>

      {/* ---------- a jornada ---------- */}
      <section className="border-t border-mesa-200 bg-white">
        <div className="mx-auto max-w-5xl px-4 py-16 sm:px-6 sm:py-24">
          <h2 className="font-display text-3xl font-semibold tracking-[-0.02em] text-mesa-900 sm:text-4xl">
            Do primeiro <span lang="en">hello</span> à sua própria apresentação
          </h2>
          <p className="mt-3 max-w-2xl font-ui text-lg leading-relaxed text-mesa-600">
            O curso tem um arco. Você começa dizendo o próprio nome e termina falando de quem
            você é, no que crê e qual é o seu propósito — em inglês, sem travar.
          </p>

          <div className="mt-12 space-y-10">
            {NIVEIS.map((nivel) => (
              <div key={nivel.rotulo} className="grid gap-2 border-t border-mesa-200 pt-6 sm:grid-cols-[minmax(0,13rem)_1fr] sm:gap-8">
                <div>
                  <p className="font-display text-xl font-semibold text-mesa-900">{nivel.rotulo}</p>
                  <p className="font-ui text-sm text-laranja-600">{nivel.faixa}</p>
                </div>
                <p className="font-ui leading-relaxed text-mesa-600">{nivel.resumo}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ---------- a fé, sem enfeite ---------- */}
      <section className="mx-auto max-w-5xl px-4 py-16 sm:px-6 sm:py-24">
        <div className="rounded-[1.75rem] bg-mesa-900 px-6 py-12 text-center text-white sm:px-16 sm:py-16">
          <p className="font-ui text-xs font-semibold uppercase tracking-[0.25em] text-laranja-300">
            Inglês com propósito
          </p>
          <p lang="en" className="mx-auto mt-6 max-w-2xl font-serif text-2xl italic leading-relaxed sm:text-3xl">
            “Go into all the world and preach the good news.”
          </p>
          <p className="mt-3 font-ui text-white/60">Ide por todo o mundo e pregai o evangelho.</p>
          <p className="mt-2 font-ui text-xs uppercase tracking-[0.2em] text-laranja-300">Mark 16:15</p>
          <p className="mx-auto mt-8 max-w-2xl font-ui leading-relaxed text-white/70">
            Cada lição abre com um versículo curto, em inglês e português. Não é decoração:
            é o vocabulário da fé entrando junto com o do dia a dia.
          </p>
          <Link
            href={entrarHref}
            className="mt-10 inline-block rounded-full bg-laranja-500 px-8 py-3.5 font-ui font-semibold text-white transition hover:bg-laranja-400"
          >
            {entrarLabel}
          </Link>
        </div>
      </section>
    </main>
  );
}
