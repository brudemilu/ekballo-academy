"use client";

import { useState } from "react";
import { Botao } from "@/components/Botao";
import { PushToggle } from "@/components/PushToggle";

// Aba Conexão de /admin/mensagens: liga as notificações neste aparelho e
// confere, com um push de teste, que o alerta de queda do WhatsApp chega.
// O aviso de verdade é disparado pelo vigia do box (ver a rota).
export function AlertaDeQueda() {
  const [ocupado, setOcupado] = useState(false);
  const [resultado, setResultado] = useState<{ ok: boolean; texto: string } | null>(
    null,
  );

  async function testar() {
    setOcupado(true);
    setResultado(null);
    try {
      const res = await fetch("/api/cron/alerta-whatsapp", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ teste: true }),
      });
      const json = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(json.erro || "não foi possível enviar o teste");
      setResultado(
        json.enviados > 0
          ? {
              ok: true,
              texto: "Teste enviado. Deve aparecer neste aparelho em instantes.",
            }
          : {
              ok: false,
              texto:
                "Nenhum aparelho seu está com as notificações ativas. Ative acima e teste de novo.",
            },
      );
    } catch (e) {
      setResultado({
        ok: false,
        texto: e instanceof Error ? e.message : "não foi possível enviar o teste",
      });
    } finally {
      setOcupado(false);
    }
  }

  return (
    <section
      aria-labelledby="alerta-queda-titulo"
      className="mt-4 rounded-2xl border border-mesa-200 bg-white p-6"
    >
      <h3
        id="alerta-queda-titulo"
        className="font-serif text-xl font-semibold text-mesa-800"
      >
        Aviso de queda no celular
      </h3>
      <p className="mt-1 text-sm text-mesa-600">
        Se o WhatsApp da plataforma cair e o conserto automático não resolver, o
        aplicativo avisa por notificação — que não depende do WhatsApp. Ative em cada
        aparelho em que você quer ser avisado.
      </p>
      <div className="mt-4">
        <PushToggle />
      </div>
      <div className="mt-4 flex flex-wrap items-center gap-3">
        <Botao
          variante="secundario"
          tamanho="pequeno"
          ocupado={ocupado}
          rotuloOcupado="Enviando…"
          onClick={testar}
        >
          Enviar um aviso de teste
        </Botao>
        {resultado && (
          <span
            role={resultado.ok ? "status" : "alert"}
            className={`text-sm ${resultado.ok ? "text-oliveira-700" : "text-red-700"}`}
          >
            {resultado.texto}
          </span>
        )}
      </div>
    </section>
  );
}
