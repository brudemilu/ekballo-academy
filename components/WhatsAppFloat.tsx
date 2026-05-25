"use client";

import { useEffect, useState } from "react";
import { usePathname } from "next/navigation";

// Número oficial do WhatsApp da Ekballo (Pr. Bruno) — formato internacional sem + ou espaços
const WHATSAPP_NUMERO = "5531994108839";
const MENSAGEM_PADRAO =
  "Olá Pr. Bruno! Vim pela Ekballo Academy e gostaria de saber mais sobre os cursos.";

// Rotas onde o botão flutuante NÃO aparece (atrapalha leitura / sobrepõe UI).
// Páginas internas de estudo: leitor de aula, leitor da Bíblia e detalhe
// de dia de plano de leitura.
const ESCONDER_PREFIXOS = ["/cursos", "/biblia", "/planos"];

export function WhatsAppFloat() {
  const pathname = usePathname();
  const [aberto, setAberto] = useState(false);
  const [mostrar, setMostrar] = useState(false);

  useEffect(() => {
    // Aparece após 1.2s (não invade na primeira impressão)
    const t = setTimeout(() => setMostrar(true), 1200);
    return () => clearTimeout(t);
  }, []);

  // Esconde nas rotas de estudo, mantém na home/dashboard/admin/perfil/etc
  if (pathname && ESCONDER_PREFIXOS.some((p) => pathname.startsWith(p))) {
    return null;
  }

  const link = `https://wa.me/${WHATSAPP_NUMERO}?text=${encodeURIComponent(MENSAGEM_PADRAO)}`;

  if (!mostrar) return null;

  return (
    <div className="fixed bottom-5 right-5 z-50 flex flex-col items-end gap-3 sm:bottom-6 sm:right-6">
      {aberto && (
        <div className="w-72 origin-bottom-right animate-scale-in rounded-2xl border border-bege-200 bg-white p-4 shadow-2xl shadow-bege-700/20">
          <div className="mb-3 flex items-start gap-3">
            <div className="flex h-10 w-10 flex-none items-center justify-center rounded-full bg-oliveira-600 text-white">
              <svg viewBox="0 0 24 24" fill="currentColor" className="h-5 w-5">
                <path d="M12 2C6.48 2 2 6.48 2 12c0 1.93.55 3.74 1.5 5.27L2 22l4.83-1.47A9.95 9.95 0 0012 22c5.52 0 10-4.48 10-10S17.52 2 12 2zm5.07 14.04c-.21.59-1.21 1.13-1.69 1.2-.43.07-.97.1-1.57-.1-.36-.11-.83-.27-1.43-.53-2.51-1.08-4.15-3.61-4.28-3.78-.12-.17-1.02-1.36-1.02-2.59s.65-1.83.88-2.08c.23-.25.5-.31.67-.31.17 0 .34 0 .49.01.16 0 .37-.06.58.44.22.51.74 1.76.81 1.89.07.13.11.28.02.45-.09.17-.13.28-.26.43-.13.15-.27.34-.38.45-.13.13-.26.27-.11.52.15.25.66 1.09 1.42 1.77.97.86 1.79 1.13 2.05 1.26.25.13.4.11.55-.07.15-.17.63-.74.8-.99.17-.25.34-.21.57-.13.23.09 1.45.69 1.7.81.25.13.42.19.48.3.06.11.06.65-.15 1.24z"/>
              </svg>
            </div>
            <div className="flex-1">
              <p className="text-sm font-semibold text-bege-800">Conversa com a Ekballo</p>
              <p className="text-xs text-bege-600">Resposta em até 1h em horário comercial</p>
            </div>
            <button
              onClick={() => setAberto(false)}
              aria-label="Fechar"
              className="text-bege-400 hover:text-bege-700"
            >
              ✕
            </button>
          </div>
          <p className="mb-4 text-sm leading-relaxed text-bege-700">
            Quer tirar dúvida sobre os cursos, falar sobre discipulado ou se conectar com a comunidade? Manda mensagem.
          </p>
          <a
            href={link}
            target="_blank"
            rel="noopener noreferrer"
            className="block w-full rounded-full bg-oliveira-600 py-2.5 text-center text-sm font-medium text-white transition hover:bg-oliveira-700"
          >
            Abrir conversa no WhatsApp
          </a>
        </div>
      )}

      <button
        onClick={() => setAberto((v) => !v)}
        aria-label="Falar no WhatsApp"
        className="group relative flex h-14 w-14 items-center justify-center rounded-full bg-oliveira-600 text-white shadow-2xl shadow-oliveira-700/30 transition hover:scale-110 hover:bg-oliveira-700 sm:h-16 sm:w-16"
      >
        <span className="absolute inset-0 -z-10 animate-pulse-soft rounded-full bg-oliveira-500 opacity-60" aria-hidden />
        {aberto ? (
          <svg viewBox="0 0 24 24" fill="currentColor" className="h-6 w-6">
            <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
          </svg>
        ) : (
          <svg viewBox="0 0 24 24" fill="currentColor" className="h-7 w-7 sm:h-8 sm:w-8">
            <path d="M12 2C6.48 2 2 6.48 2 12c0 1.93.55 3.74 1.5 5.27L2 22l4.83-1.47A9.95 9.95 0 0012 22c5.52 0 10-4.48 10-10S17.52 2 12 2zm5.07 14.04c-.21.59-1.21 1.13-1.69 1.2-.43.07-.97.1-1.57-.1-.36-.11-.83-.27-1.43-.53-2.51-1.08-4.15-3.61-4.28-3.78-.12-.17-1.02-1.36-1.02-2.59s.65-1.83.88-2.08c.23-.25.5-.31.67-.31.17 0 .34 0 .49.01.16 0 .37-.06.58.44.22.51.74 1.76.81 1.89.07.13.11.28.02.45-.09.17-.13.28-.26.43-.13.15-.27.34-.38.45-.13.13-.26.27-.11.52.15.25.66 1.09 1.42 1.77.97.86 1.79 1.13 2.05 1.26.25.13.4.11.55-.07.15-.17.63-.74.8-.99.17-.25.34-.21.57-.13.23.09 1.45.69 1.7.81.25.13.42.19.48.3.06.11.06.65-.15 1.24z"/>
          </svg>
        )}
      </button>
    </div>
  );
}
