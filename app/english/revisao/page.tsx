import Link from "next/link";
import { redirect } from "next/navigation";
import { EnglishLicaoPlayer } from "@/components/EnglishLicaoPlayer";
import { getCurrentSession } from "@/lib/db";
import { montarRevisao } from "@/lib/english";
import type { EnglishLicao, EnglishModulo } from "@/lib/english-tipos";

export const metadata = { title: "Revisão · Ekballo English" };

// O player pede módulo e lição. Na revisão os exercícios vêm de várias
// lições ao mesmo tempo, então entram estes marcadores — o modo `revisao`
// faz o player ignorar quase tudo deles (só o id da lição fica sem uso).
const MODULO_REVISAO: EnglishModulo = {
  id: "revisao", numero: 0, slug: "revisao", titulo: "Revisão",
  titulo_en: "Review", descricao: null, nivel: "iniciante", publicado: true,
};
const LICAO_REVISAO: EnglishLicao = {
  id: "revisao", modulo_id: "revisao", numero: 0, slug: "revisao",
  titulo: "Revisão do dia", titulo_pt: null, objetivo: null,
  versiculo_ref: null, versiculo_en: null, versiculo_pt: null, publicado: true,
};

export default async function EnglishRevisaoPage() {
  const session = await getCurrentSession();
  if (!session) redirect("/login");

  const revisao = await montarRevisao(session.userId);

  // Sem lição concluída não há o que revisar — e dizer isso é melhor que
  // mostrar uma tela vazia ou mandar de volta sem explicação.
  if (!revisao.disponivel || revisao.exercicios.length === 0) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-bege-50 px-6">
        <div className="max-w-md text-center">
          <p className="text-5xl">🔁</p>
          <h1 className="mt-5 font-display text-2xl font-semibold text-mesa-900">
            Ainda não há o que revisar
          </h1>
          <p className="mt-3 font-ui leading-relaxed text-mesa-600">
            A revisão sorteia exercícios das lições que você já concluiu. Faça a primeira
            lição e ela aparece aqui no dia seguinte.
          </p>
          <Link
            href="/english/jornada"
            className="mt-7 inline-block rounded-full bg-laranja-500 px-7 py-3 font-ui font-semibold text-white transition hover:bg-laranja-600"
          >
            Ir para a trilha
          </Link>
        </div>
      </main>
    );
  }

  return (
    <EnglishLicaoPlayer
      modulo={MODULO_REVISAO}
      licao={LICAO_REVISAO}
      exercicios={revisao.exercicios}
      proximaSlug={null}
      revisao
    />
  );
}
