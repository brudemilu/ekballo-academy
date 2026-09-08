import { CascaAluno, Leitura } from "@/components/Esqueleto";

export default function Carregando() {
  // max-w-3xl é a medida da mancha de leitura da mesa — o esqueleto
  // tem que nascer na mesma largura, senão o texto salta ao chegar.
  return (
    <CascaAluno largura="max-w-3xl" rotulo="Carregando a mesa">
      <Leitura />
    </CascaAluno>
  );
}
