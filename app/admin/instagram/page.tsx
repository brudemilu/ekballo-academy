import Link from "next/link";
import { redirect } from "next/navigation";
import { AdminShell } from "@/components/AdminShell";
import { AssistenteConteudo } from "@/components/AssistenteConteudo";
import { CalendarioConteudo } from "@/components/CalendarioConteudo";
import { CortesConteudo } from "@/components/CortesConteudo";
import { ImagensConteudo } from "@/components/ImagensConteudo";
import { InstagramStudio } from "@/components/InstagramStudio";
import { ListaCarrosseisInstagram } from "@/components/ListaCarrosseisInstagram";
import { PacoteSemana } from "@/components/PacoteSemana";
import { PainelInstagram } from "@/components/PainelInstagram";
import { PerfilConteudoForm } from "@/components/PerfilConteudoForm";
import { PilotoConteudo } from "@/components/PilotoConteudo";
import { RoteirosConteudo } from "@/components/RoteirosConteudo";
import { diaSP } from "@/lib/conteudo-calendario";
import { PERFIL_VAZIO, progressoDoPerfil } from "@/lib/conteudo-perfil";
import { travado } from "@/lib/cortes";
import {
  getCurrentSession,
  getIdeiaConteudo,
  getPerfilConteudo,
  getPilotoConfig,
  listCarrosseisInstagram,
  listCortesConteudo,
  listCursosPublicados,
  listExecucoesPiloto,
  listIdeiasConteudo,
  listReferenciasConteudo,
  listRoteirosConteudo,
} from "@/lib/db";
import { analisarPerfil } from "@/lib/instagram-insights";
import { diasSugeridos } from "@/lib/pacote";
import {
  acoesDoDia,
  constancia,
  destaques,
  indicadores,
  postsNaJanela,
} from "@/lib/painel";
import { carregarDadosPainel } from "@/lib/painel-dados";
import { PILOTO_PADRAO } from "@/lib/piloto";
import { apiConfigurada as youtubeConfigurado } from "@/lib/youtube";

export const metadata = { title: "Instagram — Ekballo" };
export const dynamic = "force-dynamic";

/**
 * Central do Instagram do ministério (issue #189). Tudo o que é Instagram vive
 * aqui, em abas — planejar (Calendário) e produzir (Criar). As próximas
 * frentes do copiloto (roteiros, painel, referências) entram como abas novas.
 */
const ABAS = [
  { v: "painel", label: "📊 Painel" },
  { v: "calendario", label: "🗓️ Calendário" },
  { v: "criar", label: "✨ Criar e postar" },
  { v: "imagens", label: "🖼️ Imagens" },
  { v: "roteiros", label: "🎬 Roteiros" },
  { v: "cortes", label: "✂️ Cortes" },
  { v: "assistente", label: "💬 Assistente" },
  { v: "piloto", label: "🤖 Piloto" },
  { v: "perfil", label: "🧭 Perfil" },
] as const;
type Aba = (typeof ABAS)[number]["v"];

export default async function AdminInstagramPage({
  searchParams,
}: {
  searchParams: Promise<{
    aba?: string;
    ideia?: string;
    semana?: string;
    roteiro?: string;
  }>;
}) {
  const session = await getCurrentSession();
  if (!session) redirect("/login");
  if (!session.profile?.is_admin) redirect("/dashboard");

  const {
    aba: abaParam,
    ideia: ideiaId,
    semana,
    roteiro: roteiroId,
  } = await searchParams;
  // Abrir uma ideia no estúdio implica a aba Criar.
  const aba: Aba = ideiaId
    ? "criar"
    : ABAS.some((a) => a.v === abaParam)
      ? (abaParam as Aba)
      : "painel";

  // Cada aba busca só o que mostra.
  const noPainel = aba === "painel";
  const usaPosts = aba === "calendario" || aba === "criar" || noPainel;
  const usaIdeias = aba === "calendario" || noPainel;
  // O calendário também escolhe fonte e referência (pacote da semana).
  const usaFontes = aba === "roteiros" || aba === "calendario" || aba === "piloto";
  const usaReferencias = aba === "perfil" || usaFontes || noPainel;
  const usaPerfil = aba === "perfil" || noPainel;
  const [
    carrosseis,
    ideias,
    ideia,
    perfil,
    referencias,
    cursos,
    roteiros,
    dadosPainel,
    cortes,
    piloto,
    execucoes,
  ] = await Promise.all([
    usaPosts ? listCarrosseisInstagram().catch(() => []) : Promise.resolve([]),
    usaIdeias ? listIdeiasConteudo().catch(() => []) : Promise.resolve([]),
    ideiaId ? getIdeiaConteudo(ideiaId).catch(() => null) : Promise.resolve(null),
    usaPerfil
      ? getPerfilConteudo().catch(() => PERFIL_VAZIO)
      : Promise.resolve(PERFIL_VAZIO),
    usaReferencias ? listReferenciasConteudo().catch(() => []) : Promise.resolve([]),
    usaFontes ? listCursosPublicados().catch(() => []) : Promise.resolve([]),
    aba === "roteiros" ? listRoteirosConteudo().catch(() => []) : Promise.resolve([]),
    noPainel ? carregarDadosPainel() : Promise.resolve(null),
    aba === "cortes" ? listCortesConteudo().catch(() => []) : Promise.resolve([]),
    aba === "piloto"
      ? getPilotoConfig().catch(() => PILOTO_PADRAO)
      : Promise.resolve(PILOTO_PADRAO),
    aba === "piloto" ? listExecucoesPiloto().catch(() => []) : Promise.resolve([]),
  ]);

  const hoje = diaSP(new Date());
  const cursosOpcoes = cursos
    // Cursos com tela própria (Bíblia etc.) não têm mesas de leitura.
    .filter((c) => !c.external_path)
    .map((c) => ({ id: c.id, titulo: c.titulo, autor: c.autor }))
    .sort((a, b) => a.titulo.localeCompare(b.titulo, "pt-BR"));
  const referenciasAnalisadas = referencias
    .filter((r) => r.dna)
    .map((r) => ({ id: r.id, nome: r.nome }));

  const postsDoPeriodo = dadosPainel ? postsNaJanela(dadosPainel.posts, hoje) : [];
  const resumoPerfil = analisarPerfil(postsDoPeriodo);

  const INTRO: Record<Aba, string> = {
    painel:
      "O que fazer hoje, como o perfil andou nos últimos 90 dias e o que foi diferente nos posts que saíram do normal. Tudo vem dos seus próprios números.",
    calendario:
      "A semana num lugar só. Guarde a ideia quando ela vier, arraste para o dia em que pretende postar e leve ao estúdio para virar post. Os posts agendados e publicados aparecem aqui sozinhos.",
    criar:
      "Cole qualquer conteúdo (trecho de mensagem, frase de livro, reflexão, versículo). A IA monta os slides, sugere a imagem que conversa com o texto, a palavra-chave e a legenda. Você edita tudo e aprova.",
    imagens:
      "Descreva o que quer ver e a IA cria a imagem, sem texto por cima, em quatro variações. Ou monte a capa de um Reel com o título no padrão do ministério.",
    roteiros:
      "Escolha uma mesa, um devocional ou um texto seu e receba o roteiro de um vídeo curto: o que falar, o que aparece na tela e o que mostrar. A IA só usa o que está na fonte, e mostra de onde tirou.",
    cortes:
      "Cole o link de uma pregação no YouTube e a IA aponta os melhores momentos para virar vídeo curto: onde começa, onde termina, a frase que abre e a legenda do post.",
    assistente:
      "Converse sobre o conteúdo do perfil: peça ideias, cole um texto para ele criticar, planeje a semana. As ideias que ele sugerir podem ir direto para o calendário.",
    piloto:
      "Ligue o piloto e a IA cuida da semana: escolhe o assunto, cria as peças, agenda a publicação e te avisa no WhatsApp. Nada vai ao ar sem você ter tido tempo de cancelar.",
    perfil:
      "Conte ao copiloto quem é o ministério, como você fala e em quem se inspira. É daqui que os roteiros e os posts tiram o jeito de escrever.",
  };

  const configurado = Boolean(
    process.env.CLOUDFLARE_ACCOUNT_ID && process.env.CLOUDFLARE_API_TOKEN,
  );

  return (
    <AdminShell current="instagram" session={session}>
      <div className="mb-6">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Conteúdo → Instagram
        </p>
        <h1 className="font-serif text-4xl font-semibold text-mesa-800">
          Instagram do ministério
        </h1>
        <p className="mt-3 max-w-2xl text-justify leading-relaxed text-mesa-600 hyphens-auto">
          {INTRO[aba]}
        </p>
      </div>

      <nav
        className="mb-8 flex flex-wrap gap-2 border-b border-mesa-200 pb-3"
        aria-label="Seções do Instagram"
      >
        {ABAS.map((a) => (
          <Link
            key={a.v}
            href={`/admin/instagram?aba=${a.v}`}
            aria-current={aba === a.v ? "page" : undefined}
            className={`rounded-full border px-5 py-2 text-sm font-semibold transition ${
              aba === a.v
                ? "border-mesa-700 bg-mesa-700 text-mesa-50"
                : "border-mesa-200 bg-white text-mesa-600 hover:bg-mesa-100"
            }`}
          >
            {a.label}
          </Link>
        ))}
      </nav>

      {aba === "painel" && dadosPainel ? (
        <PainelInstagram
          conectado={dadosPainel.conectado}
          erro={dadosPainel.erro}
          conta={dadosPainel.conta}
          acoes={acoesDoDia({
            hoje,
            posts: dadosPainel.posts,
            salvos: carrosseis.map((c) => ({ id: c.id, status: c.status })),
            ideias,
            perfil: progressoDoPerfil(perfil, referencias),
          })}
          indicadores={indicadores(dadosPainel.posts, hoje)}
          semanas={constancia(dadosPainel.posts, hoje)}
          destaques={destaques(dadosPainel.posts, hoje)}
          melhorMomento={resumoPerfil.melhorHorario}
          formatoTop={resumoPerfil.formatoTop}
          totalPosts={postsDoPeriodo.length}
        />
      ) : aba === "roteiros" ? (
        <RoteirosConteudo
          cursos={cursosOpcoes}
          referencias={referenciasAnalisadas}
          roteirosIniciais={roteiros}
          hoje={hoje}
          abrirId={roteiroId}
        />
      ) : aba === "imagens" ? (
        <ImagensConteudo />
      ) : aba === "cortes" ? (
        <CortesConteudo
          // Análise que ficou "processando" depois de um reinício do servidor aparece como falha.
          cortesIniciais={cortes.map((c) =>
            travado(c)
              ? { ...c, status: "erro" as const, erro: "A análise foi interrompida." }
              : c,
          )}
          configurado={youtubeConfigurado() && Boolean(process.env.GROQ_API_KEY)}
        />
      ) : aba === "assistente" ? (
        <AssistenteConteudo />
      ) : aba === "piloto" ? (
        <PilotoConteudo
          configInicial={piloto}
          execucoesIniciais={execucoes}
          cursos={cursosOpcoes}
        />
      ) : aba === "perfil" ? (
        <PerfilConteudoForm perfilInicial={perfil} referenciasIniciais={referencias} />
      ) : aba === "calendario" ? (
        <>
          <PacoteSemana
            cursos={cursosOpcoes}
            referencias={referenciasAnalisadas}
            hoje={hoje}
            diasIniciais={diasSugeridos(hoje)}
          />
          <CalendarioConteudo
            // Montar um pacote cria ideias no servidor: a chave refaz o calendário com elas.
            key={`${ideias.length}:${carrosseis.length}:${semana ?? ""}`}
            ideiasIniciais={ideias}
            posts={carrosseis.map((c) => ({
              id: c.id,
              status: c.status,
              tipo: c.tipo,
              legenda: c.legenda,
              agendado_para: c.agendado_para ?? null,
              publicado_em: c.publicado_em ?? null,
            }))}
            hoje={hoje}
            semanaInicial={
              semana && /^\d{4}-\d{2}-\d{2}$/.test(semana) ? semana : undefined
            }
          />
        </>
      ) : (
        <>
          {!configurado && (
            <div className="mb-6 rounded-xl border border-amber-300 bg-amber-50 p-4 text-sm text-amber-800">
              ⚠️ A geração por IA ainda não está configurada (faltam credenciais
              Cloudflare). Avise o desenvolvedor.
            </div>
          )}

          <InstagramStudio ideia={ideia} />

          <div id="posts" className="mt-12 scroll-mt-6">
            <h2 className="mb-4 font-serif text-2xl font-semibold text-mesa-800">
              Agendados e rascunhos
            </h2>
            <ListaCarrosseisInstagram itens={carrosseis} />
          </div>
        </>
      )}
    </AdminShell>
  );
}
