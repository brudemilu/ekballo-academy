import { NextResponse } from "next/server";
import { getCurrentSession } from "@/lib/db";
import {
  apagarAnotacaoDons,
  apagarPessoa,
  apagarRespostaDons,
  atualizarPessoa,
  criarAnotacaoDons,
  criarConvite,
  definirConviteAtivo,
} from "@/lib/dons-db";
import { ehMaster } from "@/lib/permissoes";
import { normalizeTelefoneBR } from "@/lib/telefone";

// Painel do Teste de Dons (issue #289). Exclusivo do master: as tabelas
// dons_* não têm RLS de leitura e tudo aqui roda com a chave de serviço,
// então esta checagem é a ÚNICA porta.
//
// Uma rota com `acao` em vez de cinco arquivos: são ações curtas sobre o
// mesmo punhado de tabelas, todas com a mesma guarda.

const UUID = /^[0-9a-f-]{36}$/i;

function texto(v: unknown, max: number): string {
  return typeof v === "string" ? v.trim().slice(0, max) : "";
}

function erro(msg: string, status = 400) {
  return NextResponse.json({ ok: false, erro: msg }, { status });
}

/** "" → null; inválido → undefined (para o chamador recusar). */
function telefoneOpcional(v: unknown): string | null | undefined {
  const t = texto(v, 40);
  if (!t) return null;
  return normalizeTelefoneBR(t) ?? undefined;
}

export async function POST(req: Request) {
  const session = await getCurrentSession();
  if (!session) return erro("não autenticado", 401);
  if (!ehMaster(session.profile?.papel, session.profile?.is_admin))
    return erro("apenas o master", 403);

  let body: Record<string, unknown>;
  try {
    body = await req.json();
  } catch {
    return erro("corpo inválido");
  }
  const id = texto(body.id, 40);

  try {
    switch (body.acao) {
      case "gerar-link": {
        if (body.tipo === "aberto") {
          const r = await criarConvite({
            tipo: "aberto",
            titulo: texto(body.titulo, 120),
          });
          return NextResponse.json({ ok: true, ...r });
        }
        if (body.tipo === "pessoal" && UUID.test(texto(body.pessoaId, 40))) {
          const r = await criarConvite({
            tipo: "pessoal",
            pessoaId: texto(body.pessoaId, 40),
          });
          return NextResponse.json({ ok: true, ...r });
        }
        if (body.tipo === "pessoal-novo") {
          const nome = texto(body.nome, 120);
          if (nome.length < 2) return erro("Informe o nome da pessoa.");
          const telefone = telefoneOpcional(body.telefone);
          if (telefone === undefined) return erro("Confira o WhatsApp (com DDD).");
          const r = await criarConvite({ tipo: "pessoal-novo", nome, telefone });
          return NextResponse.json({ ok: true, ...r });
        }
        return erro("tipo de link inválido");
      }
      case "ativar-link":
        if (!UUID.test(id)) return erro("link inválido");
        await definirConviteAtivo(id, body.ativo === true);
        return NextResponse.json({ ok: true });
      case "anotar": {
        const pessoaId = texto(body.pessoaId, 40);
        const t = texto(body.texto, 5000);
        if (!UUID.test(pessoaId) || !t) return erro("Escreva a anotação.");
        const anotacao = await criarAnotacaoDons(pessoaId, t);
        return NextResponse.json({ ok: true, anotacao });
      }
      case "apagar-anotacao":
        if (!UUID.test(id)) return erro("anotação inválida");
        await apagarAnotacaoDons(id);
        return NextResponse.json({ ok: true });
      case "editar-pessoa": {
        const nome = texto(body.nome, 120);
        if (!UUID.test(id) || nome.length < 2) return erro("Informe o nome.");
        const telefone = telefoneOpcional(body.telefone);
        if (telefone === undefined) return erro("Confira o WhatsApp (com DDD).");
        await atualizarPessoa(id, { nome, telefone });
        return NextResponse.json({ ok: true });
      }
      case "apagar-pessoa":
        if (!UUID.test(id)) return erro("pessoa inválida");
        await apagarPessoa(id);
        return NextResponse.json({ ok: true });
      case "apagar-teste":
        if (!UUID.test(id)) return erro("teste inválido");
        await apagarRespostaDons(id);
        return NextResponse.json({ ok: true });
      default:
        return erro("ação desconhecida");
    }
  } catch (e) {
    console.error("[dons] admin:", e);
    return erro("Não foi possível concluir. Tente de novo.", 500);
  }
}
