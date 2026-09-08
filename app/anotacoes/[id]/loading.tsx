import { CascaAluno, Linhas } from "@/components/Esqueleto";

export default function Carregando() {
  return (
    <CascaAluno largura="max-w-4xl" rotulo="Carregando a anotação">
      {/* Barra de formatação do editor. */}
      <div className="flex flex-wrap gap-1.5">
        {Array.from({ length: 9 }, (_, i) => (
          <div key={i} className="esqueleto h-8 w-8 rounded-lg" />
        ))}
      </div>
      <div className="esqueleto mt-6 h-9 w-2/3" />
      <div className="mt-8 space-y-6">
        <Linhas quantidade={4} />
        <Linhas quantidade={5} />
        <Linhas quantidade={3} />
      </div>
    </CascaAluno>
  );
}
