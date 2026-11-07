"use client";

import { useCallback, useEffect, useState } from "react";

/**
 * Instagram → TikTok (issue #273): conectar a conta, ligar/desligar, escolher
 * entre mandar para os rascunhos ou publicar direto, e ver os últimos envios.
 */

type Envio = {
  ig_media_id: string;
  permalink: string | null;
  chamada: string | null;
  modo: "rascunho" | "direto";
  situacao: "enviando" | "processando" | "no_rascunho" | "publicado" | "erro";
  privacidade: string | null;
  erro: string | null;
  criado_em: string;
};

type Estado = {
  configurado: boolean;
  conta: {
    nome: string | null;
    avatarUrl: string | null;
    refreshExpiraEm: string | null;
  } | null;
  ativo: boolean;
  modo: "rascunho" | "direto";
  envios: Envio[];
};

const ROTULO: Record<Envio["situacao"], string> = {
  enviando: "⏳ Enviando",
  processando: "⏳ O TikTok está processando",
  no_rascunho: "📥 Nos rascunhos — confirme no app",
  publicado: "✅ Publicado",
  erro: "⚠️ Falhou",
};

function quando(iso: string) {
  return new Date(iso).toLocaleString("pt-BR", {
    day: "2-digit",
    month: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    timeZone: "America/Sao_Paulo",
  });
}

export function TikTokPainel() {
  const [estado, setEstado] = useState<Estado | null>(null);
  const [ocupado, setOcupado] = useState(false);
  const [erro, setErro] = useState("");
  const [aviso, setAviso] = useState("");

  const carregar = useCallback(async () => {
    try {
      const r = await fetch("/api/admin/instagram/tiktok");
      const d = await r.json();
      if (!r.ok) throw new Error(d?.error || "Falha");
      setEstado(d as Estado);
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Não consegui ler o TikTok.");
    }
  }, []);

  useEffect(() => {
    carregar();
    const resultado = new URLSearchParams(window.location.search).get("tiktok");
    if (resultado)
      setAviso(
        resultado === "conectado"
          ? "Conta do TikTok conectada. Agora é só ligar."
          : `TikTok: ${resultado}`,
      );
  }, [carregar]);

  async function enviar(metodo: "POST" | "DELETE", corpo?: object) {
    setOcupado(true);
    setErro("");
    try {
      const r = await fetch("/api/admin/instagram/tiktok", {
        method: metodo,
        headers: { "Content-Type": "application/json" },
        body: corpo ? JSON.stringify(corpo) : undefined,
      });
      const d = await r.json().catch(() => ({}));
      if (!r.ok) throw new Error(d?.error || "Falha");
      await carregar();
    } catch (e) {
      setErro(e instanceof Error ? e.message : "Não consegui salvar.");
    } finally {
      setOcupado(false);
    }
  }

  return (
    <div
      id="tiktok"
      className="mb-4 scroll-mt-6 rounded-2xl border border-mesa-200 bg-white p-4"
    >
      <div className="flex flex-wrap items-center gap-3">
        <div className="min-w-0 flex-1">
          <p className="text-sm font-semibold text-mesa-800">
            🎵 Repetir os Reels no TikTok
          </p>
          <p className="mt-1 text-xs text-mesa-500">
            Todo Reel publicado no Instagram da conta principal vai também para o TikTok
            — inclusive o que você postar direto no aplicativo.
          </p>
        </div>
        {estado?.conta && (
          <button
            type="button"
            onClick={() => enviar("POST", { ativo: !estado.ativo })}
            disabled={ocupado}
            aria-pressed={estado.ativo}
            className={`shrink-0 rounded-lg px-4 py-2 text-sm font-semibold transition disabled:opacity-50 ${
              estado.ativo
                ? "bg-oliveira-600 text-white hover:opacity-90"
                : "border border-mesa-300 bg-white text-mesa-700 hover:bg-mesa-100"
            }`}
          >
            {ocupado ? "Salvando…" : estado.ativo ? "Ligado" : "Desligado"}
          </button>
        )}
      </div>

      {aviso && <p className="mt-2 text-xs text-oliveira-700">{aviso}</p>}
      {erro && <p className="mt-2 text-xs text-red-600">{erro}</p>}

      {estado === null && !erro && (
        <p className="mt-3 text-xs text-mesa-500">Carregando…</p>
      )}

      {estado && !estado.configurado && (
        <p className="mt-3 rounded-lg bg-amber-50 p-3 text-xs text-amber-800">
          Falta cadastrar o aplicativo do TikTok no servidor (TIKTOK_CLIENT_KEY e
          TIKTOK_CLIENT_SECRET). Avise o desenvolvedor.
        </p>
      )}

      {estado?.configurado && !estado.conta && (
        <a
          href="/api/admin/instagram/tiktok/conectar"
          className="mt-3 inline-block rounded-lg bg-mesa-800 px-4 py-2 text-sm font-semibold text-white hover:opacity-90"
        >
          Conectar a conta do TikTok
        </a>
      )}

      {estado?.conta && (
        <div className="mt-3 space-y-3">
          <div className="flex flex-wrap items-center gap-2 text-xs text-mesa-600">
            {estado.conta.avatarUrl && (
              // biome-ignore lint/performance/noImgElement: foto de perfil externa do TikTok, sem otimização
              <img
                src={estado.conta.avatarUrl}
                alt=""
                className="h-6 w-6 rounded-full"
              />
            )}
            <span>
              Conectado como <strong>{estado.conta.nome || "conta do TikTok"}</strong>
            </span>
            <button
              type="button"
              onClick={() => {
                if (confirm("Desconectar a conta do TikTok?")) enviar("DELETE");
              }}
              disabled={ocupado}
              className="text-mesa-500 underline hover:text-mesa-700"
            >
              desconectar
            </button>
          </div>

          <div className="space-y-1 text-xs text-mesa-600">
            <p>
              <strong>Reel autorizado</strong> (botão "Publicar também no TikTok" em
              cada Reel agendado): vai direto para o seu perfil do TikTok com as
              escolhas que você fez. Enquanto o TikTok não aprovar o aplicativo, ele só
              aceita como &quot;só eu&quot;.
            </p>
            <p>
              <strong>Reel sem autorização</strong> (inclusive o que você posta direto
              no app do Instagram): vai para os rascunhos do TikTok, e a legenda chega
              no seu WhatsApp.
            </p>
          </div>

          {estado.envios.length > 0 && (
            <ul className="divide-y divide-mesa-100 rounded-lg border border-mesa-100 text-xs">
              {estado.envios.map((e) => (
                <li
                  key={e.ig_media_id}
                  className="flex flex-wrap items-center gap-2 p-2"
                >
                  <span className="text-mesa-500">{quando(e.criado_em)}</span>
                  <span className="min-w-0 flex-1 truncate text-mesa-700">
                    {e.permalink ? (
                      <a
                        href={e.permalink}
                        target="_blank"
                        rel="noreferrer"
                        className="underline"
                      >
                        {e.chamada || "Reel"}
                      </a>
                    ) : (
                      e.chamada || "Reel"
                    )}
                  </span>
                  <span>
                    {ROTULO[e.situacao]}
                    {e.situacao === "publicado" && e.privacidade === "SELF_ONLY"
                      ? " (somente você)"
                      : ""}
                  </span>
                  {e.situacao === "erro" && (
                    <>
                      <span className="w-full text-red-600">{e.erro}</span>
                      <button
                        type="button"
                        onClick={() => enviar("POST", { repetir: e.ig_media_id })}
                        disabled={ocupado}
                        className="rounded border border-mesa-300 px-2 py-0.5 text-mesa-700 hover:bg-mesa-100"
                      >
                        Tentar de novo
                      </button>
                    </>
                  )}
                </li>
              ))}
            </ul>
          )}
        </div>
      )}
    </div>
  );
}
