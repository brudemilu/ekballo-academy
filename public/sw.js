// Service worker simples — apenas habilita comportamento de "app instalável"
// e cacheia assets estáticos pra ficar offline-resilient.
// NÃO cacheia respostas dinâmicas (HTML/API) pra evitar mostrar conteúdo
// desatualizado em mock-mode/auth.

const CACHE_VERSION = "ekballo-v1";
const STATIC_ASSETS = [
  "/manifest.json",
  "/icon-192.png",
  "/icon-512.png",
  "/icon-maskable-512.png",
  "/apple-icon.png",
];

self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_VERSION).then((cache) => cache.addAll(STATIC_ASSETS))
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

// Network-first com fallback pro cache. Só intercepta requests GET de mesma origem
// pra assets estáticos. HTML/API vão direto pra rede.
self.addEventListener("fetch", (event) => {
  const { request } = event;
  if (request.method !== "GET") return;
  const url = new URL(request.url);
  if (url.origin !== self.location.origin) return;

  const isStatic =
    url.pathname.startsWith("/_next/static/") ||
    url.pathname.match(/\.(png|jpg|jpeg|svg|webp|ico|woff2?|ttf|otf)$/i);

  if (!isStatic) return;

  event.respondWith(
    fetch(request)
      .then((response) => {
        const copy = response.clone();
        caches.open(CACHE_VERSION).then((cache) => cache.put(request, copy));
        return response;
      })
      .catch(() => caches.match(request))
  );
});
