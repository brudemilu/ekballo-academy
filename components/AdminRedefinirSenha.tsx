"use client";

import { useState } from "react";
import { displayTelefone } from "@/lib/telefone";

const MOCK = process.env.NEXT_PUBLIC_MOCK_MODE === "true";

// Senha temporária fácil de ditar por telefone: uma palavra + 4 dígitos.
// Sem caracteres ambíguos, sem símbolo — é pra ser trocada depois.
function gerarSenha(): string {
  const palavras = ["mesa", "leitura", "discipulo", "caminho", "semente", "colheita"];
  const palavra = palavras[Math.floor(Math.random() * palavras.length)];
  const numero = String(Math.floor(Math.random() * 9000) + 1000);
  return `${palavra}${numero}`;
}

export function AdminRedefinirSenha({
  alunoId,
  nome,
  email,
  telefone,
}: {
  alunoId: string;
  nome: string;
  email: string;
  telefone?: string | null;
}) {
  const [senha, setSenha] = useState("");
  const [confirmando, setConfirmando] = useState(false);
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState<string | null>(null);
  // Senha efetivada — fica na tela pra o líder repassar à pessoa.
  const [definida, setDefinida] = useState<string | null>(null);
  const [copiado, setCopiado] = useState(false);

  async function redefinir() {
    setLoading(true);
    setErro(null);

    if (MOCK) {
      await new Promise((r) => setTimeout(r, 400));
      setDefinida(senha);
      setConfirmando(false);
      setLoading(false);
      return;
    }

    const res = await fetch("/api/admin/redefinir-senha", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ alunoId, senha }),
    });
    const data = await res.json().catch(() => ({}));

    if (!res.ok) {
      setErro(data?.erro || "Não foi possível redefinir a senha. Tente de novo.");
      setConfirmando(false);
      setLoading(false);
      return;
    }

    setDefinida(senha);
    setSenha("");
    setConfirmando(false);
    setLoading(false);
  }

  const primeiroNome = (nome || "").trim().split(/\s+/)[0] || "discípulo";
  const mensagem = definida
    ? `Oi, ${primeiroNome}! Sua senha da Ekballo foi redefinida.\n\nAcesse: https://ekballo.escoladodiscipuloimw.com.br/login\nE-mail: ${email}\nSenha: ${definida}\n\nDepois de entrar, troque a senha em Perfil.`
    : "";
  const whatsappHref =
    definida && telefone
      ? `https://wa.me/${telefone.replace(/\D+/g, "")}?text=${encodeURIComponent(mensagem)}`
      : null;

  return (
    <div className="space-y-4">
      <p className="text-sm leading-relaxed text-mesa-600">
        Define uma senha nova para <strong>{nome || email}</strong> entrar. Use quando
        a pessoa esquecer a senha e não conseguir recuperar sozinha. Ela continua
        podendo trocar depois, em Perfil.
      </p>

      <div className="flex flex-wrap items-end gap-3">
        <div className="min-w-[220px] flex-1">
          <label
            htmlFor="nova-senha"
            className="mb-1.5 block text-sm font-medium text-mesa-700"
          >
            Nova senha
          </label>
          <input
            id="nova-senha"
            type="text"
            autoComplete="off"
            value={senha}
            onChange={(e) => {
              setSenha(e.target.value);
              setConfirmando(false);
              setDefinida(null);
            }}
            placeholder="mínimo 6 caracteres"
            className="w-full rounded-lg border border-mesa-200 bg-mesa-50 px-4 py-2.5 outline-none transition focus:border-laranja-400 focus:bg-white focus:ring-2 focus:ring-laranja-100"
          />
        </div>
        <button
          type="button"
          onClick={() => {
            setSenha(gerarSenha());
            setConfirmando(false);
            setDefinida(null);
          }}
          className="rounded-lg border border-mesa-200 bg-white px-4 py-2.5 text-sm font-medium text-mesa-700 transition hover:border-mesa-300 hover:bg-mesa-100"
        >
          Sugerir senha
        </button>
      </div>

      {senha.length > 0 && senha.length < 6 && (
        <p className="text-xs text-amber-700">A senha precisa ter pelo menos 6 caracteres.</p>
      )}

      {!confirmando ? (
        <button
          type="button"
          disabled={senha.length < 6 || loading}
          onClick={() => setConfirmando(true)}
          className="rounded-lg bg-mesa-800 px-6 py-3 text-sm font-semibold text-white transition hover:bg-mesa-900 disabled:opacity-50"
        >
          Redefinir senha
        </button>
      ) : (
        <div className="rounded-xl border border-amber-300 bg-amber-50 p-4">
          <p className="text-sm text-amber-900">
            Confirma trocar a senha de <strong>{nome || email}</strong>? A senha
            atual deixa de funcionar na hora.
          </p>
          <div className="mt-3 flex flex-wrap gap-2">
            <button
              type="button"
              onClick={redefinir}
              disabled={loading}
              className="rounded-lg bg-amber-600 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-amber-700 disabled:opacity-60"
            >
              {loading ? "Redefinindo..." : "Sim, redefinir"}
            </button>
            <button
              type="button"
              onClick={() => setConfirmando(false)}
              disabled={loading}
              className="rounded-lg border border-mesa-200 bg-white px-5 py-2.5 text-sm font-medium text-mesa-700 transition hover:bg-mesa-100"
            >
              Cancelar
            </button>
          </div>
        </div>
      )}

      {erro && (
        <div className="rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {erro}
        </div>
      )}

      {definida && (
        <div className="rounded-xl border border-oliveira-200 bg-oliveira-50 p-4">
          <p className="text-sm font-medium text-oliveira-800">
            Senha redefinida. Passe estes dados para {primeiroNome}:
          </p>
          <dl className="mt-3 space-y-1 text-sm text-mesa-700">
            <div className="flex gap-2">
              <dt className="text-mesa-500">E-mail:</dt>
              <dd className="font-medium">{email}</dd>
            </div>
            <div className="flex gap-2">
              <dt className="text-mesa-500">Senha:</dt>
              <dd className="rounded bg-white px-2 py-0.5 font-mono font-semibold text-mesa-900">
                {definida}
              </dd>
            </div>
          </dl>
          <div className="mt-4 flex flex-wrap gap-2">
            <button
              type="button"
              onClick={async () => {
                await navigator.clipboard.writeText(mensagem).catch(() => {});
                setCopiado(true);
                setTimeout(() => setCopiado(false), 2000);
              }}
              className="rounded-lg border border-oliveira-300 bg-white px-4 py-2 text-sm font-medium text-oliveira-800 transition hover:bg-oliveira-100"
            >
              {copiado ? "✓ Copiado" : "Copiar recado"}
            </button>
            {whatsappHref && (
              <a
                href={whatsappHref}
                target="_blank"
                rel="noopener noreferrer"
                className="rounded-lg bg-oliveira-600 px-4 py-2 text-sm font-semibold text-white transition hover:bg-oliveira-700"
              >
                Enviar no WhatsApp {telefone ? `(${displayTelefone(telefone)})` : ""}
              </a>
            )}
          </div>
          <p className="mt-3 text-xs text-mesa-600">
            Esta senha some da tela quando você sair da página — não fica guardada
            em lugar nenhum.
          </p>
        </div>
      )}
    </div>
  );
}
