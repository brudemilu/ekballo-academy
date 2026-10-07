-- 320_perspectivas_grimes_e_slides_licao6.sql
-- Três coisas: o artigo do Grimes na Lição 7, e os dois materiais da Lição 6
-- (o deck de slides e a cronologia comentada). Mais um conserto de uma palavra
-- colada no Adeney, que já estava no ar.
--
-- O ADENEY NÃO ENTRA DE NOVO. O Bruno mandou o link dele junto, mas o artigo já
-- estava carregado nas Lições 2 e 7 desde antes — conferido pelo início do texto,
-- idêntico ao da captura. O que esta migration faz nele é só desfazer
-- "Construirpontes", que a extração anterior deixou sem o espaço.
--
-- PROCEDÊNCIA DO GRIMES: link do Dropbox com download desabilitado, texto lido do
-- stream do visualizador. Tem camada de texto (Calibri), 4 páginas, sem OCR.
-- Auditoria por conjunto de caracteres: os 73 caracteres ausentes são o cabeçalho
-- corrido "Arti go – De todas as Línguas", que aparece nas páginas 2 a 4 e o
-- detector de cabeçalho remove de propósito; o título da página 1 ficou. Fora um
-- hífen de religação de palavra quebrada, nada de texto se perdeu.
--
-- Ele entra ANTES do Adeney, que é a ordem em que o guia da Lição 7 os chama.
--
-- OS MATERIAIS DA LIÇÃO 6 vieram em três arquivos, e não são a mesma coisa:
--   · "slide 1" é o deck de verdade, 68 páginas em 16:9, sem camada de texto;
--   · "slide 3" é uma imagem solta, também em 16:9;
--   · "slide 2" é um documento A4 de 4 páginas COM texto — material de mão.
-- Juntei o deck com a imagem num PDF só de 69 páginas, porque os dois são de
-- projeção e o modelo de aula aqui tem um anexo por item. A cronologia virou item
-- próprio, com o texto no corpo (dá para ler no celular e entra na busca) e o PDF
-- como anexo.
--
-- O título da cronologia leva "· Leitura —" de propósito: é o prefixo que o
-- sumário trata como subitem da lição. "· Material —" seria lido como guia e
-- apareceria com o destaque errado.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';

  -- Lição 6: duas posições logo após o guia (ordem 52)
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 53;
  update aulas set ordem = ordem - 10000 + 2 where curso_id = cid and ordem >= 10000;

  insert into aulas (curso_id, titulo, conteudo, ordem, material_url)
  values (cid,
    'Lição 6 · Slides — Missões modernas e o Brasil',
    'Apresentação usada para ensinar esta lição. Abra o anexo acima para projetar ou acompanhar.'
    || chr(10) || chr(10) ||
    'Não é leitura do livro: é o material do encontro, na mesma sequência do guia de estudo.',
    53, 'perspectivas/slides-licao-06.pdf');

  insert into aulas (curso_id, titulo, conteudo, ordem, material_url)
  values (cid,
    'Lição 6 · Leitura — Cronologia comentada: o avanço das missões modernas e o papel do Brasil',
    'Cronologia Comentada: O Avanço das Missões Modernas e o Papel do Brasil

1. Introdução: A "Mão de Deus na Luva da História"

A história das missões cristãs não é um mero depósito de fatos isolados ou uma lista árida de datas e nomes; ela é a "História Maior" de Deus em pleno movimento. Como missiólogos e educadores, buscamos enxergar a "mão de Deus na luva da história", compreendendo que existe uma continuidade ininterrupta do propósito divino desde Abraão até o presente momento.

Não estamos apenas revisitando o passado para admirar heróis; estamos reconhecendo que somos herdeiros de uma obra quase completa. Como disse David Livingstone: "Eu vou para abrir o caminho...

continue a obra que comecei". Hoje, recebemos o bastão de gerações que desbravaram o desconhecido para que pudéssemos viver o "crescendo" desta narrativa épica. A tarefa não é apenas um ideal; é um mandato executável que se desenrola há milhares de anos e que nos convoca para o seu capítulo final.

2. O Lento Despertar e o Movimento Morávio

Após a Reforma, o protestantismo viveu um hiato de quase 200 anos sem iniciativas missionárias sustentáveis, em grande parte pela relutância em formar estruturas específicas (sodalidades). O despertar veio através do Movimento Morávio, sob a liderança do Conde Zinzendorf. Eles foram o "elo essencial" que provou que uma comunidade de destino pode realizar o impossível.

As 3 Colunas do Movimento Morávio:

• Oração Ininterrupta: Mantiveram uma vigília de oração que durou 100 anos, iniciada por um compromisso radical que envolvia até as crianças.

• Obediência Sacrificial: Demonstraram disposição para o autossacrifício absoluto, enviando missionários para contextos onde a morte era quase certa.

• Pioneirismo Coletivo: Mostraram que a missão não depende de "estrelas" individuais, mas de um corpo unido em dependência absoluta do Senhor.

Os Morávios prepararam o terreno espiritual e estratégico, demonstrando que o pioneirismo é um esforço conjunto e sacrificial, quebrando a inércia que paralisava o protestantismo.

3. O Panorama das Três Eras Missionárias (Ondas Sucessivas)

O avanço missionário moderno não foi linear, mas ocorreu em "ondas sucessivas". Cada era não substituiu a anterior, mas construiu sobre seus alicerces, expandindo o entendimento da Igreja sobre a

Grande Comissão.

2

Era Início Pioneiro Foco Estratégico Mudança de

Paradigma

Transição Crítica

Primeira 1792 William Carey Litoral (Terras

Costeiras)

Da inércia para as cidades portuárias.

1910 (Edimburgo)

Segunda 1865 Hudson Taylor Interior dos

Continentes

Da costa para o coração geográfico.

1980 (Pattaya/Edimburgo

II)

Terceira 1934 Townsend/McGavran Povos (Etnicidade) Da geografia para barreiras etnolinguísticas.

Em andamento

Nota de Aprendizado: As eras são cumulativas. A Terceira Era refina a tarefa, mas ainda dependemos das bases lançadas pelas anteriores.

4. Primeira Era (1792): A Conquista do Litoral e a Missão do Reino

William Carey, o "Pai das Missões Modernas", foi muito mais que um pregador; ele era um polímata (botânico, linguista e reformador). Carey entendia que o Evangelho deveria transformar toda a sociedade.

1. Tradução e Ciência: Produziu gramáticas e dicionários, unindo o rigor acadêmico à paixão evangelística para que o Evangelho falasse a "língua do povo".

2. Reforma Social (Missão do Reino): Carey combateu males sociais terríveis na Índia, como o Sati (imolação de viúvas) e o infanticídio, provando que o Reino de Deus confronta as trevas sociais.

3. Sodalidades: Criou a Sociedade Batista Missionária, estabelecendo a estrutura necessária para o envio sustentável.

"Espere grandes coisas de Deus, procure fazer grandes coisas para Deus." — William Carey

5. Segunda Era (1865): A Penetração no Interior e as Missões de Fé

Quando o litoral já possuía bases, Hudson Taylor olhou para o vácuo espiritual no interior da China. Ele introduziu o conceito de "missões de fé", dependendo diretamente de Deus para o sustento e focando na identificação cultural (vestindo-se e vivendo como o povo local).

• Modelo de Carey (Denominacional): Estruturas ligadas a igrejas europeias com suporte institucional formal.

3

• Modelo de Taylor (Interdenominacional): Foco na agilidade de campo e recrutamento de pessoas comuns, movidas por uma dependência radical.

As Duas Transições: Ralph Winter explica que entre as eras ocorrem períodos de crise e reorganização.

Na transição para o interior, houve tensão entre agências que queriam a segurança do litoral e pioneiros que buscavam o risco do desconhecido.

6. Terceira Era (1934): A Grande Mudança – De "Aonde?" para "A Quem?"

Esta é a era crucial. O foco estratégico mudou da geografia para a etnicidade. Em vez de perguntar "a que país vamos?", passamos a perguntar "a qual povo vamos?".

• Cameron Townsend (Wycliffe): Focou na tradução bíblica para as "línguas do coração".

• Donald McGavran: Identificou as "Pontes de Deus" (redes sociais e familiares) como o caminho orgânico para o Evangelho.

• Ralph Winter: Unificou esses conceitos em Lausanne (1974), definindo o foco em Povos Não

Alcançados (PNAs).

Quadro Comparativo: O Fluxo do Evangelho

Individualismo Ocidental ("Bridge-Breaker") Movimentos de Povos (Engajamento em Rede)

Conversão como ato isolado; rompe as pontes sociais.

Decisões coletivas através do Oikos (rede de parentesco).

O convertido é "extraído" de sua cultura. O convertido permanece em sua rede, redimindo-a.

Gera comunidades de "estrangeiros" culturais. Gera movimentos indígenas e autênticos.

7. As Quatro Etapas de Desenvolvimento (Missão-Igreja)

Ralph Winter apresenta um framework para a maturidade do campo, onde o sucesso da missão é medido pela sua capacidade de se tornar desnecessária.

1. Pioneiro: A agência lidera tudo; não há igreja local.

2. Pai (Paternalismo): O missionário atua como tutor. Risco: Gerar dependência permanente.

3. Parceiro: Liderança compartilhada entre estrangeiros e nacionais. Esta é a transição mais difícil.

4. Participante: A igreja local assume o protagonismo; a missão deve "saber morrer" ou retirar-se para que o movimento floresça.

4

Insight: O objetivo final é a redundância do missionário. Se a missão não planeja sua saída, ela atrofia a igreja que deveria fortalecer.

8. As Mulheres e o Sul Global: A Nova Força Missionária

O eixo missionário deslocou-se irreversivelmente. Hoje, a força missionária é predominantemente feminina e provém do Sul Global (África, Ásia e América Latina).

• A Excelência Feminina: Desde a Segunda Era, as mulheres inovaram para acessar contextos onde homens eram barrados. Em regiões de segregação (como na Janela 10/40), elas são o único ponto de entrada para alcançar 50% da população.

• O Brasil na História: O Brasil deixou de ser "campo" para se tornar um centro de envio estratégico. Nossa vantagem competitiva é a flexibilidade cultural e resiliência, permitindo-nos atuar como parceiros equitativos em lugares onde o Ocidente enfrenta resistência.

9. Conclusão: A Glória do Impossível

Estamos vivendo o "crescendo" de uma tarefa terminável. O mundo está quase evangelizado, e o que resta são os campos mais difíceis. Samuel Zwemer chamou isso de "A Glória do Impossível". Ele argumentava que o impossível não é apenas viável, mas imperativo, porque o nosso "Comandante-em-

Chefe" está conosco.

A história das missões não é sobre o que os homens fizeram, mas sobre como Deus usou a fidelidade estratégica de pessoas comuns para completar Seu plano eterno. Você não é apenas um estudante desta cronologia; você é o herdeiro convocado para escrever os parágrafos finais.

O impossível se torna imperativo quando cremos que o Rei Jesus está presente. Qual será o seu papel no capítulo final desta história?',
    54, 'perspectivas/cronologia-licao-06.pdf');
end $$;

do $$
declare cid uuid; pos int;
begin
  select id into cid from cursos where slug = 'perspectivas';
  -- o Grimes entra imediatamente antes do Adeney da Lição 7
  select a.ordem into pos from aulas a
   where a.curso_id = cid and a.titulo like 'Lição 7 · Leitura — Adeney%';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= pos;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;

  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (cid, 'Lição 7 · Leitura — Grimes: De todas as Línguas', 'De todas as Línguas

Barbara F. Grimes

Barbara F. Grimes é membro da Wycliffe Bible Translators (Tradutores Bíblicos da Wycliffe) desde 1951. Ela trabalhou com seu marido entre os índios Huichol do México, onde produziram o Novo Testamento em Huichol e outras literaturas. Foi editora do Ethnologue: Languages of the World de 1971 a 2000. Desde 1988, ela e o marido traduzem as Escrituras com falantes do Pidgin havaiano para essa língua. Texto adaptado de "‘Reached'' Without Scripture?" Internati onal Journal of Fronti er Missions, 7:2, pp. 41-47. Diagrama adaptado da Bible Translati on Update, Wycliffe Bible Translators 12:2. Uti lizado com permissão da IJFM e do autor.

Depois disso olhei, e diante de mim estava uma grande multi dão que ninguém podia contar, de todas as nações, tribos, povos e línguas, de pé, diante do trono e do Cordeiro.

—Apocalipse 7:9

Fomos ordenados a fazer discípulos de todos os povos. Para isso, todo comunicador do evangelho — evangelista, professor, obreiro de desenvolvimento ou plantador de igreja — faz escolhas sobre qual idioma usará para o ministério. Muitas vezes a escolha de qual idioma usar é feita com base no que é mais fácil para o comunicador em vez do que comunica melhor aos ouvintes.

Realizar um ministério na língua materna dos ouvintes é obviamente mais eficaz. Mas para o ministério que realmente atinge povos não alcançados, o ministério na língua materna não é apenas valioso, é crucial. A necessidade do ministério e uso das Escrituras na língua materna torna-se clara ao olhar para o tipo de discípulos e igrejas que gostaríamos de ver.

Fazendo discípulos na língua materna

Muito do que um discípulo é ordenado a fazer envolve o idioma. Ser um discípulo de Jesus Cristo envolve conhecê-Lo pessoalmente. Isso requer compreensão adequada das boas novas e da Palavra de Deus. A compreensão e o conhecimento são repetidamente enfatizados em toda Escritura. O Apóstolo Paulo disse que era sua responsabilidade tornar a mensagem clara (Cl 4:4).

Mas ser discípulo envolve mais do que compreensão passiva. Um discípulo recebe a ordem de testemunhar sua fé, encorajar outros cristãos, exortar aqueles que precisam, orar, louvar, agradecer, cantar, memorizar a Palavra de Deus, ensinar seus próprios filhos, ensinar os mais jovens, instruir uns aos outros e meditar. Os discípulos exercitam dons do Espírito que envolvem comportamento verbal como comunicar sabedoria, transmitir conhecimento, profecia, interpretação de línguas, cumprir as funções de mensageiros nomeados, e ser evangelistas, pastores e mestres. Espera-se que algumas pessoas leiam as Escrituras publicamente, ensinem, preguem e interpretem qualquer língua estrangeira usada na igreja.

A língua materna é a língua que as pessoas aprendem primeiro no colo de sua mãe, na qual aprendem a pensar e falar sobre o mundo ao seu redor, interagir com as pessoas mais próximas, adquirir e expressar seus valores. É a linguagem que se torna parte de sua personalidade e identidade, e que expressa sua etnicidade e solidariedade a seu povo. As pessoas podem lidar com as habilidades verbais necessárias para a compreensão adequada das boas novas e para atuar como um discípulo em sua língua materna; a questão é se eles conseguem ou não fazer essas coisas em uma segunda língua.

Plantando Igrejas que Duram

É possível plantar igrejas sem a clareza da língua materna, mas é quase nunca desejável. Sem as Escrituras na língua materna, as igrejas não são capazes de sustentar a profundidade espiritual nas gerações seguintes. Elas têm dificuldade em responder a falsos ensinamentos, travar uma batalha espiritual e evitar o sincretismo. Muitos dentro ou fora da igreja falham em reconhecer que o Deus cristão é o Deus universal a quem todos devem responder. Não é diticil ver por que as igrejas sem isso não são apenas impedidas de alcançar os outros em sua própria comunidade, elas muitas vezes não têm uma visão para obedecer ao chamado missionário de Deus para ir a outro lugar.

Duas abordagens muitas vezes tiram a atenção dos comunicadores do evangelho de fazerem o trabalho mais diticil e duradouro para fazer discípulos na língua materna local: primeiro, em situações multilíngues há uma percebível possibilidade de transmitir as boas novas adequadamente em uma segunda língua, e em segundo lugar, há muitas vezes uma esperança de que os intérpretes bilíngues locais levem a mensagem para os outros dentro de sua comunidade.

Populações Multilíngues

Um estudo cuidadoso de como diferentes línguas são usadas em sociedades multilíngues tem fornecido compreensão importante aos socio-linguistas nas últimas décadas. Pessoas multilíngues usam cada uma de suas línguas em diferentes circunstâncias com pessoas diferentes para falar sobre diferentes assuntos. Isso é feito com diferentes graus de sucesso na fala, compreensão e com diferentes conotações psicológicas. É importante para aqueles que querem comunicar a mensagem mais importante do mundo que estejam cientes desses fatores, para que ambos comunicadores e suas mensagens não sejam mal interpretados ou rejeitados.

A segunda língua é aprendida em determinadas situações e depende da quantidade e tipo de contato que um indivíduo tem com ela, seu desejo e necessidade de aprendêla. Assim, há diferenças de fluência em uma população. Não é possível julgar a proficiência bilíngue de uma população olhando apenas para uma pequena amostra da população. É necessário investigar como grupos de diferentes idades, sexos, regiões e níveis educacionais usam seus idiomas e estudar quaisquer outros fatores que possam influenciar o contato com a segunda língua nessa cultura. A importância de alcançar a todos para Cristo, incluindo mulheres, idosos, pessoas sem estudo e em áreas remotas, justi fica o tempo e o esforço necessários para conduzir uma investigação confiável dessas diferenças.

Trabalhando com intérpretes bilíngues locais

Muitas vezes, os esforços missionários ansiosos buscam uma comunicação rápida, transmitindo a mensagem através de uma pessoa bilíngue. Essa abordagem, usada extensivamente em missões com resultados duvidosos, tem sido chamada de "modelo intérprete". Nesse modelo, uma pessoa bilíngue ouve a mensagem ou lê as Escrituras em sua segunda língua e, em seguida, espera-se que transfira o significado para sua língua materna em beneticio daqueles que não entendem a outra língua. Infelizmente, poucas pessoas são capazes de fazer esse tipo de transferência sem um extensivo treinamento e experiência nessa habilidade. A maioria dos falantes bilíngues de línguas minoritárias aprendeu sua segunda língua através do contato oral direto fora de uma sala de aula e não tem treinamento em transferência de idiomas.

As Escrituras estão frequentemente disponíveis para essas igrejas apenas em uma segunda língua. Esse modelo evita ter que traduzir as Escrituras para a primeira língua, mas supõe que as paráfrases espontâneas das Escrituras são adequadas. Não há garantia de que tais paráfrases improvisadas feitas repetidamente por vários falantes em diferentes situações sejam de todo corretas. O modelo intérprete muitas vezes resulta em uma elite bilíngue na igreja sendo os únicos elegíveis para se tornarem líderes. Outros a quem Deus possa ter dado os dons do ensino, pregação e outros dons que envolvem o uso da linguagem podem ser dificultados pela falta de proficiência bilíngue suficiente para atuar na segunda língua.

De todas as línguas

Os sábios comunicadores das boas novas trabalharão para resultados duradouros. Eles farão o trabalho desafiador de avaliação linguística e tradução bíblica. Eles farão esse trabalho diticil com as pessoas em mente e com o resultado em vista. Eles se esforçarão para levar o evangelho a cada povo em um idioma que eles não apenas entendem, mas que o povo usará para se tornar discípulos maduros, edificar a igreja, espalhar as boas novas e adorar a Deus de maneiras significativas para seu próprio povo. Não basta algumas pessoas entenderem parte da mensagem. Para Deus ouvir Seu louvor falado por igrejas pujantes "de todas as línguas", Seus comunicadores devem realizar a importante obra de trazer a palavra de Deus de uma maneira que fale aos seus corações e lares em todas as línguas.

Tradução da Bíblia: Quantas línguas faltam?

Em 1951, o Etnologue foi criado para tentar descobrir onde as traduções da Bíblia ainda eram necessárias. Em 1974, a pesquisa progrediu para que todas as línguas conhecidas do mundo fossem incluídas.

Quantas línguas ainda precisam de tradução da Bíblia em 2008? Pesquisas linguísticas ainda são necessárias em aproximadamente 2.500 idiomas para poder responder a essa pergunta. As pesquisas frequentemente descobrem línguas adicionais que não foram reconhecidas ou incluídas anteriormente. Experiências passadas mostram que cerca de 5 em cada 6 pesquisadas precisam de tradução da Bíblia.

Não basta que as pessoas tenham apenas um livro das Escrituras para se tornarem discípulos maduros. Com mais de 5.000 idiomas sem uma Bíblia ou Novo Testamento em uma língua que fala claramente com eles, ainda há uma enorme tarefa de tradução diante de nós para dar a cada povo acesso à Palavra de Deus.

Idiomas com acesso às Escrituras

Bíblias completas Apenas Novos Testamentos Apenas Partes Línguas sem qualquer porção da Bíblia

Traduções das Escrituras concluídas através da história

Um ou mais Livros Inteiros Publicados Bíblias ou Novos Testamentos Publicados

Fontes: Acesso às Escrituras – Wycliffe Bible Translators, Offi ce of Language Informati on Systems Scripture Translati ons Completed Through History - Internati onal. Lupas, Liana, e Erroll F. Rhodes, eds. 1996. Scriptures of the World. Reading, England: United Bible Societi es. Atualizado da United Bible Society 2004 Scripture Language Report', pos);
end $$;

-- conserto da palavra colada nas duas cópias do Adeney
update aulas a
   set conteudo = replace(conteudo, 'Construirpontes', 'Construir pontes')
  from cursos c
 where c.id = a.curso_id and c.slug = 'perspectivas'
   and a.titulo like '%Adeney: Deus é daltônico%'
   and a.conteudo like '%Construirpontes%';

commit;
