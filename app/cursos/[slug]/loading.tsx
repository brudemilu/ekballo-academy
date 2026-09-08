import { CascaAluno, LinhaMesa, Repete } from "@/components/Esqueleto";

export default function Carregando() {
  return (
    <CascaAluno rotulo="Carregando a temática">
      <div className="esqueleto h-4 w-20" />
      {/* Cartão de capa: etiqueta, título, descrição, ação. */}
      <div className="mt-6 rounded-2xl border border-mesa-200 bg-white p-8">
        <div className="esqueleto h-6 w-20 rounded-full" />
        <div className="esqueleto mt-5 h-10 w-4/5" />
        <div className="mt-5 space-y-2">
          <div className="esqueleto esqueleto-linha" />
          <div className="esqueleto esqueleto-linha" />
        </div>
        <div className="mt-6 border-t border-mesa-200 pt-6">
          <div className="esqueleto h-10 w-52 rounded-full" />
        </div>
      </div>
      <div className="esqueleto mt-8 h-14 w-full rounded-2xl" />
      <div className="esqueleto mt-12 h-8 w-64" />
      <div className="mt-6 space-y-3">
        <Repete vezes={6} className="space-y-3">
          <LinhaMesa />
        </Repete>
      </div>
    </CascaAluno>
  );
}
