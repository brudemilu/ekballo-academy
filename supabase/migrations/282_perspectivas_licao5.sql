-- 282_perspectivas_licao5.sql
-- Lição 5: a leitura enviada (Woodberry, "O impacto das missões cristãs").
-- Não veio o guia de estudo desta lição nem as demais leituras dela.
--
-- Transcrição literal, conferida por contagem de caracteres contra a fonte:
-- nenhuma letra falta, nenhum hífen religado, nenhum número de página a menos.
-- Idempotente.

do $curso$
declare
  v_curso uuid;
begin
  select id into v_curso from cursos where slug = 'perspectivas';
  if v_curso is null then
    raise exception 'curso perspectivas não existe';
  end if;

  if exists (select 1 from aulas a where a.curso_id = v_curso and a.ordem = 26) then
    update aulas set titulo = $t$Lição 5 · Leitura — Woodberry: O impacto das missões cristãs$t$, conteudo = $conteudo$O impacto das missões cristãs

Robert D. Woodberry

Atualmente, há muita controvérsia sobre missões. Parte dessa reação está relacionada a tendências recentes, como a resposta às violências às missões no Oriente Médio, na Índia e em outros lugares. Grande parte da controvérsia, no entanto, é simplesmente o ressurgimento de uma percepção popularsobre missões que caracteriza o movimento missionário como o servo do colonialismo e um inimigo existencial das culturas locais. O problema com essas conotações imperiais das missões, entretanto, é que elas geralmente se baseiam em romances, filmes, anedotas e impressões subjetivas. Mesmo quando as anedotas podem ser confirmadas, elas geralmente fazem pouco mais do que reforçar as suposições preexistentes da pessoa. O que está faltando é um exame abrangente e equilibrado das amplas evidências históricas e estatísticas sobre o efeito cumulativo médio das missões.

Os missionários têm ajudado ou prejudicado?

Para fazer esse exame, eu (juntamente com uma equipe de alunos) compilei dados sobre a atividade missionária protestante e católica do início do século XIX até meados do século XX e analisei cuidadosamente a pesquisa histórica atual sobre missões. Identificamos padrões no registro histórico e comparamos as condições em locais onde os missionários eram mais predominantes com as condições em locais onde eles eram menos predominantes ou não iam. Isso nos ajudou a mediros efeitos sociais das missões. Se os missionários prejudicaram principalmente as culturas para onde iam, esperaríamos que as condições fossem piores onde os missionários tivessem mais influência, mas descobrimos exatamente o contrário. Neste

Robert D. Woodberry é professor assistente de sociologia na Universidade do Texas em Austin e diretor do Project on Religion and Economic Change. Ele pesquisa as causas de longo prazo da democracia e do desenvolvimento econômico em países fora da Europa, dando atenção especial ao papel dos missionários e de outros grupos religiosos. .

capítulo, primeiro se discutem as evidências históricas e, depois, como essa história moldou o bem-estar de longo prazo das sociedades.

Os missionários promoveram a educação em massa, a impressão e a medicina ocidental

Na maioria dastradições religiosas, os leigos podem participar plenamente da vida religiosa sem saber ler. Isso não é verdade para os protestantes. Os missionários protestantes queriam que as pessoas lessem a Bíblia em seu próprio idioma. Assim, onde quer que fossem, eles rapidamente desenvolveram formas escritas de linguagem oral, criavam fontes, importavam tecnologia de impressão e imprimiam Bíblias, folhetos e livros didáticos. Nesse processo, criaram a forma escrita da maioria dos idiomas, muitasvezes introduziram as primeiras prensas de impressão e, em geral, imprimiram os primeiros jornais e livros didáticos. Eles também patrocinaram a alfabetização em massa e foram especialmente importantes na educação de mulheres, não elites e escravos.

Os governos coloniais, os colonos e os empresários geralmente desconfiavam da educação em massa. Eles preferiam lidarcom uma elite pequena e instruída que pudessem controlar. Eles achavam que os outros deveriam ser educados apenas em habilidades práticas, como alvenaria e carpintaria. Por exemplo, no Sudeste Asiático, os franceses fecharam as escolas indígenas, barraram a educação protestante e impediram que os asiáticos do Sudeste Asiático recebessem educação em outros países. Como política explícita, eles educaram apenas o número de pessoas além do ensino fundamental que pudessem contratar para o governo colonial. Antes do lobby missionário, os britânicos também não investiam na educação em massa. Nas áreas em que os britânicos conseguiram manter os missionários fora - por exemplo, no interiorda Nigéria, na Somalilândia Britânica, no Nepal enas Maldivas - eles educaram, no máximo, alguns filhos da elite existente.

A educação missionária protestante fez com que outros grupos religiosos também oferecessem educação em massa. Quando competiam com os protestantes, os missionários católicos educavam de forma ampla e geralmente tinham as melhores escolas. Entretanto, antes do Concílio Vaticano II, em 1965, ou quando estavam isolados da concorrência protestante, eles investiam predominantemente em escolas para padres e para a elite. Os hindus, os muçulmanos e os budistas eram semelhantes.

Se os missionários prejudicassem as culturas, esperaríamos que as condições fossem piores onde eles tivessem mais influência, mas descobrimos exatamente o contrário.

Os primeiros esforços missionários demonstraram os benefícios econômicos da educação e, assim, estimularam a demanda. Os missionários também escreveram e traduziram livros, construíram prédios e treinaram professores, o que facilitou a expansão educacional futura. Os governos pós-coloniais geralmente nacionalizavam as escolas das missões para criar um sistema educacional administrado pelo Estado. A criação de um sistema educacional de alta qualidade exige muito tempo e dinheiro. Portanto, os países em que esse processo começou mais cedo e de forma mais ampla tiveram uma vantagem decisiva. Mesmo quando analisamos as regiões do mundo com taxas de alfabetização pré-coloniais semelhantes, assub-regiões que tiveram mais atividade missionária protestante têm maior alfabetização atualmente (por exemplo, na África Ocidental, Oceania e Oriente Médio). Esse mesmo padrão se aplica quando comparamos a educação entre regiões do mesmo país (por exemplo, Índia, Nigéria e Gana).

As missões protestantes também foram o principal fatorque estimulou a impressão em massa em nível internacional. Porexemplo, a maioria das sociedades da Ásia e do norte da África tinha material impresso em seus próprios idiomas e foi exposta a impressoras em funcionamento por estrangeiros e minorias por duzentos ou trezentos anos antes de imprimir qualquer coisa. Inicialmente, judeus e missionários católicos imprimiram pequenas quantidades de textos. Mais tarde, as empresas comerciais e os governos coloniais imprimiram tratados e documentos administrativos, mas também ninguém os copiou. Em praticamente todos os casos, os povos indígenas começaram a imprimir somente em resposta à impressão em massa feita por missionários protestantes. Porexemplo, em 32 anos após sua chegada, os primeiros missionários protestantes britânicos na Índia imprimiram mais de 212.000 livros em 40 idiomas. Isso estimulou os muçulmanos eos hindus a fazerem o mesmo.

Mesmo na China e na Coreia - sociedades que tinham fontes metálicas móveis antes da Europa - os missionários protestantes e seusconvertidos imprimiam os primeiros jornais e alteravam radicalmente a disponibilidade de textos. Isso produziu uma revolução tanto na impressão quanto na educação de não elites. A fonte da mudança não foi o conhecimento da tecnologia ou o crescimento econômico, mas uma ideia radicalmente diferente sobre quem deveria ler e ter acesso aos textos. Sem o catalisador das ideias religiosas, os mercados prósperos e o conhecimento tecnológico não foram suficientes para estimular a educação em massa ou a impressão em massa.

Os missionários também foram fundamentais para adisseminaçãoda medicina ocidental, da educação médica e das organizações voluntárias de reforma social. Os missionários introduziram novas culturas, novas habilidades técnicas e novas ideias sobre política e economia. Tratei dessas e de outras questões com mais detalhes em outros artigos.

Durante o século XIXe o início do século XX, os missionários foram criticados com mais frequência por terem uma opinião muito elevada sobre ospovos indígenas, especialmente por antropólogos.

Missionários mobilizaram a reforma colonial

Os missionários são frequentemente acusados de uma estreita associação com os estados coloniais. Às vezes, isso eraverdade, principalmente nas colônias em que o Estado controlava as nomeações e as finanças dos missionários. Entretanto, quando os missionários eram independentes do controle direto do Estado, eles se comportavam deforma diferente. De fato, os missionários não-estatais foram fundamentais para a maioria dos principais movimentos de reforma colonial.

A maioria dos missionários não era fortemente anticolonial. Eles estavam dispostos a conviver com formas moderadas de colonialismo e não estavam preocupados principalmente com a política. Entretanto, os abusos coloniais enfureciam a população local contra o Ocidente - que muitos associavam ao cristianismo - e, portanto, dificultavam o trabalho dos missionários. Os escritos dos missionários estão repletos de reclamações sobre como os abusos coloniais minaram seus melhores esforços. Assim, os missionários tinham (1) incentivos para combater os abusos coloniais, (2) equipes e pessoas em todo o mundo que recebiam relatos dos abusos, (3) uma base de apoiadores em muitos países colonizadores e (4) uma rede maciça de mídia religiosa para mobilizar os fiéis contra as políticas que prejudicavam os interesses da missão e que feriam as pessoas que eles haviam aprendido a amar. Assim, os missionários foram fundamentais para as campanhas contra a escravidão e o trabalho forçado, o surgimento de programas de ajuda externa, a criação de organizações internacionais de assistência, a proibição do comércio de ópio, a proteção dos direitos indígenas à terra e muitasoutras reformas.

Os missionários resistiram às visões "científicas" sobre raça

Uma das críticas mais recorrentes contra os missionários é seu etnocentrismo. Os missionários do século XIX e do início do século XXeram produtos de uma época em que tanto cristãos quanto pessoas do mundo secular assumiam a superioridade da civilização ocidental. A literatura missionária histórica geralmente enfatizava problemas com outras culturase religiões de uma forma que muitos leitores modernos consideram desagradável. No entanto, isso deve servisto em comparação com o racismo "científico" que floresceu no meio acadêmico e entre os colonizadores europeus nessa época. As principais críticas missionárias a outros povos eram culturais e religiosas, não raciais. William Carey argumentou que os britânicos haviam sido bárbaros antes da chegada do cristianismo e que o evangelho poderia transformar outras culturas da mesma forma que havia transformado a Inglaterra.

Durante o século XIX e início do século XX, os missionários eram mais frequentemente criticados porterem uma opinião muito elevada sobre os povos indígenas do que o contrário, especialmente pelos antropólogos. Porexemplo, James Hunt - que cunhou a palavra "antropologia", fundou a primeira sociedade antropológica e editou as duas primeiras revistas antropológicas - argumentou que os povos de pele escura eram uma espécie diferente, mentalmente inferior aos brancos e não podiam ser "civilizados" por meio da educação. Ele argumentou que os antropólogos tinham que lutarcontra os missionários para estabelecer sua disciplina. No volume de 1866 da Anthropological Review, ele escreveu:

Nesse esforço para recomendar a Antropologia a uma aceitação mais geral, não devemos esconder de nós mesmos que duas grandes escolas são, em princípio, decididamente opostas às nossas pretensões. Esses dois partidos influentes... concordam cordialmente em desdenhar e até mesmo denunciar as verdades da Antropologia. Eles fazem isso porque essas verdades se opõem diretamente ao seu princípio fundamental de igualdade absoluta e original entre a humanidade. Os partidos aos quais nos referimos são os ortodoxos e, mais especialmente, o corpo evangélico, na religião, e o partido ultraliberal e democrático na política. O artigo é mais depreciativo e racista, mas o trecho acima deve servir. Muitos antropólogos modernos e seculares ainda têm tensões com os missionários, mas por motivos muito diferentes. Entretanto, ao criticar as atitudes etnocêntricas dos missionários, seria mais útil compará-las com outras de sua época (por exemplo, os primeiros antropólogos) do que com os padrões de hoje. Fazer o contrário é seu próprio tipo de etnocentrismo. Como escreve o historiador de Harvard,

William Hutchison, "Se, de um ponto de vista moderno, a sensibilidade às culturas estrangeiras era deficiente, os missionários [do século XIX e do início do século XX] eram consideravelmente superiores, nesse aspecto, à maioria dos contemporâneos no país ou no exterior" (Hutchison 1987:1).

As sociedades em que os missionários protestantes chegaram mais cedo e eram mais predominantes acabaram se saindo melhorem todos os indicadores de prosperidade humana.

O que é o efeito cumulativo?

Alguém pode se perguntarse, na discussão acima, eu apenas selecionei anedotas e fiz generalizações que se encaixam em minhas pressuposições. Talvez outros possam selecionar anedotas e fazer generalizações que façam os missionários parecerem muito piores. Como podemos avaliarqual foi o efeito médio e cumulativo das missões? Uma maneira é por meio de estatísticas.

Do ponto de vista estatístico, as sociedades em que os missionários protestantes chegaram mais cedo e foram mais predominantes acabaram em melhor situação em todos os indicadores de prosperidade humana que estudei: alfabetização, matrícula educacional, mortalidade infantil, expectativa de vida, desenvolvimento econômico, corrupção e democracia política. Esses resultados são consistentes tanto entre países quanto entre diferentes regiões do mesmo país (porexemplo, Índia, China, Nigéria, Gana). Se o efeito principal das missões tivesse sido destrutivo, não esperaríamos isso.

As estatísticas a seguir ilustram essas afirmações. Para os países do Sul Global, cada missionário adicional por 10.000 habitantes em 1923 está associado a uma média de 4,3 pontos percentuais a mais de matrículas educacionais entre 1960 e 1985 e 1,3 anos a mais de expectativa de vida em 2000 (sem controles estatísticos). Da mesma forma, nas províncias da Índia, cada missionário adicional por 10.000 habitantes em 1923 está associado a 1,1 ponto percentual a mais de alfabetização em 2001, etc. A prevalência histórica de missionários protestantes também está associada à democracia e a outros resultados. Minha pesquisa sugere que as missões protestantes explicam cerca de metade da variação da democracia no Sul Global e eliminam o efeito da maioria dos outros fatores que se acredita preverem a democracia.

Demonstrar que os missionários causaram esses resultados positivos é mais difícil do que mostrar as associações estatísticas. Talvez os missionários estivessem mais propensos a ir para lugares quejá estavam em melhores condições. Por exemplo, e se a maioria dos missionários fosse para climas saudáveis? Nesse caso, a saúde atual desses lugares não indicaria um benefício trazido pelo trabalho missionário. Assim, para isolaro impacto das missões protestantes no desenvolvimento, apliquei controles estatísticos relacionados ao clima, à geografia, à prevalência de doenças, aos colonizadores, ao assentamento europeu e às condições pré-coloniais. Nenhum desses controles removeu os vínculos positivos, e os coeficientes no parágrafo anterior são o que restou depois que apliquei esses controles. A associação entre missões e várias formas de bem-estaré extremamente robusta.

As localizações espaciais desses resultados positivos também são reveladoras. Na Nigéria, os britânicos impediram que os missionários entrassem em territórios no norte e a alfabetização é mais baixa lá do que na costa. No Quênia, os missionários foram restringidos perto da costa e a alfabetização é maior no interior. Na Índia, a alfabetização é mais alta em Kerala, Nagaland, Mizoram e Goa - regiões que não têm quase nada em comum, exceto a prevalência de cristãos e a histórica atividade missionária. Os povos de Nagaland e Mizoram eram caçadores-coletores sem linguagem escrita antes do contato missionário no final do século XIX. Portanto, independentemente de como se avalia a influência geral do colonialismo, do imperialismo e das atuais corporações multinacionais no Sul Global, os países afetados estariam em situação muito piorse os missionários não estivessem presentes e engajados.

Notas finais

1. Saiba mais sobre o Projeto sobre Religião e Mudança Econômica em www.prec-online.com.

2. Consulte Woodberry 2004 e 2006 para obter mais detalhes sobre estudos em diferentes áreas da prosperidade humana.

3. A associação entre as missões católicas do século XIX e início do século XX e esses resultados é pequena (ou seja, não é estatisticamente significativa). Isso parece ser devido ao fato de que, antes do Concílio Vaticano II (1965), as missões católicas tinham maior probabilidade de estar sob controle do Estado e eram menos propensas a investir em educação em massa, etc., a menos que estivessem competindo com os protestantes. 5. Nas regressões discutidas nesta seção, controlei o colonizador, a latitude, o fato de ser uma ilha, o fato de não ter território, a porcentagem de europeus, a porcentagem de muçulmanos, o fato de ter um idioma escrito antes do contato missionário e o fato de ser um grande produtor de petróleo. Para as regressões relacionadas à democracia, também controlei 24 variáveis adicionais relacionadas ao clima, à mortalidade colonial e ao processo de exploração e colonização europeia. Os coeficientes discutidos no texto deste artigo são líquidos desses controles; a porcentagem de variação explicada (R-quadrado) é sem controles.

4. Para saber mais sobre como os missionários influenciaram os movimentos de reforma colonial e a política externa, consulte Woodberry (2004; 2006);

Etherington (2005); Grant (2005); Turner (1998) e Oddie (1978). Para saber mais sobre o abolicionismo imediato, consulte Turner (1998) e Woodberry (2006). Para saber mais sobre a reforma agrária na Índia, consulte Oddie (1978). Para saber mais sobre campanhas de combate ao trabalho forçado, consulte Woodberry (2004) e Grant (2005).

Referências

1. Etherington, Norman (ed.). 2005. Missions and Empire [Missões e Império].

Nova York: Oxford University Press.

2. Grant, Kevin. 2005. A Civilised Savagery: Britain and New Slaveries in Africa,

1884-1926. Nova York: Routledge.

3. William R. Hutchison. 1987. Errand to the World: American Protestant Thought and Foreign Missions [Pensamento Protestante Americano e Missões

Estrangeiras]. Chicago: University of Chicago Press.

4. Oddie, Geoffrey A. 1978. Social Protest in India: British Protestant Missionaries and Social Reforms 1850-1900 [Protesto Social na Índia: Missionários

Protestantes Britânicos e Reformas Sociais 1850-1900]. Columbia, MO: South

Asia Books.

5. Turner, Mary, 1998. Slaves and Missionaries [Escravos e Missionários].

Kingston, Jamaica: University of the West Indies Press.

6. Woodberry, Robert D. 2004. The Shadow of Empire: Christian Missions,

Colonial Policy and Democracy in Post-Colonial Societies [Missões Cristãs,

Política Colonial e Democracia em Sociedades Pós-Coloniais]. Dissertação de doutorado, Universidade da Carolina do Norte, Chapel Hill.

7. 2006. "Reclaiming the M-Word: The Consequences of Missions for Nonwestern

Societies". The Review of Faith and International Affairs [Revista de Fé e

Assuntos Internacionais]. 4(1): 3-12.

Perguntas de estudo

1. O artigo de Woodberry descreve maneiras pelas quais as missões cristãs tiveram um impacto social positivo nas sociedades. Quais são cinco das contribuições mais significativas feitas pelos missionários? 2. Woodberry menciona um ressurgimento da percepção de que o movimento missionário tem sido o servo do colonialismo e o inimigo das culturas indígenas. Como esse artigo mostra que o oposto é verdadeiro? 3. Os missionários do século XIX e do início do século XX eram etnocêntricos? Explique sua resposta.$conteudo$
     where curso_id = v_curso and ordem = 26;
  else
    insert into aulas (curso_id, titulo, conteudo, ordem)
    values (v_curso, $t$Lição 5 · Leitura — Woodberry: O impacto das missões cristãs$t$, $conteudo$O impacto das missões cristãs

Robert D. Woodberry

Atualmente, há muita controvérsia sobre missões. Parte dessa reação está relacionada a tendências recentes, como a resposta às violências às missões no Oriente Médio, na Índia e em outros lugares. Grande parte da controvérsia, no entanto, é simplesmente o ressurgimento de uma percepção popularsobre missões que caracteriza o movimento missionário como o servo do colonialismo e um inimigo existencial das culturas locais. O problema com essas conotações imperiais das missões, entretanto, é que elas geralmente se baseiam em romances, filmes, anedotas e impressões subjetivas. Mesmo quando as anedotas podem ser confirmadas, elas geralmente fazem pouco mais do que reforçar as suposições preexistentes da pessoa. O que está faltando é um exame abrangente e equilibrado das amplas evidências históricas e estatísticas sobre o efeito cumulativo médio das missões.

Os missionários têm ajudado ou prejudicado?

Para fazer esse exame, eu (juntamente com uma equipe de alunos) compilei dados sobre a atividade missionária protestante e católica do início do século XIX até meados do século XX e analisei cuidadosamente a pesquisa histórica atual sobre missões. Identificamos padrões no registro histórico e comparamos as condições em locais onde os missionários eram mais predominantes com as condições em locais onde eles eram menos predominantes ou não iam. Isso nos ajudou a mediros efeitos sociais das missões. Se os missionários prejudicaram principalmente as culturas para onde iam, esperaríamos que as condições fossem piores onde os missionários tivessem mais influência, mas descobrimos exatamente o contrário. Neste

Robert D. Woodberry é professor assistente de sociologia na Universidade do Texas em Austin e diretor do Project on Religion and Economic Change. Ele pesquisa as causas de longo prazo da democracia e do desenvolvimento econômico em países fora da Europa, dando atenção especial ao papel dos missionários e de outros grupos religiosos. .

capítulo, primeiro se discutem as evidências históricas e, depois, como essa história moldou o bem-estar de longo prazo das sociedades.

Os missionários promoveram a educação em massa, a impressão e a medicina ocidental

Na maioria dastradições religiosas, os leigos podem participar plenamente da vida religiosa sem saber ler. Isso não é verdade para os protestantes. Os missionários protestantes queriam que as pessoas lessem a Bíblia em seu próprio idioma. Assim, onde quer que fossem, eles rapidamente desenvolveram formas escritas de linguagem oral, criavam fontes, importavam tecnologia de impressão e imprimiam Bíblias, folhetos e livros didáticos. Nesse processo, criaram a forma escrita da maioria dos idiomas, muitasvezes introduziram as primeiras prensas de impressão e, em geral, imprimiram os primeiros jornais e livros didáticos. Eles também patrocinaram a alfabetização em massa e foram especialmente importantes na educação de mulheres, não elites e escravos.

Os governos coloniais, os colonos e os empresários geralmente desconfiavam da educação em massa. Eles preferiam lidarcom uma elite pequena e instruída que pudessem controlar. Eles achavam que os outros deveriam ser educados apenas em habilidades práticas, como alvenaria e carpintaria. Por exemplo, no Sudeste Asiático, os franceses fecharam as escolas indígenas, barraram a educação protestante e impediram que os asiáticos do Sudeste Asiático recebessem educação em outros países. Como política explícita, eles educaram apenas o número de pessoas além do ensino fundamental que pudessem contratar para o governo colonial. Antes do lobby missionário, os britânicos também não investiam na educação em massa. Nas áreas em que os britânicos conseguiram manter os missionários fora - por exemplo, no interiorda Nigéria, na Somalilândia Britânica, no Nepal enas Maldivas - eles educaram, no máximo, alguns filhos da elite existente.

A educação missionária protestante fez com que outros grupos religiosos também oferecessem educação em massa. Quando competiam com os protestantes, os missionários católicos educavam de forma ampla e geralmente tinham as melhores escolas. Entretanto, antes do Concílio Vaticano II, em 1965, ou quando estavam isolados da concorrência protestante, eles investiam predominantemente em escolas para padres e para a elite. Os hindus, os muçulmanos e os budistas eram semelhantes.

Se os missionários prejudicassem as culturas, esperaríamos que as condições fossem piores onde eles tivessem mais influência, mas descobrimos exatamente o contrário.

Os primeiros esforços missionários demonstraram os benefícios econômicos da educação e, assim, estimularam a demanda. Os missionários também escreveram e traduziram livros, construíram prédios e treinaram professores, o que facilitou a expansão educacional futura. Os governos pós-coloniais geralmente nacionalizavam as escolas das missões para criar um sistema educacional administrado pelo Estado. A criação de um sistema educacional de alta qualidade exige muito tempo e dinheiro. Portanto, os países em que esse processo começou mais cedo e de forma mais ampla tiveram uma vantagem decisiva. Mesmo quando analisamos as regiões do mundo com taxas de alfabetização pré-coloniais semelhantes, assub-regiões que tiveram mais atividade missionária protestante têm maior alfabetização atualmente (por exemplo, na África Ocidental, Oceania e Oriente Médio). Esse mesmo padrão se aplica quando comparamos a educação entre regiões do mesmo país (por exemplo, Índia, Nigéria e Gana).

As missões protestantes também foram o principal fatorque estimulou a impressão em massa em nível internacional. Porexemplo, a maioria das sociedades da Ásia e do norte da África tinha material impresso em seus próprios idiomas e foi exposta a impressoras em funcionamento por estrangeiros e minorias por duzentos ou trezentos anos antes de imprimir qualquer coisa. Inicialmente, judeus e missionários católicos imprimiram pequenas quantidades de textos. Mais tarde, as empresas comerciais e os governos coloniais imprimiram tratados e documentos administrativos, mas também ninguém os copiou. Em praticamente todos os casos, os povos indígenas começaram a imprimir somente em resposta à impressão em massa feita por missionários protestantes. Porexemplo, em 32 anos após sua chegada, os primeiros missionários protestantes britânicos na Índia imprimiram mais de 212.000 livros em 40 idiomas. Isso estimulou os muçulmanos eos hindus a fazerem o mesmo.

Mesmo na China e na Coreia - sociedades que tinham fontes metálicas móveis antes da Europa - os missionários protestantes e seusconvertidos imprimiam os primeiros jornais e alteravam radicalmente a disponibilidade de textos. Isso produziu uma revolução tanto na impressão quanto na educação de não elites. A fonte da mudança não foi o conhecimento da tecnologia ou o crescimento econômico, mas uma ideia radicalmente diferente sobre quem deveria ler e ter acesso aos textos. Sem o catalisador das ideias religiosas, os mercados prósperos e o conhecimento tecnológico não foram suficientes para estimular a educação em massa ou a impressão em massa.

Os missionários também foram fundamentais para adisseminaçãoda medicina ocidental, da educação médica e das organizações voluntárias de reforma social. Os missionários introduziram novas culturas, novas habilidades técnicas e novas ideias sobre política e economia. Tratei dessas e de outras questões com mais detalhes em outros artigos.

Durante o século XIXe o início do século XX, os missionários foram criticados com mais frequência por terem uma opinião muito elevada sobre ospovos indígenas, especialmente por antropólogos.

Missionários mobilizaram a reforma colonial

Os missionários são frequentemente acusados de uma estreita associação com os estados coloniais. Às vezes, isso eraverdade, principalmente nas colônias em que o Estado controlava as nomeações e as finanças dos missionários. Entretanto, quando os missionários eram independentes do controle direto do Estado, eles se comportavam deforma diferente. De fato, os missionários não-estatais foram fundamentais para a maioria dos principais movimentos de reforma colonial.

A maioria dos missionários não era fortemente anticolonial. Eles estavam dispostos a conviver com formas moderadas de colonialismo e não estavam preocupados principalmente com a política. Entretanto, os abusos coloniais enfureciam a população local contra o Ocidente - que muitos associavam ao cristianismo - e, portanto, dificultavam o trabalho dos missionários. Os escritos dos missionários estão repletos de reclamações sobre como os abusos coloniais minaram seus melhores esforços. Assim, os missionários tinham (1) incentivos para combater os abusos coloniais, (2) equipes e pessoas em todo o mundo que recebiam relatos dos abusos, (3) uma base de apoiadores em muitos países colonizadores e (4) uma rede maciça de mídia religiosa para mobilizar os fiéis contra as políticas que prejudicavam os interesses da missão e que feriam as pessoas que eles haviam aprendido a amar. Assim, os missionários foram fundamentais para as campanhas contra a escravidão e o trabalho forçado, o surgimento de programas de ajuda externa, a criação de organizações internacionais de assistência, a proibição do comércio de ópio, a proteção dos direitos indígenas à terra e muitasoutras reformas.

Os missionários resistiram às visões "científicas" sobre raça

Uma das críticas mais recorrentes contra os missionários é seu etnocentrismo. Os missionários do século XIX e do início do século XXeram produtos de uma época em que tanto cristãos quanto pessoas do mundo secular assumiam a superioridade da civilização ocidental. A literatura missionária histórica geralmente enfatizava problemas com outras culturase religiões de uma forma que muitos leitores modernos consideram desagradável. No entanto, isso deve servisto em comparação com o racismo "científico" que floresceu no meio acadêmico e entre os colonizadores europeus nessa época. As principais críticas missionárias a outros povos eram culturais e religiosas, não raciais. William Carey argumentou que os britânicos haviam sido bárbaros antes da chegada do cristianismo e que o evangelho poderia transformar outras culturas da mesma forma que havia transformado a Inglaterra.

Durante o século XIX e início do século XX, os missionários eram mais frequentemente criticados porterem uma opinião muito elevada sobre os povos indígenas do que o contrário, especialmente pelos antropólogos. Porexemplo, James Hunt - que cunhou a palavra "antropologia", fundou a primeira sociedade antropológica e editou as duas primeiras revistas antropológicas - argumentou que os povos de pele escura eram uma espécie diferente, mentalmente inferior aos brancos e não podiam ser "civilizados" por meio da educação. Ele argumentou que os antropólogos tinham que lutarcontra os missionários para estabelecer sua disciplina. No volume de 1866 da Anthropological Review, ele escreveu:

Nesse esforço para recomendar a Antropologia a uma aceitação mais geral, não devemos esconder de nós mesmos que duas grandes escolas são, em princípio, decididamente opostas às nossas pretensões. Esses dois partidos influentes... concordam cordialmente em desdenhar e até mesmo denunciar as verdades da Antropologia. Eles fazem isso porque essas verdades se opõem diretamente ao seu princípio fundamental de igualdade absoluta e original entre a humanidade. Os partidos aos quais nos referimos são os ortodoxos e, mais especialmente, o corpo evangélico, na religião, e o partido ultraliberal e democrático na política. O artigo é mais depreciativo e racista, mas o trecho acima deve servir. Muitos antropólogos modernos e seculares ainda têm tensões com os missionários, mas por motivos muito diferentes. Entretanto, ao criticar as atitudes etnocêntricas dos missionários, seria mais útil compará-las com outras de sua época (por exemplo, os primeiros antropólogos) do que com os padrões de hoje. Fazer o contrário é seu próprio tipo de etnocentrismo. Como escreve o historiador de Harvard,

William Hutchison, "Se, de um ponto de vista moderno, a sensibilidade às culturas estrangeiras era deficiente, os missionários [do século XIX e do início do século XX] eram consideravelmente superiores, nesse aspecto, à maioria dos contemporâneos no país ou no exterior" (Hutchison 1987:1).

As sociedades em que os missionários protestantes chegaram mais cedo e eram mais predominantes acabaram se saindo melhorem todos os indicadores de prosperidade humana.

O que é o efeito cumulativo?

Alguém pode se perguntarse, na discussão acima, eu apenas selecionei anedotas e fiz generalizações que se encaixam em minhas pressuposições. Talvez outros possam selecionar anedotas e fazer generalizações que façam os missionários parecerem muito piores. Como podemos avaliarqual foi o efeito médio e cumulativo das missões? Uma maneira é por meio de estatísticas.

Do ponto de vista estatístico, as sociedades em que os missionários protestantes chegaram mais cedo e foram mais predominantes acabaram em melhor situação em todos os indicadores de prosperidade humana que estudei: alfabetização, matrícula educacional, mortalidade infantil, expectativa de vida, desenvolvimento econômico, corrupção e democracia política. Esses resultados são consistentes tanto entre países quanto entre diferentes regiões do mesmo país (porexemplo, Índia, China, Nigéria, Gana). Se o efeito principal das missões tivesse sido destrutivo, não esperaríamos isso.

As estatísticas a seguir ilustram essas afirmações. Para os países do Sul Global, cada missionário adicional por 10.000 habitantes em 1923 está associado a uma média de 4,3 pontos percentuais a mais de matrículas educacionais entre 1960 e 1985 e 1,3 anos a mais de expectativa de vida em 2000 (sem controles estatísticos). Da mesma forma, nas províncias da Índia, cada missionário adicional por 10.000 habitantes em 1923 está associado a 1,1 ponto percentual a mais de alfabetização em 2001, etc. A prevalência histórica de missionários protestantes também está associada à democracia e a outros resultados. Minha pesquisa sugere que as missões protestantes explicam cerca de metade da variação da democracia no Sul Global e eliminam o efeito da maioria dos outros fatores que se acredita preverem a democracia.

Demonstrar que os missionários causaram esses resultados positivos é mais difícil do que mostrar as associações estatísticas. Talvez os missionários estivessem mais propensos a ir para lugares quejá estavam em melhores condições. Por exemplo, e se a maioria dos missionários fosse para climas saudáveis? Nesse caso, a saúde atual desses lugares não indicaria um benefício trazido pelo trabalho missionário. Assim, para isolaro impacto das missões protestantes no desenvolvimento, apliquei controles estatísticos relacionados ao clima, à geografia, à prevalência de doenças, aos colonizadores, ao assentamento europeu e às condições pré-coloniais. Nenhum desses controles removeu os vínculos positivos, e os coeficientes no parágrafo anterior são o que restou depois que apliquei esses controles. A associação entre missões e várias formas de bem-estaré extremamente robusta.

As localizações espaciais desses resultados positivos também são reveladoras. Na Nigéria, os britânicos impediram que os missionários entrassem em territórios no norte e a alfabetização é mais baixa lá do que na costa. No Quênia, os missionários foram restringidos perto da costa e a alfabetização é maior no interior. Na Índia, a alfabetização é mais alta em Kerala, Nagaland, Mizoram e Goa - regiões que não têm quase nada em comum, exceto a prevalência de cristãos e a histórica atividade missionária. Os povos de Nagaland e Mizoram eram caçadores-coletores sem linguagem escrita antes do contato missionário no final do século XIX. Portanto, independentemente de como se avalia a influência geral do colonialismo, do imperialismo e das atuais corporações multinacionais no Sul Global, os países afetados estariam em situação muito piorse os missionários não estivessem presentes e engajados.

Notas finais

1. Saiba mais sobre o Projeto sobre Religião e Mudança Econômica em www.prec-online.com.

2. Consulte Woodberry 2004 e 2006 para obter mais detalhes sobre estudos em diferentes áreas da prosperidade humana.

3. A associação entre as missões católicas do século XIX e início do século XX e esses resultados é pequena (ou seja, não é estatisticamente significativa). Isso parece ser devido ao fato de que, antes do Concílio Vaticano II (1965), as missões católicas tinham maior probabilidade de estar sob controle do Estado e eram menos propensas a investir em educação em massa, etc., a menos que estivessem competindo com os protestantes. 5. Nas regressões discutidas nesta seção, controlei o colonizador, a latitude, o fato de ser uma ilha, o fato de não ter território, a porcentagem de europeus, a porcentagem de muçulmanos, o fato de ter um idioma escrito antes do contato missionário e o fato de ser um grande produtor de petróleo. Para as regressões relacionadas à democracia, também controlei 24 variáveis adicionais relacionadas ao clima, à mortalidade colonial e ao processo de exploração e colonização europeia. Os coeficientes discutidos no texto deste artigo são líquidos desses controles; a porcentagem de variação explicada (R-quadrado) é sem controles.

4. Para saber mais sobre como os missionários influenciaram os movimentos de reforma colonial e a política externa, consulte Woodberry (2004; 2006);

Etherington (2005); Grant (2005); Turner (1998) e Oddie (1978). Para saber mais sobre o abolicionismo imediato, consulte Turner (1998) e Woodberry (2006). Para saber mais sobre a reforma agrária na Índia, consulte Oddie (1978). Para saber mais sobre campanhas de combate ao trabalho forçado, consulte Woodberry (2004) e Grant (2005).

Referências

1. Etherington, Norman (ed.). 2005. Missions and Empire [Missões e Império].

Nova York: Oxford University Press.

2. Grant, Kevin. 2005. A Civilised Savagery: Britain and New Slaveries in Africa,

1884-1926. Nova York: Routledge.

3. William R. Hutchison. 1987. Errand to the World: American Protestant Thought and Foreign Missions [Pensamento Protestante Americano e Missões

Estrangeiras]. Chicago: University of Chicago Press.

4. Oddie, Geoffrey A. 1978. Social Protest in India: British Protestant Missionaries and Social Reforms 1850-1900 [Protesto Social na Índia: Missionários

Protestantes Britânicos e Reformas Sociais 1850-1900]. Columbia, MO: South

Asia Books.

5. Turner, Mary, 1998. Slaves and Missionaries [Escravos e Missionários].

Kingston, Jamaica: University of the West Indies Press.

6. Woodberry, Robert D. 2004. The Shadow of Empire: Christian Missions,

Colonial Policy and Democracy in Post-Colonial Societies [Missões Cristãs,

Política Colonial e Democracia em Sociedades Pós-Coloniais]. Dissertação de doutorado, Universidade da Carolina do Norte, Chapel Hill.

7. 2006. "Reclaiming the M-Word: The Consequences of Missions for Nonwestern

Societies". The Review of Faith and International Affairs [Revista de Fé e

Assuntos Internacionais]. 4(1): 3-12.

Perguntas de estudo

1. O artigo de Woodberry descreve maneiras pelas quais as missões cristãs tiveram um impacto social positivo nas sociedades. Quais são cinco das contribuições mais significativas feitas pelos missionários? 2. Woodberry menciona um ressurgimento da percepção de que o movimento missionário tem sido o servo do colonialismo e o inimigo das culturas indígenas. Como esse artigo mostra que o oposto é verdadeiro? 3. Os missionários do século XIX e do início do século XX eram etnocêntricos? Explique sua resposta.$conteudo$, 26);
  end if;
end
$curso$;
