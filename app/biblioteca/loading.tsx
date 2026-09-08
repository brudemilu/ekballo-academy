import { CascaAluno, CardLivro, Cabecalho, Repete } from "@/components/Esqueleto";

export default function Carregando() {
  return (
    <CascaAluno largura="max-w-6xl" rotulo="Carregando a biblioteca">
      <Cabecalho />
      <div className="mt-10 grid grid-cols-2 gap-5 sm:grid-cols-3 lg:grid-cols-5">
        <Repete vezes={10} className="contents">
          <CardLivro />
        </Repete>
      </div>
    </CascaAluno>
  );
}
