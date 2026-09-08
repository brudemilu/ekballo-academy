import { CascaAluno, Cabecalho, Repete } from "@/components/Esqueleto";

export default function Carregando() {
  return (
    <CascaAluno rotulo="Carregando seu perfil">
      <Cabecalho />
      <div className="mt-10 space-y-4">
        <Repete vezes={3} className="space-y-4">
          <div className="rounded-2xl border border-mesa-200 bg-white p-6">
            <div className="esqueleto h-4 w-40" />
            <div className="esqueleto mt-4 h-10 w-full rounded-xl" />
          </div>
        </Repete>
      </div>
    </CascaAluno>
  );
}
