import Link from "next/link";
import { BotaoLiberarAcesso } from "@/components/BotaoLiberarAcesso";
import { PiscaAtencao, PontoAtencao } from "@/components/PiscaAtencao";
import { rotuloDeChegada } from "@/lib/novidades";
import { aguardaLiberacao } from "@/lib/novos-cadastros";
import { displayTelefone } from "@/lib/telefone";

type Cadastro = {
  id: string;
  nome: string | null;
  email: string;
  telefone: string | null;
  is_admin: boolean;
  acesso_liberado: boolean;
  created_at: string;
};

// Quem chegou: os que aguardam liberação (sempre) e os liberados há pouco.
// A seleção e a ordem vêm de lib/novos-cadastros — aqui é só a tela.
export function NovosCadastros({ cadastros }: { cadastros: Cadastro[] }) {
  const pendentes = cadastros.filter(aguardaLiberacao).length;

  return (
    <section
      id="novos"
      aria-labelledby="novos-titulo"
      className="relative mt-6 scroll-mt-24 rounded-2xl border border-amber-200 bg-amber-50/50 p-5 sm:p-6"
    >
      {/* Pisca só enquanto há alguém esperando; liberou todo mundo, sossega. */}
      {pendentes > 0 && <PiscaAtencao />}
      <h2
        id="novos-titulo"
        className="relative flex items-center gap-2 font-serif text-2xl font-semibold text-mesa-800"
      >
        {pendentes > 0 && <PontoAtencao />}
        Novos cadastros
      </h2>
      <p className="relative mt-1 text-sm text-mesa-600">
        {pendentes > 0
          ? `${pendentes} ${pendentes === 1 ? "pessoa aguardando" : "pessoas aguardando"} a sua liberação.`
          : cadastros.length > 0
            ? "Ninguém aguardando liberação. Estes chegaram há pouco."
            : "Ninguém aguardando liberação e nenhum cadastro recente."}
      </p>

      {cadastros.length > 0 && (
        <ul className="relative mt-4 space-y-2">
          {cadastros.map((c) => {
            const pendente = aguardaLiberacao(c);
            const nome = c.nome || "(sem nome)";
            return (
              <li
                key={c.id}
                className="flex flex-col gap-3 rounded-xl border border-mesa-200 bg-white p-4 sm:flex-row sm:items-center sm:justify-between"
              >
                <div className="min-w-0">
                  <p className="flex flex-wrap items-center gap-2">
                    <Link
                      href={`/admin/alunos/${c.id}`}
                      className="font-medium text-mesa-800 hover:underline"
                    >
                      {nome}
                    </Link>
                    <span
                      className={
                        pendente
                          ? "rounded-full bg-amber-100 px-2 py-0.5 text-[11px] font-medium text-amber-800"
                          : "rounded-full bg-oliveira-100 px-2 py-0.5 text-[11px] font-medium text-oliveira-700"
                      }
                    >
                      {pendente ? "Aguardando liberação" : "Liberado"}
                    </span>
                  </p>
                  <p className="truncate text-sm text-mesa-600">{c.email}</p>
                  <p className="text-xs text-mesa-500">
                    {c.telefone ? displayTelefone(c.telefone) : "Sem WhatsApp"}
                    {" · "}
                    {new Date(c.created_at).toLocaleDateString("pt-BR", {
                      timeZone: "America/Sao_Paulo",
                    })}
                    {rotuloDeChegada(c.created_at) &&
                      ` (${rotuloDeChegada(c.created_at)})`}
                  </p>
                </div>
                <div className="flex flex-none items-center gap-3">
                  <Link
                    href={`/admin/alunos/${c.id}`}
                    className="text-sm font-medium text-mesa-600 hover:underline"
                  >
                    Abrir ficha
                  </Link>
                  {pendente && <BotaoLiberarAcesso alunoId={c.id} nome={nome} />}
                </div>
              </li>
            );
          })}
        </ul>
      )}
    </section>
  );
}
