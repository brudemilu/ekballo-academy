"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";

type Aluno = {
  id: string;
  nome: string | null;
  email: string;
  telefone: string | null;
};
type Curso = {
  id: string;
  titulo: string;
  matriculados: number;
  alunosComTelefone?: number;
};

type Props = {
  alunos: Aluno[];
  cursos: Curso[];
};

type DestinoTipo = "todos" | "curso" | "aluno";

export function EnviarMensagemForm({ alunos, cursos }: Props) {
  const router = useRouter();
  const [destinoTipo, setDestinoTipo] = useState<DestinoTipo>("todos");
  const [destinoId, setDestinoId] = useState<string>("");
  const [canalEmail, setCanalEmail] = useState(true);
  const [canalWhatsapp, setCanalWhatsapp] = useState(false);
  const [canalPush, setCanalPush] = useState(false);
  const [assunto, setAssunto] = useState("");
  const [corpoHtml, setCorpoHtml] = useState("");
  const [corpoTexto, setCorpoTexto] = useState("");
  const [enviando, startTransition] = useTransition();
  const [resultado, setResultado] = useState<
    | { tipo: "ok"; total: number; enviados: number; erros: number; mensagemId: string }
    | { tipo: "erro"; mensagem: string }
    | null
  >(null);

  function handleEnviar() {
    setResultado(null);
    if (!assunto.trim() || !corpoHtml.trim()) {
      setResultado({ tipo: "erro", mensagem: "Preencha assunto e corpo da mensagem." });
      return;
    }
    if ((destinoTipo === "curso" || destinoTipo === "aluno") && !destinoId) {
      setResultado({
        tipo: "erro",
        mensagem: `Selecione ${destinoTipo === "curso" ? "o curso" : "o aluno"}.`,
      });
      return;
    }

    const canais: ("email" | "whatsapp" | "push")[] = [];
    if (canalEmail) canais.push("email");
    if (canalWhatsapp) canais.push("whatsapp");
    if (canalPush) canais.push("push");
    if (canais.length === 0) {
      setResultado({ tipo: "erro", mensagem: "Selecione pelo menos um canal." });
      return;
    }

    // Estimativa de destinatários pra confirmação
    const estimado =
      destinoTipo === "todos"
        ? alunos.length
        : destinoTipo === "curso"
          ? cursos.find((c) => c.id === destinoId)?.matriculados ?? 0
          : 1;
    if (
      estimado > 1 &&
      !confirm(
        `Confirma o envio pra ${estimado} ${
          estimado === 1 ? "destinatário" : "destinatários"
        }? Esta ação não pode ser desfeita.`
      )
    ) {
      return;
    }

    startTransition(async () => {
      try {
        const resp = await fetch("/api/admin/enviar-mensagem", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            destino_tipo: destinoTipo,
            destino_id: destinoTipo === "todos" ? null : destinoId,
            canais,
            assunto,
            corpo_html: corpoHtml,
            corpo_texto: corpoTexto || null,
          }),
        });
        const json = await resp.json();
        if (!resp.ok) {
          setResultado({
            tipo: "erro",
            mensagem: json.erro || `HTTP ${resp.status}`,
          });
          return;
        }
        setResultado({
          tipo: "ok",
          total: json.total_destinatarios,
          enviados: json.total_enviados,
          erros: json.total_erros,
          mensagemId: json.mensagem_id,
        });
        // Limpa form em sucesso
        setAssunto("");
        setCorpoHtml("");
        setCorpoTexto("");
        router.refresh();
      } catch (e) {
        const msg = e instanceof Error ? e.message : String(e);
        setResultado({ tipo: "erro", mensagem: msg });
      }
    });
  }

  // Conta quem tem telefone preenchido entre os destinatários do escopo atual
  const alunoSelecionado =
    destinoTipo === "aluno" && destinoId
      ? alunos.find((a) => a.id === destinoId)
      : null;

  const totalSelecionados =
    destinoTipo === "todos"
      ? alunos.length
      : destinoTipo === "curso" && destinoId
        ? cursos.find((c) => c.id === destinoId)?.matriculados ?? 0
        : destinoTipo === "aluno" && destinoId
          ? 1
          : 0;

  const totalComTelefone =
    destinoTipo === "todos"
      ? alunos.filter((a) => !!a.telefone).length
      : destinoTipo === "curso" && destinoId
        ? cursos.find((c) => c.id === destinoId)?.alunosComTelefone ?? 0
        : destinoTipo === "aluno" && destinoId
          ? alunoSelecionado?.telefone
            ? 1
            : 0
          : 0;

  const totalDestinatariosLabel =
    totalSelecionados > 0
      ? `${totalSelecionados} ${totalSelecionados === 1 ? "aluno" : "alunos"}`
      : "—";

  const semTelefone = canalWhatsapp ? totalSelecionados - totalComTelefone : 0;

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
      <div className="space-y-5">
        {/* Destinatário */}
        <div>
          <label className="mb-2 block text-sm font-medium text-mesa-700">
            Destinatário
          </label>
          <div className="grid gap-2 sm:grid-cols-3">
            {([
              { v: "todos", label: "Todos os alunos" },
              { v: "curso", label: "Alunos de um curso" },
              { v: "aluno", label: "Aluno específico" },
            ] as { v: DestinoTipo; label: string }[]).map((opt) => (
              <label
                key={opt.v}
                className={`flex cursor-pointer items-center gap-2 rounded-lg border px-3 py-2.5 text-sm transition ${
                  destinoTipo === opt.v
                    ? "border-mesa-400 bg-mesa-50 text-mesa-800"
                    : "border-mesa-200 bg-white text-mesa-700 hover:border-mesa-300"
                }`}
              >
                <input
                  type="radio"
                  name="destino"
                  value={opt.v}
                  checked={destinoTipo === opt.v}
                  onChange={() => {
                    setDestinoTipo(opt.v);
                    setDestinoId("");
                  }}
                  className="h-4 w-4"
                />
                {opt.label}
              </label>
            ))}
          </div>

          {destinoTipo === "curso" && (
            <select
              value={destinoId}
              onChange={(e) => setDestinoId(e.target.value)}
              className="mt-3 w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
            >
              <option value="">Selecione um curso…</option>
              {cursos.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.titulo} ({c.matriculados} matriculado{c.matriculados === 1 ? "" : "s"})
                </option>
              ))}
            </select>
          )}

          {destinoTipo === "aluno" && (
            <select
              value={destinoId}
              onChange={(e) => setDestinoId(e.target.value)}
              className="mt-3 w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
            >
              <option value="">Selecione um aluno…</option>
              {alunos.map((a) => (
                <option key={a.id} value={a.id}>
                  {a.nome ? `${a.nome} (${a.email})` : a.email}
                </option>
              ))}
            </select>
          )}

          <p className="mt-2 text-xs text-mesa-500">
            Estimativa: {totalDestinatariosLabel}
          </p>
        </div>

        {/* Canais */}
        <div>
          <label className="mb-2 block text-sm font-medium text-mesa-700">
            Canais
          </label>
          <div className="flex flex-wrap gap-3">
            <label className="flex cursor-pointer items-center gap-2 text-sm text-mesa-700">
              <input
                type="checkbox"
                checked={canalEmail}
                onChange={(e) => setCanalEmail(e.target.checked)}
                className="h-4 w-4 rounded border-mesa-300"
              />
              Email
            </label>
            <label className="flex cursor-pointer items-center gap-2 text-sm text-mesa-700">
              <input
                type="checkbox"
                checked={canalWhatsapp}
                onChange={(e) => setCanalWhatsapp(e.target.checked)}
                className="h-4 w-4 rounded border-mesa-300"
              />
              WhatsApp
            </label>
            <label className="flex cursor-pointer items-center gap-2 text-sm text-mesa-700">
              <input
                type="checkbox"
                checked={canalPush}
                onChange={(e) => setCanalPush(e.target.checked)}
                className="h-4 w-4 rounded border-mesa-300"
              />
              Push (app)
            </label>
          </div>
          {canalWhatsapp && semTelefone > 0 && (
            <p className="mt-2 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
              {semTelefone === totalSelecionados
                ? "Nenhum dos destinatários selecionados tem telefone cadastrado — só serão atingidos os com email (se Email estiver marcado)."
                : `${semTelefone} de ${totalSelecionados} sem telefone — esses serão pulados no WhatsApp.`}
            </p>
          )}
          {canalWhatsapp && (
            <p className="mt-2 text-xs text-mesa-500">
              No WhatsApp a mensagem vai como texto plano (o assunto vira título em negrito; o HTML é convertido).
            </p>
          )}
        </div>

        {/* Assunto */}
        <div>
          <label className="mb-2 block text-sm font-medium text-mesa-700">
            Assunto
          </label>
          <input
            type="text"
            value={assunto}
            onChange={(e) => setAssunto(e.target.value)}
            className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
            placeholder="Ex.: Encontro de oração nesta semana"
          />
        </div>

        {/* Corpo HTML */}
        <div>
          <label className="mb-2 block text-sm font-medium text-mesa-700">
            Mensagem (HTML)
          </label>
          <textarea
            value={corpoHtml}
            onChange={(e) => setCorpoHtml(e.target.value)}
            rows={10}
            className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 font-mono text-xs text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
            placeholder={`<p>Olá!</p>\n<p>Mensagem aqui…</p>\n<p>Abraços,<br>Bruno</p>`}
            spellCheck={false}
          />
          <p className="mt-1 text-xs text-mesa-500">
            HTML simples com estilos inline. Quebra de linha não basta — use &lt;br&gt; ou &lt;p&gt;.
          </p>
        </div>

        {/* Corpo texto (opcional) */}
        <div>
          <label className="mb-2 block text-sm font-medium text-mesa-700">
            Versão em texto (opcional, fallback)
          </label>
          <textarea
            value={corpoTexto}
            onChange={(e) => setCorpoTexto(e.target.value)}
            rows={4}
            className="w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-sm text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200"
            placeholder="Texto puro para clientes que não renderizam HTML."
          />
        </div>
      </div>

      <div className="mt-6 flex flex-wrap items-center justify-between gap-4 border-t border-mesa-100 pt-5">
        <div className="text-sm">
          {resultado?.tipo === "ok" && (
            <span className="text-oliveira-700">
              ✓ Enviado pra {resultado.enviados}/{resultado.total}
              {resultado.erros > 0 && (
                <span className="text-red-700"> · {resultado.erros} erros</span>
              )}
            </span>
          )}
          {resultado?.tipo === "erro" && (
            <span className="text-red-700">{resultado.mensagem}</span>
          )}
        </div>
        <button
          type="button"
          onClick={handleEnviar}
          disabled={enviando}
          className="rounded-full bg-mesa-700 px-6 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800 disabled:bg-mesa-300"
        >
          {enviando ? "Enviando…" : "Enviar mensagem"}
        </button>
      </div>
    </div>
  );
}
