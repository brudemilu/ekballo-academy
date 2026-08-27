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
//
// ---- ACENTOS (regra que não pode ser quebrada) ----
// Digitar "ã" num teclado ABNT não é uma tecla: é uma COMPOSIÇÃO. O navegador
// abre um texto provisório no ponto do cursor quando você aperta o ~ e só o
// materializa quando chega o "a". Enquanto isso estiver aberto, mexer no DOM,
// chamar execCommand ou dar preventDefault ABORTA a composição — e o acento
// simplesmente some. Por isso todo handler daqui começa perguntando se há
// composição em curso e, se houver, não faz absolutamente nada até o
// `compositionend`.
// =============================================================

import {
  useCallback,
  useEffect,
  useLayoutEffect,
  useMemo,
  useRef,
  useState,
} from "react";
import { sanitizarHtml, CORES_MARCADOR } from "@/lib/sanitizar-html";

/** O que o editor deixa outros componentes fazerem no texto. */
export type EditorApi = {
  /** Insere HTML no ponto do cursor (usado pela busca da Bíblia). */
  inserirHtml: (html: string) => void;
  focar: () => void;
};

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

// Estilos de bloco oferecidos no seletor — texto por extenso em vez de
// ícones crípticos ("T" grande e "T" pequeno não diziam nada).
const ESTILOS: { valor: string; rotulo: string; dica: string }[] = [
  { valor: "p", rotulo: "Texto normal", dica: "Parágrafo comum" },
  { valor: "h2", rotulo: "Título", dica: "Título de seção" },
  { valor: "h3", rotulo: "Subtítulo", dica: "Subdivisão do título" },
  { valor: "h4", rotulo: "Rótulo", dica: "Etiqueta pequena, em maiúsculas" },
  { valor: "blockquote", rotulo: "Citação", dica: "Trecho citado, recuado" },
  { valor: "pre", rotulo: "Código", dica: "Texto monoespaçado" },
];

type Espaco = "compacto" | "normal" | "amplo";

const ESPACOS: { valor: Espaco; rotulo: string }[] = [
  { valor: "compacto", rotulo: "Compacto" },
  { valor: "normal", rotulo: "Normal" },
  { valor: "amplo", rotulo: "Amplo" },
];

const K_ESPACO = "anotacao:espacamento";

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
  apiRef,
}: {
  htmlInicial: string;
  onChange: (html: string) => void;
  /** Preenchido na montagem com os comandos que o editor aceita de fora. */
  apiRef?: { current: EditorApi | null };
  /** Ctrl/Cmd+S dentro do editor — salva sem esperar o autosave. */
  onSalvarAtalho?: () => void;
  placeholder?: string;
  alturaMinima?: number;
  /** Barra reduzida, para o card de anotação dentro da mesa. */
  compacto?: boolean;
}) {
  const areaRef = useRef<HTMLDivElement>(null);
  const rangeSalvo = useRef<Range | null>(null);
  // Verdadeiro entre compositionstart e compositionend (acento em curso).
  const compondo = useRef(false);

  const [estado, setEstado] = useState<EstadoBotoes>(ESTADO_ZERO);
  const [vazio, setVazio] = useState(!htmlInicial.trim());
  const [painelLink, setPainelLink] = useState(false);
  const [urlLink, setUrlLink] = useState("");
  const [painelCor, setPainelCor] = useState(false);
  const [painelAlinhar, setPainelAlinhar] = useState(false);
  const [espaco, setEspaco] = useState<Espaco>("normal");

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

  // Espaçamento entre linhas é preferência de leitura: vale pra todas as
  // anotações, então mora no localStorage e não no banco.
  useEffect(() => {
    try {
      const salvo = localStorage.getItem(K_ESPACO) as Espaco | null;
      if (salvo && ESPACOS.some((e) => e.valor === salvo)) setEspaco(salvo);
    } catch {
      // aba anônima: fica no padrão
    }
  }, []);

  function trocarEspaco(novo: Espaco) {
    setEspaco(novo);
    try {
      localStorage.setItem(K_ESPACO, novo);
    } catch {}
  }

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
    // Composição em curso: sair sem tocar em nada. O texto provisório do
    // acento ainda está no DOM e qualquer mexida aqui o mataria.
    if (!area || compondo.current) return;
    normalizarEstrutura(area);
    setVazio(!area.textContent?.trim() && !area.querySelector("img, hr, table"));
    onChange(area.innerHTML);
  }, [onChange, normalizarEstrutura]);

  const sincronizarBotoes = useCallback(() => {
    const area = areaRef.current;
    if (!area || compondo.current) return;
    if (!area.contains(document.getSelection()?.anchorNode ?? null)) return;
    const bloco = blocoAtual(area);
    try {
      const novo: EstadoBotoes = {
        bold: document.queryCommandState("bold"),
        italic: document.queryCommandState("italic"),
        underline: document.queryCommandState("underline"),
        strikeThrough: document.queryCommandState("strikeThrough"),
        insertUnorderedList: document.queryCommandState("insertUnorderedList"),
        insertOrderedList: document.queryCommandState("insertOrderedList"),
        bloco: (bloco?.tagName || "P").toLowerCase(),
      };
      // Só re-renderiza quando algo mudou de fato: `selectionchange` dispara a
      // cada tecla, e um setState por tecla é re-render à toa embaixo do
      // cursor — justamente o que atrapalha a digitação.
      setEstado((atual) =>
        (Object.keys(novo) as (keyof EstadoBotoes)[]).every((k) => atual[k] === novo[k])
          ? atual
          : novo,
      );
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
      if (compondo.current) return;
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

  function aplicarEstilo(tag: string) {
    cmd("formatBlock", `<${tag}>`);
  }

  function aplicarAlinhamento(align: "left" | "center" | "right" | "justify") {
    const area = areaRef.current;
    const bloco = area ? blocoAtual(area) : null;
    setPainelAlinhar(false);
    if (!bloco) return;
    if (align === "left") bloco.removeAttribute("data-align");
    else bloco.setAttribute("data-align", align);
    emitir();
  }

  function marcarTexto(cor: string) {
    const area = areaRef.current;
    if (!area || compondo.current) return;
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
    if (!area || compondo.current) return;
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
    // Composição em curso (acento, IME, autocorreção do celular): a tecla
    // pertence ao teclado, não ao editor. `keyCode === 229` é como os
    // navegadores sinalizam "esta tecla é da composição".
    if (compondo.current || e.nativeEvent.isComposing || e.keyCode === 229) return;

    const meta = e.metaKey || e.ctrlKey;
    // AltGr no Windows chega como Ctrl+Alt — e é assim que muita gente digita
    // símbolos. Tratar isso como "Ctrl" roubaria a tecla do teclado.
    const altGr = e.ctrlKey && e.altKey;
    if (altGr) return;

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
        "#": () => aplicarEstilo("h2"),
        "##": () => aplicarEstilo("h2"),
        "###": () => aplicarEstilo("h3"),
        "-": () => cmd("insertUnorderedList"),
        "*": () => cmd("insertUnorderedList"),
        "1.": () => cmd("insertOrderedList"),
        ">": () => aplicarEstilo("blockquote"),
        "[]": inserirChecklist,
        "[ ]": inserirChecklist,
      };
      const acao = atalhos[prefixo];
      if (!acao || bloco.tagName === "PRE") return;
      e.preventDefault();
      for (let i = 0; i < prefixo.length; i++) document.execCommand("delete");
      acao();
    }
  }

  // Ponte para quem escreve no texto de fora (a busca da Bíblia insere o
  // versículo no ponto onde o cursor estava antes de ir pro campo de busca).
  useEffect(() => {
    if (!apiRef) return;
    apiRef.current = {
      inserirHtml: (html: string) => {
        const area = areaRef.current;
        if (!area) return;
        area.focus();
        restaurarSelecao();
        const limpo = sanitizarHtml(html);
        try {
          document.execCommand("insertHTML", false, limpo);
        } catch {
          area.insertAdjacentHTML("beforeend", limpo);
        }
        emitir();
        sincronizarBotoes();
      },
      focar: () => areaRef.current?.focus(),
    };
    return () => {
      apiRef.current = null;
    };
  }, [apiRef, emitir, sincronizarBotoes]);

  // Objeto estável: recriar o style a cada render faz o React reescrever o
  // atributo do contentEditable a cada tecla.
  const estiloArea = useMemo(() => ({ minHeight: alturaMinima }), [alturaMinima]);

  const btn = (ativo: boolean, extra = "") =>
    `flex h-8 min-w-8 items-center justify-center rounded-lg px-2 text-sm transition ${
      ativo
        ? "bg-laranja-500 text-white shadow-sm"
        : "text-mesa-600 hover:bg-mesa-100 hover:text-mesa-900"
    } ${extra}`;

  const Sep = () => <span className="mx-1 h-5 w-px flex-none bg-mesa-200" aria-hidden />;

  return (
    <div className="overflow-hidden rounded-2xl border border-mesa-200 bg-white shadow-sm">
      {/* ---- Barra de ferramentas ---- */}
      <div className="sticky top-0 z-20 border-b border-mesa-200 bg-white/95 backdrop-blur">
        <div className="flex flex-wrap items-center gap-0.5 px-2 py-2">
          <button type="button" onClick={() => cmd("undo")} className={btn(false)} title="Desfazer (Ctrl+Z)">
            <Icone nome="desfazer" />
          </button>
          <button type="button" onClick={() => cmd("redo")} className={btn(false)} title="Refazer (Ctrl+Shift+Z)">
            <Icone nome="refazer" />
          </button>
          <Sep />

          {/* Estilo do bloco: por extenso, não mais dois "T" indistinguíveis */}
          <select
            value={ESTILOS.some((s) => s.valor === estado.bloco) ? estado.bloco : "p"}
            onChange={(e) => aplicarEstilo(e.target.value)}
            title="Estilo do parágrafo"
            className="h-8 rounded-lg border border-mesa-200 bg-white px-2 text-xs font-medium text-mesa-700 outline-none transition hover:bg-mesa-50 focus:border-laranja-400"
          >
            {ESTILOS.map((s) => (
              <option key={s.valor} value={s.valor} title={s.dica}>
                {s.rotulo}
              </option>
            ))}
          </select>
          <Sep />

          <button type="button" onClick={() => cmd("bold")} className={btn(estado.bold)} title="Negrito (Ctrl+B)">
            <span className="font-serif text-base font-bold leading-none">N</span>
          </button>
          <button type="button" onClick={() => cmd("italic")} className={btn(estado.italic)} title="Itálico (Ctrl+I)">
            <span className="font-serif text-base italic leading-none">I</span>
          </button>
          <button
            type="button"
            onClick={() => cmd("underline")}
            className={btn(estado.underline)}
            title="Sublinhado (Ctrl+U)"
          >
            <span className="font-serif text-base leading-none underline underline-offset-2">S</span>
          </button>
          <button
            type="button"
            onClick={() => cmd("strikeThrough")}
            className={btn(estado.strikeThrough)}
            title="Riscado (Ctrl+Shift+X)"
          >
            <span className="font-serif text-base leading-none line-through">S</span>
          </button>

          {/* Marca-texto */}
          <div className="relative">
            <button
              type="button"
              onClick={() => {
                guardarSelecao();
                setPainelCor((v) => !v);
                setPainelAlinhar(false);
              }}
              className={btn(painelCor)}
              title="Marca-texto (Ctrl+Shift+H)"
            >
              <Icone nome="marcador" />
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
            <Icone nome="lista" />
          </button>
          <button
            type="button"
            onClick={() => cmd("insertOrderedList")}
            className={btn(estado.insertOrderedList)}
            title="Lista numerada"
          >
            <Icone nome="listaNumerada" />
          </button>
          <button type="button" onClick={inserirChecklist} className={btn(false)} title="Lista de tarefas">
            <Icone nome="tarefas" />
          </button>
          <Sep />

          <button type="button" onClick={inserirDivisor} className={btn(false)} title="Linha divisória">
            <Icone nome="divisor" />
          </button>

          {!compacto && (
            <>
              {/* Alinhamento agrupado num menu — quatro botões soltos poluíam
                  a barra e as setas não diziam o que faziam. */}
              <div className="relative">
                <button
                  type="button"
                  onClick={() => {
                    setPainelAlinhar((v) => !v);
                    setPainelCor(false);
                  }}
                  className={btn(painelAlinhar)}
                  title="Alinhamento do parágrafo"
                >
                  <Icone nome="alinharJustificado" />
                </button>
                {painelAlinhar && (
                  <div className="absolute left-0 top-9 z-30 flex items-center gap-0.5 rounded-xl border border-mesa-200 bg-white p-1.5 shadow-lg">
                    <button
                      type="button"
                      onClick={() => aplicarAlinhamento("left")}
                      className={btn(false)}
                      title="À esquerda"
                    >
                      <Icone nome="alinharEsquerda" />
                    </button>
                    <button
                      type="button"
                      onClick={() => aplicarAlinhamento("center")}
                      className={btn(false)}
                      title="Centralizado"
                    >
                      <Icone nome="alinharCentro" />
                    </button>
                    <button
                      type="button"
                      onClick={() => aplicarAlinhamento("right")}
                      className={btn(false)}
                      title="À direita"
                    >
                      <Icone nome="alinharDireita" />
                    </button>
                    <button
                      type="button"
                      onClick={() => aplicarAlinhamento("justify")}
                      className={btn(false)}
                      title="Justificado (padrão do texto)"
                    >
                      <Icone nome="alinharJustificado" />
                    </button>
                  </div>
                )}
              </div>

              {/* Espaçamento entre linhas */}
              <div className="flex items-center gap-1 rounded-lg border border-mesa-200 px-1.5 py-0.5">
                <Icone nome="entrelinhas" />
                <select
                  value={espaco}
                  onChange={(e) => trocarEspaco(e.target.value as Espaco)}
                  title="Espaço entre as linhas do texto"
                  className="h-6 bg-transparent text-xs font-medium text-mesa-700 outline-none"
                >
                  {ESPACOS.map((e) => (
                    <option key={e.valor} value={e.valor}>
                      {e.rotulo}
                    </option>
                  ))}
                </select>
              </div>
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
            <Icone nome="link" />
          </button>
          <button type="button" onClick={limparFormatacao} className={btn(false)} title="Limpar formatação">
            <Icone nome="limpar" />
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
          data-espaco={espaco}
          onInput={emitir}
          onBlur={() => {
            // Guarda onde o cursor estava: quem for buscar um versículo vai
            // tirar o foco daqui, e a inserção precisa voltar pro mesmo ponto.
            guardarSelecao();
            emitir();
          }}
          onPaste={handlePaste}
          onClick={handleClick}
          onKeyDown={handleKeyDown}
          onKeyUp={sincronizarBotoes}
          onMouseUp={sincronizarBotoes}
          // Sem estes três, um acento digitado no teclado se perde: o
          // navegador abre a composição, o onInput dispara no meio dela e
          // qualquer alteração no DOM a cancela.
          onCompositionStart={() => {
            compondo.current = true;
          }}
          onCompositionUpdate={() => {
            compondo.current = true;
          }}
          onCompositionEnd={() => {
            compondo.current = false;
            // Agora sim: o caractere composto já está no DOM.
            emitir();
            sincronizarBotoes();
          }}
          className={`prose-anotacao px-6 py-6 outline-none sm:px-8 ${
            compacto ? "prose-anotacao-compacta" : ""
          }`}
          style={estiloArea}
        />
      </div>
    </div>
  );
}

// Ícones desenhados à mão: o projeto não tem biblioteca de ícones e não vale
// trazer uma por causa de dez glifos.
function Icone({ nome }: { nome: string }) {
  const comum = {
    width: 16,
    height: 16,
    viewBox: "0 0 20 20",
    fill: "none",
    stroke: "currentColor",
    strokeWidth: 1.7,
    strokeLinecap: "round" as const,
    strokeLinejoin: "round" as const,
    "aria-hidden": true,
  };

  switch (nome) {
    case "desfazer":
      return (
        <svg {...comum}>
          <path d="M4 9h8a4 4 0 0 1 0 8h-1" />
          <path d="M7 6 4 9l3 3" />
        </svg>
      );
    case "refazer":
      return (
        <svg {...comum}>
          <path d="M16 9H8a4 4 0 0 0 0 8h1" />
          <path d="m13 6 3 3-3 3" />
        </svg>
      );
    case "lista":
      return (
        <svg {...comum}>
          <circle cx="4" cy="6" r="1.1" fill="currentColor" stroke="none" />
          <circle cx="4" cy="10" r="1.1" fill="currentColor" stroke="none" />
          <circle cx="4" cy="14" r="1.1" fill="currentColor" stroke="none" />
          <path d="M8 6h8M8 10h8M8 14h8" />
        </svg>
      );
    case "listaNumerada":
      return (
        <svg {...comum}>
          <path d="M8 6h8M8 10h8M8 14h8" />
          <text x="2" y="8" fontSize="6" fill="currentColor" stroke="none">1</text>
          <text x="2" y="16" fontSize="6" fill="currentColor" stroke="none">2</text>
        </svg>
      );
    case "tarefas":
      return (
        <svg {...comum}>
          <rect x="2.5" y="4" width="4" height="4" rx="1" />
          <path d="m3.4 6 .9.9L6 5.2" />
          <rect x="2.5" y="12" width="4" height="4" rx="1" />
          <path d="M9 6h8M9 14h8" />
        </svg>
      );
    case "marcador":
      return (
        <svg {...comum}>
          <path d="m12 3 5 5-7 7H5v-5z" />
          <path d="M3 18h14" strokeWidth="2.4" />
        </svg>
      );
    case "divisor":
      return (
        <svg {...comum}>
          <path d="M3 10h14" strokeWidth="2" />
          <path d="M5 5h10M5 15h10" opacity="0.35" />
        </svg>
      );
    case "alinharEsquerda":
      return (
        <svg {...comum}>
          <path d="M3 5h14M3 9h8M3 13h14M3 17h8" />
        </svg>
      );
    case "alinharCentro":
      return (
        <svg {...comum}>
          <path d="M3 5h14M6 9h8M3 13h14M6 17h8" />
        </svg>
      );
    case "alinharDireita":
      return (
        <svg {...comum}>
          <path d="M3 5h14M9 9h8M3 13h14M9 17h8" />
        </svg>
      );
    case "alinharJustificado":
      return (
        <svg {...comum}>
          <path d="M3 5h14M3 9h14M3 13h14M3 17h14" />
        </svg>
      );
    case "entrelinhas":
      return (
        <svg {...comum}>
          <path d="M8 5h9M8 10h9M8 15h9" />
          <path d="M4 5v10" />
          <path d="m2.6 6.4 1.4-1.4 1.4 1.4M2.6 13.6 4 15l1.4-1.4" />
        </svg>
      );
    case "link":
      return (
        <svg {...comum}>
          <path d="M8.5 11.5a3 3 0 0 0 4.2 0l2.6-2.6a3 3 0 0 0-4.2-4.2l-1 1" />
          <path d="M11.5 8.5a3 3 0 0 0-4.2 0l-2.6 2.6a3 3 0 0 0 4.2 4.2l1-1" />
        </svg>
      );
    case "limpar":
      return (
        <svg {...comum}>
          <path d="M6 5h10M11 5l-2 10" />
          <path d="m13 11 4 4M17 11l-4 4" />
        </svg>
      );
    default:
      return null;
  }
}
