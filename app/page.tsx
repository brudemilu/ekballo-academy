import Link from "next/link";
import { Logo } from "@/components/Logo";
import { CursorGlow } from "@/components/CursorGlow";
import { RevealOnScroll } from "@/components/RevealOnScroll";
import { Marquee } from "@/components/Marquee";

// === Imagens (Unsplash) — temporárias, serão substituídas pelas fotos reais da Ekballo ===
const IMG_HERO = "https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=1600&q=80&auto=format&fit=crop";
const IMG_MESA_1 = "https://images.unsplash.com/photo-1543269865-cbf427effbad?w=900&q=80&auto=format&fit=crop";
const IMG_MESA_2 = "https://images.unsplash.com/photo-1511632765486-a01980e01a18?w=900&q=80&auto=format&fit=crop";
const IMG_FAMILIA = "https://images.unsplash.com/photo-1542037104857-ffbb0b9155fb?w=900&q=80&auto=format&fit=crop";
const IMG_BIBLIA = "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=900&q=80&auto=format&fit=crop";
// Foto local — coloque o arquivo em public/pr-bruno.jpg
const IMG_LIDER = "/pr-bruno.jpg";
const AVATAR_1 = "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&q=80&auto=format&fit=crop";
const AVATAR_2 = "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&q=80&auto=format&fit=crop";
const AVATAR_3 = "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&q=80&auto=format&fit=crop";
const AVATAR_4 = "https://images.unsplash.com/photo-1463453091185-61582044d556?w=200&q=80&auto=format&fit=crop";

export default function Home() {
  return (
    <main className="min-h-screen bg-bege-50">
      {/* ============== NAV ============== */}
      <header className="absolute inset-x-0 top-0 z-20">
        <nav className="mx-auto flex max-w-7xl items-center justify-between px-6 py-6">
          <Logo />
          <div className="flex items-center gap-3">
            <Link href="/login" className="hidden text-sm font-medium text-bege-700 hover:text-laranja-600 sm:inline">
              Entrar
            </Link>
            <Link
              href="/cadastro"
              className="rounded-full bg-laranja-500 px-5 py-2 text-sm font-medium text-white shadow-lg shadow-laranja-500/30 transition hover:scale-105 hover:bg-laranja-600"
            >
              Comece agora
            </Link>
          </div>
        </nav>
      </header>

      {/* ============== HERO ============== */}
      <CursorGlow className="relative overflow-hidden bg-gradient-to-br from-laranja-50 via-bege-50 to-bege-100">
        {/* Floating decorative blobs */}
        <div aria-hidden className="absolute -right-32 top-20 h-96 w-96 animate-float-slow rounded-full bg-laranja-200/50 blur-3xl" />
        <div aria-hidden className="absolute -left-32 bottom-0 h-96 w-96 rounded-full bg-oliveira-200/40 blur-3xl" />

        <div className="relative mx-auto grid max-w-7xl items-center gap-12 px-6 pb-24 pt-40 sm:pt-48 lg:grid-cols-12 lg:gap-16 lg:pb-32 lg:pt-56">
          {/* Texto */}
          <div className="lg:col-span-7">
            <p className="mb-6 inline-flex items-center gap-2 rounded-full border border-laranja-200 bg-laranja-50 px-4 py-1.5 text-xs font-semibold uppercase tracking-[0.2em] text-laranja-700 animate-fade-in">
              <span className="inline-block h-1.5 w-1.5 animate-pulse-soft rounded-full bg-laranja-500" />
              Discipulado · Formação · Envio
            </p>
            <h1 className="font-serif text-5xl font-semibold leading-[1.02] text-bege-800 sm:text-6xl lg:text-7xl animate-fade-up">
              Famílias fortes.
              <br />
              <span className="shimmer-text">Discípulos maduros.</span>
            </h1>
            <p className="mx-auto mt-8 max-w-2xl font-serif text-xl italic leading-relaxed text-bege-700 sm:text-2xl animate-fade-up [animation-delay:120ms]">
              Mais que encontros. Uma transformação. Na mesa somos formados pelo
              Espírito, somos enviados.
            </p>
            <div className="mt-10 flex flex-col items-start gap-4 sm:flex-row animate-fade-up [animation-delay:240ms]">
              <Link
                href="/cadastro"
                className="group inline-flex items-center gap-2 rounded-full bg-laranja-500 px-8 py-4 text-base font-semibold text-white shadow-xl shadow-laranja-500/30 transition hover:scale-[1.03] hover:bg-laranja-600"
              >
                Quero começar a caminhada
                <svg className="h-5 w-5 transition group-hover:translate-x-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3" />
                </svg>
              </Link>
              <Link
                href="/manifesto"
                className="inline-flex items-center gap-2 rounded-full border border-bege-300 bg-white/70 px-8 py-4 text-base font-medium text-bege-800 backdrop-blur transition hover:border-oliveira-400 hover:bg-white hover:text-oliveira-700"
              >
                Conhecer a mesa
              </Link>
            </div>

            {/* Mini-stats */}
            <div className="mt-14 grid grid-cols-3 gap-6 border-t border-bege-200 pt-8 animate-fade-up [animation-delay:360ms]">
              <div>
                <p className="font-serif text-3xl font-semibold text-laranja-600">+200</p>
                <p className="mt-1 text-xs text-bege-600">discípulos na mesa</p>
              </div>
              <div>
                <p className="font-serif text-3xl font-semibold text-oliveira-600">12</p>
                <p className="mt-1 text-xs text-bege-600">temáticas publicadas</p>
              </div>
              <div>
                <p className="font-serif text-3xl font-semibold text-bege-700">7 anos</p>
                <p className="mt-1 text-xs text-bege-600">de jornada Ekballo</p>
              </div>
            </div>
          </div>

          {/* Imagem */}
          <div className="lg:col-span-5">
            <div className="relative animate-fade-in [animation-delay:300ms]">
              <div className="absolute -inset-4 rounded-[2rem] bg-gradient-to-br from-laranja-300/30 via-bege-200/20 to-oliveira-300/30 blur-2xl" aria-hidden />
              <div className="img-vignette relative overflow-hidden rounded-[2rem] shadow-2xl shadow-bege-700/20">
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img
                  src={IMG_HERO}
                  alt="Mesa Ekballo — pessoas reunidas em volta de uma refeição compartilhada"
                  className="aspect-[4/5] w-full object-cover"
                  loading="eager"
                />
              </div>
              {/* Floating badge */}
              <div className="absolute -bottom-6 -left-6 max-w-[200px] rounded-2xl border border-bege-200 bg-white p-4 shadow-xl shadow-bege-700/15 sm:-bottom-8 sm:-left-8 animate-fade-up [animation-delay:600ms]">
                <p className="text-xs font-semibold uppercase tracking-wider text-laranja-600">esta semana</p>
                <p className="mt-1 font-serif text-lg font-semibold text-bege-800 leading-tight">3 famílias começaram</p>
                <p className="text-xs text-bege-600">o curso âncora juntas</p>
              </div>
            </div>
          </div>
        </div>
      </CursorGlow>

      {/* ============== MARQUEE ============== */}
      <Marquee items={["Mesa", "Formação", "Espírito", "Envio", "Famílias", "Comunidade", "Discipulado", "Maturidade"]} />

      {/* ============== TRÊS PILARES ============== */}
      <section className="bg-white">
        <div className="mx-auto max-w-7xl px-6 py-24 lg:py-32">
          <RevealOnScroll className="mx-auto mb-16 max-w-2xl text-center">
            <p className="mb-3 text-xs font-semibold uppercase tracking-[0.25em] text-laranja-600">Três passos da formação</p>
            <h2 className="font-serif text-4xl font-semibold leading-tight text-bege-800 sm:text-5xl">
              Mesa, Formação, Envio
            </h2>
            <p className="mx-auto mt-5 max-w-xl text-bege-700">
              Três movimentos que se sustentam mutuamente. Um discípulo só amadurece quando os três se tornam um mesmo respirar.
            </p>
          </RevealOnScroll>

          <div className="grid gap-6 md:grid-cols-3">
            {[
              {
                num: "01",
                title: "Mesa",
                text: "O encontro começa onde sempre começou. Comunidade, escuta, partilha do pão, oração. Aqui não há aluno e professor — há discípulos diante do Mestre.",
                cor: "from-laranja-100 to-laranja-50",
                accent: "bg-laranja-500",
                img: IMG_MESA_1,
              },
              {
                num: "02",
                title: "Formação",
                text: "Temáticas, livros, atividades de reflexão escrita com devolutiva pastoral. Cada resposta é lida, cada caminhada acompanhada. A formação não é informação — é transformação.",
                cor: "from-bege-100 to-bege-50",
                accent: "bg-bege-700",
                img: IMG_BIBLIA,
              },
              {
                num: "03",
                title: "Envio",
                text: "Quem é formado é enviado. A maturidade não é destino, é envio. Cada discipulado se torna fonte. Cada família, multiplicação. Cada encontro, semente.",
                cor: "from-oliveira-100 to-oliveira-50",
                accent: "bg-oliveira-600",
                img: IMG_FAMILIA,
              },
            ].map((p, i) => (
              <RevealOnScroll key={p.num} delay={(i + 1) as 1 | 2 | 3} as="article" className="lift overflow-hidden rounded-3xl border border-bege-200 bg-white">
                <div className="img-vignette relative aspect-[16/10] overflow-hidden">
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img src={p.img} alt={p.title} className="h-full w-full object-cover transition duration-700 hover:scale-105" loading="lazy" />
                  <div className={`absolute left-4 top-4 inline-flex items-center gap-2 rounded-full bg-white/95 px-3 py-1 text-xs font-semibold uppercase tracking-wider text-bege-700 shadow-sm`}>
                    <span className={`inline-block h-1.5 w-1.5 rounded-full ${p.accent}`} />
                    {p.num}
                  </div>
                </div>
                <div className="p-7">
                  <h3 className="mb-3 font-serif text-2xl font-semibold text-bege-800">{p.title}</h3>
                  <p className="text-[15px] leading-relaxed text-bege-700">{p.text}</p>
                </div>
              </RevealOnScroll>
            ))}
          </div>
        </div>
      </section>

      {/* ============== COMO FUNCIONA ============== */}
      <section className="bg-gradient-to-b from-bege-100 via-bege-100 to-bege-200/50">
        <div className="mx-auto max-w-7xl px-6 py-24 lg:py-32">
          <div className="grid gap-16 lg:grid-cols-2 lg:items-center">
            <RevealOnScroll>
              <p className="mb-3 text-xs font-semibold uppercase tracking-[0.25em] text-laranja-700">Como funciona</p>
              <h2 className="mb-6 font-serif text-4xl font-semibold leading-tight text-bege-800 sm:text-5xl">
                Uma plataforma para a caminhada inteira.
              </h2>
              <p className="mb-8 text-lg leading-relaxed text-bege-700">
                Temáticas de discipulado, livros com questões de reflexão, atividades escritas com devolutiva do líder. Tudo num só lugar, no seu ritmo, com a comunidade Ekballo ao redor.
              </p>
              <ul className="space-y-4">
                {[
                  ["Curso âncora gratuito", "para entrar na mesa, sem custo, no seu tempo"],
                  ["Atividades de reflexão escrita", "você responde, seu líder lê e devolve"],
                  ["Múltipla escolha com progressão", "cursos por etapa, conteúdo que se desbloqueia conforme você avança"],
                  ["Acesso pelo celular", "sem instalar app, em qualquer lugar"],
                ].map(([t, d], i) => (
                  <li key={i} className="flex items-start gap-4">
                    <div className="mt-0.5 flex h-7 w-7 flex-none items-center justify-center rounded-full bg-laranja-500 text-white">
                      <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.704 5.296a1 1 0 010 1.414l-7.5 7.5a1 1 0 01-1.414 0l-3.5-3.5a1 1 0 111.414-1.414L8.5 12.086l6.79-6.79a1 1 0 011.414 0z" clipRule="evenodd" />
                      </svg>
                    </div>
                    <div>
                      <p className="font-semibold text-bege-800">{t}</p>
                      <p className="text-sm text-bege-600">{d}</p>
                    </div>
                  </li>
                ))}
              </ul>
            </RevealOnScroll>

            <RevealOnScroll delay={1}>
              <div className="relative">
                <div className="absolute -inset-4 rounded-3xl bg-gradient-to-br from-laranja-200/40 via-bege-200/20 to-oliveira-200/40 blur-2xl" />
                <div className="relative overflow-hidden rounded-2xl border border-bege-200 bg-white shadow-2xl shadow-bege-700/15">
                  <div className="border-b border-bege-100 bg-bege-50 px-6 py-4">
                    <div className="flex items-center gap-2">
                      <div className="h-2.5 w-2.5 rounded-full bg-laranja-400" />
                      <div className="h-2.5 w-2.5 rounded-full bg-bege-300" />
                      <div className="h-2.5 w-2.5 rounded-full bg-oliveira-400" />
                      <div className="ml-3 text-xs text-bege-500">academy.ekballo.com.br/aulas</div>
                    </div>
                  </div>
                  <div className="space-y-5 p-7">
                    <div>
                      <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-laranja-600">Aula 03 · Reflexão</p>
                      <h4 className="font-serif text-xl font-semibold text-bege-800">
                        O que significa para você &ldquo;ser enviado&rdquo;?
                      </h4>
                    </div>
                    <div className="rounded-lg border border-bege-100 bg-bege-50/50 p-4 text-sm text-bege-700">
                      Sua resposta aqui... O líder vai ler e te responder em até 48h.
                    </div>
                    <div className="rounded-xl border-l-4 border-oliveira-400 bg-oliveira-50/50 p-4">
                      <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-oliveira-700">Devolutiva do líder</p>
                      <p className="text-sm leading-relaxed text-bege-800">
                        Beatriz, sua resposta me marcou. Ser enviado começa por dizer sim ao próximo passo, mesmo sem ver o caminho inteiro...
                      </p>
                    </div>
                    <div className="flex items-center justify-between text-xs text-bege-500">
                      <span>✓ Aula concluída</span>
                      <span className="text-oliveira-600 font-medium">● Sua jornada continua</span>
                    </div>
                  </div>
                </div>
              </div>
            </RevealOnScroll>
          </div>
        </div>
      </section>

      {/* ============== DEPOIMENTOS ============== */}
      <section className="bg-white">
        <div className="mx-auto max-w-7xl px-6 py-24 lg:py-32">
          <RevealOnScroll className="mx-auto mb-16 max-w-2xl text-center">
            <p className="mb-3 text-xs font-semibold uppercase tracking-[0.25em] text-laranja-600">Histórias da mesa</p>
            <h2 className="font-serif text-4xl font-semibold leading-tight text-bege-800 sm:text-5xl">
              O que tem acontecido com quem caminha com a gente.
            </h2>
          </RevealOnScroll>

          <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-4">
            {[
              {
                avatar: AVATAR_1,
                nome: "Maria Helena",
                turma: "Mesa 01",
                texto: "Foi a primeira plataforma onde eu não me senti aluno — me senti discípulo. A devolutiva do líder na minha reflexão me marcou demais.",
              },
              {
                avatar: AVATAR_2,
                nome: "João Pedro",
                turma: "Mesa 01",
                texto: "Comecei o Ego Transformado de curiosidade e três meses depois eu estava começando o discipulado com um cara da minha célula. Não era o plano — virou o plano.",
              },
              {
                avatar: AVATAR_3,
                nome: "Camila Ribeiro",
                turma: "Mesa 02",
                texto: "Saí do curso de Keller com uma frase emoldurada na geladeira: ‘comprometimento não é sentimento, é decisão acumulada’. Mudou meu jeito de viver comunidade.",
              },
              {
                avatar: AVATAR_4,
                nome: "Pedro Henrique",
                turma: "Mesa 02",
                texto: "O que mais me ajudou foi a constância. Não é evento, é caminhada semanal. E o líder que lê o que eu escrevo me faz levar a sério.",
              },
            ].map((d, i) => (
              <RevealOnScroll key={i} delay={(i + 1) as 1 | 2 | 3 | 4} as="article" className="lift rounded-2xl border border-bege-200 bg-bege-50/40 p-6">
                <div className="mb-4 flex items-center gap-3">
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img src={d.avatar} alt={d.nome} className="h-12 w-12 rounded-full object-cover ring-2 ring-laranja-200" loading="lazy" />
                  <div>
                    <p className="text-sm font-semibold text-bege-800">{d.nome}</p>
                    <p className="text-xs text-bege-500">{d.turma}</p>
                  </div>
                </div>
                <p className="text-sm leading-relaxed text-bege-700">&ldquo;{d.texto}&rdquo;</p>
              </RevealOnScroll>
            ))}
          </div>
        </div>
      </section>

      {/* ============== FUNDADOR/LÍDER ============== */}
      <section className="relative overflow-hidden bg-bege-100">
        <div aria-hidden className="absolute inset-0 bg-gradient-to-br from-laranja-100/40 via-transparent to-bege-200/40" />
        <div className="relative mx-auto grid max-w-7xl gap-12 px-6 py-24 lg:grid-cols-12 lg:gap-16 lg:py-32">
          {/* Foto */}
          <RevealOnScroll className="lg:col-span-5 lg:sticky lg:top-24 lg:self-start">
            <div className="relative">
              <div className="absolute -inset-4 rounded-[2rem] bg-gradient-to-br from-laranja-300/30 via-bege-300/20 to-oliveira-300/25 blur-2xl" aria-hidden />
              <div className="img-vignette relative overflow-hidden rounded-[2rem] shadow-2xl shadow-bege-800/25">
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img
                  src={IMG_LIDER}
                  alt="Pr. Bruno Fernandes — pastor da Ekballo"
                  className="aspect-[3/4] w-full object-cover"
                  style={{ objectPosition: "center 20%", filter: "contrast(1.04) saturate(1.06) brightness(1.02)" }}
                  loading="lazy"
                />
                {/* Badge sobreposto */}
                <div className="absolute bottom-5 left-5 right-5 rounded-2xl border border-white/30 bg-bege-900/55 p-4 backdrop-blur-md">
                  <p className="font-serif text-base font-semibold text-white">Pr. Bruno Fernandes</p>
                  <p className="mt-0.5 text-xs text-laranja-200">Pastor · Fundador da Ekballo Academy</p>
                </div>
              </div>
            </div>
          </RevealOnScroll>

          {/* Texto */}
          <RevealOnScroll delay={1} className="lg:col-span-7">
            <p className="mb-3 text-xs font-semibold uppercase tracking-[0.25em] text-laranja-700">A voz pastoral · A história</p>
            <h2 className="mb-8 font-serif text-4xl font-semibold leading-tight text-bege-800 sm:text-5xl">
              Pr. Bruno Fernandes
            </h2>

            {/* Pull quote — primeiro parágrafo do texto na íntegra */}
            <blockquote className="mb-10 border-l-4 border-laranja-500 bg-laranja-50/40 py-5 pl-6 pr-4 font-serif text-lg italic leading-relaxed text-bege-800 sm:text-xl">
              A Ekballo Academy nasceu daquilo que acreditamos e vivemos todos os dias: discipulado não acontece apenas em um púlpito, em uma aula ou dentro de um auditório. Discipulado verdadeiro acontece na caminhada, na mesa, nas conversas sinceras, no acompanhamento intencional e na vida compartilhada.
            </blockquote>

            {/* Corpo — parágrafos 2 a 6 do texto, sem edição */}
            <div className="space-y-5 text-[15.5px] leading-relaxed text-bege-700">
              <p>
                Ekballo entende que formar pessoas vai muito além de transmitir conteúdo. É sobre construir famílias fortes, desenvolver maturidade espiritual, fortalecer raízes e preparar pessoas para viverem o propósito de Deus com profundidade, equilíbrio e direção.
              </p>
              <p>
                Casado com Débora de Oliveira e pai de dois filhos, Bruno Fernandes carrega a convicção de que o Reino é construído primeiro dentro de casa. Por isso, a Ekballo Academy nasce como uma extensão da mesa da comunhão para o restante da semana — um ambiente onde o discipulado continua mesmo depois que o encontro presencial termina e a rotina recomeça.
              </p>
              <p>
                Aqui, cada reflexão, pergunta, resposta e processo importa. Não é uma plataforma fria, automática ou distante. Existe presença, acompanhamento e cuidado pastoral real. Cada conteúdo foi pensado para gerar transformação prática, conversas profundas e crescimento contínuo na caminhada com Cristo.
              </p>
              <p>
                A Ekballo Academy é para quem deseja ir além do superficial. Para quem entende que formação é processo, que maturidade exige constância e que o Evangelho precisa ser vivido no cotidiano.
              </p>
              <p>
                Mais do que uma plataforma, este é um ambiente de envio, crescimento e construção de pessoas saudáveis espiritualmente, emocionalmente e relacionalmente.
              </p>
            </div>

            {/* Frase de fechamento — último parágrafo do texto, em destaque */}
            <p className="mt-10 border-t border-bege-300 pt-6 font-serif text-lg italic leading-relaxed text-laranja-800">
              Porque no fim, o discipulado não é sobre acumular conhecimento. É sobre formar pessoas que vivem Jesus de forma genuína — dentro de casa, na igreja e no mundo.
            </p>

            {/* CTAs */}
            <div className="mt-10 flex flex-wrap gap-3">
              <a
                href="https://wa.me/5531994108839?text=Ol%C3%A1%20Pr.%20Bruno%2C%20quero%20conversar%20sobre%20a%20Ekballo%20Academy"
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 rounded-full bg-oliveira-600 px-6 py-3 text-sm font-semibold text-white shadow-lg shadow-oliveira-600/30 transition hover:scale-[1.03] hover:bg-oliveira-700"
              >
                <svg viewBox="0 0 24 24" fill="currentColor" className="h-5 w-5">
                  <path d="M12 2C6.48 2 2 6.48 2 12c0 1.93.55 3.74 1.5 5.27L2 22l4.83-1.47A9.95 9.95 0 0012 22c5.52 0 10-4.48 10-10S17.52 2 12 2zm5.07 14.04c-.21.59-1.21 1.13-1.69 1.2-.43.07-.97.1-1.57-.1-.36-.11-.83-.27-1.43-.53-2.51-1.08-4.15-3.61-4.28-3.78-.12-.17-1.02-1.36-1.02-2.59s.65-1.83.88-2.08c.23-.25.5-.31.67-.31.17 0 .34 0 .49.01.16 0 .37-.06.58.44.22.51.74 1.76.81 1.89.07.13.11.28.02.45-.09.17-.13.28-.26.43-.13.15-.27.34-.38.45-.13.13-.26.27-.11.52.15.25.66 1.09 1.42 1.77.97.86 1.79 1.13 2.05 1.26.25.13.4.11.55-.07.15-.17.63-.74.8-.99.17-.25.34-.21.57-.13.23.09 1.45.69 1.7.81.25.13.42.19.48.3.06.11.06.65-.15 1.24z"/>
                </svg>
                Falar com o pastor
              </a>
              <Link
                href="/manifesto"
                className="inline-flex items-center gap-2 rounded-full border border-bege-300 bg-white px-6 py-3 text-sm font-semibold text-bege-700 hover:border-laranja-400 hover:text-laranja-600"
              >
                Ler o manifesto
              </Link>
            </div>
          </RevealOnScroll>
        </div>
      </section>

      {/* ============== GALERIA ============== */}
      <section className="bg-white">
        <div className="mx-auto max-w-7xl px-6 py-24">
          <RevealOnScroll className="mx-auto mb-12 max-w-2xl text-center">
            <p className="mb-3 text-xs font-semibold uppercase tracking-[0.25em] text-laranja-600">A vida na mesa</p>
            <h2 className="font-serif text-4xl font-semibold leading-tight text-bege-800 sm:text-5xl">
              Onde a formação acontece de verdade.
            </h2>
          </RevealOnScroll>

          <div className="grid gap-4 md:grid-cols-3">
            {[IMG_MESA_2, IMG_BIBLIA, IMG_FAMILIA].map((src, i) => (
              <RevealOnScroll key={i} delay={(i + 1) as 1 | 2 | 3} className="img-vignette overflow-hidden rounded-2xl">
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img
                  src={src}
                  alt="Vida da comunidade Ekballo"
                  className="aspect-[4/5] w-full object-cover transition duration-700 hover:scale-105"
                  loading="lazy"
                />
              </RevealOnScroll>
            ))}
          </div>
        </div>
      </section>

      {/* ============== CTA FINAL ============== */}
      <section className="relative overflow-hidden bg-gradient-to-br from-laranja-500 via-laranja-600 to-laranja-700 text-white">
        <div aria-hidden className="absolute inset-0 opacity-15">
          <div className="absolute -right-32 top-0 h-96 w-96 animate-float-slow rounded-full bg-white blur-3xl" />
          <div className="absolute -left-32 bottom-0 h-96 w-96 rounded-full bg-bege-200 blur-3xl" />
        </div>
        <RevealOnScroll className="relative mx-auto max-w-3xl px-6 py-24 text-center lg:py-32">
          <h2 className="mb-6 font-serif text-4xl font-semibold leading-tight sm:text-5xl lg:text-6xl">
            A mesa está posta.
          </h2>
          <p className="mx-auto mb-12 max-w-xl text-lg text-laranja-50">
            Crie sua conta gratuita, escolha seu primeiro curso, sente-se à mesa. O Espírito faz o resto.
          </p>
          <div className="flex flex-col items-center justify-center gap-4 sm:flex-row">
            <Link
              href="/cadastro"
              className="group inline-flex items-center gap-2 rounded-full bg-white px-10 py-4 text-base font-semibold text-laranja-700 shadow-2xl shadow-laranja-900/30 transition hover:scale-[1.03]"
            >
              Criar minha conta gratuita
              <svg className="h-5 w-5 transition group-hover:translate-x-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3" />
              </svg>
            </Link>
            <a
              href="https://wa.me/5531994108839?text=Ol%C3%A1!%20Vim%20pela%20Ekballo%20Academy."
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 rounded-full border-2 border-white/40 bg-white/10 px-8 py-4 text-base font-semibold text-white backdrop-blur transition hover:bg-white/20"
            >
              Conversar antes
            </a>
          </div>
        </RevealOnScroll>
      </section>

      {/* ============== FOOTER ============== */}
      <footer className="border-t border-bege-200 bg-bege-50">
        <div className="mx-auto max-w-7xl px-6 py-12">
          <div className="flex flex-col items-center justify-between gap-6 sm:flex-row">
            <Logo />
            <div className="flex flex-wrap items-center gap-6 text-sm text-bege-600">
              <Link href="/manifesto" className="hover:text-laranja-600">Manifesto</Link>
              <Link href="/login" className="hover:text-laranja-600">Entrar</Link>
              <Link href="/cadastro" className="hover:text-laranja-600">Cadastro</Link>
              <a
                href="https://wa.me/5531994108839"
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1.5 hover:text-oliveira-700"
              >
                <svg viewBox="0 0 24 24" fill="currentColor" className="h-4 w-4"><path d="M12 2C6.48 2 2 6.48 2 12c0 1.93.55 3.74 1.5 5.27L2 22l4.83-1.47A9.95 9.95 0 0012 22c5.52 0 10-4.48 10-10S17.52 2 12 2z"/></svg>
                WhatsApp
              </a>
            </div>
          </div>
          <p className="mt-8 text-center text-xs text-bege-500">
            © {new Date().getFullYear()} Ekballo Academy · Famílias fortes. Discípulos maduros.
          </p>
        </div>
      </footer>
    </main>
  );
}
