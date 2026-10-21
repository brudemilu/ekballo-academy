"use client";

import { useEffect, useRef, useState } from "react";
import {
  type AutorizacaoTikTok,
  avisoDeRotulo,
  type CriadorTikTok,
  declaracao,
  legendaParaTikTok,
  lerAutorizacao,
  ROTULO_PRIVACIDADE,
  URL_CONTEUDO_DE_MARCA,
  URL_USO_DE_MUSICA,
  validarAutorizacao,
} from "@/lib/tiktok";

/**
 * "Publicar também no TikTok" — autorização por vídeo (issue #275).
 *
 * Segue as regras de publicação direta do TikTok: mostra a conta que vai
 * receber, a escolha de quem pode ver SEM valor marcado, interações todas
 * desmarcadas (e travadas quando a conta não permite), conteúdo comercial,
 * prévia, legenda editável e a declaração antes do botão. Sem autorizar, o
 * Reel continua indo para os rascunhos do TikTok.
 */
export function TikTokAutorizacao({
  postId,
  legenda,
  videoUrl,
  inicial,
}: {
  postId: string;
  legenda: string;
  videoUrl?: string;
  inicial?: unknown;
}) {
  const [autorizada, setAutorizada] = useState<AutorizacaoTikTok | null>(
    lerAutorizacao(inicial),
  );
  const [aberto, setAberto] = useState(false);
  const [criador, setCriador] = useState<CriadorTikTok | null>(null);
  const [semConta, setSemConta] = useState(false);
  const [erro, setErro] = useState("");
  const [salvando, setSalvando] = useState(false);
  const [duracao, setDuracao] = useState<number | undefined>();
  const [f, setF] = useState<AutorizacaoTikTok>({
    privacidade: "",
    comentarios: false,
    dueto: false,
    costura: false,
    comercial: false,
    suaMarca: false,
    conteudoDeMarca: false,
    legenda: legendaParaTikTok(legenda),
  });
  const video = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    if (!aberto || criador || semConta) return;
    fetch("/api/admin/instagram/tiktok/autorizar")
      .then(async (r) => {
        const d = await r.json().catch(() => ({}));
        if (!r.ok)
          throw new Error(
            d?.error ||
              "Não consegui falar com o TikTok agora. Tente de novo mais tarde.",
          );
        if (!d.conectado) setSemConta(true);
        else setCriador(d.criador as CriadorTikTok);
      })
      .catch((e) => setErro(e instanceof Error ? e.message : "Falha"));
  }, [aberto, criador, semConta]);

  const muda = (parcial: Partial<AutorizacaoTikTok>) =>
    setF((x) => ({ ...x, ...parcial }));
  const problemas = criador ? validarAutorizacao(f, criador, duracao) : ["…"];
  const rotulo = avisoDeRotulo(f);
  const decl = declaracao(f);

  async function autorizar() {
    setSalvando(true);
    setErro("");
    try {
      const r = await fetch("/api/admin/instagram/tiktok/autorizar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: postId, autorizacao: f, duracaoSeg: duracao }),
      });
      const d = await r.json().catch(() => ({}));
      if (!r.ok) throw new Error(d?.error || "Falha");
      setAutorizada(d.autorizacao as AutorizacaoTikTok);
      setAberto(false);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Não consegui autorizar.");
    } finally {
      setSalvando(false);
    }
  }

  async function desfazer() {
    if (!confirm("Tirar a autorização? O Reel volta a ir para os rascunhos do TikTok."))
      return;
    const r = await fetch(`/api/admin/instagram/tiktok/autorizar?id=${postId}`, {
      method: "DELETE",
    });
    if (r.ok) setAutorizada(null);
  }

  if (autorizada) {
    return (
      <div className="mt-3 border-t border-mesa-100 pt-3 text-xs text-mesa-600">
        <p>
          🎵 <strong>TikTok autorizado</strong> ({autorizada.conta || "sua conta"}, quem
          pode ver:{" "}
          {ROTULO_PRIVACIDADE[autorizada.privacidade] || autorizada.privacidade}). Vai
          para o TikTok quando sair no Instagram — pode levar alguns minutos para
          aparecer no seu perfil.{" "}
          <button type="button" onClick={desfazer} className="text-mesa-500 underline">
            tirar autorização
          </button>
        </p>
      </div>
    );
  }

  return (
    <div className="mt-3 border-t border-mesa-100 pt-3">
      {!aberto ? (
        <button
          type="button"
          onClick={() => setAberto(true)}
          className="rounded-lg border border-mesa-300 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-100"
        >
          🎵 Publicar também no TikTok
        </button>
      ) : (
        <div className="space-y-3 rounded-xl border border-mesa-200 bg-mesa-50 p-3 text-xs text-mesa-700">
          <p className="text-sm font-semibold text-mesa-800">Publicar no TikTok</p>
          {erro && <p className="text-red-600">{erro}</p>}
          {semConta && (
            <p>
              Conecte a conta do TikTok no quadro "Repetir os Reels no TikTok" antes de
              autorizar.
            </p>
          )}
          {!criador && !semConta && !erro && <p>Lendo a sua conta do TikTok…</p>}
          {criador && (
            <>
              <p>
                Vai para a conta: <strong>{criador.nome}</strong>
                {criador.usuario ? ` (@${criador.usuario})` : ""}
              </p>

              {videoUrl && (
                // biome-ignore lint/a11y/useMediaCaption: prévia do Reel do próprio pastor, sem trilha de legenda
                <video
                  ref={video}
                  src={videoUrl}
                  controls
                  preload="metadata"
                  onLoadedMetadata={() =>
                    setDuracao(video.current?.duration || undefined)
                  }
                  className="max-h-72 rounded-lg bg-black"
                />
              )}

              <label className="block">
                <span className="mb-1 block font-medium">Legenda</span>
                <textarea
                  value={f.legenda}
                  onChange={(e) => muda({ legenda: e.target.value })}
                  rows={5}
                  className="w-full rounded-lg border border-mesa-200 bg-white p-2"
                />
              </label>

              <label className="block">
                <span className="mb-1 block font-medium">Quem pode ver este vídeo</span>
                <select
                  value={f.privacidade}
                  onChange={(e) => muda({ privacidade: e.target.value })}
                  className="w-full rounded-lg border border-mesa-200 bg-white p-2"
                >
                  <option value="" disabled>
                    Escolha…
                  </option>
                  {criador.privacidades.map((p) => {
                    const travado =
                      f.comercial && f.conteudoDeMarca && p === "SELF_ONLY";
                    return (
                      <option key={p} value={p} disabled={travado}>
                        {ROTULO_PRIVACIDADE[p] || p}
                        {travado ? " — conteúdo de marca não pode ser privado" : ""}
                      </option>
                    );
                  })}
                </select>
              </label>

              <fieldset className="space-y-1">
                <legend className="mb-1 font-medium">Permitir que as pessoas</legend>
                {(
                  [
                    ["comentarios", "comentem", criador.comentarioBloqueado],
                    ["dueto", "façam dueto", criador.duetoBloqueado],
                    ["costura", "façam costura", criador.costuraBloqueada],
                  ] as const
                ).map(([chave, rotuloInt, bloqueado]) => (
                  <label
                    key={chave}
                    className={`flex items-center gap-2 ${bloqueado ? "opacity-50" : ""}`}
                  >
                    <input
                      type="checkbox"
                      checked={f[chave]}
                      disabled={bloqueado}
                      onChange={(e) => muda({ [chave]: e.target.checked })}
                    />
                    <span>
                      {rotuloInt}
                      {bloqueado ? " (desligado nas configurações da sua conta)" : ""}
                    </span>
                  </label>
                ))}
              </fieldset>

              <fieldset className="space-y-1">
                <label className="flex items-center gap-2 font-medium">
                  <input
                    type="checkbox"
                    checked={f.comercial}
                    onChange={(e) =>
                      muda({
                        comercial: e.target.checked,
                        suaMarca: false,
                        conteudoDeMarca: false,
                      })
                    }
                  />
                  Divulgar conteúdo comercial
                </label>
                <p className="text-mesa-500">
                  Marque se o vídeo promove você, uma marca, produto ou serviço.
                </p>
                {f.comercial && (
                  <div className="ml-5 space-y-1">
                    <label className="flex items-center gap-2">
                      <input
                        type="checkbox"
                        checked={f.suaMarca}
                        onChange={(e) => muda({ suaMarca: e.target.checked })}
                      />
                      Sua marca (você está promovendo a si mesmo ou o seu negócio)
                    </label>
                    <label className="flex items-center gap-2">
                      <input
                        type="checkbox"
                        checked={f.conteudoDeMarca}
                        onChange={(e) =>
                          muda({
                            conteudoDeMarca: e.target.checked,
                            privacidade:
                              e.target.checked && f.privacidade === "SELF_ONLY"
                                ? ""
                                : f.privacidade,
                          })
                        }
                      />
                      Conteúdo de marca (parceria paga com outra marca)
                    </label>
                    {rotulo && <p className="text-amber-700">{rotulo}</p>}
                  </div>
                )}
              </fieldset>

              <p className="text-mesa-500">
                {decl.marca ? (
                  <>
                    Ao publicar, você concorda com a{" "}
                    <a
                      href={URL_CONTEUDO_DE_MARCA}
                      target="_blank"
                      rel="noreferrer"
                      className="underline"
                    >
                      Política de Conteúdo de Marca
                    </a>{" "}
                    e com a{" "}
                    <a
                      href={URL_USO_DE_MUSICA}
                      target="_blank"
                      rel="noreferrer"
                      className="underline"
                    >
                      Confirmação de Uso de Música
                    </a>{" "}
                    do TikTok.
                  </>
                ) : (
                  <>
                    Ao publicar, você concorda com a{" "}
                    <a
                      href={URL_USO_DE_MUSICA}
                      target="_blank"
                      rel="noreferrer"
                      className="underline"
                    >
                      Confirmação de Uso de Música
                    </a>{" "}
                    do TikTok.
                  </>
                )}
              </p>
              <p className="text-mesa-500">
                O vídeo vai para o TikTok quando sair no Instagram. Depois de enviado,
                pode levar alguns minutos para aparecer no seu perfil.
              </p>

              {criador && problemas.length > 0 && problemas[0] !== "…" && (
                <ul className="list-disc pl-5 text-amber-700">
                  {problemas.map((p) => (
                    <li key={p}>{p}</li>
                  ))}
                </ul>
              )}
              <div className="flex gap-2">
                <button
                  type="button"
                  onClick={autorizar}
                  disabled={salvando || problemas.length > 0}
                  className="rounded-lg bg-mesa-800 px-3 py-2 text-xs font-semibold text-white hover:opacity-90 disabled:opacity-40"
                >
                  {salvando ? "Autorizando…" : "Autorizar publicação no TikTok"}
                </button>
                <button
                  type="button"
                  onClick={() => setAberto(false)}
                  className="rounded-lg border border-mesa-300 px-3 py-2 text-xs"
                >
                  Fechar
                </button>
              </div>
            </>
          )}
        </div>
      )}
    </div>
  );
}
