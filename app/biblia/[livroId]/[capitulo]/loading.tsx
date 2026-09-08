import { CascaAluno, Linhas } from "@/components/Esqueleto";

export default function Carregando() {
  return (
    <CascaAluno largura="max-w-3xl" rotulo="Carregando o capítulo">
      <div className="esqueleto h-3 w-32 rounded-full" />
      <div className="esqueleto mt-4 h-9 w-56" />
      {/* Versículos: número curto + texto. */}
      <div className="mt-10 space-y-5">
        {Array.from({ length: 12 }, (_, i) => (
          <div key={i} className="flex gap-3">
            <div className="esqueleto h-3 w-5 flex-none rounded" />
            <Linhas quantidade={2} className="flex-1" />
          </div>
        ))}
      </div>
    </CascaAluno>
  );
}
