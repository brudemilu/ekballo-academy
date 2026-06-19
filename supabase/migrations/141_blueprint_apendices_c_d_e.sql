-- =============================================================
-- O Blueprint de Parach — Apêndices C, D e E (aulas 19, 20, 21).
-- D (Cartão 2) e E (4 frameworks) usam o componente de tabela [quadro].
-- Idempotente por slug/ordem. (Conteúdo de 20/21 atualizado via UPDATE.)
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

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 19;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice C — Guias de Discussão para Equipes$t$, 19,
$conteudo$CINCO SESSÕES PARA EQUIPES DE LIDERANÇA

As cinco sessões a seguir foram projetadas para mover uma equipe de liderança da consciência para a aplicação. Cada guia pressupõe um ambiente de confiança onde a honestidade é bem-vinda e onde a prática compartilhada — não o insight privado — é o objetivo. Trabalhem através delas em ordem; cada uma se constrói sobre a anterior.

VISÃO GERAL DAS SESSÕES

Sessão 1 — A Grande Inversão (60-90 min). Sessão 2 — Descobrindo Seu Design (90-120 min). Sessão 3 — O Protocolo de Elias (90-120 min). Sessão 4 — Construindo uma Cultura Parach (90-120 min). Sessão 5 — A Longa Obediência (60-90 min).

SESSÃO 1 — A GRANDE INVERSÃO

Tempo: 60-90 minutos.

Abertura (10 min). Passem pelo círculo e respondam honestamente: “Em uma escala de 1 a 10, quão exausto você está no ministério agora?”

Estudo Bíblico (20 min). Leiam Mateus 11:28-30. Em seguida, trabalhem juntos nas seguintes perguntas: 1. O que Jesus quer dizer com um “jugo suave”? 2. Como isso se compara à sua experiência atual? 3. Que jugos você tomou sobre si que Jesus nunca lhe deu?

Conceito Central (15 min). “Esforçar-se é liderar da exaustão em direção ao descanso. Florescer é liderar do descanso para um serviço frutífero.” Discutam como equipe: Qual é a sua primeira reação a essa declaração? Onde você a vê confirmada — ou contradita — em seu próprio ritmo ministerial?

Aplicação (20 min). 1. Como a cultura de nossa equipe reforça o esforço? 2. Qual é uma coisa que poderíamos mudar para criar uma cultura mais Parach? 3. Como podemos nos responsabilizar mutuamente por essa mudança?

Oração Final (5 min). Orem brevemente uns pelos outros, pedindo ao Senhor que troque cada jugo fabricado por você pelo Dele.

SESSÃO 2 — DESCOBRINDO SEU DESIGN

Tempo: 90-120 minutos.

Abertura (15 min). Compartilhem com o grupo: Com qual pássaro — Águia, Corvo, Pavão, Pelicano ou Coruja — você mais se identifica, e por quê?

Análise da Avaliação (30 min). Cada pessoa compartilha três coisas: dom primário e secundário, uma surpresa dos resultados, e a pontuação atual do Índice de Florescimento.

Mapeamento da Equipe (20 min). Criem um mapa visual da distribuição de dons da equipe em um quadro branco ou flip chart. Em seguida, discutam juntos: Quais dons estão bem representados? Quais estão faltando? Como esse mapa explica nossas forças e nossas dificuldades recorrentes?

Aplicação (20 min). Como podemos honrar o design único de cada pessoa em vez de achatá-lo? Que ajustes devemos fazer em papéis, ritmo ou responsabilidade? Como cobriremos as lacunas que identificamos?

Oração Final (5 min). Orem por cada pessoa pelo nome e pelo dom, abençoando o design que Deus colocou nela.

SESSÃO 3 — O PROTOCOLO DE ELIAS

Tempo: 90-120 minutos.

Abertura (10 min). “Você já se sentiu como Elias debaixo da giesta? O que estava acontecendo em sua vida quando essa estação veio?”

Estudo Bíblico (30 min). Leiam 1 Reis 19:1-18. Em seguida, considerem juntos: 1. Por que Elias desabou imediatamente após sua maior vitória? 2. O que Deus não fez? O que Ele fez em vez disso? 3. Por que cuidado físico antes do aconselhamento espiritual?

Os Cinco Passos (20 min). Revisem o Blueprint de Horebe: 1. Cuidado Físico — comida, sono, descanso para o corpo. 2. Tempo e Espaço — permissão para recolher-se. 3. Presença — a voz mansa e suave antes do rugido. 4. Revelação Fresca — uma palavra renovada para uma missão renovada. 5. Nova Comissão e Comunidade — Eliseu, e os sete mil. Qual desses mais negligenciamos quando alguém da nossa equipe está lutando?

Avaliação Pessoal (15 min). Pontuem-se honestamente em uma escala de 1 a 5: Exaustão Física ___; Depleção Emocional ___; Desânimo Espiritual ___; Pensamento Distorcido ___; Isolamento ___.

Aplicação (15 min). Como saberíamos se alguém nesta equipe estivesse se aproximando do colapso? Que sistemas podemos implementar para pegar uns aos outros antes da giesta?

SESSÃO 4 — CONSTRUINDO UMA CULTURA PARACH

Tempo: 90-120 minutos.

Abertura (10 min). “Se alguém novo se juntasse à nossa equipe amanhã, o que essa pessoa observaria sobre o nosso ritmo e nossa abordagem ao descanso?”

Auditoria Cultural (25 min). Parte A. Onde uma cultura de esforço aparece entre nós? Façam um brainstorm honesto em cinco categorias — ritmo, métricas, comunicação, tomada de decisão e práticas espirituais. Parte B. Como seria uma cultura florescente em cada uma dessas mesmas cinco áreas?

Estudo Bíblico (15 min). Leiam Marcos 6:30-32. Notem duas coisas: Jesus iniciou o descanso — os discípulos não pediram por ele. A demanda urgente ainda estava presente — Ele se retirou mesmo assim. Qual é o nosso equivalente de “ir num barco”? Nós temos um?

Planejamento de Ação (30 min). Identifiquem três mudanças específicas que esta equipe fará. Para cada mudança, respondam: Quem é responsável? Quando começa? Como mediremos se está funcionando?

Prestação de Contas (10 min). Quando revisaremos esses compromissos — aos 30, 60 e 90 dias? Quem nos responsabiliza? E o que faremos se escorregarmos?

SESSÃO 5 — A LONGA OBEDIÊNCIA

Tempo: 60-90 minutos.

Abertura (10 min). “Pense em um líder que terminou bem — ainda frutífero na velhice. O que caracterizou sua vida?”

Estudo Bíblico (20 min). Leiam Salmo 92:12-15. Reflitam juntos sobre quatro perguntas: 1. O que significa “florescer como uma palmeira”? 2. Qual é a diferença entre estar plantado e ser um visitante? 3. O que mata a frutificação de longo prazo? 4. O que a preserva?

Os Cinco Compromissos (20 min). 1. Permanecer Plantado — enraizamento em vez de inquietação. 2. Proteger os Ritmos — o Sábado é inegociável. 3. Permanecer em Comunidade — “Só eu restei” é sempre uma mentira. 4. Receber Antes de Dar — seja pastoreado para pastorear. 5. Medir pela Fidelidade — o sucesso é obediência.

Compromisso Pessoal (15 min). Escreva uma carta para si mesmo, a ser aberta daqui a um ano. Comece com estas palavras: “Hoje eu me comprometo a liderar a partir do transbordamento. Especificamente...” Selem as cartas. Designem uma pessoa para guardá-las e distribuí-las nesta mesma data no próximo ano.

Bênção Final (5 min). Leiam Hebreus 13:20-21 em voz alta juntos como uma bênção uns sobre os outros.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Os cinco encontros levam a equipe “da consciência para a aplicação”; pensando na sua equipe (ou nas pessoas com quem você lidera), qual das cinco sessões — A Grande Inversão, Descobrindo Seu Design, O Protocolo de Elias, Construindo uma Cultura Parach, A Longa Obediência — sua liderança mais precisa fazer primeiro, e por quê?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A Sessão 3 propõe sistemas para “pegar uns aos outros antes da giesta”; na sua equipe, como vocês saberiam se alguém está se aproximando do colapso, e que combinado concreto vocês poderiam criar para se cuidarem antes que isso aconteça?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$A Sessão 5 pede uma carta para você mesmo abrir daqui a um ano, começando com “Hoje eu me comprometo a liderar a partir do transbordamento. Especificamente...”; o que você escreveria nessa carta hoje?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 20;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice D — Cartões de Referência Rápida$t$, 20,
$conteudo$FERRAMENTAS DE BOLSO PARA A JORNADA

Os quatro cartões a seguir foram projetados para serem arrancados, fotografados ou copiados na capa interna de um diário. Não são para leitura, mas para se carregar — breves o suficiente para um olhar rápido, pesados o suficiente para nortear um dia. Mantenha-os onde você os verá nos dias em que esquecer.

CARTÃO 1 — VERIFICAÇÃO DIÁRIA PARACH

Cinco perguntas para cada dia: 1. Eu permaneci antes de agir? 2. Estou trabalhando com a energia de Deus ou com a minha? 3. O que estou tentando controlar que pertence a Deus? 4. Meu ritmo é sustentável por trinta anos? 5. Pelo que sou grato?

Cartão 2 — quando estiver lutando, pergunte:

[quadro] Cartão 2 — Diagnóstico Rápido dos Cinco Dons
Se você é um… | Pergunte-se…
--- | ---
Apóstolo | Estou tentando construir tudo sozinho?
Profeta | Estou tentando mudar as pessoas, ou apenas entregar?
Evangelista | Meu valor está ligado aos números?
Pastor | Estou tentando ser o Salvador?
Mestre | Estou estudando para conhecer a Deus, ou apenas para saber sobre Deus?

CARTÃO 3 — PROTOCOLO DE EMERGÊNCIA

Quando se aproximar do esgotamento: 1. PARE. Cancele o que puder. 2. DURMA. Descanso físico primeiro. 3. COMA. Cuide de seu corpo. 4. CONTE. Ligue para uma pessoa de confiança. 5. ESCUTE. Espere a voz mansa e suave. 6. AGUARDE. A recuperação leva tempo.

CARTÃO 4 — CHECKLIST DO SÁBADO

É realmente Sábado? Sem comunicação de trabalho. Sem preparação de sermão ou planejamento. Sem culpa por descansar. Tempo prolongado com Deus. Atividades que dão vida. Descanso físico. Gratidão ao final do dia.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Cartão 1 traz cinco perguntas de verificação diária (permaneci antes de agir? estou na energia de Deus ou na minha? o que tento controlar que é de Deus? meu ritmo é sustentável por trinta anos? pelo que sou grato?); qual dessas cinco mais te confronta hoje, e por quê?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O Cartão 3 (Protocolo de Emergência) e o Cartão 4 (Checklist do Sábado) são ferramentas para os dias difíceis; qual desses cartões você precisa “carregar no bolso” nesta estação, e onde você vai deixá-lo para realmente vê-lo quando esquecer?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 21;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Apêndice E — Os Frameworks de Restauração$t$, 21,
$conteudo$PARA ESTUDO PESSOAL E EXPLORAÇÃO MAIS PROFUNDA

Estes quatro frameworks reúnem os padrões centrais da liderança Parach em forma de referência. Use-os junto aos capítulos para estudo pessoal, discussão em equipe ou reflexão diagnóstica.

[quadro] Framework 1 — As Sete Festas e a Restauração da Liderança
Festa | Cumprimento em Cristo | Restauração da Liderança
--- | --- | ---
Páscoa | Jesus como o Cordeiro; Seu sangue cobre o pecado | Vida Restaurada — não mais trabalhando por vida, mas a partir da vida assegurada pelo Cordeiro
Pães Asmos | Jesus como sacrifício sem pecado; remoção do pecado | Pureza Restaurada — o velho fermento da performance e amargura é removido
Primícias | Ressurreição de Jesus; primícias dos que dormem | Identidade Restaurada — segura como filho ou filha, independentemente da colheita desta estação
Pentecostes | Espírito Santo derramado | Poder Restaurado — o Espírito despedaça a ilusão do “Só eu restei”; o Consolador faz o trabalho pesado
Trombetas | Anúncio do retorno do Rei | Autoridade Restaurada — chamado da autocomiseração para a identidade real
Expiação | Jesus como Sumo Sacerdote; véu rasgado | Acesso Restaurado — acesso permanente à presença do Pai
Tabernáculos | Deus habitando com o povo; colheita final | Perspectiva Restaurada — visão eterna; os problemas atuais são “leves e momentâneos”

[quadro] Framework 2 — As Sete Parábolas e a Lógica do Reino
Parábola | Lógica do Reino | Mudança na Liderança
--- | --- | ---
O Semeador | O sucesso depende do solo, não da força do semeador | De “Eu preciso fazê-lo crescer” para “Eu cuido do solo”
Trigo e Joio | O verdadeiro e o falso crescem juntos até a colheita | De “Eu preciso purificar tudo” para “Eu confio no tempo de Deus”
Grão de Mostarda | O Reino começa impossivelmente pequeno | De “desprezar os pequenos começos” para “confiar no DNA divino”
O Fermento | A expansão é silenciosa e interna | De “impacto externo barulhento” para “influência interna silenciosa”
Tesouro Escondido | O Reino é descoberta alegre | De “obrigação pesada” para “posse alegre”
Pérola de Grande Valor | Um único prêmio substitui todas as buscas | De “buscar validação” para “descansar no Prêmio”
A Rede | Deus é o classificador final | De “ansiedade sobre resultados” para “fidelidade em lançar a rede”

FRAMEWORK 3 — CAMINHOS DE RESTAURAÇÃO ESPECÍFICOS POR DOM

Cada dom do cinco-em-um tem um caminho particular de restauração quando tem operado a partir do esforço. As cinco tabelas abaixo traçam os cinco estágios de recuperação para cada um.

[quadro] O Caminho do Apóstolo
Estágio | Experiência | Cura Chave
--- | --- | ---
Cuidado Físico | Precisa parar de construir | Permissão para pausar a visão
Tempo e Espaço | Sente-se como abandonar a missão | A missão é de Deus, não deles
Presença | Confrontar a mentira “Eu preciso construir” | “Eu estou construindo; você participa”
Revelação Fresca | Nova visão incluindo descanso | Arquitetura sustentável
Nova Comissão | Ênfase em delegação | De pioneiro solitário a pai de movimento

[quadro] O Caminho do Profeta
Estágio | Experiência | Cura Chave
--- | --- | ---
Cuidado Físico | Admitir exaustão | Permissão para parar de arder
Tempo e Espaço | O silêncio parece abandono | O silêncio não é rejeição
Presença | Derramar o fardo | Ser ouvido, não apenas ouvir
Revelação Fresca | Voz mansa e suave | Intimidade acima da intensidade
Nova Comissão | “7.000 que não dobraram o joelho” | Do isolamento à comunidade

[quadro] O Caminho do Evangelista
Estágio | Experiência | Cura Chave
--- | --- | ---
Cuidado Físico | Parar o alcance frenético | Permissão para não salvar todos
Tempo e Espaço | Culpa pelas “almas morrendo” | A conversão é obra de Deus
Presença | Liberar os números | Identidade em Cristo, não na resposta
Revelação Fresca | Celebrar sementes, não apenas colheita | Fidelidade acima de frutificação
Nova Comissão | Ritmo sustentável | Da culpa para a alegria

[quadro] O Caminho do Pastor
Estágio | Experiência | Cura Chave
--- | --- | ---
Cuidado Físico | O mais difícil é parar de cuidar dos outros | Permissão para receber cuidado
Tempo e Espaço | Culpa por “abandonar” o rebanho | Jesus é o Pastor Principal
Presença | Ser pastoreado | Receber antes de dar
Revelação Fresca | “Você não é o Salvador” | Liberdade do Complexo de Messias
Nova Comissão | Limites como mordomia | Do esgotamento ao transbordamento

[quadro] O Caminho do Mestre
Estágio | Experiência | Cura Chave
--- | --- | ---
Cuidado Físico | Parar o estudo sem fim | Permissão para não saber tudo
Tempo e Espaço | Estudar para si, não para produção | Ser alimentado antes de alimentar
Presença | Vir como estudante | Humildade diante da Palavra
Revelação Fresca | “Estude, pratique, depois ensine” | Aplicação antes da informação
Nova Comissão | Ensinar a partir do transbordamento | Do seco ao dador de vida

[quadro] Framework 4 — O Diagnóstico Esgotamento-para-Festa
Sintoma | Descrição | Remédio da Festa
--- | --- | ---
Exaustão Física | Corpo esgotado | Páscoa — vida restaurada
Depleção Emocional | “Contundido”, quebrantado | Pães Asmos — pureza restaurada
Desânimo Espiritual | O trabalho parece morto | Primícias — identidade restaurada
Pensamento Distorcido | “Só eu restei” | Pentecostes — mente sã restaurada
Autocomiseração | Mentalidade de vítima | Trombetas — autoridade restaurada
Isolamento | Cortado da Presença | Expiação — acesso restaurado
Perspectiva Perdida | Não consegue ver além da crise | Tabernáculos — visão eterna restaurada

“O Viticultor está restaurando o jardim inteiro — um líder, um dom, uma festa de cada vez.”$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$O Framework 4 liga cada sintoma de esgotamento a um “Remédio da Festa” (ex.: “Só eu restei” → Pentecostes, mente sã restaurada); olhando a coluna dos sintomas — exaustão, depleção, desânimo, pensamento distorcido, autocomiseração, isolamento, perspectiva perdida — qual descreve melhor onde você está, e que restauração ele aponta?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O Framework 3 mostra que cada dom tem uma “cura chave” (o apóstolo: a missão é de Deus; o pastor: você não é o Salvador; o mestre: ser alimentado antes de alimentar...); qual é a cura chave do seu dom, e o que mudaria na sua liderança se você cresse nela de verdade?$p$, 'reflexao', null);
  end if;

end $migration$;
