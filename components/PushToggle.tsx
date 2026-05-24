"use client";

import { useEffect, useState } from "react";

// Converte VAPID public key base64url → Uint8Array (formato exigido pelo PushManager).
function urlBase64ToUint8Array(base64String: string): Uint8Array {
  const padding = "=".repeat((4 - (base64String.length % 4)) % 4);
  const base64 = (base64String + padding).replace(/-/g, "+").replace(/_/g, "/");
  const raw = atob(base64);
  const out = new Uint8Array(raw.length);
  for (let i = 0; i < raw.length; i++) out[i] = raw.charCodeAt(i);
  return out;
}

type Estado = "carregando" | "nao-suportado" | "desativadas" | "ativadas" | "bloqueadas";

export function PushToggle() {
  const [estado, setEstado] = useState<Estado>("carregando");
  const [acao, setAcao] = useState<"idle" | "ativando" | "desativando">("idle");
  const [erro, setErro] = useState<string | null>(null);

  const vapidPub = process.env.NEXT_PUBLIC_VAPID_PUBLIC_KEY;

  useEffect(() => {
    (async () => {
      if (typeof window === "undefined") return;
      if (!("serviceWorker" in navigator) || !("PushManager" in window) || !("Notification" in window)) {
        setEstado("nao-suportado");
        return;
      }
      if (Notification.permission === "denied") {
        setEstado("bloqueadas");
        return;
      }
      const reg = await navigator.serviceWorker.ready;
      const sub = await reg.pushManager.getSubscription();
      setEstado(sub ? "ativadas" : "desativadas");
    })();
  }, []);

  async function ativar() {
    if (!vapidPub) {
      setErro("Chave VAPID pública não configurada no projeto.");
      return;
    }
    setAcao("ativando");
    setErro(null);
    try {
      const perm = await Notification.requestPermission();
      if (perm !== "granted") {
        setEstado(perm === "denied" ? "bloqueadas" : "desativadas");
        setAcao("idle");
        return;
      }
      const reg = await navigator.serviceWorker.ready;
      const sub = await reg.pushManager.subscribe({
        userVisibleOnly: true,
        applicationServerKey: urlBase64ToUint8Array(vapidPub).buffer as ArrayBuffer,
      });
      const subJson = sub.toJSON();
      const resp = await fetch("/api/push/subscribe", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(subJson),
      });
      if (!resp.ok) {
        const j = await resp.json().catch(() => ({ erro: `HTTP ${resp.status}` }));
        throw new Error(j.erro || `HTTP ${resp.status}`);
      }
      setEstado("ativadas");
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      setErro(msg);
    } finally {
      setAcao("idle");
    }
  }

  async function desativar() {
    setAcao("desativando");
    setErro(null);
    try {
      const reg = await navigator.serviceWorker.ready;
      const sub = await reg.pushManager.getSubscription();
      if (sub) {
        await fetch(
          `/api/push/subscribe?endpoint=${encodeURIComponent(sub.endpoint)}`,
          { method: "DELETE" }
        );
        await sub.unsubscribe();
      }
      setEstado("desativadas");
    } catch (e) {
      const msg = e instanceof Error ? e.message : String(e);
      setErro(msg);
    } finally {
      setAcao("idle");
    }
  }

  // UI
  if (estado === "carregando") {
    return (
      <div className="rounded-2xl border border-mesa-200 bg-white p-6">
        <p className="text-sm text-mesa-500">Carregando…</p>
      </div>
    );
  }

  if (estado === "nao-suportado") {
    return (
      <div className="rounded-2xl border border-mesa-200 bg-white p-6">
        <h2 className="font-serif text-lg font-semibold text-mesa-800">
          Notificações
        </h2>
        <p className="mt-2 text-sm text-mesa-600">
          Seu navegador não suporta notificações push. No iPhone, instale o app
          (Compartilhar → Adicionar à Tela Inicial) e tente novamente.
        </p>
      </div>
    );
  }

  if (estado === "bloqueadas") {
    return (
      <div className="rounded-2xl border border-amber-200 bg-amber-50 p-6">
        <h2 className="font-serif text-lg font-semibold text-mesa-800">
          Notificações bloqueadas
        </h2>
        <p className="mt-2 text-sm text-mesa-700">
          Você bloqueou notificações pra este site. Pra liberar, vá nas
          configurações do navegador → Permissões → Notificações → permitir
          para ekballo-academy.vercel.app.
        </p>
      </div>
    );
  }

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6">
      <div className="flex flex-wrap items-start justify-between gap-4">
        <div className="min-w-0">
          <h2 className="font-serif text-lg font-semibold text-mesa-800">
            Notificações
          </h2>
          <p className="mt-1 text-sm text-mesa-600">
            Receba avisos no celular quando o líder mandar mensagem ou der
            devolutiva na sua reflexão.
          </p>
          {estado === "ativadas" && (
            <p className="mt-2 inline-flex items-center gap-1.5 text-xs font-medium text-oliveira-700">
              <span className="h-2 w-2 rounded-full bg-oliveira-500" />
              Ativado neste device
            </p>
          )}
        </div>
        <div className="flex-none">
          {estado === "desativadas" ? (
            <button
              onClick={ativar}
              disabled={acao !== "idle"}
              className="rounded-full bg-mesa-700 px-4 py-2 text-sm font-medium text-mesa-50 hover:bg-mesa-800 disabled:opacity-60"
            >
              {acao === "ativando" ? "Ativando…" : "Ativar notificações"}
            </button>
          ) : (
            <button
              onClick={desativar}
              disabled={acao !== "idle"}
              className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-sm font-medium text-mesa-700 hover:bg-mesa-50 disabled:opacity-60"
            >
              {acao === "desativando" ? "Desativando…" : "Desativar"}
            </button>
          )}
        </div>
      </div>
      {erro && (
        <p className="mt-3 rounded-lg border border-red-200 bg-red-50 px-3 py-2 text-xs text-red-700">
          {erro}
        </p>
      )}
    </div>
  );
}
