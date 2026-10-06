import type {
  Achado,
  LinhaFormato,
  PostQueCresceu,
  ResumoCrescimento,
} from "@/lib/crescimento";
import { NOME_FORMATO } from "@/lib/crescimento";

/**
 * Seção de crescimento do painel do Instagram (issue #225): o que diz se o
 * perfil está chegando a gente nova. Só mostra — as contas são de
 * lib/crescimento.ts. Número que o Instagram não informa aparece como "—",
 * nunca como zero: zero é uma informação, "não sei" é outra.
 */

const semDado = "—";
const inteiro = (n: number | null | undefined) =>
  typeof n === "number" ? n.toLocaleString("pt-BR") : semDado;
const decimal = (n: number | null | undefined) =>
  typeof n === "number" ? n.toFixed(1).replace(".", ",") : semDado;

function primeiraLinha(t: string) {
  const linha = (t || "").split("\n")[0].trim();
  return linha.length > 90 ? `${linha.slice(0, 90)}…` : linha || "(sem legenda)";
}

function Numero({
  rotulo,
  valor,
  apoio,
}: {
  rotulo: string;
  valor: string;
  apoio?: string;
}) {
  return (
    <div className="rounded-xl border border-mesa-200 bg-bege-50 p-3">
      <p className="text-xs font-medium uppercase tracking-wider text-mesa-500">
        {rotulo}
      </p>
      <p className="mt-1 font-serif text-2xl font-semibold text-mesa-800">{valor}</p>
      {apoio ? <p className="mt-0.5 text-xs text-mesa-500">{apoio}</p> : null}
    </div>
  );
}

export function CrescimentoInstagram({
  resumo,
  seguidoresNovos30,
  visitasPerfil30,
  alcance30,
  formatos,
  achados,
  melhores,
}: {
  resumo: ResumoCrescimento;
  /** Da conta inteira, em 30 dias; null quando o Instagram não informa. */
  seguidoresNovos30: number | null;
  visitasPerfil30: number | null;
  alcance30: number | null;
  formatos: LinhaFormato[];
  achados: Achado[];
  melhores: PostQueCresceu[];
}) {
  const novos =
    typeof seguidoresNovos30 === "number"
      ? `${seguidoresNovos30 > 0 ? "+" : ""}${seguidoresNovos30.toLocaleString("pt-BR")}`
      : semDado;
  return (
    <section className="rounded-2xl border border-mesa-200 bg-white p-5">
      <h2 className="font-serif text-xl font-semibold text-mesa-800">Crescimento</h2>
      <p className="mt-1 text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
        O que mostra se o perfil está chegando a gente nova. Curtida diz que quem já
        segue gostou; envio e salvamento são o que leva o post a quem ainda não segue.
      </p>

      <div className="mt-4 grid grid-cols-2 gap-3 md:grid-cols-4">
        <Numero rotulo="Seguidores novos" valor={novos} apoio="saldo em 30 dias" />
        <Numero
          rotulo="Visitas ao perfil"
          valor={inteiro(visitasPerfil30)}
          apoio="em 30 dias"
        />
        <Numero
          rotulo="Alcance de um post"
          valor={inteiro(resumo.alcanceTipico)}
          apoio={
            resumo.alcanceSobreSeguidores !== null
              ? `${Math.round(resumo.alcanceSobreSeguidores * 100)}% dos seguidores`
              : "típico, em 30 dias"
          }
        />
        <Numero
          rotulo="Envios"
          valor={inteiro(resumo.compartilhamentos)}
          apoio={
            resumo.enviosPorCemAlcancados !== null
              ? `${decimal(resumo.enviosPorCemAlcancados)} a cada 100 alcançados`
              : `em ${resumo.posts} posts`
          }
        />
      </div>
      <p className="mt-2 text-xs text-mesa-500">
        {resumo.posts} {resumo.posts === 1 ? "post" : "posts"} em {resumo.dias} dias ·{" "}
        {inteiro(resumo.salvos)} salvamentos · {inteiro(resumo.seguiuPelosPosts)}{" "}
        seguiram a partir de um post do feed · {inteiro(alcance30)} contas alcançadas ao
        todo
      </p>

      {achados.length > 0 && (
        <div className="mt-5">
          <h3 className="text-sm font-semibold text-mesa-800">
            O que os números dizem
          </h3>
          <ul className="mt-2 space-y-2">
            {achados.map((a) => (
              <li key={a.chave} className="rounded-lg border border-mesa-200 p-3">
                <p className="text-sm font-medium text-mesa-800">{a.titulo}</p>
                <p className="mt-1 text-justify text-sm leading-relaxed text-mesa-600 hyphens-auto">
                  {a.detalhe}
                </p>
              </li>
            ))}
          </ul>
        </div>
      )}

      {formatos.length > 0 && (
        <div className="mt-5">
          <h3 className="text-sm font-semibold text-mesa-800">
            Por formato, em 90 dias
          </h3>
          <div className="mt-2 overflow-x-auto">
            <table className="w-full min-w-[26rem] text-left text-sm">
              <thead>
                <tr className="border-b border-mesa-200 text-xs uppercase tracking-wider text-mesa-500">
                  <th scope="col" className="py-2 pr-3 font-medium">
                    Formato
                  </th>
                  <th scope="col" className="py-2 pr-3 text-right font-medium">
                    Posts
                  </th>
                  <th scope="col" className="py-2 pr-3 text-right font-medium">
                    Alcance típico
                  </th>
                  <th scope="col" className="py-2 pr-3 text-right font-medium">
                    Envios por post
                  </th>
                  <th scope="col" className="py-2 text-right font-medium">
                    Salvos por post
                  </th>
                </tr>
              </thead>
              <tbody>
                {formatos.map((f) => (
                  <tr
                    key={f.formato}
                    className="border-b border-mesa-100 text-mesa-800"
                  >
                    <th scope="row" className="py-2 pr-3 font-medium">
                      {NOME_FORMATO[f.formato]}
                    </th>
                    <td className="py-2 pr-3 text-right tabular-nums">{f.posts}</td>
                    <td className="py-2 pr-3 text-right tabular-nums">
                      {inteiro(f.alcanceTipico)}
                    </td>
                    <td className="py-2 pr-3 text-right tabular-nums">
                      {decimal(f.compartilhamentos)}
                    </td>
                    <td className="py-2 text-right tabular-nums">
                      {decimal(f.salvos)}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {melhores.length > 0 && (
        <div className="mt-5">
          <h3 className="text-sm font-semibold text-mesa-800">
            Os posts que mais andaram
          </h3>
          <ul className="mt-2 space-y-2">
            {melhores.map((m) => (
              <li
                key={m.post.id}
                className="rounded-lg border border-mesa-200 bg-bege-50 p-3"
              >
                <p className="text-sm text-mesa-800">{primeiraLinha(m.post.caption)}</p>
                <p className="mt-1 text-xs text-mesa-500">
                  {NOME_FORMATO[m.formato]} · {m.motivo}
                  {m.post.permalink ? (
                    <>
                      {" · "}
                      <a
                        href={m.post.permalink}
                        target="_blank"
                        rel="noreferrer"
                        className="font-medium text-laranja-700 underline"
                      >
                        ver no Instagram
                      </a>
                    </>
                  ) : null}
                </p>
              </li>
            ))}
          </ul>
        </div>
      )}
    </section>
  );
}
