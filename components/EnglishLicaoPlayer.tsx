"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import {
  embaralharComSemente,
  nomeConquista,
  normalizarResposta,
  respostaCorreta,
  type EnglishExercicio,
  type EnglishLicao,
  type EnglishModulo,
} from "@/lib/english-tipos";

// =============================================================
// Player da lição do Ekballo English.
//
// Um exercício por vez, feedback imediato, e no fim manda o
// resultado pra /api/english/concluir (progresso + streak +
// conquista).
//
// OUVIR: MP3 pré-gerado com voz neural (Edge TTS), servido
// estático de public/english/audio. A voz do navegador só entra
// como plano B — ela varia demais entre aparelhos, e num curso de
// idioma a pronúncia de referência não pode depender de quem abre.
//
// FALAR: o aluno GRAVA a voz e o servidor transcreve (Whisper via
// Groq) pra comparar com a frase esperada. Antes isso usava o
// reconhecimento do navegador, que só existe no Chrome/Edge do
// computador — ou seja, não corrigia quem estuda pelo celular, que
// é a maioria. Gravar funciona em todo aparelho moderno.
// Onde nem gravar dá, o exercício vira honra ("Já falei").
// =============================================================

type Props = {
  modulo: EnglishModulo;
  licao: EnglishLicao;
  exercicios: EnglishExercicio[];
  proximaSlug: string | null;
  /** Revisão do dia: mesma mecânica, mas os exercícios vêm de várias lições
   *  já concluídas. Não conclui lição nem altera a nota dela — só registra a
   *  revisão e segura a sequência. */
  revisao?: boolean;
};

type Veredito = "certo" | "errado" | null;

// Exercícios de vocabulário ensinam, não avaliam — ficam fora da nota.
const VALE_NOTA: Record<string, boolean> = {
  vocabulario: false, escolha: true, traducao: true, ouvir: true, montar: true, falar: true,
  imagem: true,
};

// ---------- voz do navegador ----------

// Plano B, quando o exercício não tem MP3 pré-gerado. Aqui a voz é a do
// aparelho, e a qualidade varia MUITO — por isso escolhemos explicitamente
// a melhor voz inglesa disponível em vez de aceitar o padrão do navegador,
// que no Chrome do desktop costuma ser uma voz compacta quase ininteligível.
const VOZES_PREFERIDAS = [
  /natural/i,                 // Microsoft *Neural/Natural — as melhores
  /google (us|uk) english/i,  // Chrome desktop
  /samantha|alex|daniel/i,    // macOS / iOS
  /aria|jenny|guy|libby/i,    // Windows
];

function melhorVozIngles(): SpeechSynthesisVoice | null {
  if (typeof window === "undefined" || !("speechSynthesis" in window)) return null;
  const inglesas = window.speechSynthesis
    .getVoices()
    .filter((v) => v.lang?.toLowerCase().startsWith("en"));
  if (!inglesas.length) return null;
  for (const padrao of VOZES_PREFERIDAS) {
    const achada = inglesas.find((v) => padrao.test(v.name));
    if (achada) return achada;
  }
  return inglesas.find((v) => v.lang?.toLowerCase() === "en-us") || inglesas[0];
}

function pronunciarNoNavegador(texto: string) {
  if (typeof window === "undefined" || !("speechSynthesis" in window)) return;
  window.speechSynthesis.cancel();
  const fala = new SpeechSynthesisUtterance(texto);
  fala.lang = "en-US";
  fala.rate = 0.95; // 0.85 arrastava e embolava as vozes compactas
  const voz = melhorVozIngles();
  if (voz) fala.voice = voz;
  window.speechSynthesis.speak(fala);
}

/**
 * ESPÉCIME — a assinatura visual do curso.
 *
 * A palavra em inglês é o objeto de estudo, então recebe tratamento de
 * espécime de catálogo: enorme, e logo abaixo a pronúncia aproximada
 * ("gud mór-nin"), que já existe no banco e que quase nenhum app de idioma
 * põe em primeiro plano. O português desce a legenda — antes ele disputava
 * tamanho com o inglês, e disputa vira ruído: o aluno lia o português e
 * pulava o que veio aprender.
 */
function Especime({
  en, dica, pt, compacto = false,
}: { en: string; dica?: string | null; pt?: string | null; compacto?: boolean }) {
  return (
    <div className="text-center">
      <p
        lang="en"
        className={`font-display font-semibold leading-[0.95] tracking-[-0.03em] text-mesa-900 ${
          compacto ? "text-4xl sm:text-5xl" : "text-5xl sm:text-7xl"
        }`}
      >
        {en}
      </p>
      {dica ? (
        <p className="mt-4 font-ui text-xs font-semibold uppercase tracking-[0.3em] text-laranja-600 sm:text-sm">
          {dica}
        </p>
      ) : null}
      {pt ? <p className="mt-5 font-ui text-base text-mesa-500">{pt}</p> : null}
    </div>
  );
}

export function EnglishLicaoPlayer({ modulo, licao, exercicios, proximaSlug, revisao = false }: Props) {
  const router = useRouter();

  const [indice, setIndice] = useState(0);
  const [veredito, setVeredito] = useState<Veredito>(null);
  const [digitado, setDigitado] = useState("");
  const [escolhida, setEscolhida] = useState<string | null>(null);
  const [montadas, setMontadas] = useState<string[]>([]);
  const [revelado, setRevelado] = useState(false);
  const [gravando, setGravando] = useState(false);
  const [analisando, setAnalisando] = useState(false);
  const [minhaGravacao, setMinhaGravacao] = useState<string | null>(null);
  const [transcricao, setTranscricao] = useState("");
  const [erroFala, setErroFala] = useState<string | null>(null);
  const [acertos, setAcertos] = useState(0);
  const [avaliados, setAvaliados] = useState(0);
  const [finalizando, setFinalizando] = useState(false);
  const [resultado, setResultado] = useState<{
    streak: { dias_seguidos: number; recorde: number; total_licoes: number };
    novasConquistas: string[];
  } | null>(null);
  const [erroEnvio, setErroEnvio] = useState<string | null>(null);
  // Se o aparelho não grava (navegador antigo, permissão negada em nível de
  // sistema), o exercício de fala vira honra em vez de virar parede.
  const [podeGravar, setPodeGravar] = useState(true);

  const inputRef = useRef<HTMLInputElement>(null);
  const gravadorRef = useRef<MediaRecorder | null>(null);
  const limiteRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const audioRef = useRef<HTMLAudioElement | null>(null);

  /**
   * Toca o áudio do exercício. Manda o MP3 pré-gerado (voz neural, igual em
   * todo aparelho); só cai na voz do navegador se não houver arquivo ou se o
   * arquivo falhar.
   */
  const ouvirExercicio = useCallback((ex: EnglishExercicio | undefined) => {
    if (!ex) return;
    const texto = ex.audio_texto || ex.pergunta || ex.resposta || "";

    if (ex.audio_url) {
      try {
        audioRef.current?.pause();
        if (typeof window !== "undefined" && "speechSynthesis" in window) {
          window.speechSynthesis.cancel();
        }
        const som = new Audio(ex.audio_url);
        audioRef.current = som;
        void som.play().catch(() => pronunciarNoNavegador(texto));
        return;
      } catch {
        // arquivo indisponível — segue pro plano B
      }
    }
    pronunciarNoNavegador(texto);
  }, []);

  const exercicio = exercicios[indice];
  const ultimo = indice >= exercicios.length - 1;
  const progresso = exercicios.length ? Math.round((indice / exercicios.length) * 100) : 0;

  useEffect(() => {
    // Gravar funciona em todo aparelho moderno, iPhone incluído — ao
    // contrário do reconhecimento de fala do navegador, que só existia no
    // Chrome/Edge do computador e deixava sem correção justamente quem
    // estuda pelo celular.
    setPodeGravar(
      typeof window !== "undefined" &&
      typeof MediaRecorder !== "undefined" &&
      Boolean(navigator.mediaDevices?.getUserMedia),
    );
  }, []);

  // Banco de palavras do "montar": embaralhado de forma determinística
  // (semente = id do exercício) pra não quebrar a hidratação.
  const bancoPalavras = useMemo(() => {
    if (exercicio?.tipo !== "montar" || !exercicio.resposta) return [];
    return embaralharComSemente(exercicio.resposta.split(/\s+/), exercicio.id);
  }, [exercicio]);

  const disponiveis = useMemo(() => {
    const usadas = [...montadas];
    return bancoPalavras.filter((palavra) => {
      const i = usadas.indexOf(palavra);
      if (i >= 0) { usadas.splice(i, 1); return false; }
      return true;
    });
  }, [bancoPalavras, montadas]);

  // Ao entrar num exercício de ouvir, toca o áudio sozinho.
  useEffect(() => {
    if (exercicio?.tipo === "ouvir") ouvirExercicio(exercicio);
    if (exercicio?.tipo === "traducao" || exercicio?.tipo === "ouvir") {
      inputRef.current?.focus();
    }
  }, [exercicio, ouvirExercicio]);

  // Para o microfone e a voz ao sair da tela.
  useEffect(() => () => {
    if (limiteRef.current) clearTimeout(limiteRef.current);
    try { gravadorRef.current?.stop(); } catch { /* já parado */ }
    audioRef.current?.pause();
    if (typeof window !== "undefined" && "speechSynthesis" in window) window.speechSynthesis.cancel();
  }, []);

  const podeConferir = (() => {
    if (!exercicio) return false;
    switch (exercicio.tipo) {
      case "vocabulario": return true;
      case "escolha":
      case "imagem": return escolhida !== null;
      case "traducao":
      case "ouvir": return digitado.trim().length > 0;
      case "montar": return montadas.length > 0;
      // Sem microfone (ou com microfone que falhou), o aluno segue na palavra
      // dele. O exercício de fala nunca pode ser uma parede.
      case "falar": return !podeGravar || erroFala !== null;
      default: return false;
    }
  })();

  function conferir() {
    if (!exercicio || veredito) return;

    let certo = true;
    if (exercicio.tipo === "escolha" || exercicio.tipo === "imagem") {
      certo = exercicio.alternativas.some((a) => a.correta && a.texto === escolhida);
    } else if (exercicio.tipo === "traducao" || exercicio.tipo === "ouvir") {
      certo = respostaCorreta(digitado, exercicio.resposta, exercicio.aceitas);
    } else if (exercicio.tipo === "montar") {
      certo = respostaCorreta(montadas.join(" "), exercicio.resposta, exercicio.aceitas);
    } else if (exercicio.tipo === "falar") {
      // Aqui o botão só fica ativo quando NÃO houve gravação (sem microfone
      // ou com falha) — nesse caso vale a palavra do aluno. Quando há
      // gravação, quem decide é conferirPronuncia, pela transcrição.
      certo = true;
    }

    registrarVeredito(certo);
  }

  /** Fecha o exercício: contabiliza (quando o tipo vale nota) e mostra o veredito. */
  function registrarVeredito(certo: boolean) {
    if (!exercicio || veredito) return;
    if (VALE_NOTA[exercicio.tipo]) {
      setAvaliados((n) => n + 1);
      if (certo) setAcertos((n) => n + 1);
    }
    setVeredito(certo ? "certo" : "errado");
  }

  const concluir = useCallback(async (totalAvaliado: number, totalAcertos: number) => {
    setFinalizando(true);
    setErroEnvio(null);
    try {
      const res = await fetch(revisao ? "/api/english/revisar" : "/api/english/concluir", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(
          revisao
            ? { acertos: totalAcertos, total: totalAvaliado, exercicios: exercicios.map((e) => e.id) }
            : { licaoId: licao.id, acertos: totalAcertos, total: totalAvaliado },
        ),
      });
      const dados = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(dados.erro || "Não deu para salvar o seu progresso.");
      setResultado({ streak: dados.streak, novasConquistas: dados.novasConquistas || [] });
      router.refresh();
    } catch (erro) {
      setErroEnvio(erro instanceof Error ? erro.message : "Não deu para salvar o seu progresso.");
      setResultado({ streak: { dias_seguidos: 0, recorde: 0, total_licoes: 0 }, novasConquistas: [] });
    } finally {
      setFinalizando(false);
    }
  }, [licao.id, revisao, exercicios, router]);

  function avancar() {
    if (ultimo) {
      void concluir(avaliados, acertos);
      return;
    }
    setIndice((i) => i + 1);
    setVeredito(null);
    setDigitado("");
    setEscolhida(null);
    setMontadas([]);
    setRevelado(false);
    setTranscricao("");
    setErroFala(null);
    setMinhaGravacao(null);
    setAnalisando(false);
    pararGravacao();
  }

  /** Encerra a gravação e solta o microfone. Idempotente. */
  function pararGravacao() {
    if (limiteRef.current) { clearTimeout(limiteRef.current); limiteRef.current = null; }
    try { gravadorRef.current?.stop(); } catch { /* já parado */ }
    setGravando(false);
  }

  /** Grava a fala do aluno, guarda para ele se ouvir, e manda conferir. */
  async function gravar() {
    setErroFala(null);
    setTranscricao("");
    setMinhaGravacao(null);

    let trilha: MediaStream;
    try {
      trilha = await navigator.mediaDevices.getUserMedia({ audio: true });
    } catch {
      setErroFala("O navegador bloqueou o microfone. Libere o acesso nas permissões deste site — ou siga sem gravar.");
      setPodeGravar(false);
      return;
    }

    let gravador: MediaRecorder;
    try {
      gravador = new MediaRecorder(trilha);
    } catch {
      trilha.getTracks().forEach((t) => t.stop());
      setPodeGravar(false);
      return;
    }
    gravadorRef.current = gravador;

    const pedacos: BlobPart[] = [];
    gravador.ondataavailable = (e) => { if (e.data.size > 0) pedacos.push(e.data); };

    gravador.onstop = async () => {
      trilha.getTracks().forEach((t) => t.stop()); // solta o microfone
      setGravando(false);
      const tipo = gravador.mimeType || "audio/webm";
      const blob = new Blob(pedacos, { type: tipo });
      if (blob.size === 0) {
        setErroFala("Não gravou nada. Tente de novo, mais perto do microfone.");
        return;
      }
      // Guarda para o aluno se ouvir — comparar a própria voz com o modelo
      // é metade do aprendizado de pronúncia, e não custa nada.
      setMinhaGravacao(URL.createObjectURL(blob));
      await conferirPronuncia(blob, tipo);
    };

    setGravando(true);
    gravador.start();
    // Corte de segurança: frase de lição é curta, e microfone aberto
    // esquecido vira arquivo grande e conta desnecessária.
    limiteRef.current = setTimeout(pararGravacao, 8000);
  }

  /** Manda o áudio pro servidor, que transcreve e compara. */
  async function conferirPronuncia(blob: Blob, tipo: string) {
    if (!exercicio?.resposta) return;
    setAnalisando(true);
    try {
      const extensao = tipo.includes("mp4") ? "m4a" : tipo.includes("ogg") ? "ogg" : "webm";
      const form = new FormData();
      form.append("audio", blob, `fala.${extensao}`);
      form.append("nome", `fala.${extensao}`);
      form.append("esperado", exercicio.resposta);
      form.append("aceitas", JSON.stringify(exercicio.aceitas || []));

      const res = await fetch("/api/english/pronuncia", { method: "POST", body: form });
      const dados = await res.json().catch(() => ({}));
      if (!res.ok) throw new Error(dados.erro || "não consegui ouvir agora");

      setTranscricao(dados.transcricao || "");
      registrarVeredito(Boolean(dados.correto));
    } catch (e) {
      setErroFala(e instanceof Error ? e.message : "não consegui ouvir agora");
    } finally {
      setAnalisando(false);
    }
  }

  // ---------------- tela final ----------------

  if (resultado) {
    const nota = avaliados ? Math.round((acertos / avaliados) * 100) : 100;
    return (
      <div className="mx-auto max-w-2xl px-4 py-12 sm:px-6">
        <div className="rounded-[2rem] border border-mesa-200 bg-white p-8 text-center shadow-xl shadow-mesa-800/5">
          <p className="text-5xl">{nota === 100 ? "🏆" : nota >= 70 ? "🎉" : "💪"}</p>
          <h1 className="mt-4 font-serif text-3xl font-semibold text-mesa-900">
            {nota === 100 ? "Perfect!" : nota >= 70 ? "Well done!" : "Keep going!"}
          </h1>
          <p className="mt-2 text-mesa-600">
            {revisao
              ? "Você revisou o que já tinha aprendido."
              : <>Você concluiu <strong>{licao.titulo}</strong>.</>}
          </p>

          <div className="mt-8 grid gap-3 sm:grid-cols-3">
            <div className="rounded-2xl border border-mesa-200 bg-bege-50 p-4">
              <p className="text-2xl font-semibold text-mesa-900">{acertos}/{avaliados}</p>
              <p className="mt-1 text-xs uppercase tracking-[0.15em] text-mesa-500">Acertos</p>
            </div>
            <div className="rounded-2xl border border-laranja-200 bg-laranja-50 p-4">
              <p className="text-2xl font-semibold text-laranja-700">🔥 {resultado.streak.dias_seguidos}</p>
              <p className="mt-1 text-xs uppercase tracking-[0.15em] text-laranja-700">Dias seguidos</p>
            </div>
            <div className="rounded-2xl border border-mesa-200 bg-bege-50 p-4">
              <p className="text-2xl font-semibold text-mesa-900">{resultado.streak.total_licoes}</p>
              <p className="mt-1 text-xs uppercase tracking-[0.15em] text-mesa-500">Lições feitas</p>
            </div>
          </div>

          {resultado.novasConquistas.length > 0 && (
            <div className="mt-6 rounded-2xl border border-laranja-200 bg-laranja-50 p-5 text-left">
              <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-700">
                Nova conquista
              </p>
              <ul className="mt-3 space-y-2">
                {resultado.novasConquistas.map((chave) => {
                  const c = nomeConquista(chave);
                  return (
                    <li key={chave} className="flex items-start gap-3">
                      <span className="text-2xl">{c.emoji}</span>
                      <span>
                        <span className="block font-semibold text-mesa-900">{c.nome}</span>
                        <span className="block text-sm text-mesa-600">{c.descricao}</span>
                      </span>
                    </li>
                  );
                })}
              </ul>
            </div>
          )}

          {erroEnvio && (
            <p className="mt-6 rounded-2xl border border-laranja-300 bg-laranja-50 p-4 text-sm text-laranja-800">
              {erroEnvio} Seu resultado desta rodada não foi registrado — dá para refazer a lição.
            </p>
          )}

          <div className="mt-8 flex flex-col gap-3 sm:flex-row sm:justify-center">
            {proximaSlug ? (
              <Link
                href={`/english/licao/${proximaSlug}`}
                className="rounded-full bg-laranja-500 px-6 py-3 font-semibold text-white transition hover:bg-laranja-600"
              >
                Próxima lição →
              </Link>
            ) : null}
            <Link
              href="/english/jornada"
              className="rounded-full border border-mesa-300 px-6 py-3 font-semibold text-mesa-800 transition hover:border-laranja-400 hover:text-laranja-700"
            >
              Voltar à trilha
            </Link>
          </div>
        </div>
      </div>
    );
  }

  if (!exercicio) {
    return (
      <div className="mx-auto max-w-2xl px-4 py-16 text-center sm:px-6">
        <p className="text-mesa-600">Esta lição ainda não tem exercícios.</p>
        <Link href="/english/jornada" className="mt-4 inline-block font-semibold text-laranja-600">
          Voltar à trilha
        </Link>
      </div>
    );
  }

  // ---------------- tela do exercício ----------------

  const respostaEsperada =
    exercicio.tipo === "escolha" || exercicio.tipo === "imagem"
      ? exercicio.alternativas.find((a) => a.correta)?.texto || ""
      : exercicio.resposta || "";

  return (
    <div className="min-h-screen bg-bege-50">
      {/* topo: sair + barra de progresso */}
      <header className="border-b border-mesa-200 bg-white/90 backdrop-blur">
        <div className="mx-auto flex max-w-3xl items-center gap-4 px-4 py-4 sm:px-6">
          <Link
            href="/english/jornada"
            aria-label="Sair da lição"
            className="text-xl leading-none text-mesa-400 transition hover:text-mesa-700"
          >
            ✕
          </Link>
          {/* Um segmento por exercício, não uma barra contínua: numa prática
              curta o que o aluno quer saber é QUANTOS PASSOS FALTAM, e barra
              não responde isso. */}
          <div className="flex flex-1 items-center gap-1" aria-hidden>
            {exercicios.map((e, i) => (
              <span
                key={e.id}
                className={`h-1.5 flex-1 rounded-full transition-colors duration-300 ${
                  i < indice ? "bg-laranja-500" : i === indice ? "bg-laranja-300" : "bg-mesa-200"
                }`}
              />
            ))}
          </div>
          <span className="font-ui text-sm font-semibold tabular-nums text-mesa-500">
            {indice + 1}/{exercicios.length}
          </span>
        </div>
      </header>

      <main className="mx-auto w-full max-w-3xl px-4 py-8 sm:px-6 sm:py-12">
        <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-600">
          {revisao ? "Revisão do dia" : `Módulo ${modulo.numero} · Lição ${licao.numero}`}
        </p>
        <h1 className="mt-2 font-serif text-2xl font-semibold text-mesa-900 sm:text-3xl">
          {exercicio.enunciado}
        </h1>

        <div className="mt-6 sm:mt-8">
          {/* ---- vocabulário ---- */}
          {exercicio.tipo === "vocabulario" && (
            <div className="rounded-3xl border border-mesa-200 bg-white px-6 py-10 text-center shadow-sm shadow-mesa-800/5 sm:px-10">
              {exercicio.imagem_url && (
                // eslint-disable-next-line @next/next/no-img-element
                <img
                  src={exercicio.imagem_url}
                  alt=""
                  aria-hidden
                  className="mx-auto mb-8 h-32 w-32 rounded-2xl object-contain sm:h-40 sm:w-40"
                />
              )}
              <Especime
                en={exercicio.pergunta || ""}
                dica={exercicio.dica}
                pt={exercicio.pergunta_pt}
              />
              <button
                type="button"
                onClick={() => ouvirExercicio(exercicio)}
                className="mt-6 rounded-full border border-laranja-300 bg-laranja-50 px-6 py-3 font-semibold text-laranja-700 transition hover:bg-laranja-100"
              >
                🔊 Ouvir
              </button>
            </div>
          )}

          {/* ---- escolha ---- */}
          {exercicio.tipo === "escolha" && (
            <div className="space-y-3">
              {exercicio.alternativas.map((alt) => {
                const marcada = escolhida === alt.texto;
                const mostrarCerta = veredito !== null && alt.correta;
                const mostrarErrada = veredito === "errado" && marcada && !alt.correta;
                return (
                  <button
                    key={alt.texto}
                    type="button"
                    disabled={veredito !== null}
                    onClick={() => setEscolhida(alt.texto)}
                    className={`w-full rounded-2xl border-2 px-5 py-4 text-left text-lg transition ${
                      mostrarCerta
                        ? "border-acerto-500 bg-acerto-50 text-acerto-700"
                        : mostrarErrada
                          ? "border-erro-500 bg-erro-50 text-erro-600"
                          : marcada
                            ? "border-laranja-400 bg-laranja-50 text-mesa-900"
                            : "border-mesa-200 bg-white text-mesa-800 hover:border-laranja-300"
                    }`}
                  >
                    {alt.texto}
                  </button>
                );
              })}
            </div>
          )}

          {/* ---- escolha a imagem ---- */}
          {/* A palavra em inglês fica grande no topo e as figuras embaixo, sem
              legenda nenhuma: é o ponto do exercício. Rótulo escrito ao lado da
              figura entregaria a resposta e devolveria a muleta da tradução. */}
          {exercicio.tipo === "imagem" && (
            <div>
              <div className="mb-6 flex flex-col items-center gap-3">
                <Especime en={exercicio.pergunta || ""} dica={exercicio.dica} compacto />
                <button
                  type="button"
                  onClick={() => ouvirExercicio(exercicio)}
                  className="rounded-full border border-laranja-300 bg-laranja-50 px-5 py-2 text-sm font-semibold text-laranja-700 transition hover:bg-laranja-100"
                >
                  🔊 Ouvir
                </button>
              </div>

              <div className="grid grid-cols-2 gap-3 sm:gap-4">
                {exercicio.alternativas.map((alt, i) => {
                  const marcada = escolhida === alt.texto;
                  const mostrarCerta = veredito !== null && alt.correta;
                  const mostrarErrada = veredito === "errado" && marcada && !alt.correta;
                  return (
                    <button
                      key={alt.texto}
                      type="button"
                      disabled={veredito !== null}
                      onClick={() => setEscolhida(alt.texto)}
                      aria-label={`Opção ${i + 1}`}
                      className={`overflow-hidden rounded-2xl border-2 bg-white p-2 transition ${
                        mostrarCerta
                          ? "border-acerto-500 ring-2 ring-acerto-500"
                          : mostrarErrada
                            ? "border-erro-500 ring-2 ring-erro-500"
                            : marcada
                              ? "border-laranja-400 ring-2 ring-laranja-300"
                              : "border-mesa-200 hover:border-laranja-300"
                      }`}
                    >
                      {alt.imagem ? (
                        // eslint-disable-next-line @next/next/no-img-element
                        <img
                          src={alt.imagem}
                          alt=""
                          aria-hidden
                          className="aspect-square w-full rounded-xl object-contain"
                        />
                      ) : (
                        // Sem figura ainda: cai pra palavra, pra não virar botão vazio.
                        <span className="flex aspect-square w-full items-center justify-center rounded-xl bg-bege-50 p-3 text-lg text-mesa-700">
                          {alt.texto}
                        </span>
                      )}
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {/* ---- tradução / ouvir ---- */}
          {(exercicio.tipo === "traducao" || exercicio.tipo === "ouvir") && (
            <div className="rounded-3xl border border-mesa-200 bg-white p-6 shadow-sm shadow-mesa-800/5 sm:p-8">
              {exercicio.tipo === "traducao" ? (
                <p className="text-center font-display text-3xl font-semibold tracking-[-0.02em] text-mesa-900 sm:text-4xl">
                  {exercicio.pergunta_pt}
                </p>
              ) : (
                <div className="text-center">
                  <button
                    type="button"
                    onClick={() => ouvirExercicio(exercicio)}
                    className="rounded-full border border-laranja-300 bg-laranja-50 px-8 py-4 text-lg font-semibold text-laranja-700 transition hover:bg-laranja-100"
                  >
                    🔊 Ouvir de novo
                  </button>
                  {!revelado ? (
                    <button
                      type="button"
                      onClick={() => setRevelado(true)}
                      className="mt-3 block w-full text-sm text-mesa-500 underline underline-offset-4"
                    >
                      Não consigo ouvir agora — mostrar o texto
                    </button>
                  ) : (
                    <p lang="en" className="mt-3 text-lg text-mesa-700">{exercicio.audio_texto}</p>
                  )}
                </div>
              )}

              <input
                ref={inputRef}
                lang="en"
                value={digitado}
                disabled={veredito !== null}
                onChange={(e) => setDigitado(e.target.value)}
                onKeyDown={(e) => { if (e.key === "Enter" && podeConferir) conferir(); }}
                placeholder="Escreva em inglês..."
                autoCapitalize="off"
                autoCorrect="off"
                spellCheck={false}
                className="mt-6 w-full rounded-2xl border-2 border-mesa-200 bg-bege-50 px-5 py-4 text-lg text-mesa-900 outline-none transition focus:border-laranja-400 disabled:opacity-70"
              />
            </div>
          )}

          {/* ---- montar ---- */}
          {exercicio.tipo === "montar" && (
            <div className="rounded-3xl border border-mesa-200 bg-white p-6 shadow-sm shadow-mesa-800/5 sm:p-8">
              <p className="text-center text-lg text-mesa-600">{exercicio.pergunta_pt}</p>

              <div className="mt-6 min-h-[4.5rem] rounded-2xl border-2 border-dashed border-mesa-300 bg-bege-50 p-3">
                <div className="flex flex-wrap gap-2">
                  {montadas.map((palavra, i) => (
                    <button
                      key={`${palavra}-${i}`}
                      type="button"
                      disabled={veredito !== null}
                      onClick={() => setMontadas((m) => m.filter((_, j) => j !== i))}
                      className="rounded-xl border border-mesa-300 bg-white px-4 py-2 text-lg text-mesa-900"
                    >
                      {palavra}
                    </button>
                  ))}
                </div>
              </div>

              <div className="mt-5 flex flex-wrap justify-center gap-2">
                {disponiveis.map((palavra, i) => (
                  <button
                    key={`${palavra}-${i}`}
                    type="button"
                    disabled={veredito !== null}
                    onClick={() => setMontadas((m) => [...m, palavra])}
                    className="rounded-xl border-2 border-mesa-200 bg-white px-4 py-2 text-lg text-mesa-800 transition hover:border-laranja-300"
                  >
                    {palavra}
                  </button>
                ))}
              </div>
            </div>
          )}

          {/* ---- falar ---- */}
          {exercicio.tipo === "falar" && (
            <div className="rounded-3xl border border-mesa-200 bg-white px-6 py-10 text-center shadow-sm shadow-mesa-800/5 sm:px-10">
              <Especime
                en={exercicio.pergunta || ""}
                dica={exercicio.dica}
                pt={exercicio.pergunta_pt}
                compacto
              />

              <button
                type="button"
                onClick={() => ouvirExercicio(exercicio)}
                className="mt-5 rounded-full border border-mesa-300 px-5 py-2 text-sm font-semibold text-mesa-700 transition hover:border-laranja-400"
              >
                🔊 Ouvir o modelo
              </button>

              {podeGravar ? (
                <>
                  <button
                    type="button"
                    disabled={veredito !== null || analisando}
                    onClick={gravando ? pararGravacao : gravar}
                    className={`mt-6 block w-full rounded-2xl px-6 py-5 text-lg font-semibold transition ${
                      gravando
                        ? "animate-pulse-soft bg-laranja-600 text-white"
                        : "bg-laranja-500 text-white hover:bg-laranja-600"
                    } disabled:opacity-60`}
                  >
                    {analisando
                      ? "Conferindo..."
                      : gravando
                        ? "🎙️ Gravando... toque para parar"
                        : "🎙️ Gravar minha voz"}
                  </button>

                  {/* Ouvir a própria gravação ao lado do modelo é metade do
                      aprendizado de pronúncia — e não custa nada. */}
                  {minhaGravacao && (
                    <div className="mt-4 flex items-center justify-center gap-3">
                      <button
                        type="button"
                        onClick={() => { void new Audio(minhaGravacao).play(); }}
                        className="rounded-full border border-mesa-300 px-5 py-2 text-sm font-semibold text-mesa-700 transition hover:border-laranja-400"
                      >
                        ▶️ Ouvir você
                      </button>
                      <button
                        type="button"
                        onClick={() => ouvirExercicio(exercicio)}
                        className="rounded-full border border-mesa-300 px-5 py-2 text-sm font-semibold text-mesa-700 transition hover:border-laranja-400"
                      >
                        🔊 Ouvir o modelo
                      </button>
                    </div>
                  )}

                  {transcricao && (
                    <p className="mt-4 text-mesa-700">
                      Ouvi: <span lang="en" className="font-semibold">{transcricao}</span>
                    </p>
                  )}

                  {erroFala && (
                    <div className="mt-4 rounded-2xl border border-laranja-200 bg-laranja-50 p-4 text-left">
                      <p className="text-sm text-laranja-800">{erroFala}</p>
                      <p className="mt-2 text-xs text-mesa-500">
                        Fale a frase em voz alta do seu jeito e toque em “Já falei” — a lição
                        segue normalmente.
                      </p>
                    </div>
                  )}
                </>
              ) : (
                <div className="mt-6 rounded-2xl border border-mesa-200 bg-bege-50 p-5">
                  <p className="text-sm font-semibold text-mesa-800">
                    🔊 Ouça o modelo, fale em voz alta e toque em “Já falei”.
                  </p>
                  <p className="mt-2 text-xs text-mesa-500">
                    Este aparelho não deixa gravar o microfone, então a correção automática
                    não roda aqui. A lição segue normalmente.
                  </p>
                </div>
              )}
            </div>
          )}
        </div>

        {/* versículo da lição, no primeiro exercício */}
        {!revisao && indice === 0 && licao.versiculo_en && (
          <div className="mt-8 rounded-2xl border border-mesa-200 bg-white/70 p-5 text-center">
            <p lang="en" className="font-serif text-lg italic text-mesa-800">
              “{licao.versiculo_en}”
            </p>
            <p className="mt-1 text-sm text-mesa-600">{licao.versiculo_pt}</p>
            <p className="mt-2 text-xs uppercase tracking-[0.2em] text-laranja-600">
              {licao.versiculo_ref}
            </p>
          </div>
        )}
      </main>

      {/* rodapé: conferir / continuar + veredito */}
      <footer
        className={`border-t transition-colors ${
          veredito === "certo"
            ? "border-acerto-200 bg-acerto-50"
            : veredito === "errado"
              ? "border-erro-200 bg-erro-50"
              : "border-mesa-200 bg-white"
        }`}
      >
        {/* O botão sobe um pouco da borda: `env(safe-area-inset-bottom)` cobre a
            faixa do indicador do iPhone, e o mínimo de 1.75rem garante folga
            também em aparelho sem essa faixa. Colado na borda, o polegar
            esbarrava no gesto de voltar do sistema. */}
        <div
          className="mx-auto flex max-w-3xl flex-col gap-4 px-4 pt-5 sm:flex-row sm:items-center sm:justify-between sm:px-6"
          style={{ paddingBottom: "max(1.75rem, env(safe-area-inset-bottom))" }}
        >
          <div className="min-h-[1.5rem] text-sm">
            {veredito === "certo" && (
              <p className="font-semibold text-mesa-900">
                {exercicio.tipo === "vocabulario" ? "Boa — segue o ritmo." : "Correto!"}
              </p>
            )}
            {veredito === "errado" && (
              <p className="text-erro-600">
                Resposta certa: <span lang="en" className="font-semibold">{respostaEsperada}</span>
              </p>
            )}
          </div>

          {veredito === null ? (
            <button
              type="button"
              onClick={conferir}
              disabled={!podeConferir}
              className="rounded-full bg-laranja-500 px-8 py-3 font-semibold text-white transition hover:bg-laranja-600 disabled:cursor-not-allowed disabled:opacity-40"
            >
              {exercicio.tipo === "vocabulario"
                ? "Entendi"
                : exercicio.tipo === "falar" && (!podeGravar || erroFala !== null)
                  ? "Já falei"
                  : "Conferir"}
            </button>
          ) : (
            <button
              type="button"
              onClick={avancar}
              disabled={finalizando}
              className="rounded-full bg-mesa-800 px-8 py-3 font-semibold text-white transition hover:bg-mesa-900 disabled:opacity-60"
            >
              {finalizando ? "Salvando..." : ultimo ? "Terminar lição" : "Continuar"}
            </button>
          )}
        </div>
      </footer>
    </div>
  );
}
