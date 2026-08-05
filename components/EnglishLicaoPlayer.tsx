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
// Voz é 100% do navegador — speechSynthesis pra ouvir e
// SpeechRecognition pra falar. Sem custo de servidor e sem
// arquivo de áudio; onde não houver suporte, o exercício de fala
// vira honra ("Já falei") em vez de sumir.
// =============================================================

type Props = {
  modulo: EnglishModulo;
  licao: EnglishLicao;
  exercicios: EnglishExercicio[];
  proximaSlug: string | null;
};

type Veredito = "certo" | "errado" | null;

// Exercícios de vocabulário ensinam, não avaliam — ficam fora da nota.
const VALE_NOTA: Record<string, boolean> = {
  vocabulario: false, escolha: true, traducao: true, ouvir: true, montar: true, falar: true,
};

// ---------- voz do navegador ----------

type MotorFala = {
  lang: string;
  interimResults: boolean;
  maxAlternatives: number;
  continuous: boolean;
  start: () => void;
  stop: () => void;
  onresult: ((e: { results: ArrayLike<ArrayLike<{ transcript: string }>> }) => void) | null;
  onerror: (() => void) | null;
  onend: (() => void) | null;
};

type JanelaComFala = Window & {
  SpeechRecognition?: new () => MotorFala;
  webkitSpeechRecognition?: new () => MotorFala;
};

function pronunciar(texto: string) {
  if (typeof window === "undefined" || !("speechSynthesis" in window)) return;
  window.speechSynthesis.cancel();
  const fala = new SpeechSynthesisUtterance(texto);
  fala.lang = "en-US";
  fala.rate = 0.85; // devagar: é aula, não locução
  window.speechSynthesis.speak(fala);
}

export function EnglishLicaoPlayer({ modulo, licao, exercicios, proximaSlug }: Props) {
  const router = useRouter();

  const [indice, setIndice] = useState(0);
  const [veredito, setVeredito] = useState<Veredito>(null);
  const [digitado, setDigitado] = useState("");
  const [escolhida, setEscolhida] = useState<string | null>(null);
  const [montadas, setMontadas] = useState<string[]>([]);
  const [revelado, setRevelado] = useState(false);
  const [ouvindo, setOuvindo] = useState(false);
  const [transcricao, setTranscricao] = useState("");
  const [acertos, setAcertos] = useState(0);
  const [avaliados, setAvaliados] = useState(0);
  const [finalizando, setFinalizando] = useState(false);
  const [resultado, setResultado] = useState<{
    streak: { dias_seguidos: number; recorde: number; total_licoes: number };
    novasConquistas: string[];
  } | null>(null);
  const [erroEnvio, setErroEnvio] = useState<string | null>(null);
  const [temVoz, setTemVoz] = useState(true);

  const inputRef = useRef<HTMLInputElement>(null);
  const motorRef = useRef<MotorFala | null>(null);

  const exercicio = exercicios[indice];
  const ultimo = indice >= exercicios.length - 1;
  const progresso = exercicios.length ? Math.round((indice / exercicios.length) * 100) : 0;

  useEffect(() => {
    const janela = window as JanelaComFala;
    setTemVoz(Boolean(janela.SpeechRecognition || janela.webkitSpeechRecognition));
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
    if (exercicio?.tipo === "ouvir" && exercicio.audio_texto) pronunciar(exercicio.audio_texto);
    if (exercicio?.tipo === "traducao" || exercicio?.tipo === "ouvir") {
      inputRef.current?.focus();
    }
  }, [exercicio]);

  // Para o microfone e a voz ao sair da tela.
  useEffect(() => () => {
    motorRef.current?.stop();
    if (typeof window !== "undefined" && "speechSynthesis" in window) window.speechSynthesis.cancel();
  }, []);

  const podeConferir = (() => {
    if (!exercicio) return false;
    switch (exercicio.tipo) {
      case "vocabulario": return true;
      case "escolha": return escolhida !== null;
      case "traducao":
      case "ouvir": return digitado.trim().length > 0;
      case "montar": return montadas.length > 0;
      case "falar": return transcricao.trim().length > 0 || !temVoz;
      default: return false;
    }
  })();

  function conferir() {
    if (!exercicio || veredito) return;

    let certo = true;
    if (exercicio.tipo === "escolha") {
      certo = exercicio.alternativas.some((a) => a.correta && a.texto === escolhida);
    } else if (exercicio.tipo === "traducao" || exercicio.tipo === "ouvir") {
      certo = respostaCorreta(digitado, exercicio.resposta, exercicio.aceitas);
    } else if (exercicio.tipo === "montar") {
      certo = respostaCorreta(montadas.join(" "), exercicio.resposta, exercicio.aceitas);
    } else if (exercicio.tipo === "falar") {
      // Sem microfone, vale a palavra do aluno. Com microfone, aceita a frase
      // solta dentro do que foi reconhecido (o motor costuma acrescentar coisa).
      if (!temVoz) {
        certo = true;
      } else {
        const dito = normalizarResposta(transcricao);
        const alvo = normalizarResposta(exercicio.resposta || "");
        certo = respostaCorreta(transcricao, exercicio.resposta, exercicio.aceitas)
          || (alvo.length > 0 && dito.includes(alvo));
      }
    }

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
      const res = await fetch("/api/english/concluir", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ licaoId: licao.id, acertos: totalAcertos, total: totalAvaliado }),
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
  }, [licao.id, router]);

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
  }

  function escutar() {
    const janela = window as JanelaComFala;
    const Motor = janela.SpeechRecognition || janela.webkitSpeechRecognition;
    if (!Motor) { setTemVoz(false); return; }

    const motor = new Motor();
    motorRef.current = motor;
    motor.lang = "en-US";
    motor.interimResults = false;
    motor.maxAlternatives = 1;
    motor.continuous = false;
    motor.onresult = (e) => {
      const texto = e.results?.[0]?.[0]?.transcript || "";
      setTranscricao(texto);
    };
    motor.onerror = () => setOuvindo(false);
    motor.onend = () => setOuvindo(false);
    setTranscricao("");
    setOuvindo(true);
    motor.start();
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
            Você concluiu <strong>{licao.titulo}</strong>.
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
    exercicio.tipo === "escolha"
      ? exercicio.alternativas.find((a) => a.correta)?.texto || ""
      : exercicio.resposta || "";

  return (
    <div className="flex min-h-screen flex-col bg-bege-50">
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
          <div className="h-2.5 flex-1 overflow-hidden rounded-full bg-mesa-200">
            <div
              className="h-full rounded-full bg-laranja-500 transition-all duration-300"
              style={{ width: `${progresso}%` }}
            />
          </div>
          <span className="text-sm font-semibold tabular-nums text-mesa-500">
            {indice + 1}/{exercicios.length}
          </span>
        </div>
      </header>

      <main className="mx-auto w-full max-w-3xl flex-1 px-4 py-8 sm:px-6 sm:py-12">
        <p className="text-xs font-semibold uppercase tracking-[0.2em] text-laranja-600">
          Módulo {modulo.numero} · Lição {licao.numero}
        </p>
        <h1 className="mt-2 font-serif text-2xl font-semibold text-mesa-900 sm:text-3xl">
          {exercicio.enunciado}
        </h1>

        <div className="mt-8">
          {/* ---- vocabulário ---- */}
          {exercicio.tipo === "vocabulario" && (
            <div className="rounded-3xl border border-mesa-200 bg-white p-8 text-center shadow-sm shadow-mesa-800/5">
              <p lang="en" className="font-serif text-4xl font-semibold text-mesa-900 sm:text-5xl">
                {exercicio.pergunta}
              </p>
              {exercicio.dica && (
                <p className="mt-3 text-sm italic text-mesa-500">som aproximado: {exercicio.dica}</p>
              )}
              <p className="mt-5 text-lg text-mesa-600">{exercicio.pergunta_pt}</p>
              <button
                type="button"
                onClick={() => pronunciar(exercicio.audio_texto || exercicio.pergunta || "")}
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
                        ? "border-oliveira-600 bg-oliveira-100 text-mesa-900"
                        : mostrarErrada
                          ? "border-laranja-500 bg-laranja-50 text-laranja-800"
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

          {/* ---- tradução / ouvir ---- */}
          {(exercicio.tipo === "traducao" || exercicio.tipo === "ouvir") && (
            <div className="rounded-3xl border border-mesa-200 bg-white p-6 shadow-sm shadow-mesa-800/5 sm:p-8">
              {exercicio.tipo === "traducao" ? (
                <p className="text-center font-serif text-3xl font-semibold text-mesa-900">
                  {exercicio.pergunta_pt}
                </p>
              ) : (
                <div className="text-center">
                  <button
                    type="button"
                    onClick={() => pronunciar(exercicio.audio_texto || exercicio.resposta || "")}
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
            <div className="rounded-3xl border border-mesa-200 bg-white p-8 text-center shadow-sm shadow-mesa-800/5">
              <p lang="en" className="font-serif text-3xl font-semibold text-mesa-900 sm:text-4xl">
                {exercicio.pergunta}
              </p>
              <p className="mt-3 text-mesa-600">{exercicio.pergunta_pt}</p>

              <button
                type="button"
                onClick={() => pronunciar(exercicio.audio_texto || exercicio.resposta || "")}
                className="mt-5 rounded-full border border-mesa-300 px-5 py-2 text-sm font-semibold text-mesa-700 transition hover:border-laranja-400"
              >
                🔊 Ouvir o modelo
              </button>

              {temVoz ? (
                <>
                  <button
                    type="button"
                    disabled={veredito !== null || ouvindo}
                    onClick={escutar}
                    className={`mt-6 block w-full rounded-2xl px-6 py-5 text-lg font-semibold transition ${
                      ouvindo
                        ? "animate-pulse-soft bg-laranja-600 text-white"
                        : "bg-laranja-500 text-white hover:bg-laranja-600"
                    } disabled:opacity-60`}
                  >
                    {ouvindo ? "🎙️ Ouvindo... fale agora" : "🎙️ Tocar e falar"}
                  </button>
                  {transcricao && (
                    <p className="mt-4 text-mesa-700">
                      Entendi: <span lang="en" className="font-semibold">{transcricao}</span>
                    </p>
                  )}
                </>
              ) : (
                <div className="mt-6">
                  <p className="text-sm text-mesa-500">
                    Este navegador não escuta o microfone. Fale a frase em voz alta e siga em frente.
                  </p>
                  <p className="mt-2 text-xs text-mesa-400">
                    Para o reconhecimento de fala, use o Chrome ou o Edge.
                  </p>
                </div>
              )}
            </div>
          )}
        </div>

        {/* versículo da lição, no primeiro exercício */}
        {indice === 0 && licao.versiculo_en && (
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
            ? "border-oliveira-300 bg-oliveira-100"
            : veredito === "errado"
              ? "border-laranja-300 bg-laranja-50"
              : "border-mesa-200 bg-white"
        }`}
      >
        <div className="mx-auto flex max-w-3xl flex-col gap-4 px-4 py-5 sm:flex-row sm:items-center sm:justify-between sm:px-6">
          <div className="min-h-[1.5rem] text-sm">
            {veredito === "certo" && (
              <p className="font-semibold text-mesa-900">
                {exercicio.tipo === "vocabulario" ? "Boa — segue o ritmo." : "Correto!"}
              </p>
            )}
            {veredito === "errado" && (
              <p className="text-laranja-800">
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
                : exercicio.tipo === "falar" && !temVoz
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
