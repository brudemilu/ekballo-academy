# Rascunho — Curso "Seja um Líder de Verdade" (texto integral)

Conteúdo limpo (OCR corrigido, ortografia modernizada) do livro de John Haggai,
*Seja um Líder de Verdade* (Editora Betânia, 1990), para **substituir** o conteúdo
das aulas do curso `seja-um-lider-de-verdade` (migração 053, que era paráfrase).

- Fonte: PDF integral anexado em 28/05/2026.
- Decisões do Bruno: substituir o 053; texto **integral**; **só leitura livre**;
  **sem Prefácio e sem Agradecimentos**; aula 0 (Apresentação) mantida intacta.
- A página de aula renderiza `conteudo` como TEXTO PURO (`split("\n\n")` +
  `whitespace-pre-wrap`), sem markdown — por isso a migração converte os `.md`
  para texto puro (subtítulos em caixa, sem `##`/`**`/`>`).

## Status — TODOS os 13 capítulos prontos ✅

| Ordem | Aula | Arquivo |
|---|---|---|
| 1 | 1. Um Chamado à Liderança | `02-cap01-chamado.md` |
| 2 | 2. O Princípio da Visão | `03-cap02-visao.md` |
| 3 | 3. O Princípio do Estabelecimento de Metas | `04-cap03-metas.md` |
| 4 | 4. O Princípio do Amor | `05-cap04-amor.md` |
| 5 | 5. O Princípio da Humildade | `06-cap05-humildade.md` |
| 6 | 6. O Princípio do Autocontrole | `07-cap06-autocontrole.md` |
| 7 | 7. O Princípio da Comunicação | `08-cap07-comunicacao.md` |
| 8 | 8. O Princípio do Investimento | `09-cap08-investimento.md` |
| 9 | 9. O Princípio da Oportunidade | `10-cap09-oportunidade.md` |
| 10 | 10. O Princípio da Energia | `11-cap10-energia.md` |
| 11 | 11. O Princípio do Poder da Persistência | `12-cap11-persistencia.md` |
| 12 | 12. O Princípio da Autoridade | `13-cap12-autoridade.md` |
| 13 | 13. O Princípio da Conscientização | `14-cap13-conscientizacao.md` |

## Migração

- Gerada por `scripts/gerar-054.mjs` →
  `supabase/migrations/054_seja_um_lider_texto_integral.sql` (~496 KB).
- 13 UPDATEs por `curso_id` + `ordem`. Idempotente. Reaplique rodando o script
  de novo se editar algum rascunho.
- **Pendente: aplicar no banco** (esta sessão não tem o MCP Supabase / CLI /
  credenciais de escrita).
