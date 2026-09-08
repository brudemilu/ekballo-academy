import { CascaAluno, Cabecalho, Repete } from "@/components/Esqueleto";

export default function Carregando() {
  return (
    <CascaAluno largura="max-w-6xl" rotulo="Carregando seu caderno">
      <Cabecalho />
      <div className="mt-8 flex gap-2">
        <div className="esqueleto h-9 w-24 rounded-full" />
        <div className="esqueleto h-9 w-28 rounded-full" />
        <div className="esqueleto h-9 w-24 rounded-full" />
      </div>
      <div className="esqueleto mt-6 h-40 w-full rounded-2xl" />
      <div className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        <Repete vezes={6} className="contents">
          <div className="rounded-2xl border border-mesa-200 bg-white p-5">
            <div className="esqueleto h-4 w-3/4" />
            <div className="mt-4 space-y-2">
              <div className="esqueleto esqueleto-linha" />
              <div className="esqueleto esqueleto-linha" />
              <div className="esqueleto esqueleto-linha" />
            </div>
            <div className="esqueleto mt-5 h-2.5 w-20 rounded-full" />
          </div>
        </Repete>
      </div>
    </CascaAluno>
  );
}
