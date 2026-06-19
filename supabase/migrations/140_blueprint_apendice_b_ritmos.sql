-- =============================================================
-- O Blueprint de Parach — Apêndice B: Ritmos para a Liderança Parach (aula 18).
-- Transcrição na íntegra (scan lido página a página). Cabeçalhos de seção em
-- CAIXA ALTA renderizam como título (ehTitulo()). Atividades = reflexão. Idempotente.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'blueprint-parach';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values ('blueprint-parach','O Blueprint de Parach','Estudo guiado a partir de O Blueprint de Parach, de Dr. Richard William. O livro confronta a "epidemia do esforço" no ministério e propõe a Grande Inversão: liderar a partir do descanso, e não em direção a ele — do transbordamento, e não da exaustão. Cada trecho traz o texto na íntegra e, ao final, perguntas de reflexão para você examinar de onde vem a energia da sua liderança. Os capítulos vão sendo liberados conforme a ordem de leitura do livro.','/api/og/curso/blueprint-parach', false, 0, v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 18;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice B — Ritmos para a Liderança Parach$t$, 18,
$conteudo$PRÁTICAS SEMANAIS, MENSAIS, TRIMESTRAIS E ANUAIS

O florescimento não é um evento — é um ritmo. O que o corpo não consegue sustentar em velocidade de sprint, a alma não consegue sustentar em frenesi. As páginas a seguir oferecem um andaime prático para uma vida Parach: uma cadência semanal que começa (não termina) no descanso, um padrão mensal que honra as diferentes estações de atenção, um recolhimento trimestral modelado no Horeb de Elias, e um arco anual que espelha o ano agrícola. Adote-os lentamente. Não tente instalar cada ritmo de uma só vez.

O RITMO SEMANAL

A cadência de sete dias de um líder florescente.

DIA 1 — SÁBADO (O PONTO DE PARTIDA)

A semana começa com descanso, não termina com ele. Esta é a Grande Inversão.

1. Tempo prolongado e sem pressa com Deus — sem agenda.

2. Descanso físico: dormir até mais tarde, cochilar, ficar quieto.

3. Atividades que dão vida: natureza, família, brincar.

4. Sem e-mail, sem planejamento ministerial, sem culpa.

INEGOCIÁVEL. Este dia é protegido. Não opcional. Não negociável. Não interrompido.

DIA 2 — DIA DA SEMENTE (VISÃO E PLANEJAMENTO)

Vindo do descanso, planeje a semana com clareza.

1. Revise seu chamado e responsabilidades principais.

2. Identifique as três a cinco “grandes pedras” da semana.

3. Bloqueie tempo para trabalho profundo, reuniões e margem.

4. Ore: “Senhor, o que Tu estás fazendo que eu possa participar?”

DIAS 3-5 — DIAS DE CULTIVO (TRABALHO FOCADO)

Ministério ativo fluindo do descanso do Dia 1.

1. Primeira hora: tempo de permanência antes de qualquer produção.

2. Manhã: trabalho profundo — estudo, escrita, estratégia.

3. Meio-dia: trabalho relacional — reuniões, cuidado pastoral.

4. Tarde: tarefas administrativas.

5. Noite: família e restauração.

VERIFICAÇÃO DIÁRIA:

1. Estou trabalhando com a energia de Deus ou em minha própria força?

2. Permaneci antes de agir?

3. O que estou tentando controlar que pertence a Deus?

DIA 6 — DIA DA COLHEITA (EXPRESSÃO MINISTERIAL)

O dia de frutificação — o púlpito, o ensino, a expressão pública.

1. Lidere a partir do transbordamento, não da performance.

2. Esteja totalmente presente; confie em Deus com os resultados.

3. Breve reflexão noturna: O que Deus fez?

DIA 7 — DIA DE TRANSIÇÃO

Uma suave rampa de volta ao Sábado.

1. Tarefas leves e pontas soltas.

2. Tempo de processamento — diário, reflexão.

3. Atividade física para liberar estresse.

4. Prepare o coração e o lar para o Sábado.

O RITMO MENSAL

Quatro semanas, quatro ênfases.

Nem toda semana em um determinado mês precisa ter a mesma aparência. Atribuir a cada uma das quatro semanas uma postura dominante impede que o calendário se transforme em um borrão indiferenciado.

Semana 1 — Visão: pensamento estratégico, planejamento de longo prazo, encontros com mentores.

Semana 2 — Cultivo: trabalho profundo, preparação do ensino principal, construção e criação.

Semana 3 — Relacional: reuniões individuais, cuidado pastoral, desenvolvimento de equipe.

Semana 4 — Recuperação: agenda mais leve, avaliação, renovação espiritual prolongada, margem.

O RITMO TRIMESTRAL

O Dia de Horebe — o recolhimento de um profeta.

A cada três meses, agende um tempo prolongado de recolhimento — de oito a doze horas — longe de casa e do escritório. Leve apenas sua Bíblia, um diário e provisões mínimas. Desligue o telefone. Não meça o sucesso pelo insight produzido; meça-o pelo silêncio mantido.

OS TRÊS TERÇOS:

1. Primeiro Terço — Descanso e Silêncio. Durma se estiver cansado. Caminhe. Nada de leitura ou conversa. Deixe sua alma se assentar diante do Senhor sem agenda.

2. Segundo Terço — Processamento. Anote três perguntas no diário: O que está me esgotando? O que me dá vida? Onde tenho me esforçado?

3. Terceiro Terço — Escuta. Meditação prolongada das Escrituras. Silêncio. Então pergunte simplesmente: “O que Tu estás dizendo, Senhor?”

A PERGUNTA-CHAVE: “O que você está fazendo aqui, [seu nome]?” A pergunta que Deus fez a Elias no Horeb (1 Reis 19:9) é a pergunta que Deus faz a cada líder que correu por muito tempo com muito pouco.

O RITMO ANUAL

Quatro estações de liderança.

O ano agrícola sempre foi a metáfora preferida da Bíblia para o trabalho espiritual. Onde o calendário não tem ritmo embutido, o líder precisa impor um — caso contrário, toda estação se torna uma estação de colheita, o que é uma receita para a exaustão.

Jan-Mar — Plantio: visão, planejamento, lançamento de novas iniciativas.

Abr-Jun — Cultivo: crescimento, desenvolvimento, investimento profundo em pessoas.

Jul-Set — Colheita: avaliação, celebração, reunião do fruto do ano.

Out-Dez — Descanso: poda, liberação, restauração para o ano que virá.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Ritmo Semanal começa no Sábado (descanso), não termina nele — a Grande Inversão; olhando para a sua semana real, o descanso entra como o fundamento de onde o trabalho flui, ou como uma recompensa que quase nunca chega? Que mudança concreta tornaria o seu “Dia 1” inegociável?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O ritmo trimestral propõe um “Dia de Horebe” — de 8 a 12 horas de recolhimento, medido pelo silêncio mantido e não pelo insight produzido; quando foi a última vez que você parou assim diante de Deus, e o que tem te impedido de agendar o próximo? Diante da pergunta “O que você está fazendo aqui?”, o que você responderia hoje?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Os ritmos mensal e anual dão a cada período uma ênfase (visão, cultivo, relacional/colheita, recuperação/descanso) para que nem toda estação vire colheita; em qual “estação” você tem tentado viver o ano inteiro, e que ritmo você precisa impor para não transformar tudo numa corrida rumo à exaustão?$p$, 'reflexao', null);
  end if;

end $migration$;
