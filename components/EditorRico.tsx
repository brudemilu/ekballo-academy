"use client";

// =============================================================
// EKBALLO ACADEMY · Editor de texto do caderno de anotações
//
// contentEditable + document.execCommand. `execCommand` está marcado como
// deprecated há anos, mas continua sendo a única API de edição rica que todo
// navegador implementa — e a alternativa (TipTap/ProseMirror) custaria ~200 kB
// de bundle num app que hoje tem 7 dependências. Onde execCommand não dá conta
// (alinhamento, marca-texto, checklist), o comando é feito na mão sobre o DOM.
//
// O innerHTML é escrito UMA vez, na montagem: React não pode re-renderizar o
// conteúdo a cada tecla, senão o cursor pula. Quem troca de anotação usa `key`
// no componente pai pra forçar remontagem.
// =============================================================

import {
  useCallback,
  useEffect,
  useLayoutEffect,
  useRef,
  useState,
} from "react";
import { sanitizarHtml, CORES_MARCADOR } from "@/lib/sanitizar-html";

type EstadoBotoes = {
  bold: boolean;
  italic: boolean;
  underline: boolean;
  strikeThrough: boolean;
  insertUnorderedList: boolean;
  insertOrderedList: boolean;
  bloco: string;
};

const ESTADO_ZERO: EstadoBotoes = {
  bold: false,
  italic: false,
  underline: false,
  strikeThrough: false,
  insertUnorderedList: false,
  insertOrderedList: false,
  bloco: "p",
};

const BLOCOS = ["P", "H2", "H3", "H4", "BLOCKQUOTE", "PRE", "LI", "DIV"];

function blocoAtual(raiz: HTMLElement): HTMLElement | null {
  const sel = window.getSelection();
  if (!sel || sel.rangeCount === 0) return null;
  let no: Node | null = sel.getRangeAt(0).startContainer;
  while (no && no !== raiz) {
    if (no.nodeType === 1 && BLOCOS.includes((no as HTMLElement).tagName)) {
      return no as HTMLElement;
    }
    no = no.parentNode;
  }
  return null;
}

export function EditorRico({
  htmlInicial,
  onChange,
  onSalvarAtalho,
  placeholder = "Comece a escrever…",
  alturaMinima = 420,
  compacto = false,
}: {
  htmlInicial: string;
  onChange: (html: string) => void;
  /** Ctrl/Cmd+S dentro do editor — salva sem esperar o autosave. */
  onSalvarAtalho?: () => void;
  placeholder?: string;
  alturaMinima?: number;
  /** Barra reduzida, para o card de anotação dentro da mesa. */
  compacto?: boolean;
}) {
  const areaRef = useRef<HTMLDivElement>(null);
  const rangeSalvo = useRef<Range | null>(null);
  const [estado, setEstado] = useState<EstadoBotoes>(ESTADO_ZERO);
  const [vazio, setVazio] = useState(!htmlInicial.trim());
  const [painelLink, setPainelLink] = useState(false);
  const [urlLink, setUrlLink] = useState("");
  const [painelCor, setPainelCor] = useState(false);

  // Conteúdo inicial + preferência de tags (<b> em vez de <span style>).
  useLayoutEffect(() => {
    const area = areaRef.current;
    if (!area) return;
    area.innerHTML = htmlInicial || "<p><br></p>";
    try {
      document.execCommand("styleWithCSS", false, "false");
      document.execCommand("defaultParagraphSeparator", false, "p");
    } catch {
      // navegador antigo: o padrão dele já serve
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // execCommand deixa lixo estrutural: cria <ul> DENTRO do <p> em que o cursor
  // estava (HTML inválido, some ao recarregar) e não repassa o data-tarefa pros
  // <li> nascidos de um Enter. Arruma as duas coisas antes de salvar.
  const normalizarEstrutura = useCallback((area: HTMLElement) => {
    area.querySelectorAll("p > ul, p > ol").forEach((lista) => {
      const p = lista.parentElement;
      if (!p?.parentElement) return;
      p.parentElement.insertBefore(lista, p.nextSibling);
      if (!p.textContent?.trim() && !p.querySelector("br, img, hr")) p.remove();
    });
    area.querySelectorAll('ul[data-lista="tarefas"] > li').forEach((li) => {
      if (!li.hasAttribute("data-tarefa")) li.setAttribute("data-tarefa", "0");
    });
    // <li> órfão (fora de lista) que sobrou de uma inserção: vira parágrafo.
    area.querySelectorAll("li").forEach((li) => {
      const pai = li.parentElement;
      if (pai && pai !== area) return;
      const p = document.createElement("p");
      p.innerHTML = li.innerHTML;
      li.replaceWith(p);
    });
  }, []);

  const emitir = useCallback(() => {
    const area = areaRef.current;
    if (!area) return;
    normalizarEstrutura(area);
    const html = area.innerHTML;
    setVazio(!area.textContent?.trim() && !area.querySelector("img, hr, table"));
    onChange(html);
  }, [onChange, normalizarEstrutura]);

  const sincronizarBotoes = useCallback(() => {
    const area = areaRef.current;
    if (!area || !area.contains(document.getSelection()?.anchorNode ?? null)) return;
    const bloco = blocoAtual(area);
    try {
      setEstado({
        bold: document.queryCommandState("bold"),
        italic: document.queryCommandState("italic"),
        underline: document.queryCommandState("underline"),
        strikeThrough: document.queryCommandState("strikeThrough"),
        insertUnorderedList: document.queryCommandState("insertUnorderedList"),
        insertOrderedList: document.queryCommandState("insertOrderedList"),
        bloco: (bloco?.tagName || "P").toLowerCase(),
      });
    } catch {
      // queryCommandState pode lançar quando a seleção está fora do editor
    }
  }, []);

  useEffect(() => {
    document.addEventListener("selectionchange", sincronizarBotoes);
    return () => document.removeEventListener("selectionchange", sincronizarBotoes);
  }, [sincronizarBotoes]);

  // Guarda a seleção antes de o foco ir pro campo de link (o input rouba o
  // caret e, sem isso, o link seria aplicado no lugar errado).
  function guardarSelecao() {
    const sel = window.getSelection();
    if (sel && sel.rangeCount && areaRef.current?.contains(sel.anchorNode)) {
      rangeSalvo.current = sel.getRangeAt(0).cloneRange();
    }
  }

  function restaurarSelecao() {
    const range = rangeSalvo.current;
    const sel = window.getSelection();
    if (range && sel) {
      sel.removeAllRanges();
      sel.addRange(range);
    }
    areaRef.current?.focus();
  }

  const cmd = useCallback(
    (comando: string, valor?: string) => {
      areaRef.current?.focus();
      try {
        document.execCommand(comando, false, valor);
      } catch {
        // comando não suportado — o botão simplesmente não faz nada
      }
      emitir();
      sincronizarBotoes();
    },
    [emitir, sincronizarBotoes],
  );

  function aplicarBloco(tag: string) {
    // Alterna: clicar em "Título" de novo volta pra parágrafo.
    const alvo = estado.bloco === tag.toLowerCase() ? "p" : tag;
    cmd("formatBlock", `<${alvo}>`);
  }

  function aplicarAlinhamento(align: "left" | "center" | "right" | "justify") {
    const area = areaRef.current;
    const bloco = area ? blocoAtual(area) : null;
    if (!bloco) return;
    if (align === "left") bloco.removeAttribute("data-align");
    else bloco.setAttribute("data-align", align);
    emitir();
  }

  function marcarTexto(cor: string) {
    const area = areaRef.current;
    if (!area) return;
    area.focus();
    try {
      // hiliteColor exige styleWithCSS ligado; volta a desligar em seguida pra
      // negrito/itálico continuarem virando <b>/<i> e não <span style>.
      document.execCommand("styleWithCSS", false, "true");
      document.execCommand("hiliteColor", false, cor);
      document.execCommand("styleWithCSS", false, "false");
    } catch {
      // sem suporte: marca-texto simplesmente não aplica
    }
    setPainelCor(false);
    emitir();
  }

  function limparMarcacao() {
    const area = areaRef.current;
    const sel = window.getSelection();
    if (!area || !sel || sel.rangeCount === 0) return;
    const range = sel.getRangeAt(0);
    // Desembrulha <mark> e spans de fundo que cruzam a seleção.
    const marcas = Array.from(area.querySelectorAll("mark, span[style*='background']"));
    for (const marca of marcas) {
      if (!range.intersectsNode(marca)) continue;
      const pai = marca.parentNode;
      if (!pai) continue;
      while (marca.firstChild) pai.insertBefore(marca.firstChild, marca);
      pai.removeChild(marca);
    }
    emitir();
  }

  // Inserir a <ul> com insertHTML quebrava a lista quando o cursor estava
  // dentro de um <p> (o <li> saía solto). Aqui o navegador cria a lista com o
  // mecanismo dele — que sabe converter o bloco atual — e só decoramos.
  function inserirChecklist() {
    const area = areaRef.current;
    if (!area) return;
    area.focus();
    try {
      if (!document.queryCommandState("insertUnorderedList")) {
        document.execCommand("insertUnorderedList");
      }
    } catch {
      return;
    }
    const bloco = blocoAtual(area);
    const ul = bloco?.tagName === "LI" ? bloco.parentElement : null;
    if (ul?.tagName === "UL") {
      ul.setAttribute("data-lista", "tarefas");
      Array.from(ul.children).forEach((li) => li.setAttribute("data-tarefa", "0"));
    }
    emitir();
    sincronizarBotoes();
  }

  function inserirDivisor() {
    cmd("insertHTML", "<hr><p><br></p>");
  }

  function confirmarLink() {
    const url = urlLink.trim();
    restaurarSelecao();
    if (url) {
      cmd("createLink", /^https?:|^mailto:|^\//i.test(url) ? url : `https://${url}`);
    }
    setPainelLink(false);
    setUrlLink("");
  }

  function limparFormatacao() {
    limparMarcacao();
    cmd("removeFormat");
    cmd("formatBlock", "<p>");
  }

  // Colar: qualquer HTML de fora passa pelo mesmo sanitizador do servidor.
  // Com Shift, cola como texto puro.
  function handlePaste(e: React.ClipboardEvent<HTMLDivElement>) {
    e.preventDefault();
    const html = e.clipboardData.getData("text/html");
    const texto = e.clipboardData.getData("text/plain");
    if (html) {
      const limpo = sanitizarHtml(html);
      if (limpo) {
        cmd("insertHTML", limpo);
        return;
      }
    }
    // Texto puro: preserva parágrafos, escapando o que vier junto.
    const paragrafos = texto
      .split(/\n{2,}/)
      .map((p) =>
        p
          .replace(/&/g, "&amp;")
          .replace(/</g, "&lt;")
          .replace(/>/g, "&gt;")
          .replace(/\n/g, "<br>"),
      )
      .filter(Boolean)
      .map((p) => `<p>${p}</p>`)
      .join("");
    cmd("insertHTML", paragrafos || "<p><br></p>");
  }

  // Clique no quadradinho da checklist alterna feito/não feito. O checkbox é
  // desenhado pelo CSS (::before do li), então a detecção é por posição.
  function handleClick(e: React.MouseEvent<HTMLDivElement>) {
    const alvo = e.target as HTMLElement;
    const li = alvo.closest?.("li[data-tarefa]") as HTMLElement | null;
    if (!li) return;
    const caixa = li.getBoundingClientRect();
    if (e.clientX - caixa.left > 26) return; // clicou no texto, não no quadradinho
    li.setAttribute("data-tarefa", li.getAttribute("data-tarefa") === "1" ? "0" : "1");
    emitir();
  }

  // Atalhos + conversões de markdown enquanto digita.
  function handleKeyDown(e: React.KeyboardEvent<HTMLDivElement>) {
    const meta = e.metaKey || e.ctrlKey;

    if (meta && e.key.toLowerCase() === "s") {
      e.preventDefault();
      onSalvarAtalho?.();
      return;
    }
    if (meta && e.key.toLowerCase() === "k") {
      e.preventDefault();
      guardarSelecao();
      setPainelLink(true);
      return;
    }
    // Negrito/itálico/sublinhado no atalho: o contentEditable até trata
    // sozinho, mas o comportamento varia por navegador — e o rodapé do editor
    // promete os três. Melhor executar explicitamente.
    if (meta && !e.shiftKey && ["b", "i", "u"].includes(e.key.toLowerCase())) {
      e.preventDefault();
      cmd({ b: "bold", i: "italic", u: "underline" }[e.key.toLowerCase()] as string);
      return;
    }
    if (meta && e.shiftKey && e.key.toLowerCase() === "x") {
      e.preventDefault();
      cmd("strikeThrough");
      return;
    }
    if (meta && e.shiftKey && e.key.toLowerCase() === "h") {
      e.preventDefault();
      marcarTexto(CORES_MARCADOR.amarelo);
      return;
    }

    // Tab dentro de lista = aninhar / desaninhar.
    if (e.key === "Tab") {
      const area = areaRef.current;
      const bloco = area ? blocoAtual(area) : null;
      if (bloco?.tagName === "LI") {
        e.preventDefault();
        cmd(e.shiftKey ? "outdent" : "indent");
        return;
      }
    }

    // "## " vira título, "- " vira lista, "> " vira citação, "[] " vira tarefa.
    if (e.key === " ") {
      const area = areaRef.current;
      const bloco = area ? blocoAtual(area) : null;
      const sel = window.getSelection();
      if (!area || !bloco || !sel || !sel.isCollapsed) return;
      const prefixo = (sel.anchorNode?.textContent || "").slice(0, sel.anchorOffset);
      const atalhos: Record<string, () => void> = {
        "#": () => aplicarBloco("H2"),
        "##": () => aplicarBloco("H2"),
        "###": () => aplicarBloco("H3"),
        "-": () => cmd("insertUnorderedList"),
        "*": () => cmd("insertUnorderedList"),
        "1.": () => cmd("insertOrderedList"),
        ">": () => aplicarBloco("BLOCKQUOTE"),
        "[]": inserirChecklist,
        "[ ]": inserirChecklist,
      };
      const acao = atalhos[prefixo];
      if (!acao || bloco.tagName === "PRE") return;
      e.preventDefault();
      // Apaga o prefixo digitado antes de aplicar o formato.
      for (let i = 0; i < prefixo.length; i++) document.execCommand("delete");
      acao();
    }
  }

  const btn = (ativo: boolean) =>
    `flex h-8 min-w-8 items-center justify-center rounded-lg px-2 text-sm transition ${
      ativo
        ? "bg-laranja-500 text-white shadow-sm"
        : "text-mesa-600 hover:bg-mesa-100 hover:text-mesa-900"
    }`;

  const Sep = () => <span className="mx-1 h-5 w-px flex-none bg-mesa-200" aria-hidden />;

  return (
    <div className="overflow-hidden rounded-2xl border border-mesa-200 bg-white shadow-sm">
      {/* ---- Barra de ferramentas ---- */}
      <div className="sticky top-0 z-20 border-b border-mesa-200 bg-white/95 backdrop-blur">
        <div className="flex flex-wrap items-center gap-0.5 px-2 py-2">
          <button type="button" onClick={() => cmd("undo")} className={btn(false)} title="Desfazer (Ctrl+Z)">
            ↶
          </button>
          <button type="button" onClick={() => cmd("redo")} className={btn(false)} title="Refazer (Ctrl+Shift+Z)">
            ↷
          </button>
          <Sep />

          <button
            type="button"
            onClick={() => aplicarBloco("H2")}
            className={btn(estado.bloco === "h2")}
            title="Título"
          >
            <span className="font-serif font-semibold">T</span>
          </button>
          <button
            type="button"
            onClick={() => aplicarBloco("H3")}
            className={btn(estado.bloco === "h3")}
            title="Subtítulo"
          >
            <span className="font-serif text-xs font-semibold">T</span>
          </button>
          <Sep />

          <button type="button" onClick={() => cmd("bold")} className={btn(estado.bold)} title="Negrito (Ctrl+B)">
            <b>N</b>
          </button>
          <button type="button" onClick={() => cmd("italic")} className={btn(estado.italic)} title="Itálico (Ctrl+I)">
            <i className="font-serif">I</i>
          </button>
          <button
            type="button"
            onClick={() => cmd("underline")}
            className={btn(estado.underline)}
            title="Sublinhado (Ctrl+U)"
          >
            <u>S</u>
          </button>
          <button
            type="button"
            onClick={() => cmd("strikeThrough")}
            className={btn(estado.strikeThrough)}
            title="Tachado (Ctrl+Shift+X)"
          >
            <s>R</s>
          </button>

          {/* Marca-texto */}
          <div className="relative">
            <button
              type="button"
              onClick={() => {
                guardarSelecao();
                setPainelCor((v) => !v);
              }}
              className={btn(painelCor)}
              title="Marca-texto (Ctrl+Shift+H)"
            >
              🖍
            </button>
            {painelCor && (
              <div className="absolute left-0 top-9 z-30 flex items-center gap-1 rounded-xl border border-mesa-200 bg-white p-1.5 shadow-lg">
                {Object.entries(CORES_MARCADOR).map(([nome, hex]) => (
                  <button
                    key={nome}
                    type="button"
                    onClick={() => {
                      restaurarSelecao();
                      marcarTexto(hex);
                    }}
                    title={nome}
                    className="h-6 w-6 rounded-md border border-mesa-300 transition hover:scale-110"
                    style={{ background: hex }}
                  />
                ))}
                <button
                  type="button"
                  onClick={() => {
                    restaurarSelecao();
                    limparMarcacao();
                    setPainelCor(false);
                  }}
                  title="Tirar marca-texto"
                  className="h-6 w-6 rounded-md border border-mesa-300 text-xs text-mesa-500 hover:bg-mesa-100"
                >
                  ✕
                </button>
              </div>
            )}
          </div>
          <Sep />

          <button
            type="button"
            onClick={() => cmd("insertUnorderedList")}
            className={btn(estado.insertUnorderedList)}
            title="Lista com marcadores"
          >
            ☰
          </button>
          <button
            type="button"
            onClick={() => cmd("insertOrderedList")}
            className={btn(estado.insertOrderedList)}
            title="Lista numerada"
          >
            <span className="text-xs font-semibold">1.</span>
          </button>
          <button type="button" onClick={inserirChecklist} className={btn(false)} title="Lista de tarefas">
            ☑
          </button>
          <Sep />

          <button
            type="button"
            onClick={() => aplicarBloco("BLOCKQUOTE")}
            className={btn(estado.bloco === "blockquote")}
            title="Citação"
          >
            <span className="font-serif text-base leading-none">&ldquo;</span>
          </button>
          <button
            type="button"
            onClick={() => aplicarBloco("PRE")}
            className={btn(estado.bloco === "pre")}
            title="Bloco de código"
          >
            <span className="font-mono text-xs">{"</>"}</span>
          </button>
          <button type="button" onClick={inserirDivisor} className={btn(false)} title="Linha divisória">
            —
          </button>

          {!compacto && (
            <>
              <Sep />
              <button
                type="button"
                onClick={() => aplicarAlinhamento("left")}
                className={btn(false)}
                title="Alinhar à esquerda"
              >
                ⬅
              </button>
              <button
                type="button"
                onClick={() => aplicarAlinhamento("center")}
                className={btn(false)}
                title="Centralizar"
              >
                ⬌
              </button>
              <button
                type="button"
                onClick={() => aplicarAlinhamento("justify")}
                className={btn(false)}
                title="Justificar (padrão ABNT)"
              >
                ☰
              </button>
            </>
          )}
          <Sep />

          <button
            type="button"
            onClick={() => {
              guardarSelecao();
              setPainelLink((v) => !v);
            }}
            className={btn(painelLink)}
            title="Inserir link (Ctrl+K)"
          >
            🔗
          </button>
          <button type="button" onClick={limparFormatacao} className={btn(false)} title="Limpar formatação">
            ⌫
          </button>
        </div>

        {painelLink && (
          <div className="flex items-center gap-2 border-t border-mesa-200 bg-mesa-50 px-3 py-2">
            <input
              autoFocus
              value={urlLink}
              onChange={(e) => setUrlLink(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === "Enter") {
                  e.preventDefault();
                  confirmarLink();
                }
                if (e.key === "Escape") setPainelLink(false);
              }}
              placeholder="https://…  (selecione o texto antes)"
              className="flex-1 rounded-lg border border-mesa-200 bg-white px-3 py-1.5 text-sm outline-none focus:border-laranja-400"
            />
            <button
              type="button"
              onClick={confirmarLink}
              className="rounded-lg bg-laranja-500 px-3 py-1.5 text-xs font-semibold text-white hover:bg-laranja-600"
            >
              Aplicar
            </button>
            <button
              type="button"
              onClick={() => {
                restaurarSelecao();
                cmd("unlink");
                setPainelLink(false);
              }}
              className="rounded-lg border border-mesa-200 bg-white px-3 py-1.5 text-xs font-medium text-mesa-600 hover:bg-mesa-100"
            >
              Remover
            </button>
          </div>
        )}
      </div>

      {/* ---- Área de escrita ---- */}
      <div className="relative">
        {vazio && (
          <p className="pointer-events-none absolute left-6 top-6 text-mesa-400 sm:left-8">
            {placeholder}
          </p>
        )}
        <div
          ref={areaRef}
          contentEditable
          suppressContentEditableWarning
          role="textbox"
          aria-multiline="true"
          aria-label="Conteúdo da anotação"
          spellCheck
          lang="pt-BR"
          onInput={emitir}
          onBlur={emitir}
          onPaste={handlePaste}
          onClick={handleClick}
          onKeyDown={handleKeyDown}
          onKeyUp={sincronizarBotoes}
          onMouseUp={sincronizarBotoes}
          className="prose-anotacao px-6 py-6 outline-none sm:px-8"
          style={{ minHeight: alturaMinima }}
        />
      </div>
    </div>
  );
}
