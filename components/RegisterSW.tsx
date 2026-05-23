"use client";

import { useEffect } from "react";

export function RegisterSW() {
  useEffect(() => {
    if (typeof window === "undefined") return;
    if (!("serviceWorker" in navigator)) return;
    // Em dev/HMR o SW pode atrapalhar. Só registra em produção.
    if (process.env.NODE_ENV !== "production") return;

    const onLoad = () => {
      navigator.serviceWorker.register("/sw.js").catch(() => {
        // silencioso — SW é progressivo, app funciona sem ele
      });
    };
    window.addEventListener("load", onLoad);
    return () => window.removeEventListener("load", onLoad);
  }, []);

  return null;
}
