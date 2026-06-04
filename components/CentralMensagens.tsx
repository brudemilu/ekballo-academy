"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import Link from "next/link";
import { WhatsAppFilaPainel } from "@/components/WhatsAppFilaPainel";
import { TemplatesMensagemManager } from "@/components/TemplatesMensagemManager";
import { AutomacaoCampanhas } from "@/components/AutomacaoCampanhas";

type Aluno = { id: string; nome: string | null; email: string; telefone: string | null };
type Curso = { id: string; titulo: string; matriculados: number; alunosComTelefone?: number };
type Template = { id: string; titulo: string; corpo: string; descricao: string | null };
type MensagemHist = {
  id: string;
  assunto: string;
  destino_label: string;
  canais: string[];
  enviada_em: string;
  total_enviados: number;
  total_erros: number;
  total_destinatarios: number;
};
type Grupo = { JID?: string; Jid?: string; jid?: string; Name?: string; name?: string };
type Status = { connected: boolean; loggedIn: boolean; nome?: string | null; mock?: boolean };

type Props = {
  alunos: Aluno[];
  cursos: Curso[];
  templates: Template[];
  mensagens: MensagemHist[];
};

type Aba = "enviar" | "automacao" | "fila" | "templates" | "historico" | "conexao";
type DestinoClasse = "discipulos" | "grupo" | "numero";
type Escopo = "todos" | "curso" | "aluno";

const jidG = (g: Grupo) => g.JID || g.Jid || g.jid || "";
const nomeG = (g: Grupo) => g.Name || g.name || jidG(g) || "(sem nome)";
const inputCls =
  "w-full rounded-lg border border-mesa-200 bg-mesa-50/50 px-4 py-2.5 text-sm text-mesa-800 focus:border-mesa-400 focus:outline-none focus:ring-2 focus:ring-mesa-200";

export function CentralMensagens({ alunos, cursos, templates, mensagens }: Props) {
  const [aba, setAba] = useState<Aba>("enviar");
  const [status, setStatus] = useState<Status | null>(null);
  const [pendentesAuto, setPendentesAuto] = useState(0);

  const carregarStatus = useCallback(async () => {
    try {
      const r = await fetch("/api/admin/whatsapp");
      setStatus((await r.json()) as Status);
    } catch {
      /* ignora */
    }
  }, []);
  useEffect(() => {
    carregarStatus();
    fetch("/api/admin/campanhas")
      .then((r) => r.json())
      .then((d) => setPendentesAuto((d.campanhas || []).length))
      .catch(() => {});
  }, [carregarStatus]);

  const conectado = !!status?.loggedIn;

  const abas: { k: Aba; label: string; badge?: number }[] = [
    { k: "enviar", label: "Enviar" },
    { k: "automacao", label: "Automação", badge: pendentesAuto },
    { k: "fila", label: "Fila" },
    { k: "templates", label: "Templates" },
    { k: "historico", label: "Histórico" },
    { k: "conexao", label: "Conexão" },
  ];

  return (
    <div>
      {/* Cabeçalho com status */}
      <div className="mb-5 flex flex-wrap items-center justify-between gap-3">
        <div className="flex items-center gap-2 text-sm text-mesa-600">
          <span
            className={`inline-block h-2.5 w-2.5 rounded-full ${
              conectado ? "bg-oliveira-600" : "bg-red-500"
            }`}
          />
          {status?.mock
            ? "Modo demonstração"
            : conectado
              ? `WhatsApp conectado${status?.nome ? ` · ${status.nome}` : ""}`
              : "WhatsApp desconectado"}
          {!conectado && !status?.mock && (
            <button
              type="button"
              onClick={() => setAba("conexao")}
              className="ml-1 rounded-full bg-laranja-600 px-3 py-1 text-xs font-medium text-white hover:bg-laranja-700"
            >
              Conectar
            </button>
          )}
        </div>
      </div>

      {/* Abas */}
      <div className="mb-6 flex gap-1 overflow-x-auto border-b border-mesa-200">
        {abas.map((t) => (
          <button
            key={t.k}
            type="button"
            onClick={() => setAba(t.k)}
            className={`-mb-px whitespace-nowrap border-b-2 px-4 py-2.5 text-sm font-medium transition ${
              aba === t.k
                ? "border-mesa-700 text-mesa-800"
                : "border-transparent text-mesa-500 hover:text-mesa-700"
            }`}
          >
            {t.label}
            {!!t.badge && t.badge > 0 && (
              <span className="ml-1.5 rounded-full bg-laranja-600 px-1.5 py-0.5 text-[10px] font-semibold text-white">
                {t.badge}
              </span>
            )}
          </button>
        ))}
      </div>

      {aba === "enviar" && (
        <Compositor
          alunos={alunos}
          cursos={cursos}
          templates={templates}
          conectado={conectado}
        />
      )}
      {aba === "automacao" && <AutomacaoCampanhas />}
      {aba === "fila" && <WhatsAppFilaPainel />}
      {aba === "templates" && (
        <TemplatesMensagemManager
          inicial={templates.map((t) => ({
            id: t.id,
            titulo: t.titulo,
            corpo: t.corpo,
            descricao: t.descricao,
          }))}
        />
      )}
      {aba === "historico" && <Historico mensagens={mensagens} />}
      {aba === "conexao" && <Conexao status={status} onMudou={carregarStatus} />}
    </div>
  );
}

// ----------------------------------------------------------------------------
// COMPOSITOR ÚNICO
// ----------------------------------------------------------------------------
function Compositor({
  alunos,
  cursos,
  templates,
  conectado,
}: {
  alunos: Aluno[];
  cursos: Curso[];
  templates: Template[];
  conectado: boolean;
}) {
  const [classe, setClasse] = useState<DestinoClasse>("discipulos");
  const [escopo, setEscopo] = useState<Escopo>("todos");
  const [escopoId, setEscopoId] = useState("");
  const [numero, setNumero] = useState("");

  // grupos
  const [grupos, setGrupos] = useState<Grupo[] | null>(null);
  const [carregandoGrupos, setCarregandoGrupos] = useState(false);
  const [buscaGrupo, setBuscaGrupo] = useState("");
  const [grupoJid, setGrupoJid] = useState("");
  const [grupoNome, setGrupoNome] = useState("");

  // conteúdo
  const [templateId, setTemplateId] = useState("");
  const [conteudo, setConteudo] = useState<"texto" | "midia">("texto");
  const [assunto, setAssunto] = useState("");
  const [mensagem, setMensagem] = useState("");
  const [midiaUrl, setMidiaUrl] = useState("");
  const [midiaTipo, setMidiaTipo] = useState<"image" | "video" | "audio" | "document">("image");
  const [legenda, setLegenda] = useState("");
  const [filename, setFilename] = useState("");

  // canais (só discípulos)
  const [cEmail, setCEmail] = useState(false);
  const [cWhats, setCWhats] = useState(true);
  const [cPush, setCPush] = useState(false);

  const [enviando, setEnviando] = useState(false);
  const [resultado, setResultado] = useState<{ ok: boolean; texto: string } | null>(null);

  const ehDireto = classe === "grupo" || classe === "numero";

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

  function aplicarTemplate(id: string) {
    setTemplateId(id);
    const t = templates.find((x) => x.id === id);
    if (!t) return;
    setAssunto(t.titulo);
    // Para envio direto (grupo/número) não há aluno: remove placeholders.
    if (ehDireto) {
      setMensagem(
        t.corpo
          .replace(/\{\{\s*nome\s*\}\}/gi, "")
          .replace(/\{\{\s*curso\s*\}\}/gi, "")
          .replace(/\s{2,}/g, " ")
          .trim()
      );
    } else {
      setMensagem(t.corpo);
    }
  }

  // Estimativas de destinatários (discípulos)
  const totalEscopo =
    escopo === "todos"
      ? alunos.length
      : escopo === "curso" && escopoId
        ? cursos.find((c) => c.id === escopoId)?.matriculados ?? 0
        : escopo === "aluno" && escopoId
          ? 1
          : 0;
  const comTelefone =
    escopo === "todos"
      ? alunos.filter((a) => !!a.telefone).length
      : escopo === "curso" && escopoId
        ? cursos.find((c) => c.id === escopoId)?.alunosComTelefone ?? 0
        : escopo === "aluno" && escopoId
          ? alunos.find((a) => a.id === escopoId)?.telefone
            ? 1
            : 0
          : 0;

  async function enviar() {
    setResultado(null);
    if (!mensagem.trim() && conteudo === "texto") {
      setResultado({ ok: false, texto: "Escreva a mensagem." });
      return;
    }
    if (conteudo === "midia" && !midiaUrl.trim()) {
      setResultado({ ok: false, texto: "Informe a URL da mídia." });
      return;
    }
    setEnviando(true);
    try {
      if (classe === "discipulos") {
        const canais: string[] = [];
        if (cEmail) canais.push("email");
        if (cWhats) canais.push("whatsapp");
        if (cPush) canais.push("push");
        if (!canais.length) {
          setResultado({ ok: false, texto: "Selecione ao menos um canal." });
          setEnviando(false);
          return;
        }
        if ((escopo === "curso" || escopo === "aluno") && !escopoId) {
          setResultado({ ok: false, texto: "Selecione o curso/discípulo." });
          setEnviando(false);
          return;
        }
        const corpoHtml = mensagem
          .replace(/&/g, "&amp;")
          .replace(/</g, "&lt;")
          .replace(/\n/g, "<br>\n");
        const r = await fetch("/api/admin/enviar-mensagem", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            destino_tipo: escopo,
            destino_id: escopo === "todos" ? null : escopoId,
            canais,
            assunto: assunto || "Mensagem",
            corpo_html: corpoHtml,
            corpo_texto: mensagem,
          }),
        });
        const d = await r.json();
        if (!r.ok) {
          setResultado({ ok: false, texto: d.erro || `HTTP ${r.status}` });
        } else {
          const fila = d.whatsapp_enfileirados
            ? ` · ${d.whatsapp_enfileirados} na fila do WhatsApp (1/min)`
            : "";
          setResultado({
            ok: true,
            texto: `Enviado para ${d.total_enviados}/${d.total_destinatarios}${fila}.`,
          });
          setMensagem("");
        }
      } else {
        // grupo ou número (envio direto)
        const destinatario = classe === "grupo" ? grupoJid : numero;
        if (!destinatario.trim()) {
          setResultado({ ok: false, texto: classe === "grupo" ? "Escolha um grupo." : "Informe o número." });
          setEnviando(false);
          return;
        }
        const payload =
          conteudo === "texto"
            ? { acao: "enviar", tipo: "texto", destinatario, mensagem }
            : {
                acao: "enviar",
                tipo: "midia",
                destinatario,
                url: midiaUrl,
                midia_tipo: midiaTipo,
                legenda,
                filename,
              };
        const r = await fetch("/api/admin/whatsapp", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(payload),
        });
        const d = await r.json();
        if (r.ok && d.status === "enviado") {
          setResultado({ ok: true, texto: "Enviado!" });
          if (conteudo === "texto") setMensagem("");
        } else {
          setResultado({ ok: false, texto: d.erro || JSON.stringify(d.evolution_body || d) });
        }
      }
    } catch (e) {
      setResultado({ ok: false, texto: e instanceof Error ? e.message : "erro de rede" });
    } finally {
      setEnviando(false);
    }
  }

  const usaPlaceholderEmGrupo =
    ehDireto && /\{\{\s*(nome|curso)\s*\}\}/i.test(mensagem);

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6 sm:p-8">
      <div className="space-y-5">
        {/* DESTINO */}
        <div>
          <label className="mb-2 block text-sm font-medium text-mesa-700">Para</label>
          <div className="grid gap-2 sm:grid-cols-3">
            {([
              { v: "discipulos", label: "Discípulos" },
              { v: "grupo", label: "Grupo do WhatsApp" },
              { v: "numero", label: "Número avulso" },
            ] as { v: DestinoClasse; label: string }[]).map((o) => (
              <label
                key={o.v}
                className={`flex cursor-pointer items-center gap-2 rounded-lg border px-3 py-2.5 text-sm transition ${
                  classe === o.v
                    ? "border-mesa-400 bg-mesa-50 text-mesa-800"
                    : "border-mesa-200 bg-white text-mesa-700 hover:border-mesa-300"
                }`}
              >
                <input
                  type="radio"
                  name="classe"
                  checked={classe === o.v}
                  onChange={() => {
                    setClasse(o.v);
                    setResultado(null);
                    if (o.v !== "grupo" && o.v !== "numero") setConteudo("texto");
                  }}
                  className="h-4 w-4"
                />
                {o.label}
              </label>
            ))}
          </div>

          {/* sub-opções por classe */}
          {classe === "discipulos" && (
            <div className="mt-3 space-y-2">
              <select
                value={escopo}
                onChange={(e) => {
                  setEscopo(e.target.value as Escopo);
                  setEscopoId("");
                }}
                className={inputCls}
              >
                <option value="todos">Todos os discípulos ({alunos.length})</option>
                <option value="curso">Discípulos de uma temática</option>
                <option value="aluno">Discípulo específico</option>
              </select>
              {escopo === "curso" && (
                <select value={escopoId} onChange={(e) => setEscopoId(e.target.value)} className={inputCls}>
                  <option value="">Selecione a temática…</option>
                  {cursos.map((c) => (
                    <option key={c.id} value={c.id}>
                      {c.titulo} ({c.matriculados} matriculado{c.matriculados === 1 ? "" : "s"})
                    </option>
                  ))}
                </select>
              )}
              {escopo === "aluno" && (
                <select value={escopoId} onChange={(e) => setEscopoId(e.target.value)} className={inputCls}>
                  <option value="">Selecione o discípulo…</option>
                  {alunos.map((a) => (
                    <option key={a.id} value={a.id}>
                      {a.nome ? `${a.nome} (${a.email})` : a.email}
                    </option>
                  ))}
                </select>
              )}
            </div>
          )}

          {classe === "grupo" && (
            <div className="mt-3 space-y-2">
              {grupoJid && (
                <p className="rounded-lg border border-oliveira-200 bg-oliveira-50 px-3 py-2 text-sm text-oliveira-800">
                  Grupo: <strong>{grupoNome}</strong>{" "}
                  <button
                    type="button"
                    onClick={() => {
                      setGrupoJid("");
                      setGrupoNome("");
                    }}
                    className="ml-1 text-xs underline"
                  >
                    trocar
                  </button>
                </p>
              )}
              {!grupoJid && (
                <>
                  <div className="flex gap-2">
                    <button
                      type="button"
                      onClick={carregarGrupos}
                      disabled={carregandoGrupos || !conectado}
                      className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50 disabled:opacity-50"
                    >
                      {carregandoGrupos ? "Carregando…" : grupos ? "Recarregar grupos" : "Carregar grupos"}
                    </button>
                    {!conectado && <span className="self-center text-xs text-mesa-500">conecte o WhatsApp na aba Conexão</span>}
                  </div>
                  {grupos && grupos.length > 0 && (
                    <>
                      <input
                        value={buscaGrupo}
                        onChange={(e) => setBuscaGrupo(e.target.value)}
                        placeholder={`Buscar entre ${grupos.length} grupos…`}
                        className={inputCls}
                      />
                      <ul className="max-h-60 divide-y divide-mesa-100 overflow-y-auto rounded-lg border border-mesa-200">
                        {grupos
                          .filter((g) =>
                            buscaGrupo.trim()
                              ? nomeG(g).toLowerCase().includes(buscaGrupo.trim().toLowerCase())
                              : true
                          )
                          .slice(0, 60)
                          .map((g) => (
                            <li key={jidG(g)}>
                              <button
                                type="button"
                                onClick={() => {
                                  setGrupoJid(jidG(g));
                                  setGrupoNome(nomeG(g));
                                }}
                                className="block w-full px-3 py-2 text-left text-sm text-mesa-700 hover:bg-mesa-50"
                              >
                                {nomeG(g)}
                              </button>
                            </li>
                          ))}
                      </ul>
                    </>
                  )}
                  {grupos && grupos.length === 0 && (
                    <p className="text-sm text-mesa-500">Nenhum grupo encontrado.</p>
                  )}
                </>
              )}
            </div>
          )}

          {classe === "numero" && (
            <input
              value={numero}
              onChange={(e) => setNumero(e.target.value)}
              placeholder="Número com DDD (ex.: 11999998888)"
              className={`${inputCls} mt-3`}
            />
          )}
        </div>

        {/* TEMPLATE */}
        {templates.length > 0 && (
          <div>
            <label className="mb-2 block text-sm font-medium text-mesa-700">Template (opcional)</label>
            <select value={templateId} onChange={(e) => aplicarTemplate(e.target.value)} className={inputCls}>
              <option value="">Escrever do zero…</option>
              {templates.map((t) => (
                <option key={t.id} value={t.id}>
                  {t.titulo}
                </option>
              ))}
            </select>
          </div>
        )}

        {/* CONTEÚDO: texto/mídia só p/ envio direto */}
        {ehDireto && (
          <div className="flex gap-2">
            {(["texto", "midia"] as const).map((t) => (
              <button
                key={t}
                type="button"
                onClick={() => setConteudo(t)}
                className={`rounded-full px-4 py-1.5 text-xs font-medium transition ${
                  conteudo === t
                    ? "bg-mesa-700 text-mesa-50"
                    : "border border-mesa-200 bg-white text-mesa-700 hover:bg-mesa-100"
                }`}
              >
                {t === "texto" ? "Texto" : "Mídia"}
              </button>
            ))}
          </div>
        )}

        {/* ASSUNTO (só discípulos) */}
        {classe === "discipulos" && (
          <div>
            <label className="mb-2 block text-sm font-medium text-mesa-700">Assunto</label>
            <input
              value={assunto}
              onChange={(e) => setAssunto(e.target.value)}
              placeholder="Ex.: Continue sua leitura"
              className={inputCls}
            />
          </div>
        )}

        {/* MENSAGEM ou MÍDIA */}
        {conteudo === "texto" ? (
          <div>
            <label className="mb-2 block text-sm font-medium text-mesa-700">Mensagem</label>
            <textarea
              value={mensagem}
              onChange={(e) => setMensagem(e.target.value)}
              rows={5}
              placeholder="Sua mensagem… use {{nome}} e {{curso}} (só para discípulos)."
              className={inputCls}
            />
            {classe === "discipulos" && (
              <p className="mt-1 text-xs text-mesa-500">
                <code className="rounded bg-mesa-100 px-1">{"{{nome}}"}</code> e{" "}
                <code className="rounded bg-mesa-100 px-1">{"{{curso}}"}</code> são trocados no envio.
              </p>
            )}
            {usaPlaceholderEmGrupo && (
              <p className="mt-1 text-xs text-amber-700">
                ⚠️ Em grupo/número, {"{{nome}}"} e {"{{curso}}"} não são preenchidos — edite o texto.
              </p>
            )}
          </div>
        ) : (
          <div className="space-y-3">
            <input
              value={midiaUrl}
              onChange={(e) => setMidiaUrl(e.target.value)}
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

        {/* CANAIS (só discípulos) */}
        {classe === "discipulos" && (
          <div>
            <label className="mb-2 block text-sm font-medium text-mesa-700">Canais</label>
            <div className="flex flex-wrap gap-3 text-sm text-mesa-700">
              <label className="flex cursor-pointer items-center gap-2">
                <input type="checkbox" checked={cWhats} onChange={(e) => setCWhats(e.target.checked)} className="h-4 w-4 rounded" />
                WhatsApp
              </label>
              <label className="flex cursor-pointer items-center gap-2">
                <input type="checkbox" checked={cEmail} onChange={(e) => setCEmail(e.target.checked)} className="h-4 w-4 rounded" />
                Email
              </label>
              <label className="flex cursor-pointer items-center gap-2">
                <input type="checkbox" checked={cPush} onChange={(e) => setCPush(e.target.checked)} className="h-4 w-4 rounded" />
                Push (app)
              </label>
            </div>
            {cWhats && comTelefone > 0 && (
              <p className="mt-2 rounded-lg border border-mesa-200 bg-mesa-50 px-3 py-2 text-xs text-mesa-700">
                📨 O WhatsApp sai 1 por minuto (proteção contra bloqueio). {comTelefone}{" "}
                {comTelefone === 1 ? "mensagem" : "mensagens"} ≈{" "}
                <strong>{comTelefone < 60 ? `${comTelefone} min` : `${Math.round((comTelefone / 60) * 10) / 10} h`}</strong>.
              </p>
            )}
          </div>
        )}

        {/* AÇÃO */}
        <div className="flex flex-wrap items-center justify-between gap-3 border-t border-mesa-100 pt-5">
          <div className="text-sm">
            {classe === "discipulos" && totalEscopo > 0 && (
              <span className="text-mesa-500">Estimativa: {totalEscopo} discípulo(s)</span>
            )}
            {resultado && (
              <span className={resultado.ok ? "text-oliveira-700" : "text-red-700"}>
                {resultado.ok ? "✓ " : ""}
                {resultado.texto}
              </span>
            )}
          </div>
          <button
            type="button"
            onClick={enviar}
            disabled={enviando || (ehDireto && !conectado)}
            className="rounded-full bg-mesa-700 px-6 py-2.5 text-sm font-medium text-mesa-50 hover:bg-mesa-800 disabled:cursor-not-allowed disabled:bg-mesa-300"
          >
            {enviando ? "Enviando…" : "Enviar"}
          </button>
        </div>
        {ehDireto && !conectado && (
          <p className="text-right text-xs text-mesa-500">Conecte o WhatsApp (aba Conexão) para enviar a grupos/números.</p>
        )}
      </div>
    </div>
  );
}

// ----------------------------------------------------------------------------
// HISTÓRICO
// ----------------------------------------------------------------------------
function Historico({ mensagens }: { mensagens: MensagemHist[] }) {
  if (mensagens.length === 0) {
    return (
      <div className="rounded-2xl border-2 border-dashed border-mesa-200 bg-white py-16 text-center">
        <p className="font-serif text-lg text-mesa-500">Nenhuma mensagem enviada ainda.</p>
      </div>
    );
  }
  return (
    <ul className="space-y-3">
      {mensagens.map((m) => (
        <li key={m.id} className="rounded-xl border border-mesa-200 bg-white p-5">
          <div className="flex flex-wrap items-start justify-between gap-4">
            <div className="min-w-0 flex-1">
              <div className="mb-1 flex flex-wrap items-center gap-2">
                <h3 className="font-serif text-lg font-semibold text-mesa-800">{m.assunto}</h3>
                <span className="rounded-full bg-mesa-100 px-2 py-0.5 text-xs text-mesa-600">{m.destino_label}</span>
                {m.canais.map((c) => (
                  <span key={c} className="rounded-full bg-laranja-100 px-2 py-0.5 text-xs text-laranja-700">
                    {c}
                  </span>
                ))}
              </div>
              <p className="text-xs text-mesa-500">{new Date(m.enviada_em).toLocaleString("pt-BR")}</p>
            </div>
            <div className="flex items-center gap-5 text-sm">
              <div className="text-right">
                <p className="font-serif text-xl font-semibold text-oliveira-700">{m.total_enviados}</p>
                <p className="text-xs text-mesa-500">enviados</p>
              </div>
              {m.total_erros > 0 && (
                <div className="text-right">
                  <p className="font-serif text-xl font-semibold text-red-700">{m.total_erros}</p>
                  <p className="text-xs text-mesa-500">erros</p>
                </div>
              )}
              <div className="text-right">
                <p className="font-serif text-xl font-semibold text-mesa-700">{m.total_destinatarios}</p>
                <p className="text-xs text-mesa-500">total</p>
              </div>
              <Link
                href={`/admin/mensagens/${m.id}`}
                className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
              >
                Ver detalhes →
              </Link>
            </div>
          </div>
        </li>
      ))}
    </ul>
  );
}

// ----------------------------------------------------------------------------
// CONEXÃO (status + QR)
// ----------------------------------------------------------------------------
function Conexao({ status, onMudou }: { status: Status | null; onMudou: () => void }) {
  const [qr, setQr] = useState<string | null>(null);
  const [conectando, setConectando] = useState(false);
  const pollRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const conectado = !!status?.loggedIn;

  useEffect(() => {
    return () => {
      if (pollRef.current) clearInterval(pollRef.current);
    };
  }, []);

  useEffect(() => {
    if (conectado && pollRef.current) {
      clearInterval(pollRef.current);
      pollRef.current = null;
      setQr(null);
    }
  }, [conectado]);

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
      setQr(d.qrcode || null);
      if (!d.loggedIn) {
        if (pollRef.current) clearInterval(pollRef.current);
        pollRef.current = setInterval(onMudou, 4000);
      }
    } finally {
      setConectando(false);
    }
  }

  return (
    <div className="rounded-2xl border border-mesa-200 bg-white p-6">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="flex items-center gap-2 text-sm text-mesa-700">
          <span className={`inline-block h-2.5 w-2.5 rounded-full ${conectado ? "bg-oliveira-600" : "bg-red-500"}`} />
          {conectado ? `Conectado${status?.nome ? ` como ${status.nome}` : ""}` : "Desconectado"}
        </p>
        <div className="flex gap-2">
          <button
            type="button"
            onClick={onMudou}
            className="rounded-full border border-mesa-200 bg-white px-4 py-2 text-xs font-medium text-mesa-700 hover:bg-mesa-50"
          >
            Atualizar
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
            No celular: <strong>WhatsApp → Aparelhos conectados → Conectar um aparelho</strong> e aponte para o
            código. Ele expira em ~30s — se sumir, clique em <em>Gerar novo QR</em>.
          </p>
        </div>
      )}
    </div>
  );
}
