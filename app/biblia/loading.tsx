import { CascaAluno, Cabecalho, Repete } from "@/components/Esqueleto";

export default function Carregando() {
  return (
    <CascaAluno largura="max-w-5xl" rotulo="Carregando a Bíblia">
      <Cabecalho />
      {/* Os dois testamentos, cada um com sua grade de livros. */}
      {[0, 1].map((t) => (
        <div key={t} className="mt-10">
          <div className="esqueleto h-6 w-48" />
          <div className="mt-5 grid grid-cols-2 gap-2.5 sm:grid-cols-3 lg:grid-cols-4">
            <Repete vezes={8} className="contents">
              <div className="esqueleto h-11 rounded-xl" />
            </Repete>
          </div>
        </div>
      ))}
    </CascaAluno>
  );
}
