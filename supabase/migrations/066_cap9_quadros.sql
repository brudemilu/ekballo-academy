-- =============================================================
-- O Desafio de Todo Líder — Capítulo 9: tabelas viram quadros
-- Converte as duas tabelas (antes em lista) para o formato [quadro],
-- renderizado como caixa/tabela emoldurada na aula. Idempotente.
-- =============================================================

update public.aulas a
set conteudo = replace(
  replace(
    a.conteudo,
$old1$LINHA DO TEMPO DO LÍDER
• Fase 1 — Fundamentos
• Fase 2 — Crescimento interior
• Fase 3 — Maturidade no ministério
• Fase 4 — Maturidade na vida
• Fase 5 — Convergência
• Fase 6 — Celebração$old1$,
$new1$[quadro] LINHA DO TEMPO DO LÍDER
Fase 1 | Fundamentos
Fase 2 | Crescimento interior
Fase 3 | Maturidade no ministério
Fase 4 | Maturidade na vida
Fase 5 | Convergência
Fase 6 | Celebração$new1$
  ),
$old2$ELEMENTOS USADOS PARA O CRESCIMENTO INTERIOR
• Disciplinas interiores: Estudo, Meditação, Oração, Jejum
• Disciplinas exteriores: Simplicidade, Submissão, Serviço
• Disciplinas corporativas: Confissão, Instrução, Adoração, Culto
• Testes de crescimento: Integridade, Obediência, Palavra$old2$,
$new2$[quadro] ELEMENTOS USADOS PARA O CRESCIMENTO INTERIOR
Disciplinas interiores | Disciplinas exteriores | Disciplinas corporativas | Testes de crescimento
--- | --- | --- | ---
Estudo | Simplicidade | Confissão | Integridade
Meditação | Submissão | Instrução | Obediência
Oração | Serviço | Adoração | Palavra
Jejum |  | Culto | $new2$
)
from public.cursos c
where a.curso_id = c.id
  and c.slug = 'o-desafio-de-todo-lider'
  and a.ordem = 9;
