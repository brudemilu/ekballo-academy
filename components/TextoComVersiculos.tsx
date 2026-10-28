import { acharReferencias, type FaixaRef } from "@/lib/referencia-biblica";

// Texto corrido com as referências bíblicas clicáveis (issue #282). Não tem
// estado nem "use client": só marca cada referência com data-ref-livro /
// data-ref-trechos, e o VersiculoPopup (montado uma vez no layout) é quem
// escuta o clique. Assim serve em página de servidor e em componente de
// cliente do mesmo jeito.

/** Atributos que transformam um elemento em referência clicável. */
export function atributosRef(f: Pick<FaixaRef, "livroId" | "trechos">) {
  if (!f.livroId || !f.trechos) return {};
  return {
    "data-ref-livro": f.livroId,
    "data-ref-trechos": f.trechos,
    role: "button",
    tabIndex: 0,
    title: "Ler o versículo",
  } as const;
}

export function TextoComVersiculos({
  texto,
  herdarCor = false,
}: {
  texto: string;
  /** Em fundo de tema (sépia, escuro): mantém a cor do texto, só sublinha. */
  herdarCor?: boolean;
}) {
  const faixas = acharReferencias(texto);
  if (faixas.length === 0) return <>{texto}</>;

  const partes: React.ReactNode[] = [];
  let pos = 0;
  faixas.forEach((f, i) => {
    if (f.start > pos) partes.push(texto.slice(pos, f.start));
    partes.push(
      <span
        key={i}
        className={herdarCor ? "ref-biblica ref-herda-cor" : "ref-biblica"}
        {...atributosRef(f)}
      >
        {texto.slice(f.start, f.end)}
      </span>,
    );
    pos = f.end;
  });
  if (pos < texto.length) partes.push(texto.slice(pos));
  return <>{partes}</>;
}
