// Service worker — Ekballo Academy
// Funções:
//   1. App-shell: cacheia assets estáticos e rotas principais pra app funcionar offline.
//   2. Web Push: recebe push do backend, exibe notificação, foca/abre URL ao clicar.

const CACHE_VERSION = "ekballo-v4";
const STATIC_ASSETS = [
  "/manifest.json",
  "/icon-192.png",
  "/icon-512.png",
  "/icon-maskable-512.png",
  "/apple-icon.png",
  "/offline.html",
];
const APP_SHELL_ROUTES = ["/", "/dashboard", "/biblioteca"];

async function cacheResponse(request, response) {
  const cache = await caches.open(CACHE_VERSION);
  await cache.put(request, response.clone());
  return response;
}

async function getCachedOrFallback(request) {
  const cache = await caches.open(CACHE_VERSION);
  const cached = await cache.match(request);
  if (cached) return cached;

  const fallback = await cache.match("/offline.html");
  if (fallback) return fallback;

  return new Response(
    `<!doctype html><html lang="pt-BR"><head><meta charset="utf-8"/><meta name="viewport" content="width=device-width, initial-scale=1"/><title>Offline</title><style>body{font-family:system-ui,sans-serif;background:#17140F;color:#f7efe3;display:grid;place-items:center;min-height:100vh;margin:0;padding:24px;text-align:center}</style></head><body><div><h1>Você está offline</h1><p>A biblioteca já baixada continua disponível neste dispositivo.</p><p><a href="/biblioteca" style="color:#ff8a3d">Abrir biblioteca</a></p></div></body></html>`,
    { headers: { "Content-Type": "text/html; charset=utf-8" } }
  );
}

self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_VERSION).then((cache) => cache.addAll([...STATIC_ASSETS, ...APP_SHELL_ROUTES]))
  );
  self.skipWaiting();
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(
        keys
          .filter((k) => k !== CACHE_VERSION)
          .map((k) => caches.delete(k))
      )
    )
  );
  self.clients.claim();
});

// Network-first para navegação e cache-first para assets estáticos.
self.addEventListener("fetch", (event) => {
  const { request } = event;
  if (request.method !== "GET") return;
  const url = new URL(request.url);
  if (url.origin !== self.location.origin) return;

  // Rotas principais do app (shell + biblioteca) devem continuar abertas offline.
  if (request.mode === "navigate") {
    event.respondWith(
      fetch(request)
        .then((response) => cacheResponse(request, response))
        .catch(() => getCachedOrFallback(request))
    );
    return;
  }

  const isStatic =
    url.pathname.startsWith("/_next/static/") ||
    url.pathname.match(/\.(png|jpg|jpeg|svg|webp|ico|woff2?|ttf|otf)$/i);
  if (!isStatic) return;

  event.respondWith(
    fetch(request)
      .then((response) => cacheResponse(request, response))
      .catch(() => caches.match(request))
  );
});

// ============== PUSH NOTIFICATIONS ==============

self.addEventListener("push", (event) => {
  let data = { title: "Ekballo Academy", body: "Você tem uma novidade." };
  try {
    if (event.data) data = event.data.json();
  } catch (e) {
    // payload não-JSON: ignora e usa default
  }

  const title = data.title || "Ekballo Academy";
  const options = {
    body: data.body || "",
    icon: data.icon || "/icon-192.png",
    badge: data.badge || "/icon-192.png",
    tag: data.tag,
    data: { url: data.url || "/dashboard" },
    requireInteraction: false,
  };

  event.waitUntil(self.registration.showNotification(title, options));
});

self.addEventListener("notificationclick", (event) => {
  event.notification.close();
  const targetUrl = event.notification.data?.url || "/dashboard";
  event.waitUntil(
    self.clients.matchAll({ type: "window", includeUncontrolled: true }).then((clientList) => {
      // Se já tem uma janela do app aberta, foca e navega
      for (const client of clientList) {
        try {
          const u = new URL(client.url);
          if (u.origin === self.location.origin && "focus" in client) {
            client.navigate(targetUrl);
            return client.focus();
          }
        } catch (e) {
          // ignore
        }
      }
      // Senão abre nova janela
      if (self.clients.openWindow) {
        return self.clients.openWindow(targetUrl);
      }
    })
  );
});
