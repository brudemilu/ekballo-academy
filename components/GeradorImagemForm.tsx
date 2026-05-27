"use client";

import { useMemo, useState } from "react";

type Formato = "feed" | "story";

export function GeradorImagemForm({ iaAtiva }: { iaAtiva: boolean }) {
  const [verso, setVerso] = useState(
    "O Senhor é o meu pastor e nada me faltará.",
  );
  const [ref, setRef] = useState("Salmos 23:1");
  const [top, setTop] = useState("");
  const [sub, setSub] = useState("");
  const [brand, setBrand] = useState("Ekballo Academy");
  const [bg, setBg] = useState(
    "amanhecer dourado sobre montanhas com névoa, raios de sol filtrando",
  );
  const [formato, setFormato] = useState<Formato>("feed");
  const [previewKey, setPreviewKey] = useState(0); // força recarregar preview

  const url = useMemo(() => {
    const params = new URLSearchParams();
    if (verso) params.set("verso", verso);
    if (ref) params.set("ref", ref);
    if (top) params.set("top", top);
    if (sub) params.set("sub", sub);
    if (brand) params.set("brand", brand);
    if (bg && iaAtiva) params.set("bg", bg);
    params.set("f", formato);
    return `/api/og/livre?${params.toString()}`;
  }, [verso, ref, top, sub, brand, bg, formato, iaAtiva]);

  const downloadUrl = url + "&dl=1";

  const previewSrc = `${url}&_k=${previewKey}`;

  return (
    <div className="grid gap-6 lg:grid-cols-[1fr_1.1fr]">
      {/* Formulário */}
      <div className="space-y-4">
        <Field label="Versículo / texto" required>
          <textarea
            value={verso}
            onChange={(e) => setVerso(e.target.value)}
            rows={4}
            className="w-full rounded-xl border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200"
            placeholder='Ex: "O Senhor é o meu pastor..."'
          />
        </Field>

        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="Referência">
            <input
              value={ref}
              onChange={(e) => setRef(e.target.value)}
              className="w-full rounded-xl border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200"
              placeholder="Salmos 23:1"
            />
          </Field>
          <Field label="Subtexto (versão, autor)">
            <input
              value={sub}
              onChange={(e) => setSub(e.target.value)}
              className="w-full rounded-xl border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200"
              placeholder="ACF · ou · — Pr. Bruno Fernandes"
            />
          </Field>
        </div>

        <div className="grid gap-4 sm:grid-cols-2">
          <Field label="Rótulo do topo (opcional)">
            <input
              value={top}
              onChange={(e) => setTop(e.target.value)}
              className="w-full rounded-xl border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200"
              placeholder="Ex: Esperança"
            />
            <p className="mt-1 text-xs text-mesa-500">
              Vazio = ponto dourado discreto.
            </p>
          </Field>
          <Field label="Marca (rodapé)">
            <input
              value={brand}
              onChange={(e) => setBrand(e.target.value)}
              className="w-full rounded-xl border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200"
              placeholder="Ekballo Academy"
            />
          </Field>
        </div>

        <Field label="Tema do fundo (descreva a cena pra IA)">
          <textarea
            value={bg}
            onChange={(e) => setBg(e.target.value)}
            rows={3}
            disabled={!iaAtiva}
            className="w-full rounded-xl border border-mesa-200 bg-white px-3 py-2 text-sm text-mesa-800 focus:border-laranja-400 focus:outline-none focus:ring-2 focus:ring-laranja-200 disabled:bg-mesa-50 disabled:text-mesa-400"
            placeholder="Ex: floresta de pinheiros ao amanhecer, neblina baixa"
          />
          <p className="mt-1 text-xs text-mesa-500">
            {iaAtiva
              ? "Quanto mais específico, melhor. A IA adiciona automaticamente: luz cinematográfica, paleta sacra, espaço pro texto."
              : "Habilitado quando GEMINI_API_KEY estiver configurada."}
          </p>
        </Field>

        <Field label="Formato">
          <div className="flex gap-2">
            <FormatoBtn
              ativo={formato === "feed"}
              onClick={() => setFormato("feed")}
              label="Feed 1080×1080"
              sub="Quadrado · Insta feed, WhatsApp"
            />
            <FormatoBtn
              ativo={formato === "story"}
              onClick={() => setFormato("story")}
              label="Story 1080×1920"
              sub="Vertical · Story, Status"
            />
          </div>
        </Field>

        <div className="flex flex-wrap gap-2 pt-2">
          <button
            type="button"
            onClick={() => setPreviewKey((k) => k + 1)}
            className="rounded-full bg-mesa-700 px-5 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800"
          >
            🔄 Atualizar preview
          </button>
          <a
            href={downloadUrl}
            download
            className="rounded-full bg-laranja-600 px-5 py-2.5 text-sm font-medium text-white hover:bg-laranja-700"
          >
            ⬇ Baixar PNG
          </a>
          <a
            href={url}
            target="_blank"
            rel="noreferrer"
            className="rounded-full border border-mesa-200 bg-white px-4 py-2.5 text-sm font-medium text-mesa-700 hover:bg-mesa-50"
          >
            Abrir em nova aba
          </a>
        </div>
      </div>

      {/* Preview */}
      <div className="lg:sticky lg:top-6">
        <p className="mb-2 text-xs font-medium uppercase tracking-[0.2em] text-mesa-500">
          Preview
        </p>
        <div className="overflow-hidden rounded-2xl border border-mesa-200 bg-mesa-900 shadow-xl shadow-mesa-700/10">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            src={previewSrc}
            alt="Preview"
            className="block w-full"
            style={{ aspectRatio: formato === "story" ? "9 / 16" : "1 / 1" }}
          />
        </div>
        {iaAtiva && (
          <p className="mt-2 text-xs text-mesa-500">
            ⏱ Primeira render pode levar 5-15s (chamada à IA). Recargas
            subsequentes usam o cache.
          </p>
        )}
      </div>
    </div>
  );
}

function Field({
  label,
  required,
  children,
}: {
  label: string;
  required?: boolean;
  children: React.ReactNode;
}) {
  return (
    <label className="block">
      <span className="mb-1.5 block text-xs font-medium uppercase tracking-wider text-mesa-600">
        {label}
        {required && <span className="ml-1 text-laranja-600">*</span>}
      </span>
      {children}
    </label>
  );
}

function FormatoBtn({
  ativo,
  onClick,
  label,
  sub,
}: {
  ativo: boolean;
  onClick: () => void;
  label: string;
  sub: string;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={`flex flex-1 flex-col items-start rounded-xl border px-4 py-3 text-left transition ${
        ativo
          ? "border-laranja-400 bg-laranja-50 text-mesa-900"
          : "border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-50"
      }`}
    >
      <span className="text-sm font-medium">{label}</span>
      <span className="text-xs text-mesa-500">{sub}</span>
    </button>
  );
}
