"use client";

import { useCallback, useEffect, useRef, useState } from "react";

type Status = { connected: boolean; loggedIn: boolean; nome?: string | null; mock?: boolean };
type Grupo = { JID?: string; Jid?: string; jid?: string; Name?: string; name?: string };

function jidDoGrupo(g: Grupo): string {
  return g.JID || g.Jid || g.jid || "";
}
function nomeDoGrupo(g: Grupo): string {
  return g.Name || g.name || jidDoGrupo(g) || "(sem nome)";
}

export function WhatsAppPainel() {
  const [status, setStatus] = useState<Status | null>(null);
  const [qr, setQr] = useState<string | null>(null);
  const [conectando, setConectando] = useState(false);
  const [grupos, setGrupos] = useState<Grupo[] | null>(null);
  const [carregandoGrupos, setCarregandoGrupos] = useState(false);

  // form de envio
  const [destinatario, setDestinatario] = useState("");
  const [tipo, setTipo] = useState<"texto" | "midia">("texto");
  const [mensagem, setMensagem] = useState("");
  const [url, setUrl] = useState("");
  const [midiaTipo, setMidiaTipo] = useState<"image" | "video" | "audio" | "document">("image");
  const [legenda, setLegenda] = useState("");
  const [filename, setFilename] = useState("");
  const [enviando, setEnviando] = useState(false);
  const [resultado, setResultado] = useState<{ ok: boolean; texto: string } | null>(null);

  const pollRef = useRef<ReturnType<typeof setInterval> | null>(null);

  const carregarStatus = useCallback(async () => {
    try {
      const r = await fetch("/api/admin/whatsapp");
      const d = (await r.json()) as Status;
      setStatus(d);
      if (d.loggedIn && pollRef.current) {
        clearInterval(pollRef.current);
        pollRef.current = null;
        setQr(null);
      }
    } catch {
      /* ignora; usuário pode tentar de novo */
    }
  }, []);

  useEffect(() => {
    carregarStatus();
    return () => {
      if (pollRef.current) clearInterval(pollRef.current);
    };
  }, [carregarStatus]);

  async function conectar() {
    setConectando(true);
    setQr(null);
    try {
      const r = await fetch("/api/admin/whatsapp", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ acao: "conectar" }),
      });
      const d = await r.json();
      setStatus((s) => ({ ...(s || { connected: false, loggedIn: false }), ...d }));
      setQr(d.qrcode || null);
      // Faz polling do status enquanto o QR estiver na tela.
      if (!d.loggedIn) {
        if (pollRef.current) clearInterval(pollRef.current);
        pollRef.current = setInterval(carregarStatus, 4000);
      }
    } catch {
      setResultado({ ok: false, texto: "Erro de rede ao conectar." });
    } finally {
      setConectando(false);
    }
  }

  async function carregarGrupos() {
    setCarregandoGrupos(true);
    try {
      const r = await fetch("/api/admin/whatsapp", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ acao: "grupos" }),
      });
      const d = await r.json();
      setGrupos(Array.isArray(d.grupos) ? d.grupos : []);
    } catch {
      setGrupos([]);
    } finally {
      setCarregandoGrupos(false);
    }
  }

  async function enviar() {
    setResultado(null);
    if (!destinatario.trim()) {
      setResultado({ ok: false, texto: "Informe o número ou o grupo de destino." });
      return;
    }
    setEnviando(true);
    try {
      const payload =
        tipo === "texto"
          ? { acao: "enviar", tipo, destinatario, mensagem }
          : { acao: "enviar", tipo, destinatario, url, midia_tipo: midiaTipo, legenda, filename };
      const r = await fetch("/api/admin/whatsapp", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });
      const d = await r.json();
      if (r.ok && d.status === "enviado") {
        setResultado({ ok: true, texto: `Enviado! ${d.message_id ? `(id ${d.message_id})` : ""}` });
        if (tipo === "texto") setMensagem("");
      } else {
        setResultado({ ok: false, texto: d.erro || JSON.stringify(d.evolution_body || d) });
      }
    } catch (e) {
      setResultado({ ok: false, texto: e instanceof Error ? e.message : "erro de rede" });
    } finally {
      setEnviando(false);
    }
  }

  const conectado = !!status?.loggedIn;
  const inputCls =
    "w-full rounded-xl border border-mesa-200 bg-white px-4 py-3 text-sm text-mesa-800 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200";

  return (
    <div className="space-y-10">
      {status?.mock && (
        <div className="rounded-xl border border-amber-300 bg-amber-50 p-4 text-sm text-amber-900">
          Modo demonstração ativo — o WhatsApp real só funciona rodando com Supabase
          (<code>NEXT_PUBLIC_MOCK_MODE=false</code>) e os secrets <code>EVOLUTION_*</code> configurados.
        </div>
      )}

      {/* CONEXÃO */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-6">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div>
            <h2 className="font-serif text-2xl font-semibold text-mesa-800">Conexão</h2>
            <p className="mt-1 flex items-center gap-2 text-sm text-mesa-600">
              <span
                className={`inline-block h-2.5 w-2.5 rounded-full ${
                  conectado ? "bg-oliveira-600" : "bg-red-500"
                }`}
              />
              {conectado
                ? `Conectado${status?.nome ? ` como ${status.nome}` : ""}`
                : "Desconectado — escaneie o QR para parear o WhatsApp"}
            </p>
          </div>
          <div className="flex gap-2">
            <button
              type="button"
              onClick={carregarStatus}
              className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
            >
              Atualizar status
            </button>
            {!conectado && (
              <button
                type="button"
                onClick={conectar}
                disabled={conectando}
                className="rounded-full bg-laranja-600 px-5 py-2 text-xs font-medium text-white hover:bg-laranja-700 disabled:opacity-50"
              >
                {conectando ? "Gerando QR…" : qr ? "Gerar novo QR" : "Conectar / Gerar QR"}
              </button>
            )}
          </div>
        </div>

        {qr && !conectado && (
          <div className="mt-6 flex flex-col items-center gap-3 rounded-xl bg-mesa-50 p-6">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src={qr} alt="QR code para conectar o WhatsApp" className="h-64 w-64" />
            <p className="max-w-sm text-center text-sm text-mesa-600">
              No celular: <strong>WhatsApp → Configurações → Aparelhos conectados →
              Conectar um aparelho</strong> e aponte para o código. Ele expira em ~30s —
              se sumir, clique em <em>Gerar novo QR</em>.
            </p>
          </div>
        )}
      </section>

      {/* ENVIO */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-6">
        <h2 className="font-serif text-2xl font-semibold text-mesa-800">Enviar mensagem</h2>
        <p className="mt-1 text-sm text-mesa-600">
          Para um número (com DDD; o &ldquo;55&rdquo; é adicionado se faltar) ou para um grupo
          (use o JID terminado em <code>@g.us</code>).
        </p>

        <div className="mt-5 space-y-4">
          <div>
            <label className="mb-1 block text-xs font-medium uppercase tracking-wide text-mesa-500">
              Destino
            </label>
            <input
              value={destinatario}
              onChange={(e) => setDestinatario(e.target.value)}
              placeholder="11999998888  ou  120363...@g.us"
              className={inputCls}
            />
          </div>

          <div className="flex gap-2">
            {(["texto", "midia"] as const).map((t) => (
              <button
                key={t}
                type="button"
                onClick={() => setTipo(t)}
                className={`rounded-full px-4 py-1.5 text-xs font-medium transition ${
                  tipo === t
                    ? "bg-mesa-700 text-mesa-50"
                    : "border border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-100"
                }`}
              >
                {t === "texto" ? "Texto" : "Mídia"}
              </button>
            ))}
          </div>

          {tipo === "texto" ? (
            <textarea
              value={mensagem}
              onChange={(e) => setMensagem(e.target.value)}
              rows={4}
              placeholder="Sua mensagem…"
              className={inputCls}
            />
          ) : (
            <div className="space-y-3">
              <input
                value={url}
                onChange={(e) => setUrl(e.target.value)}
                placeholder="URL pública da mídia (https://…)"
                className={inputCls}
              />
              <div className="flex flex-wrap gap-3">
                <select
                  value={midiaTipo}
                  onChange={(e) => setMidiaTipo(e.target.value as typeof midiaTipo)}
                  className={`${inputCls} sm:w-auto`}
                >
                  <option value="image">Imagem</option>
                  <option value="video">Vídeo</option>
                  <option value="audio">Áudio</option>
                  <option value="document">Documento</option>
                </select>
                {midiaTipo === "document" && (
                  <input
                    value={filename}
                    onChange={(e) => setFilename(e.target.value)}
                    placeholder="nome-do-arquivo.pdf"
                    className={`${inputCls} sm:flex-1`}
                  />
                )}
              </div>
              {midiaTipo !== "audio" && (
                <input
                  value={legenda}
                  onChange={(e) => setLegenda(e.target.value)}
                  placeholder="Legenda (opcional)"
                  className={inputCls}
                />
              )}
            </div>
          )}

          <button
            type="button"
            onClick={enviar}
            disabled={enviando || !conectado}
            className="rounded-xl bg-laranja-600 px-6 py-3 text-sm font-medium text-white hover:bg-laranja-700 disabled:cursor-not-allowed disabled:opacity-50"
          >
            {enviando ? "Enviando…" : "Enviar"}
          </button>
          {!conectado && (
            <p className="text-xs text-mesa-500">Conecte o WhatsApp acima para habilitar o envio.</p>
          )}

          {resultado && (
            <div
              className={`rounded-xl border p-4 text-sm ${
                resultado.ok
                  ? "border-oliveira-200 bg-oliveira-50 text-oliveira-800"
                  : "border-red-300 bg-red-50 text-red-900"
              }`}
            >
              {resultado.texto}
            </div>
          )}
        </div>
      </section>

      {/* GRUPOS */}
      <section className="rounded-2xl border border-mesa-200 bg-white p-6">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div>
            <h2 className="font-serif text-2xl font-semibold text-mesa-800">Grupos</h2>
            <p className="mt-1 text-sm text-mesa-600">
              Clique em um grupo para usá-lo como destino no envio acima.
            </p>
          </div>
          <button
            type="button"
            onClick={carregarGrupos}
            disabled={carregandoGrupos || !conectado}
            className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50 disabled:opacity-50"
          >
            {carregandoGrupos ? "Carregando…" : "Carregar grupos"}
          </button>
        </div>

        {grupos && (
          <ul className="mt-4 divide-y divide-mesa-100">
            {grupos.length === 0 && (
              <li className="py-4 text-sm text-mesa-500">
                Nenhum grupo encontrado (ou o WhatsApp ainda não sincronizou).
              </li>
            )}
            {grupos.map((g) => {
              const jid = jidDoGrupo(g);
              return (
                <li key={jid} className="flex items-center justify-between gap-3 py-3">
                  <div className="min-w-0">
                    <p className="truncate text-sm font-medium text-mesa-800">{nomeDoGrupo(g)}</p>
                    <p className="truncate text-xs text-mesa-400">{jid}</p>
                  </div>
                  <button
                    type="button"
                    onClick={() => setDestinatario(jid)}
                    className="flex-none rounded-full border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
                  >
                    Usar
                  </button>
                </li>
              );
            })}
          </ul>
        )}
      </section>
    </div>
  );
}
