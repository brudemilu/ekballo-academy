import { parseFigura, parseQuadro } from "@/lib/estrutura-livro";

// Blocos especiais do texto dos livros: tabela ("[quadro]") e imagem
// ("[figura]"). Usados pelo leitor da mesa e pela leitura ao lado.

export function Quadro({ bloco }: { bloco: string }) {
  const { titulo, header, linhas } = parseQuadro(bloco);
  return (
    <div className="my-6 overflow-hidden rounded-xl border border-mesa-300">
      {titulo && (
        <div className="bg-mesa-100 px-4 py-2.5 text-center text-sm font-semibold uppercase tracking-wide text-mesa-800">
          {titulo}
        </div>
      )}
      <table className="w-full border-collapse text-sm">
        {header && (
          <thead>
            <tr>
              {header.map((c, j) => (
                <th
                  key={j}
                  className="border border-mesa-200 bg-mesa-50 px-3 py-2 text-center font-semibold text-mesa-800"
                >
                  {c}
                </th>
              ))}
            </tr>
          </thead>
        )}
        <tbody>
          {linhas.map((linha, i) => (
            <tr key={i}>
              {linha.map((c, j) => (
                <td
                  key={j}
                  className={`border border-mesa-200 px-3 py-2 align-top text-mesa-700 ${
                    linha.length === 2 && j === 0 ? "font-medium text-mesa-800" : ""
                  }`}
                >
                  {c}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export function Figura({ bloco }: { bloco: string }) {
  const { src, legenda } = parseFigura(bloco);
  return (
    <figure className="my-6">
      <img
        loading="lazy"
        decoding="async"
        src={src}
        alt={legenda || "Figura do livro"}
        className="mx-auto w-full max-w-2xl rounded-xl border border-mesa-300 bg-white p-3"
      />
      {legenda && (
        <figcaption className="mt-2 text-center text-sm text-mesa-600">
          {legenda}
        </figcaption>
      )}
    </figure>
  );
}
