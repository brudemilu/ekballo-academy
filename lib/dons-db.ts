// =============================================================
// EKBALLO ACADEMY · Teste de Dons — acesso a dados (só servidor)
//
// Por que um módulo à parte e não mais funções em lib/db.ts: as
// tabelas dons_* não têm política de RLS (ver migration 379), então
// TUDO aqui usa a chave de serviço. Juntar isso ao db.ts misturaria
// funções que respeitam a sessão com funções que ignoram — e o
// próximo a mexer não saberia qual é qual. Aqui, todas ignoram; quem
// chama é que confere se é o master (rotas /admin/dons e
// /api/admin/dons) ou se o token do link é válido (/dons/[token]).
//
// Mesmo padrão do resto do app: cada função tem o ramo mock (estado
// em memória, dados fictícios) e o ramo Supabase.
// =============================================================

import { randomBytes } from "node:crypto";
import {
  arrumarNome,
  lerIdade,
  mesmaPessoa,
  montarResultado,
  type Pontuacao,
  pontuar,
  type ResultadoDons,
  TOTAL_PERGUNTAS,
  VERSAO_TESTE,
  validarRespostas,
} from "@/lib/dons";
import { isMockMode } from "@/lib/mock-data";
import { createServiceClient } from "@/lib/supabase/service";
import { normalizeTelefoneBR } from "@/lib/telefone";

export type PessoaDons = {
  id: string;
  nome: string;
  telefone: string | null;
  criado_em: string;
};

export type ConviteDons = {
  id: string;
  token: string;
  pessoa_id: string | null;
  titulo: string | null;
  ativo: boolean;
  usos: number;
  criado_em: string;
};

export type RespostaDons = {
  id: string;
  pessoa_id: string;
  convite_id: string | null;
  respondido_em: string;
  nome_informado: string;
  idade: number | null;
  telefone_informado: string | null;
  versao: string;
  respostas: number[];
  pontuacao: Pontuacao;
  resultado_exibido: ResultadoDons;
  pontuacao_planilha: Pontuacao | null;
  origem: "link" | "planilha";
  vista_em: string | null;
};

export type AnotacaoDons = {
  id: string;
  pessoa_id: string;
  texto: string;
  criado_em: string;
};

export type PessoaResumo = PessoaDons & {
  total_testes: number;
  novas: number;
  ultima: Pick<
    RespostaDons,
    "id" | "respondido_em" | "idade" | "pontuacao" | "resultado_exibido" | "origem"
  > | null;
};

// -------------------------------------------------------------
// MOCK — pessoas fictícias, só para desenvolver e para o E2E.
// -------------------------------------------------------------

function respostasFicticias(semente: number): number[] {
  return Array.from({ length: TOTAL_PERGUNTAS }, (_, i) => (i * 7 + semente * 3) % 5);
}

function respostaFicticia(
  id: string,
  pessoa: PessoaDons,
  quando: string,
  semente: number,
  vista: boolean,
): RespostaDons {
  const respostas = respostasFicticias(semente);
  const pontuacao = pontuar(respostas);
  return {
    id,
    pessoa_id: pessoa.id,
    convite_id: null,
    respondido_em: quando,
    nome_informado: pessoa.nome,
    idade: 30,
    telefone_informado: pessoa.telefone,
    versao: VERSAO_TESTE,
    respostas,
    pontuacao,
    resultado_exibido: montarResultado(pontuacao),
    pontuacao_planilha: null,
    origem: "link",
    vista_em: vista ? quando : null,
  };
}

const MOCK_P1: PessoaDons = {
  id: "00000000-0000-4000-8000-0000000d0001",
  nome: "Maria Exemplo",
  telefone: "5531900000001",
  criado_em: "2025-03-05T10:00:00Z",
};
const MOCK_P2: PessoaDons = {
  id: "00000000-0000-4000-8000-0000000d0002",
  nome: "João Fictício",
  telefone: null,
  criado_em: "2026-04-02T10:00:00Z",
};

const MOCK = {
  pessoas: [MOCK_P1, MOCK_P2] as PessoaDons[],
  respostas: [
    respostaFicticia(
      "00000000-0000-4000-8000-0000000d0101",
      MOCK_P1,
      "2025-03-05T10:00:00Z",
      1,
      true,
    ),
    respostaFicticia(
      "00000000-0000-4000-8000-0000000d0102",
      MOCK_P1,
      "2026-04-02T10:00:00Z",
      2,
      false,
    ),
    respostaFicticia(
      "00000000-0000-4000-8000-0000000d0103",
      MOCK_P2,
      "2026-04-02T12:00:00Z",
      3,
      true,
    ),
  ] as RespostaDons[],
  convites: [
    {
      id: "00000000-0000-4000-8000-0000000d0201",
      token: "demo-aberto",
      pessoa_id: null,
      titulo: "Link de demonstração",
      ativo: true,
      usos: 0,
      criado_em: "2026-11-01T10:00:00Z",
    },
  ] as ConviteDons[],
  anotacoes: [
    {
      id: "00000000-0000-4000-8000-0000000d0301",
      pessoa_id: MOCK_P1.id,
      texto:
        "Conversamos sobre o resultado. Combinamos acompanhar no grupo de novos convertidos.",
      criado_em: "2025-03-12T20:00:00Z",
    },
  ] as AnotacaoDons[],
};

function idMock(): string {
  return crypto.randomUUID();
}

// -------------------------------------------------------------

function db() {
  return createServiceClient();
}

function novoToken(): string {
  // 16 bytes = 128 bits: impossível de adivinhar varrendo endereços.
  return randomBytes(16).toString("base64url");
}

function resumir(p: PessoaDons, respostas: RespostaDons[]): PessoaResumo {
  const minhas = respostas
    .filter((r) => r.pessoa_id === p.id)
    .sort((a, b) => b.respondido_em.localeCompare(a.respondido_em));
  const u = minhas[0];
  return {
    ...p,
    total_testes: minhas.length,
    novas: minhas.filter((r) => !r.vista_em).length,
    ultima: u
      ? {
          id: u.id,
          respondido_em: u.respondido_em,
          idade: u.idade,
          pontuacao: u.pontuacao,
          resultado_exibido: u.resultado_exibido,
          origem: u.origem,
        }
      : null,
  };
}

/** Todas as pessoas, com o último teste — a mais recente primeiro. */
export async function listPessoasDons(): Promise<PessoaResumo[]> {
  let pessoas: PessoaDons[];
  let respostas: RespostaDons[];
  if (isMockMode()) {
    pessoas = MOCK.pessoas;
    respostas = MOCK.respostas;
  } else {
    const s = db();
    const [p, r] = await Promise.all([
      s.from("dons_pessoas").select("id, nome, telefone, criado_em"),
      // Sem o array de 160 notas: a lista não precisa dele.
      s
        .from("dons_respostas")
        .select(
          "id, pessoa_id, respondido_em, idade, pontuacao, resultado_exibido, origem, vista_em",
        ),
    ]);
    if (p.error) throw new Error(p.error.message);
    if (r.error) throw new Error(r.error.message);
    pessoas = (p.data ?? []) as PessoaDons[];
    respostas = (r.data ?? []) as RespostaDons[];
  }
  return pessoas
    .map((p) => resumir(p, respostas))
    .sort((a, b) =>
      (b.ultima?.respondido_em ?? b.criado_em).localeCompare(
        a.ultima?.respondido_em ?? a.criado_em,
      ),
    );
}

export type FichaDons = {
  pessoa: PessoaDons;
  respostas: RespostaDons[];
  anotacoes: AnotacaoDons[];
  convites: ConviteDons[];
};

export async function getFichaDons(pessoaId: string): Promise<FichaDons | null> {
  if (isMockMode()) {
    const pessoa = MOCK.pessoas.find((p) => p.id === pessoaId);
    if (!pessoa) return null;
    return {
      pessoa,
      respostas: MOCK.respostas
        .filter((r) => r.pessoa_id === pessoaId)
        .sort((a, b) => b.respondido_em.localeCompare(a.respondido_em)),
      anotacoes: MOCK.anotacoes
        .filter((a) => a.pessoa_id === pessoaId)
        .sort((a, b) => b.criado_em.localeCompare(a.criado_em)),
      convites: MOCK.convites.filter((c) => c.pessoa_id === pessoaId),
    };
  }
  if (!/^[0-9a-f-]{36}$/i.test(pessoaId)) return null;
  const s = db();
  const { data: pessoa } = await s
    .from("dons_pessoas")
    .select("id, nome, telefone, criado_em")
    .eq("id", pessoaId)
    .maybeSingle();
  if (!pessoa) return null;
  const [r, a, c] = await Promise.all([
    s
      .from("dons_respostas")
      .select("*")
      .eq("pessoa_id", pessoaId)
      .order("respondido_em", { ascending: false }),
    s
      .from("dons_anotacoes")
      .select("*")
      .eq("pessoa_id", pessoaId)
      .order("criado_em", { ascending: false }),
    s
      .from("dons_convites")
      .select("*")
      .eq("pessoa_id", pessoaId)
      .order("criado_em", { ascending: false }),
  ]);
  return {
    pessoa: pessoa as PessoaDons,
    respostas: (r.data ?? []) as RespostaDons[],
    anotacoes: (a.data ?? []) as AnotacaoDons[],
    convites: (c.data ?? []) as ConviteDons[],
  };
}

/** Abrir a ficha tira o selo de "nova" das respostas. */
export async function marcarRespostasVistas(pessoaId: string): Promise<void> {
  const agora = new Date().toISOString();
  if (isMockMode()) {
    for (const r of MOCK.respostas)
      if (r.pessoa_id === pessoaId && !r.vista_em) r.vista_em = agora;
    return;
  }
  await db()
    .from("dons_respostas")
    .update({ vista_em: agora })
    .eq("pessoa_id", pessoaId)
    .is("vista_em", null);
}

/** Links abertos (de grupo). Os pessoais aparecem na ficha de cada um. */
export async function listConvitesAbertos(): Promise<ConviteDons[]> {
  if (isMockMode()) return MOCK.convites.filter((c) => !c.pessoa_id);
  const { data, error } = await db()
    .from("dons_convites")
    .select("*")
    .is("pessoa_id", null)
    .order("criado_em", { ascending: false });
  if (error) throw new Error(error.message);
  return (data ?? []) as ConviteDons[];
}

export type NovoConvite =
  | { tipo: "pessoal"; pessoaId: string }
  | { tipo: "pessoal-novo"; nome: string; telefone: string | null }
  | { tipo: "aberto"; titulo: string };

export async function criarConvite(
  pedido: NovoConvite,
): Promise<{ convite: ConviteDons; pessoaId: string | null }> {
  let pessoaId: string | null = null;
  if (pedido.tipo === "pessoal") pessoaId = pedido.pessoaId;
  if (pedido.tipo === "pessoal-novo") {
    pessoaId = await criarPessoa(pedido.nome, pedido.telefone);
  }
  const linha = {
    token: novoToken(),
    pessoa_id: pessoaId,
    titulo: pedido.tipo === "aberto" ? pedido.titulo.trim() || null : null,
  };
  if (isMockMode()) {
    const convite: ConviteDons = {
      id: idMock(),
      ...linha,
      ativo: true,
      usos: 0,
      criado_em: new Date().toISOString(),
    };
    MOCK.convites.unshift(convite);
    return { convite, pessoaId };
  }
  const { data, error } = await db()
    .from("dons_convites")
    .insert(linha)
    .select("*")
    .single();
  if (error) throw new Error(error.message);
  return { convite: data as ConviteDons, pessoaId };
}

export async function definirConviteAtivo(id: string, ativo: boolean): Promise<void> {
  if (isMockMode()) {
    const c = MOCK.convites.find((x) => x.id === id);
    if (c) c.ativo = ativo;
    return;
  }
  const { error } = await db().from("dons_convites").update({ ativo }).eq("id", id);
  if (error) throw new Error(error.message);
}

async function criarPessoa(nome: string, telefone: string | null): Promise<string> {
  const linha = { nome: arrumarNome(nome), telefone };
  if (isMockMode()) {
    const p: PessoaDons = {
      id: idMock(),
      ...linha,
      criado_em: new Date().toISOString(),
    };
    MOCK.pessoas.push(p);
    return p.id;
  }
  const { data, error } = await db()
    .from("dons_pessoas")
    .insert(linha)
    .select("id")
    .single();
  if (error) throw new Error(error.message);
  return data.id as string;
}

export async function atualizarPessoa(
  id: string,
  dados: { nome: string; telefone: string | null },
): Promise<void> {
  const linha = { nome: arrumarNome(dados.nome), telefone: dados.telefone };
  if (isMockMode()) {
    const p = MOCK.pessoas.find((x) => x.id === id);
    if (p) Object.assign(p, linha);
    return;
  }
  const { error } = await db()
    .from("dons_pessoas")
    .update({ ...linha, atualizado_em: new Date().toISOString() })
    .eq("id", id);
  if (error) throw new Error(error.message);
}

/** Apaga a pessoa com todo o histórico (testes, anotações, links). */
export async function apagarPessoa(id: string): Promise<void> {
  if (isMockMode()) {
    MOCK.pessoas = MOCK.pessoas.filter((p) => p.id !== id);
    MOCK.respostas = MOCK.respostas.filter((r) => r.pessoa_id !== id);
    MOCK.anotacoes = MOCK.anotacoes.filter((a) => a.pessoa_id !== id);
    MOCK.convites = MOCK.convites.filter((c) => c.pessoa_id !== id);
    return;
  }
  const { error } = await db().from("dons_pessoas").delete().eq("id", id);
  if (error) throw new Error(error.message);
}

export async function apagarRespostaDons(id: string): Promise<void> {
  if (isMockMode()) {
    MOCK.respostas = MOCK.respostas.filter((r) => r.id !== id);
    return;
  }
  const { error } = await db().from("dons_respostas").delete().eq("id", id);
  if (error) throw new Error(error.message);
}

export async function criarAnotacaoDons(
  pessoaId: string,
  texto: string,
): Promise<AnotacaoDons> {
  const linha = { pessoa_id: pessoaId, texto: texto.trim() };
  if (isMockMode()) {
    const a: AnotacaoDons = {
      id: idMock(),
      ...linha,
      criado_em: new Date().toISOString(),
    };
    MOCK.anotacoes.unshift(a);
    return a;
  }
  const { data, error } = await db()
    .from("dons_anotacoes")
    .insert(linha)
    .select("*")
    .single();
  if (error) throw new Error(error.message);
  return data as AnotacaoDons;
}

export async function apagarAnotacaoDons(id: string): Promise<void> {
  if (isMockMode()) {
    MOCK.anotacoes = MOCK.anotacoes.filter((a) => a.id !== id);
    return;
  }
  const { error } = await db().from("dons_anotacoes").delete().eq("id", id);
  if (error) throw new Error(error.message);
}

// -------------------------------------------------------------
// LADO PÚBLICO — quem abre o link, sem conta.
// -------------------------------------------------------------

export type SituacaoLink =
  | { estado: "invalido" }
  | { estado: "inativo" }
  | {
      estado: "aberto";
      convite: ConviteDons;
      /** Link pessoal: nome já conhecido, a pessoa não precisa digitar. */
      pessoa: Pick<PessoaDons, "nome" | "telefone"> | null;
    }
  | {
      estado: "respondido";
      respondidoEm: string;
      resultado: ResultadoDons;
      nome: string;
    };

export async function situacaoDoLink(token: string): Promise<SituacaoLink> {
  if (!/^[A-Za-z0-9_-]{6,64}$/.test(token)) return { estado: "invalido" };

  let convite: ConviteDons | undefined;
  let pessoa: PessoaDons | undefined;
  let jaRespondida: RespostaDons | undefined;

  if (isMockMode()) {
    convite = MOCK.convites.find((c) => c.token === token);
    if (convite?.pessoa_id) {
      pessoa = MOCK.pessoas.find((p) => p.id === convite?.pessoa_id);
      jaRespondida = MOCK.respostas.find((r) => r.convite_id === convite?.id);
    }
  } else {
    const s = db();
    const { data } = await s
      .from("dons_convites")
      .select("*")
      .eq("token", token)
      .maybeSingle();
    convite = (data as ConviteDons | null) ?? undefined;
    if (convite?.pessoa_id) {
      const [p, r] = await Promise.all([
        s
          .from("dons_pessoas")
          .select("id, nome, telefone, criado_em")
          .eq("id", convite.pessoa_id)
          .maybeSingle(),
        s
          .from("dons_respostas")
          .select("respondido_em, resultado_exibido, nome_informado")
          .eq("convite_id", convite.id)
          .order("respondido_em", { ascending: false })
          .limit(1)
          .maybeSingle(),
      ]);
      pessoa = (p.data as PessoaDons | null) ?? undefined;
      jaRespondida = (r.data as RespostaDons | null) ?? undefined;
    }
  }

  if (!convite) return { estado: "invalido" };
  // Link pessoal vale uma resposta: quem volta nele revê o que apareceu.
  if (jaRespondida) {
    return {
      estado: "respondido",
      respondidoEm: jaRespondida.respondido_em,
      resultado: jaRespondida.resultado_exibido,
      nome: jaRespondida.nome_informado,
    };
  }
  if (!convite.ativo) return { estado: "inativo" };
  return {
    estado: "aberto",
    convite,
    pessoa: pessoa ? { nome: pessoa.nome, telefone: pessoa.telefone } : null,
  };
}

export type EnvioPublico = {
  nome: unknown;
  idade: unknown;
  telefone: unknown;
  respostas: unknown;
};

export type ResultadoEnvio =
  | { ok: true; resultado: ResultadoDons }
  | { ok: false; status: number; erro: string };

/**
 * Grava a resposta de quem abriu o link. A pontuação é SEMPRE refeita
 * aqui, a partir das 160 notas — nada calculado no navegador é aceito.
 */
export async function registrarRespostaPublica(
  token: string,
  envio: EnvioPublico,
): Promise<ResultadoEnvio> {
  const situacao = await situacaoDoLink(token);
  if (situacao.estado === "invalido")
    return { ok: false, status: 404, erro: "Este link não existe." };
  if (situacao.estado === "inativo")
    return { ok: false, status: 410, erro: "Este link foi encerrado." };
  if (situacao.estado === "respondido")
    return {
      ok: false,
      status: 409,
      erro: "Este teste já foi respondido por este link.",
    };

  const respostas = validarRespostas(envio.respostas);
  if (!respostas) return { ok: false, status: 400, erro: "Faltam respostas no teste." };

  const convite = situacao.convite;
  const nomeDigitado =
    typeof envio.nome === "string" ? envio.nome.trim().slice(0, 120) : "";
  const nome = arrumarNome(nomeDigitado || situacao.pessoa?.nome || "");
  if (nome.length < 2) return { ok: false, status: 400, erro: "Informe o seu nome." };
  const telefoneBruto = typeof envio.telefone === "string" ? envio.telefone : "";
  const telefone = telefoneBruto.trim() ? normalizeTelefoneBR(telefoneBruto) : null;
  if (telefoneBruto.trim() && !telefone)
    return { ok: false, status: 400, erro: "Confira o número do WhatsApp (com DDD)." };
  const idade = lerIdade(envio.idade);

  // De quem é esta resposta?
  let pessoaId = convite.pessoa_id;
  if (!pessoaId) {
    const candidatos = telefone ? await pessoasComTelefone(telefone) : [];
    pessoaId =
      candidatos.find((p) => mesmaPessoa(p, { nome, telefone }))?.id ??
      (await criarPessoa(nome, telefone));
  } else if (telefone && !situacao.pessoa?.telefone) {
    // Link pessoal criado sem telefone: aproveita o que a pessoa informou.
    await atualizarPessoa(pessoaId, { nome: situacao.pessoa?.nome ?? nome, telefone });
  }

  const pontuacao = pontuar(respostas);
  const resultado = montarResultado(pontuacao);
  const linha = {
    pessoa_id: pessoaId,
    convite_id: convite.id,
    nome_informado: nome,
    idade,
    telefone_informado: telefone,
    versao: VERSAO_TESTE,
    respostas,
    pontuacao,
    resultado_exibido: resultado,
    origem: "link" as const,
  };

  if (isMockMode()) {
    MOCK.respostas.push({
      id: idMock(),
      ...linha,
      respondido_em: new Date().toISOString(),
      pontuacao_planilha: null,
      vista_em: null,
    });
    convite.usos += 1;
    return { ok: true, resultado };
  }

  const s = db();
  const { error } = await s.from("dons_respostas").insert(linha);
  if (error)
    return { ok: false, status: 500, erro: "Não foi possível salvar. Tente de novo." };
  await s
    .from("dons_convites")
    .update({ usos: convite.usos + 1 })
    .eq("id", convite.id);
  return { ok: true, resultado };
}

async function pessoasComTelefone(telefone: string): Promise<PessoaDons[]> {
  if (isMockMode()) return MOCK.pessoas.filter((p) => p.telefone === telefone);
  const { data } = await db()
    .from("dons_pessoas")
    .select("id, nome, telefone, criado_em")
    .eq("telefone", telefone);
  return (data ?? []) as PessoaDons[];
}
