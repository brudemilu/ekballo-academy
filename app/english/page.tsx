import Link from "next/link";
import { Logo } from "@/components/Logo";
import { RevealOnScroll } from "@/components/RevealOnScroll";

const modules = [
  {
    title: "Módulo 1",
    subtitle: "Primeiros passos",
    description: "Cumprimentos, nome, idade, frases simples e primeira confiança para falar.",
  },
  {
    title: "Módulo 2",
    subtitle: "Meu mundo",
    description: "Família, casa, rotina, escola, hobbies e a primeira conversa sobre si.",
  },
  {
    title: "Módulo 3",
    subtitle: "Vida cotidiana",
    description: "Comida, bebidas, roupas, pedir algo e usar o inglês no dia a dia.",
  },
  {
    title: "Módulo 4",
    subtitle: "Sentimentos e ações",
    description: "Expressar emoções, narrar ações e falar com mais naturalidade.",
  },
  {
    title: "Módulo 5",
    subtitle: "Perguntas e respostas",
    description: "Aprender a responder perguntas simples e formar frases curtas com segurança.",
  },
  {
    title: "Módulo 6",
    subtitle: "Conversas básicas",
    description: "Diálogos curtos, role-play e primeira interação com outra pessoa.",
  },
  {
    title: "Módulo 7",
    subtitle: "Fé e vida diária",
    description: "Frases de fé, gratidão, esperança, oração e propósito em inglês.",
  },
  {
    title: "Módulo 8",
    subtitle: "Expressão pessoal",
    description: "Dizer o que gosta, o que sente, o que prefere e o que pensa.",
  },
  {
    title: "Módulo 9",
    subtitle: "Situações reais",
    description: "Escola, igreja, loja, viagem e comunicação prática para o mundo real.",
  },
  {
    title: "Módulo 10",
    subtitle: "Falar com confiança",
    description: "Descrever, contar histórias curtas, responder rápido e falar com mais segurança.",
  },
  {
    title: "Módulo 11",
    subtitle: "Discussão e opinião",
    description: "Concordar, discordar, explicar ideias e desenvolver uma voz mais firme.",
  },
  {
    title: "Módulo 12",
    subtitle: "Projeto final",
    description: "Apresentar a si mesmo, falar sobre fé, propósito e mostrar todo o progresso.",
  },
];

const features = [
  "Rotina diária com missão simples e progressiva",
  "Prática de fala desde o primeiro módulo",
  "Conteúdo cristão integrado com propósito e identidade",
  "Gamificação com streak, conquistas e progresso visível",
  "Experiência premium para crianças, adolescentes e adultos",
];

export default function EkballoEnglishPage() {
  return (
    <main className="min-h-screen bg-bege-50 text-bege-800">
      <header className="border-b border-bege-200 bg-bege-50/90 backdrop-blur">
        <nav className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">
          <Logo />
          <div className="flex items-center gap-3">
            <Link href="/" className="text-sm font-medium text-bege-600 transition hover:text-laranja-600">
              Voltar ao Ekballo
            </Link>
            <Link
              href="/cadastro"
              className="rounded-full bg-laranja-500 px-4 py-2 text-sm font-semibold text-white shadow-lg shadow-laranja-500/20 transition hover:bg-laranja-600"
            >
              Quero entrar
            </Link>
          </div>
        </nav>
      </header>

      <section className="relative overflow-hidden bg-gradient-to-br from-laranja-50 via-bege-50 to-bege-100">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_left,_rgba(255,90,44,0.16),_transparent_32%),radial-gradient(circle_at_bottom_right,_rgba(99,94,86,0.14),_transparent_40%)]" />
        <div className="relative mx-auto flex max-w-7xl flex-col gap-10 px-6 py-20 lg:flex-row lg:items-center lg:py-28">
          <div className="max-w-2xl">
            <p className="mb-4 inline-flex rounded-full border border-laranja-200 bg-white/70 px-4 py-1.5 text-xs font-semibold uppercase tracking-[0.2em] text-laranja-700">
              Ekballo English
            </p>
            <h1 className="font-serif text-4xl font-semibold leading-tight text-bege-800 sm:text-5xl lg:text-6xl">
              Aprender inglês com propósito, fé e confiança.
            </h1>
            <p className="mt-6 text-lg leading-relaxed text-bege-700">
              Uma experiência premium para crianças, adolescentes e adultos, com foco em fala real, rotina diária, conteúdo cristão e progresso visível.
            </p>
            <div className="mt-8 flex flex-col gap-3 sm:flex-row">
              <Link
                href="/cadastro"
                className="rounded-full bg-laranja-500 px-6 py-3 text-center font-semibold text-white shadow-xl shadow-laranja-500/25 transition hover:bg-laranja-600"
              >
                Começar agora
              </Link>
              <Link
                href="/manifesto"
                className="rounded-full border border-bege-300 bg-white/80 px-6 py-3 text-center font-semibold text-bege-800 transition hover:border-laranja-400 hover:text-laranja-700"
              >
                Conhecer a visão
              </Link>
            </div>
          </div>

          <RevealOnScroll delay={1} as="div" className="w-full max-w-xl rounded-[2rem] border border-bege-200 bg-white/85 p-8 shadow-2xl shadow-bege-700/10 backdrop-blur">
            <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-600">O que o aluno sente</p>
            <div className="mt-4 space-y-4">
              {[
                "Hoje eu consigo falar frases simples em inglês.",
                "Eu sigo uma rotina diária e vejo meu progresso.",
                "Eu aprendo com propósito, fé e confiança.",
              ].map((item) => (
                <div key={item} className="rounded-2xl border border-bege-200 bg-bege-50 p-4 text-sm leading-relaxed text-bege-700">
                  {item}
                </div>
              ))}
            </div>
          </RevealOnScroll>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-6 py-20">
        <RevealOnScroll className="max-w-3xl">
          <p className="text-sm font-semibold uppercase tracking-[0.2em] text-laranja-600">Por que Ekballo English</p>
          <h2 className="mt-3 font-serif text-3xl font-semibold text-bege-800 sm:text-4xl">
            Não é só um curso de inglês. É uma jornada de formação.
          </h2>
          <p className="mt-4 text-lg leading-relaxed text-bege-700">
            O projeto une ensino prático, fala desde o início, rotina diária, identidade cristã e uma experiência premium que se adapta a crianças, adolescentes e adultos.
          </p>
        </RevealOnScroll>

        <div className="mt-12 grid gap-6 md:grid-cols-2 xl:grid-cols-3">
          {features.map((feature, index) => (
            <RevealOnScroll key={feature} delay={index as 0 | 1 | 2} as="div" className="rounded-3xl border border-bege-200 bg-white p-6 shadow-sm shadow-bege-700/5">
              <div className="mb-4 flex h-10 w-10 items-center justify-center rounded-full bg-laranja-500 text-sm font-semibold text-white">
                {index + 1}
              </div>
              <p className="text-base leading-relaxed text-bege-700">{feature}</p>
            </RevealOnScroll>
          ))}
        </div>
      </section>

      <section className="bg-white">
        <div className="mx-auto max-w-7xl px-6 py-20">
          <RevealOnScroll className="max-w-3xl">
            <p className="text-sm font-semibold uppercase tracking-[0.2em] text-laranja-600">Estrutura do curso</p>
            <h2 className="mt-3 font-serif text-3xl font-semibold text-bege-800 sm:text-4xl">
              Do zero à fala com confiança, em 12 módulos pensados para crescer.
            </h2>
          </RevealOnScroll>

          <div className="mt-12 grid gap-6 md:grid-cols-2 xl:grid-cols-3">
            {modules.map((module, index) => (
              <RevealOnScroll key={module.title} delay={(index % 3) as 0 | 1 | 2} as="article" className="rounded-3xl border border-bege-200 bg-bege-50 p-6 shadow-sm shadow-bege-700/5">
                <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-600">{module.title}</p>
                <h3 className="mt-2 font-serif text-xl font-semibold text-bege-800">{module.subtitle}</h3>
                <p className="mt-3 text-sm leading-relaxed text-bege-700">{module.description}</p>
              </RevealOnScroll>
            ))}
          </div>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-6 py-20">
        <RevealOnScroll as="div" className="rounded-[2rem] border border-bege-200 bg-gradient-to-br from-bege-100 to-white p-10 shadow-xl shadow-bege-700/10">
          <p className="text-sm font-semibold uppercase tracking-[0.2em] text-laranja-600">Próximo passo</p>
          <h2 className="mt-3 font-serif text-3xl font-semibold text-bege-800 sm:text-4xl">
            O projeto já está sendo organizado para virar uma experiência real no sistema.
          </h2>
          <p className="mt-4 max-w-3xl text-lg leading-relaxed text-bege-700">
            Nesta primeira etapa, a proposta foi transformada em uma página de lançamento, com visão, pilares, módulos e uma experiência premium. A próxima fase é estruturar a jornada completa dentro da plataforma Ekballo.
          </p>
          <div className="mt-8 flex flex-col gap-3 sm:flex-row">
            <Link href="/cadastro" className="rounded-full bg-laranja-500 px-6 py-3 text-center font-semibold text-white transition hover:bg-laranja-600">
              Quero entrar no projeto
            </Link>
            <Link href="/" className="rounded-full border border-bege-300 px-6 py-3 text-center font-semibold text-bege-800 transition hover:border-laranja-400 hover:text-laranja-700">
              Voltar para a home
            </Link>
          </div>
        </RevealOnScroll>
      </section>
    </main>
  );
}
