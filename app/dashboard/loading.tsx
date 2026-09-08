import { CascaAluno, CardPainel, CardLivro, Cabecalho, Repete } from "@/components/Esqueleto";

export default function Carregando() {
  return (
    <CascaAluno largura="max-w-6xl" rotulo="Carregando seu painel">
      <Cabecalho />
      <div className="mt-10 grid gap-4 sm:grid-cols-2">
        <Repete vezes={4} className="contents">
          <CardPainel />
        </Repete>
      </div>
      <div className="esqueleto mt-14 h-7 w-40" />
      <div className="mt-6 grid grid-cols-2 gap-5 sm:grid-cols-3 lg:grid-cols-4">
        <Repete vezes={4} className="contents">
          <CardLivro />
        </Repete>
      </div>
    </CascaAluno>
  );
}
