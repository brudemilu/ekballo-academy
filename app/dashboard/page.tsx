import Link from "next/link";
import { redirect } from "next/navigation";
import { Logo } from "@/components/Logo";
import { UserMenu } from "@/components/UserMenu";
import { CompletarTelefoneBanner } from "@/components/CompletarTelefoneBanner";
import {
  getCurrentSession,
  listCursosPublicados,
  listMatriculasByAluno,
  listProgressoLeitura,
  getMaterialUrl,
} from "@/lib/db";
import {
  ContinuandoLeitura,
  BarraProgresso,
  type ItemLeitura,
} from "@/components/ContinuandoLeitura";
import { getDevocionalDoDia } from "@/lib/devocionais";
import { getProximaLicao, getStreak } from "@/lib/english";
import { podeVerAgenda } from "@/lib/permissoes";
import { agruparPorCategoria } from "@/lib/categorias";
import { SeloOffline } from "@/components/SeloOffline";
import { CAPA_LIVRO } from "@/lib/capas";

// Mostra "Pr. Bruno" para "Pr. Bruno Fernandes" / "Maria" para "Maria Helena Andrade"
function greetingName(nome?: string | null): string {
  if (!nome) return "discípulo";
  const parts = nome.trim().split(/\s+/);
  if (parts[0]?.endsWith(".") && parts[1]) return `${parts[0]} ${parts[1]}`;
  return parts[0];
}

// Timestamp em ms (0 quando não há data). Datas vindas do banco e do app usam
// sufixos diferentes ("+00:00" vs "Z"), então comparar como texto não serve.
function instante(iso?: string | null): number {
  if (!iso) return 0;
  const t = Date.parse(iso);
  return Number.isNaN(t) ? 0 : t;
}

// "8 de julho de 2026" — data em que a leitura foi concluída.
function dataConclusao(iso: string): string {
  try {
    return new Intl.DateTimeFormat("pt-BR", {
      timeZone: "America/Sao_Paulo",
      day: "numeric",
      month: "long",
      year: "numeric",
    }).format(new Date(iso));
  } catch {
    return "";
  }
}

export default async function DashboardPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const [todosCursos, matriculas, leituras, devocional, proximaLicao, englishStreak] =
    await Promise.all([
      listCursosPublicados(),
      listMatriculasByAluno(session.userId),
      listProgressoLeitura(session.userId),
      getDevocionalDoDia(),
      getProximaLicao(session.userId),
      getStreak(session.userId),
    ]);

  const mostrarAgenda = podeVerAgenda(
    session.profile?.papel,
    session.profile?.is_admin,
    session.profile?.email ?? session.email,
  );

  // Pede o WhatsApp pra quem está sem telefone no cadastro (recuperação de senha).
  const semTelefone =
    (session.profile?.telefone || "").replace(/\D+/g, "").length < 10;

  const matriculasMap = new Map(matriculas.map((m) => [m.curso_id, m]));
  // Admin vê todos os cursos publicados; aluno comum só os que foi matriculado.
  const cursos = session.profile?.is_admin
    ? todosCursos
    : todosCursos.filter((c) => matriculasMap.has(c.id));

  // Resolve imagens (path do bucket privado vira signed URL). Pula os livros
  // que já têm capa estática em CAPA_LIVRO — pra esses o card não usa o signed
  // URL, então assinar seria uma chamada de rede à toa (era o maior gargalo).
  const imagensResolvidas = await Promise.all(
    cursos.map((c) => (CAPA_LIVRO[c.slug] ? Promise.resolve(null) : getMaterialUrl(c.imagem_url)))
  );
  const imagemMap = new Map(
    cursos.map((c, i) => [c.id, imagensResolvidas[i]])
  );

  // Vitrine agrupada por seção (Liderança, Discipulado, …). Se só existe
  // uma seção, não vale mostrar título — cai no grid simples de antes.
  const grupos = agruparPorCategoria(cursos);
  const mostrarSecoes = grupos.length > 1;

  // Capa do card: estática quando existe, senão a OG tipográfica (em retrato).
  const capaDe = (curso: (typeof cursos)[number]) => {
    const ogUrl = imagemMap.get(curso.id);
    return (
      CAPA_LIVRO[curso.slug] ??
      (ogUrl?.startsWith("/api/og/curso/") ? `${ogUrl}?formato=retrato&v=4` : ogUrl ?? null)
    );
  };

  // Leitura em andamento: livro aberto, começado e ainda não fechado. Vai pro
  // topo do painel porque era justamente o que sumia no meio da vitrine — e
  // vale mesmo sem matrícula (o master lê os livros sem se matricular).
  const leituraMap = new Map(leituras.map((l) => [l.curso_id, l]));
  const emLeitura: ItemLeitura[] = cursos
    .filter((curso) => {
      const l = leituraMap.get(curso.id);
      if (!l || l.total_aulas === 0) return false;
      if (matriculasMap.get(curso.id)?.concluido_em) return false;
      if (l.concluidas >= l.total_aulas) return false;
      // Dispensado pelo ✕ — volta sozinho quando ele lê algo novo no livro.
      // Compara em ms: o app grava "…Z" e o PostgREST devolve "…+00:00",
      // então comparar as strings daria resultado errado.
      if (l.dispensado_em && Date.parse(l.dispensado_em) >= instante(l.ultima_em)) {
        return false;
      }
      // "Começou" = concluiu ao menos uma mesa ou abriu o livro alguma vez.
      return l.concluidas > 0 || !!l.ultima_em;
    })
    .sort(
      (a, b) =>
        instante(leituraMap.get(b.id)?.ultima_em) -
        instante(leituraMap.get(a.id)?.ultima_em),
    )
    .map((curso) => {
      const l = leituraMap.get(curso.id)!;
      const paginaCurso = curso.external_path ?? `/cursos/${curso.slug}`;
      return {
        cursoId: curso.id,
        titulo: curso.titulo,
        href:
          !curso.external_path && l.proxima_aula_id
            ? `/cursos/${curso.slug}/aulas/${l.proxima_aula_id}`
            : paginaCurso,
        capa: capaDe(curso),
        concluidas: l.concluidas,
        total: l.total_aulas,
        proxima: l.proxima_aula_titulo
          ? { titulo: l.proxima_aula_titulo, ordem: l.proxima_aula_ordem ?? 0 }
          : null,
      };
    });

  // Livros lidos = matrículas concluídas (o trigger marca `concluido_em` quando
  // todas as mesas do livro terminam). Vão pra uma estante própria, mais recente
  // primeiro, com a data em que a leitura foi fechada.
  const cursoPorId = new Map(cursos.map((c) => [c.id, c]));
  const livrosLidos = matriculas
    .filter((m) => m.concluido_em && cursoPorId.has(m.curso_id))
    .map((m) => ({ curso: cursoPorId.get(m.curso_id)!, em: m.concluido_em as string }))
    .sort((a, b) => b.em.localeCompare(a.em));

  const renderCard = (curso: (typeof cursos)[number]) => {
    const matricula = matriculasMap.get(curso.id);
    const concluido = matricula?.concluido_em;
    const href = curso.external_path ?? `/cursos/${curso.slug}`;
    const capa = capaDe(curso);
    // Livro em andamento ganha anel laranja e barra de progresso no pé da capa —
    // é o que faz ele saltar aos olhos no meio da estante inteira.
    const leitura = leituraMap.get(curso.id);
    const emAndamento =
      !concluido &&
      !!leitura &&
      leitura.total_aulas > 0 &&
      leitura.concluidas > 0 &&
      leitura.concluidas < leitura.total_aulas;
    return (
      <Link key={curso.id} href={href} className="group flex flex-col gap-3">
        <div
          className={`lift relative aspect-[3/4] overflow-hidden rounded-2xl bg-gradient-to-br from-laranja-100 via-bege-100 to-oliveira-100 shadow-[0_4px_16px_-4px_rgba(38,35,32,0.10)] ring-1 ${
            emAndamento ? "ring-2 ring-laranja-400" : "ring-mesa-200/70"
          }`}
        >
          {capa ? (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={capa}
              alt={curso.titulo}
              loading="lazy"
              decoding="async"
              className="h-full w-full object-cover transition duration-500 group-hover:scale-[1.04]"
            />
          ) : (
            <div className="flex h-full items-center justify-center">
              <Logo />
            </div>
          )}
          {concluido ? (
            <span className="absolute left-3 top-3 inline-flex items-center gap-1 rounded-full bg-oliveira-700/95 px-2.5 py-1 text-[11px] font-semibold text-white shadow-sm backdrop-blur">
              ✓ Concluído
            </span>
          ) : emAndamento ? (
            <span className="absolute left-3 top-3 inline-flex items-center gap-1 rounded-full bg-laranja-500 px-2.5 py-1 text-[11px] font-semibold text-white shadow-sm backdrop-blur">
              Lendo · {leitura!.concluidas}/{leitura!.total_aulas}
            </span>
          ) : matricula ? (
            <span className="absolute left-3 top-3 inline-flex items-center gap-1 rounded-full border border-laranja-200 bg-white/90 px-2.5 py-1 text-[11px] font-semibold text-laranja-600 shadow-sm backdrop-blur">
              Em andamento
            </span>
          ) : null}
          {curso.is_pago && (
            <span className="absolute right-3 top-3 inline-flex items-center rounded-full bg-mesa-900/85 px-2.5 py-1 text-[11px] font-semibold text-white shadow-sm backdrop-blur">
              Pago
            </span>
          )}
          <SeloOffline slug={curso.slug} />
          {curso.audio_status === "pronto" ? (
            <span className="absolute bottom-3 left-3 inline-flex items-center gap-1 rounded-full bg-laranja-500 px-2.5 py-1 text-[11px] font-semibold text-white shadow-md shadow-laranja-500/30 ring-1 ring-white/20 backdrop-blur">
              🎧 Com áudio
            </span>
          ) : curso.audio_status === "gerando" || curso.audio_status === "pendente" ? (
            <span className="absolute bottom-3 left-3 inline-flex items-center gap-1 rounded-full bg-laranja-500/95 px-2.5 py-1 text-[11px] font-semibold text-white shadow-md backdrop-blur">
              🎧 Gerando áudio…
            </span>
          ) : null}
          {emAndamento && (
            <div className="absolute inset-x-0 bottom-0 bg-white/85 px-2 py-1.5 backdrop-blur">
              <BarraProgresso
                concluidas={leitura!.concluidas}
                total={leitura!.total_aulas}
              />
            </div>
          )}
        </div>
        <h3 className="line-clamp-2 font-serif text-[15px] font-semibold leading-snug text-mesa-800 transition-colors group-hover:text-laranja-600">
          {curso.titulo}
        </h3>
      </Link>
    );
  };

  return (
    <main className="min-h-screen bg-mesa-50">
      <header className="sticky top-0 z-40 border-b border-mesa-200 bg-white/85 backdrop-blur-md">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4">
          <Link href="/dashboard" className="transition-opacity hover:opacity-80">
            <Logo />
          </Link>
          <div className="flex items-center gap-3">
            <Link
              href="/biblioteca"
              className="inline-flex items-center gap-1.5 rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 shadow-sm transition hover:border-laranja-300 hover:bg-laranja-50 hover:text-laranja-700"
              title="Livros baixados para ler e ouvir offline"
            >
              📚 <span className="hidden sm:inline">Biblioteca</span>
            </Link>
            <div className="border-l border-mesa-200 pl-3">
              <UserMenu
                nome={session.profile?.nome || null}
                email={session.profile?.email || session.email}
                isAdmin={!!session.profile?.is_admin}
              />
            </div>
          </div>
        </nav>
      </header>

      <div className="mx-auto max-w-6xl px-6 py-14">
        {semTelefone && <CompletarTelefoneBanner userId={session.userId} />}

        <div className="mb-14 max-w-2xl">
          <p className="mb-3 text-xs font-semibold uppercase tracking-[0.18em] text-mesa-500">
            Bem-vindo de volta
          </p>
          <h1 className="font-serif text-4xl font-semibold leading-[1.05] tracking-tight text-mesa-900 sm:text-5xl">
            Olá, {greetingName(session.profile?.nome)}.
          </h1>
          <p className="mt-5 text-lg leading-relaxed text-mesa-600">
            Aqui está sua trilha. Escolha uma temática, faça no seu ritmo, deixe
            sua reflexão. O líder vai ler e te responder.
          </p>
        </div>

        {/* Atalhos: agenda + devocional + english (accent bar + botão circular) */}
        {(mostrarAgenda || devocional || proximaLicao) && (
          <div className="mb-14 grid gap-5 lg:grid-cols-2">
            {/* Minha agenda (só pra quem tem acesso, ex.: Débora) */}
            {mostrarAgenda && (
              <Link
                href="/admin/agenda"
                className="lift group relative flex items-center justify-between gap-4 overflow-hidden rounded-2xl border border-mesa-200 bg-white p-6 shadow-[0_4px_16px_-4px_rgba(38,35,32,0.08)]"
              >
                <span className="absolute inset-y-0 left-0 w-1 bg-mesa-400" aria-hidden />
                <div className="min-w-0 pl-2">
                  <p className="mb-2 text-xs font-semibold uppercase tracking-[0.18em] text-mesa-500">
                    Pessoal
                  </p>
                  <h2 className="font-serif text-xl font-semibold text-mesa-900">
                    📅 Minha agenda
                  </h2>
                  <p className="mt-1.5 text-sm leading-relaxed text-mesa-600">
                    Seus compromissos e os do Google Calendar, num lugar só.
                  </p>
                </div>
                <span className="flex h-12 w-12 flex-none items-center justify-center rounded-full bg-mesa-100 text-xl text-laranja-600 transition-colors group-hover:bg-laranja-500 group-hover:text-white">
                  →
                </span>
              </Link>
            )}

            {/* Devocional de hoje (destaque no topo) */}
            {devocional && (
              <Link
                href="/devocional"
                className="lift group relative flex items-center justify-between gap-4 overflow-hidden rounded-2xl border border-laranja-200 bg-gradient-to-br from-laranja-50 to-bege-100 p-6 shadow-[0_4px_16px_-4px_rgba(38,35,32,0.08)]"
              >
                <span className="absolute inset-y-0 left-0 w-1 bg-laranja-500" aria-hidden />
                <div className="min-w-0 pl-2">
                  <p className="mb-2 text-xs font-semibold uppercase tracking-[0.18em] text-laranja-700">
                    Devocional de hoje
                  </p>
                  <h2 className="font-serif text-xl font-semibold text-mesa-900">
                    {devocional.titulo || devocional.versiculo_ref}
                  </h2>
                  <p className="mt-1.5 line-clamp-2 border-l-2 border-laranja-200 pl-3 text-sm italic leading-relaxed text-mesa-600">
                    &ldquo;{devocional.versiculo_texto}&rdquo;{" "}
                    <span className="not-italic text-mesa-500">
                      — {devocional.versiculo_ref}
                    </span>
                  </p>
                </div>
                <span className="flex h-12 w-12 flex-none items-center justify-center rounded-full bg-white/70 text-xl text-laranja-600 transition-colors group-hover:bg-laranja-500 group-hover:text-white">
                  →
                </span>
              </Link>
            )}

            {/* Ekballo English — lição do dia + sequência */}
            {proximaLicao && (
              <Link
                href={`/english/licao/${proximaLicao.slug}`}
                className="lift group relative flex items-center justify-between gap-4 overflow-hidden rounded-2xl border border-mesa-200 bg-white p-6 shadow-[0_4px_16px_-4px_rgba(38,35,32,0.08)]"
              >
                <span className="absolute inset-y-0 left-0 w-1 bg-laranja-500" aria-hidden />
                <div className="min-w-0 pl-2">
                  <p className="mb-2 flex items-center gap-2 text-xs font-semibold uppercase tracking-[0.18em] text-laranja-700">
                    Ekballo English
                    {englishStreak.dias_seguidos > 0 && (
                      <span className="rounded-full bg-laranja-50 px-2 py-0.5 tracking-normal text-laranja-700">
                        🔥 {englishStreak.dias_seguidos}
                      </span>
                    )}
                  </p>
                  <h2 lang="en" className="font-serif text-xl font-semibold text-mesa-900">
                    🗣️ {proximaLicao.titulo}
                  </h2>
                  <p className="mt-1.5 text-sm leading-relaxed text-mesa-600">
                    {englishStreak.total_licoes === 0
                      ? "Sua primeira lição de inglês está pronta."
                      : `${proximaLicao.titulo_pt} — mantenha a sequência de hoje.`}
                  </p>
                </div>
                <span className="flex h-12 w-12 flex-none items-center justify-center rounded-full bg-mesa-100 text-xl text-laranja-600 transition-colors group-hover:bg-laranja-500 group-hover:text-white">
                  →
                </span>
              </Link>
            )}
          </div>
        )}


        <ContinuandoLeitura itens={emLeitura} />

        {cursos.length === 0 ? (
          <div className="rounded-2xl border-2 border-dashed border-mesa-300 bg-white/60 px-6 py-20 text-center">
            <p className="font-serif text-2xl text-mesa-700">
              Sua matrícula ainda não foi liberada.
            </p>
            <p className="mx-auto mt-3 max-w-md text-sm leading-relaxed text-mesa-500">
              Seu líder pastoral vai te matricular nas temáticas da sua trilha. Quando isso acontecer, elas aparecem aqui.
            </p>
          </div>
        ) : mostrarSecoes ? (
          <div className="space-y-14">
            {grupos.map((grupo) => (
              <section key={grupo.label}>
                <h2 className="mb-6 font-serif text-2xl font-semibold text-mesa-900">
                  {grupo.label}
                </h2>
                <div className="grid grid-cols-2 gap-5 sm:grid-cols-3 md:gap-6 lg:grid-cols-4 xl:grid-cols-5">
                  {grupo.cursos.map((curso) => renderCard(curso))}
                </div>
              </section>
            ))}
          </div>
        ) : (
          <section>
            <h2 className="mb-6 font-serif text-2xl font-semibold text-mesa-900">
              Temáticas
            </h2>
            <div className="grid grid-cols-2 gap-5 sm:grid-cols-3 md:gap-6 lg:grid-cols-4 xl:grid-cols-5">
              {cursos.map((curso) => renderCard(curso))}
            </div>
          </section>
        )}

        {/* Estante de livros lidos — só aparece quando há leitura concluída */}
        {livrosLidos.length > 0 && (
          <section className="mt-16 border-t border-mesa-200 pt-12">
            <div className="mb-2 flex items-baseline gap-3">
              <h2 className="font-serif text-2xl font-semibold text-mesa-900">
                Livros lidos
              </h2>
              <span className="rounded-full bg-oliveira-100 px-2.5 py-0.5 text-xs font-semibold text-oliveira-700">
                {livrosLidos.length}
              </span>
            </div>
            <p className="mb-8 text-sm leading-relaxed text-mesa-600">
              As leituras que você concluiu, com a data em que fechou cada livro.
            </p>
            <div className="grid grid-cols-2 gap-5 sm:grid-cols-3 md:gap-6 lg:grid-cols-4 xl:grid-cols-5">
              {livrosLidos.map(({ curso, em }) => {
                const capa = capaDe(curso);
                return (
                  <Link
                    key={curso.id}
                    href={curso.external_path ?? `/cursos/${curso.slug}`}
                    className="group flex flex-col gap-3"
                  >
                    <div className="lift relative aspect-[3/4] overflow-hidden rounded-2xl bg-gradient-to-br from-oliveira-100 via-bege-100 to-laranja-100 shadow-[0_4px_16px_-4px_rgba(38,35,32,0.10)] ring-1 ring-oliveira-200/70">
                      {capa ? (
                        // eslint-disable-next-line @next/next/no-img-element
                        <img
                          src={capa}
                          alt={curso.titulo}
                          loading="lazy"
                          decoding="async"
                          className="h-full w-full object-cover transition duration-500 group-hover:scale-[1.04]"
                        />
                      ) : (
                        <div className="flex h-full items-center justify-center">
                          <Logo />
                        </div>
                      )}
                      <span className="absolute left-3 top-3 inline-flex items-center gap-1 rounded-full bg-oliveira-700/95 px-2.5 py-1 text-[11px] font-semibold text-white shadow-sm backdrop-blur">
                        ✓ Lido
                      </span>
                    </div>
                    <div className="flex flex-col gap-1">
                      <h3 className="line-clamp-2 font-serif text-[15px] font-semibold leading-snug text-mesa-800 transition-colors group-hover:text-laranja-600">
                        {curso.titulo}
                      </h3>
                      <p className="text-[11px] font-medium text-oliveira-700">
                        Concluído em {dataConclusao(em)}
                      </p>
                    </div>
                  </Link>
                );
              })}
            </div>
          </section>
        )}
      </div>
    </main>
  );
}
