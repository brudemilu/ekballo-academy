-- =============================================================
-- Ego Transformado: expande para 10 MCs por capítulo (40 MCs no total)
-- e reordena para que as 2 reflexões venham primeiro (ordem 1-2)
-- seguidas das 10 múltiplas escolha (ordem 3-12).
-- Reflexões já existem (migração 007); reaproveitamos os IDs.
-- =============================================================

do $mig$
declare
  v_aula1 uuid; v_aula2 uuid; v_aula3 uuid; v_aula4 uuid;
  v_atv uuid;
begin
  select a.id into v_aula1 from public.aulas a join public.cursos c on c.id = a.curso_id where c.slug = 'ego-transformado-keller' and a.ordem = 1;
  select a.id into v_aula2 from public.aulas a join public.cursos c on c.id = a.curso_id where c.slug = 'ego-transformado-keller' and a.ordem = 2;
  select a.id into v_aula3 from public.aulas a join public.cursos c on c.id = a.curso_id where c.slug = 'ego-transformado-keller' and a.ordem = 3;
  select a.id into v_aula4 from public.aulas a join public.cursos c on c.id = a.curso_id where c.slug = 'ego-transformado-keller' and a.ordem = 4;

  -- ============ PASSO 1: liberar slots de ordem (move para negativos temporários) ============
  update public.atividades set ordem = -ordem - 100 where aula_id in (v_aula1, v_aula2, v_aula3, v_aula4);

  -- ============ PASSO 2: posicionar reflexões nas ordens 1 e 2 ============
  update public.atividades set ordem = 1 where aula_id = v_aula1 and pergunta = 'Que pergunta este capítulo deixou no seu coração?';
  update public.atividades set ordem = 2 where aula_id = v_aula1 and pergunta = 'Onde você tem buscado se sentir alguém de valor?';

  update public.atividades set ordem = 1 where aula_id = v_aula2 and pergunta = 'Das quatro marcas — vazio, dolorido, atarefado, frágil — qual você reconhece mais em você hoje?';
  update public.atividades set ordem = 2 where aula_id = v_aula2 and pergunta = 'Em que momento da sua semana o seu ego doeu?';

  update public.atividades set ordem = 1 where aula_id = v_aula3 and pergunta = 'Em que parte da sua vida você ainda está tentando provar quem você é?';
  update public.atividades set ordem = 2 where aula_id = v_aula3 and pergunta = 'Como você costuma reagir quando recebe uma crítica?';

  update public.atividades set ordem = 1 where aula_id = v_aula4 and pergunta = 'Onde você ainda performa para se sentir aceito?';
  update public.atividades set ordem = 2 where aula_id = v_aula4 and pergunta = 'O que você quer praticar essa semana para lembrar que Deus já se pronunciou sobre você?';

  -- ============ PASSO 3: posicionar MCs existentes em ordem de fluxo do capítulo ============
  -- K1: pergunta central (ordem 3) e problema comum tradicional/moderna (ordem 11)
  update public.atividades set ordem = 3  where aula_id = v_aula1 and pergunta = 'Qual é a pergunta central que abre o livro de Keller, ao analisar 1Coríntios 3.21–4.7?';
  update public.atividades set ordem = 11 where aula_id = v_aula1 and pergunta = 'Qual o problema comum tanto da abordagem tradicional (autoestima alta = causa do mal) quanto da moderna (baixa autoestima = causa do mal)?';

  -- K2: physioō literal (ordem 4), 4 marcas (ordem 5), Madonna (ordem 12)
  update public.atividades set ordem = 4  where aula_id = v_aula2 and pergunta = 'A palavra grega physioō, que Paulo usa para descrever o ego natural, significa literalmente:';
  update public.atividades set ordem = 5  where aula_id = v_aula2 and pergunta = 'Quais são as quatro marcas do ego humano natural, segundo Keller?';
  update public.atividades set ordem = 12 where aula_id = v_aula2 and pergunta = 'O exemplo da Madonna ("o que me impulsiona é o medo de ser medíocre... minha luta nunca terminará") ilustra qual verdade sobre o ego?';

  -- K3: saiu do tribunal (ordem 5), Lewis pensar menos (ordem 10), teste simples (ordem 12)
  update public.atividades set ordem = 5  where aula_id = v_aula3 and pergunta = 'Em 1Coríntios 4.3-4, Paulo diz: "pouco me importa se sou julgado por vós... nem eu julgo a mim mesmo". O que ele está dizendo, segundo Keller?';
  update public.atividades set ordem = 10 where aula_id = v_aula3 and pergunta = 'Segundo a famosa citação de C.S. Lewis em "Cristianismo puro e simples", o que é a verdadeira humildade do evangelho?';
  update public.atividades set ordem = 12 where aula_id = v_aula3 and pergunta = 'Qual o "teste simples" que Keller apresenta para identificar uma pessoa que se esqueceu de si mesma?';

  -- K4: veredicto antes do desempenho (ordem 7), reviver o evangelho (ordem 12)
  update public.atividades set ordem = 7  where aula_id = v_aula4 and pergunta = 'O que torna o evangelho cristão radicalmente diferente de toda outra forma de identidade, segundo Keller?';
  update public.atividades set ordem = 12 where aula_id = v_aula4 and pergunta = 'Para alguém que já crê mas todos os dias se vê "arrastado de volta para o tribunal", qual a orientação prática de Keller?';

  -- ============ PASSO 4: criar 8 novas MCs em K1 (ordens 4-10, 12 sobra para K1.10) ============
  -- K1 ordem 4: passagem bíblica
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 4, 'Qual passagem bíblica Keller usa como base para este estudo?', 'multipla_escolha',
   'Keller fundamenta toda a reflexão em 1Coríntios 3.21—4.7, onde Paulo trata da divisão na igreja de Corinto.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Romanos 8.1-7', false),
  (v_atv, 2, '1Coríntios 3.21—4.7', true),
  (v_atv, 3, 'Mateus 5.1-12 (Bem-aventuranças)', false),
  (v_atv, 4, 'Salmo 139.23-24', false);

  -- K1 ordem 5: causa da divisão em Corinto
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 5, 'O que estava por trás da divisão na igreja de Corinto, segundo Paulo?', 'multipla_escolha',
   'Paulo identifica orgulho e vanglória como a raiz: os coríntios usavam relacionamentos com Paulo, Apolo e Cefas como trampolim para um jogo de poder, formando facções.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Discordâncias doutrinárias sobre o batismo', false),
  (v_atv, 2, 'Diferenças culturais entre judeus e gentios', false),
  (v_atv, 3, 'Orgulho e vanglória — formação de facções em torno de líderes', true),
  (v_atv, 4, 'Falta de recursos financeiros para manter a igreja', false);

  -- K1 ordem 6: hubris
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 6, 'Na visão das culturas tradicionais, o que era o "hubris" — causa apontada para o mau comportamento humano?', 'multipla_escolha',
   'Hubris é palavra grega que significa soberba ou autoestima elevada demais. As culturas tradicionais explicavam o mau comportamento atribuindo-o a esse excesso de auto-importância.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Falta de educação formal', false),
  (v_atv, 2, 'Soberba — autoestima elevada demais', true),
  (v_atv, 3, 'Vergonha ou baixa autoestima', false),
  (v_atv, 4, 'Ignorância religiosa', false);

  -- K1 ordem 7: visão moderna
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 7, 'Como a sociedade ocidental contemporânea explica o mau comportamento humano?', 'multipla_escolha',
   'A crença moderna inverteu a tradicional: hoje se acredita que as pessoas agem mal por falta de autoestima e valorização muito baixa de si mesmas.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Autoestima elevada demais (igual à visão tradicional)', false),
  (v_atv, 2, 'Influência de fatores espirituais malignos', false),
  (v_atv, 3, 'Falta de autoestima — autovalorização muito baixa de si mesmas', true),
  (v_atv, 4, 'Predisposição genética', false);

  -- K1 ordem 8: Lauren Slater
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 8, 'O que Lauren Slater concluiu, no artigo do New York Times citado por Keller?', 'multipla_escolha',
   'Slater relatou que as pesquisas mostram que pessoas com autoestima elevada são mais perigosas que as de baixa autoestima — contrariando a teoria moderna dominante.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Que a baixa autoestima é o maior problema social do país', false),
  (v_atv, 2, 'Que pessoas com autoestima elevada são mais perigosas que as de baixa autoestima', true),
  (v_atv, 3, 'Que autoestima não tem nenhuma relação com comportamento', false),
  (v_atv, 4, 'Que só pessoas religiosas têm autoestima saudável', false);

  -- K1 ordem 9: por que a teoria moderna é atraente
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 9, 'Por que a "teoria da baixa autoestima como causa do mau comportamento" é tão atraente, segundo Keller?', 'multipla_escolha',
   'Ela é atraente porque não exige nenhum julgamento moral — basta animar a pessoa e ajudá-la a se desenvolver, sem precisar repreender o erro.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque tem comprovação científica robusta', false),
  (v_atv, 2, 'Porque permite resolver problemas sem precisar fazer julgamento moral', true),
  (v_atv, 3, 'Porque foi desenvolvida por psicólogos cristãos', false),
  (v_atv, 4, 'Porque tem apoio direto da Bíblia', false);

  -- K1 ordem 10: como culturas tradicionais lidavam
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 10, 'Como as culturas tradicionais lidavam com o mau comportamento das pessoas?', 'multipla_escolha',
   'Nas culturas tradicionais, as pessoas eram repreendidas, convencidas do erro e alertadas da sua maldade — abordagem oposta à animação moderna.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Encorajando, elogiando e oferecendo terapia', false),
  (v_atv, 2, 'Ignorando o problema até passar', false),
  (v_atv, 3, 'Repreendendo, convencendo do erro e alertando da maldade', true),
  (v_atv, 4, 'Excluindo a pessoa da convivência social', false);

  -- K1 ordem 12: as três coisas que Paulo revela
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula1, 12, 'Quais são as três coisas que Paulo revela nesse texto, segundo Keller?', 'multipla_escolha',
   'Paulo revela: (1) a condição natural do ego humano, (2) a visão transformada do eu pelo evangelho, e (3) como alcançar essa visão transformada.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Três tipos de pecado, três culturas e três castigos', false),
  (v_atv, 2, 'A condição natural do ego, a visão transformada do eu, e como alcançá-la', true),
  (v_atv, 3, 'Como ser admirado pela igreja, pela cidade e por Deus', false),
  (v_atv, 4, 'Três métodos de aumentar a autoestima', false);

  -- ============ PASSO 5: criar 7 novas MCs em K2 ============
  -- K2 ordem 3: por que physioō em vez de hubris
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 3, 'Por que Paulo escolheu a palavra "physioō" em vez de "hubris" para falar sobre orgulho?', 'multipla_escolha',
   'Physioō é uma palavra incomum, usada quase exclusivamente por Paulo — sugerindo que ele queria ensinar algo específico sobre o ego humano que a palavra comum "hubris" não captava.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque "hubris" não existia no grego do seu tempo', false),
  (v_atv, 2, 'Porque queria ensinar algo específico sobre o ego — physioō é uma palavra rara usada quase só por ele', true),
  (v_atv, 3, 'Porque queria evitar parecer crítico aos coríntios', false),
  (v_atv, 4, 'Porque foi um erro de copista preservado nas cópias', false);

  -- K2 ordem 6: Kierkegaard
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 6, 'Segundo Kierkegaard (citado por Keller), em torno do que o coração humano natural costuma criar sua identidade?', 'multipla_escolha',
   'Para Kierkegaard, o ego natural se fundamenta em algo além de Deus — busca em sucesso, beleza, aprovação ou propósito o senso de valor que só Deus pode dar.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Em torno de Deus, naturalmente', false),
  (v_atv, 2, 'Em torno da razão e da lógica', false),
  (v_atv, 3, 'Em torno de algo que não é Deus', true),
  (v_atv, 4, 'Em torno da consciência coletiva da humanidade', false);

  -- K2 ordem 7: sentimentos feridos
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 7, 'Quando dizemos que "alguém feriu nossos sentimentos", o que está realmente acontecendo, segundo Keller?', 'multipla_escolha',
   'Keller mostra que sentimentos não podem ser feridos — quem se sente machucado é o ego (o nosso eu, a nossa identidade). É o ego que dói.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Os sentimentos foram realmente feridos', false),
  (v_atv, 2, 'Os sentimentos continuam ótimos — quem se machucou foi o ego (nossa identidade)', true),
  (v_atv, 3, 'É apenas uma figura de linguagem sem significado real', false),
  (v_atv, 4, 'Deus é quem está nos disciplinando', false);

  -- K2 ordem 8: Lewis sobre orgulho competitivo
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 8, 'Segundo C.S. Lewis (citado por Keller), qual é a essência do orgulho?', 'multipla_escolha',
   'Para Lewis, o orgulho é competitivo por definição: ninguém se orgulha de ter algo, mas de tê-lo em quantidade MAIOR que os outros.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'A satisfação de ter algo em abundância', false),
  (v_atv, 2, 'A competitividade — ter MAIS do que os outros', true),
  (v_atv, 3, 'A coragem de defender a própria honra', false),
  (v_atv, 4, 'A capacidade de se afirmar em público', false);

  -- K2 ordem 9: exemplo do menino
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 9, 'No exemplo do menino que fazia coisas que detestava (xadrez, voluntariado) por insistência da mãe, o que Keller está ilustrando?', 'multipla_escolha',
   'Keller usa o exemplo para mostrar como o ego vive construindo um "currículo" que impressione — fazemos coisas pelas quais não temos interesse só para nos sobressair.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'A importância da disciplina e da obediência aos pais', false),
  (v_atv, 2, 'Como o ego vive construindo um "currículo" que impressione, mesmo em coisas que detestamos', true),
  (v_atv, 3, 'Que pais sempre sabem o que é melhor para os filhos', false),
  (v_atv, 4, 'A virtude do serviço aos pobres', false);

  -- K2 ordem 10: superioridade x inferioridade
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 10, 'Por que complexo de superioridade e complexo de inferioridade são basicamente a mesma coisa, segundo Keller?', 'multipla_escolha',
   'Ambos resultam de um ego superinflado: um vive com medo de ser desinflado, o outro já foi desinflado. Os dois estão presos à mesma dinâmica.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque ambos têm raízes na infância', false),
  (v_atv, 2, 'Porque ambos resultam de um ego superinflado — um teme estourar, o outro já estourou', true),
  (v_atv, 3, 'Porque os dois são curados com o mesmo medicamento', false),
  (v_atv, 4, 'Porque ambos são problemas exclusivamente femininos', false);

  -- K2 ordem 11: fragilidade
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula2, 11, 'Por que Keller diz que o ego natural é frágil?', 'multipla_escolha',
   'Qualquer coisa superinflada está prestes a estourar — é a imagem da bexiga cheia demais. Por estar inflado em vez de saciado, o ego natural é inerentemente instável.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Por causa da genética e da idade', false),
  (v_atv, 2, 'Pela falta de exercício espiritual', false),
  (v_atv, 3, 'Porque qualquer coisa superinflada está prestes a estourar', true),
  (v_atv, 4, 'Pela ausência de elogios recebidos', false);

  -- ============ PASSO 6: criar 7 novas MCs em K3 ============
  -- K3 ordem 3: Paulo ministro de Deus
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 3, 'Em 1Coríntios 4.1,2, o que Paulo lembra aos coríntios sobre seu papel?', 'multipla_escolha',
   'Paulo se apresenta como ministro de Deus encarregado dos mistérios divinos, com uma obra a realizar — não como alguém que precisa do veredicto deles para se sentir alguém.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Que ele é o maior apóstolo da igreja', false),
  (v_atv, 2, 'Que ele é ministro de Deus encarregado dos mistérios divinos, com uma obra a realizar', true),
  (v_atv, 3, 'Que ele merece respeito por ter chegado primeiro à cidade', false),
  (v_atv, 4, 'Que ele precisa do apoio financeiro deles', false);

  -- K3 ordem 4: "julgado" = veredicto
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 4, 'Quando Paulo diz "pouco me importa se sou julgado por vós", o que a palavra "julgado" significa, segundo Keller?', 'multipla_escolha',
   'A palavra tem o sentido de "ser alvo de um veredicto" — Paulo está dizendo que não precisa que ninguém (nem ele mesmo) pronuncie um veredicto definitivo sobre quem ele é.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Ser condenado em um tribunal criminal', false),
  (v_atv, 2, 'Ser corrigido em uma sala de aula', false),
  (v_atv, 3, 'Ser alvo de um veredicto definitivo sobre quem você é', true),
  (v_atv, 4, 'Ser conhecido por suas obras', false);

  -- K3 ordem 6: por que padrões próprios não funcionam
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 6, 'Por que estabelecer os próprios padrões (em vez de seguir os dos outros) não resolve o problema, segundo Keller?', 'multipla_escolha',
   'Não funciona porque qualquer padrão sério eu não consigo cumprir e qualquer padrão frouxo me condena por ter padrões baixos — em ambos os casos, o tribunal interno continua condenando.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque é considerado arrogante pela sociedade', false),
  (v_atv, 2, 'Porque a Bíblia proíbe explicitamente', false),
  (v_atv, 3, 'Padrões sérios eu não consigo cumprir, e padrões frouxos me condenam por serem baixos', true),
  (v_atv, 4, 'Porque a sociedade contemporânea impede', false);

  -- K3 ordem 7: "principal dos pecadores"
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 7, 'Em 1Timóteo 1.15, Paulo se declara "o principal dos pecadores". Por que essa afirmação é impressionante, segundo Keller?', 'multipla_escolha',
   'Porque Paulo usa o tempo presente ("sou", não "era") — e mesmo assim mantém estabilidade, confiança e segue na obra à qual foi chamado. Foge às nossas categorias.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque Paulo era de fato o pior pecador da história', false),
  (v_atv, 2, 'Porque ele usa o tempo presente ("sou", não "era") e mesmo assim mantém estabilidade e confiança', true),
  (v_atv, 3, 'Porque Timóteo precisava ouvir isso para sua própria fé', false),
  (v_atv, 4, 'Porque é uma declaração de humildade fingida, uma estratégia retórica', false);

  -- K3 ordem 8: pecados e realizações
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 8, 'O que Paulo faz com seus pecados e suas realizações, segundo Keller?', 'multipla_escolha',
   'Paulo enxerga ambos — pecados e realizações — mas se recusa a conectá-los à sua identidade. Eles não definem quem ele é.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Esconde os pecados e celebra publicamente as realizações', false),
  (v_atv, 2, 'Confessa os pecados e esquece tudo o mais', false),
  (v_atv, 3, 'Enxerga ambos, mas se recusa a conectá-los à sua identidade', true),
  (v_atv, 4, 'Aceita os dois como definidores de quem ele é', false);

  -- K3 ordem 9: humildade não tem relação com
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 9, 'Segundo Keller, o que Paulo descreve como humildade NÃO tem nenhuma relação com:', 'multipla_escolha',
   'Keller faz questão de dizer que a humildade do evangelho "não tem nenhuma relação com nossa ideia de humildade" — não é nem alta nem baixa autoestima, é uma terceira coisa.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Com o evangelho de Cristo', false),
  (v_atv, 2, 'Com a doutrina cristã', false),
  (v_atv, 3, 'Com a nossa ideia comum de "humildade" — não é alta nem baixa autoestima', true),
  (v_atv, 4, 'Com a vida prática diária', false);

  -- K3 ordem 11: ego como dedos dos pés
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula3, 11, 'Que imagem Keller usa para descrever o ego de uma pessoa verdadeiramente humilde segundo o evangelho?', 'multipla_escolha',
   'O ego dela é como os dedos dos pés: simplesmente exerce sua função, sem implorar por atenção. Ele trabalha, mas não chama a atenção para si.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Um músculo forte e visível', false),
  (v_atv, 2, 'Um castelo bem fortificado', false),
  (v_atv, 3, 'Os dedos dos pés — simplesmente exerce sua função sem chamar atenção', true),
  (v_atv, 4, 'Uma vela apagada', false);

  -- ============ PASSO 7: criar 8 novas MCs em K4 ============
  -- K4 ordem 3: como Paulo alcançou autoesquecimento
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 3, 'Como Paulo alcançou o "bendito autoesquecimento", segundo Keller?', 'multipla_escolha',
   'Não foi por força de vontade nem por seguir padrões. Foi porque alguém — o único cuja opinião realmente importa — já havia se pronunciado sobre ele.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Por anos de meditação e disciplina espiritual', false),
  (v_atv, 2, 'Por ter passado por muitos sofrimentos', false),
  (v_atv, 3, 'Porque o único cuja opinião realmente importa já havia se pronunciado sobre ele', true),
  (v_atv, 4, 'Por estudar filosofia grega', false);

  -- K4 ordem 4: o que todos buscam
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 4, 'Segundo Keller, o que Paulo, Madonna e todos nós buscamos?', 'multipla_escolha',
   'Buscamos um veredicto definitivo que afirme que somos importantes e valiosos — e fazemos isso todos os dias, colocando-nos em um tribunal.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Sucesso material e fama', false),
  (v_atv, 2, 'Aprovação dos pais', false),
  (v_atv, 3, 'Um veredicto definitivo que afirme que somos importantes e valiosos', true),
  (v_atv, 4, 'Aprovação dos amigos próximos', false);

  -- K4 ordem 5: metáfora do tribunal
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 5, 'Por que Paulo usa a metáfora do "tribunal" mesmo sabendo que os coríntios não eram um tribunal?', 'multipla_escolha',
   'Para mostrar que o problema da autoestima — alta ou baixa — é que todos os dias nos colocamos em julgamento, buscando um veredicto sobre quem somos.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque a Lei Romana usava essa imagem', false),
  (v_atv, 2, 'Porque era uma piada interna com os coríntios', false),
  (v_atv, 3, 'Para mostrar que todos os dias nos colocamos em julgamento, buscando veredicto sobre quem somos', true),
  (v_atv, 4, 'Porque ele teve experiência judicial recente', false);

  -- K4 ordem 6: outras religiões
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 6, 'Em outras religiões (ateísmo, budismo, islamismo), qual é a relação entre desempenho e veredicto, segundo Keller?', 'multipla_escolha',
   'Em todas essas, é o desempenho que leva ao veredicto — você precisa atuar bem para descobrir que é alguém. Por isso vive todo dia em julgamento.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Não há relação — são sistemas que ignoram veredictos', false),
  (v_atv, 2, 'Veredicto e desempenho são independentes', false),
  (v_atv, 3, 'O desempenho leva ao veredicto — por isso a pessoa vive em julgamento todos os dias', true),
  (v_atv, 4, 'Os veredictos são dados aleatoriamente', false);

  -- K4 ordem 8: base do veredicto positivo
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 8, 'No cristianismo, qual é a BASE do veredicto positivo de Deus sobre o crente?', 'multipla_escolha',
   'É o desempenho perfeito de Cristo, imputado a nós. Quando cremos, Deus nos vê com as ações perfeitas de Cristo, como se fossem nossas.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'O nosso bom comportamento e nossas obras', false),
  (v_atv, 2, 'O desempenho perfeito de Cristo, imputado a nós', true),
  (v_atv, 3, 'Nossa decisão pessoal de seguir Jesus', false),
  (v_atv, 4, 'Os méritos dos nossos antepassados', false);

  -- K4 ordem 9: por que Jesus precisou ser julgado
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 9, 'Por que Jesus precisou ser julgado e condenado, segundo Keller?', 'multipla_escolha',
   'Para nos substituir — Jesus recebeu a condenação que merecíamos e encarou o julgamento que deveria ser nosso, para que não precisássemos enfrentar mais nenhum.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque Ele cometeu pecados que precisavam ser pagos', false),
  (v_atv, 2, 'Para nos substituir — recebeu a condenação que merecíamos', true),
  (v_atv, 3, 'Para ensinar como suportar injustiça com paciência', false),
  (v_atv, 4, 'Para cumprir uma profecia secundária do Antigo Testamento', false);

  -- K4 ordem 10: "Tu és o meu filho amado"
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 10, 'Quando Deus diz ao cristão "Tu és o meu filho amado, em ti me agrado" (Marcos 1.11), o que está acontecendo, segundo Keller?', 'multipla_escolha',
   'Deus está atribuindo ao crente as ações perfeitas de Cristo, como se fossem dele, e adotando-o como filho. O veredicto vem da obra de Cristo, não do desempenho do crente.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Deus está respondendo ao bom desempenho do cristão', false),
  (v_atv, 2, 'Deus está atribuindo ao crente o desempenho perfeito de Cristo e adotando-o como filho', true),
  (v_atv, 3, 'É uma promessa apenas para o futuro, ainda não realizada', false),
  (v_atv, 4, 'Deus está se referindo apenas a Jesus, não ao crente', false);

  -- K4 ordem 11: por que outros sistemas falham
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula4, 11, 'Por que todos os outros sistemas de identidade (não-cristãos) falham, segundo Keller?', 'multipla_escolha',
   'Porque neles o veredicto nunca chega — como Madonna confessou, mesmo no auge do sucesso o desempenho jamais alcança o veredicto supremo que a pessoa busca.')
  returning id into v_atv;
  insert into public.alternativas (atividade_id, ordem, texto, correta) values
  (v_atv, 1, 'Porque seus seguidores são preguiçosos', false),
  (v_atv, 2, 'Porque o veredicto nunca chega — o desempenho jamais alcança o veredicto supremo', true),
  (v_atv, 3, 'Porque eles não têm uma escritura sagrada', false),
  (v_atv, 4, 'Porque dependem de líderes humanos falíveis', false);
end
$mig$;
