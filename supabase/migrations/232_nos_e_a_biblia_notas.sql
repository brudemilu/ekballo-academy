-- Nós e a Bíblia — recupera as notas de rodapé (citações) descartadas na carga.
--
-- Diagnóstico: os capítulos estavam entre 86% e 94% do PDF, mas as três
-- conclusões curtas batiam 100%. Isso é diferença sistemática, não perda
-- capítulo a capítulo. A análise tipográfica confirmou: no Cap. 4, 84,2% dos
-- caracteres estão no corpo 15 (texto) e 13,9% no corpo 8,7 (notas); na
-- Conclusão da Parte II, 98,8% é corpo 15 e não há notas. Ou seja, o texto
-- corrido sempre esteve íntegro — o que a carga descartou foram as notas.
--
-- Em 14 das 16 seções as notas fecham a lacuna medida quase exatamente.
-- Este livro agrupa as notas no fim de cada capítulo, já numeradas, então elas
-- entram como uma seção NOTAS ao final de cada mesa.
--
-- Idempotente: só insere onde ainda não existe a seção NOTAS.

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'nos-e-a-biblia';
  if v_curso_id is null then
    raise exception 'curso nao encontrado';
  end if;

  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. FRYE, Northrop. Anatomia da crítica. São Paulo: Cultrix, 1957. p. 21.

2. REINKE, A. Os outros da Bíblia: história, fé e cultura dos povos antigos e sua atuação no plano divino. Rio de Janeiro: Thomas Nelson Brasil, 2019.

3. REINKE, A. Aqueles da Bíblia: história, fé e cultura do povo bíblico de Israel e sua atuação no plano divino. Rio de Janeiro: Thomas Nelson Brasil, 2021.$nota$
  where curso_id = v_curso_id and ordem = 1
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. KOCHAV, Sarah. Israel: grandes civilizações do passado. Barcelona: Fólio, 2006. p. 164-165.

2. REINKE, André Daniel. Os outros da Bíblia: história, fé e cultura dos povos antigos e sua atuação no plano divino. Rio de Janeiro: Thomas Nelson Brasil, 2019.

3. GONZÁLEZ, Justo L. Cultura & evangelho: o lugar da cultura no plano de Deus. São Paulo: Hagnos, 2011. p. 37-50.

4. Como demonstra Ruth Benedict ao analisar a cultura japonesa. BENEDICT, Ruth. O crisântemo e a espada: padrões da cultura japonesa. São Paulo: Perspectiva, 1972. p. 19.

5. GONZÁLEZ, 2011, p. 51-77.

6. Esse é o argumento básico da excelente obra de RICHARDSON, Don. O fator Melquisedeque: o testemunho de Deus nas culturas através do mundo. São Paulo: Vida Nova, 1995.

7. REINKE, André Daniel. Aqueles da Bíblia: história, fé e cultura do povo bíblico de Israel e sua atuação no plano divino. Rio de Janeiro: Thomas Nelson Brasil, 2021.

8. BURKE, Peter. Hibridismo cultural. São Leopoldo: Unisinos, 2009. p. 13-22.

9. Uso o termo “protestante” de maneira livre, para designar tudo o que derivou da Reforma, incluindo os movimentos pentecostais e neopentecostais. Considero esses movimentos a continuidade do processo sectário iniciado pelos reformadores. Neste livro, não me preocupo em delimitar historicamente os conceitos.$nota$
  where curso_id = v_curso_id and ordem = 2
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. BRAKEMEIER, Gottfried. A autoridade da Bíblia: controvérsias — significado — fundamento. 2. ed. São Leopoldo: Sinodal, 2003. p. 33-34.

2. BRAKEMEIER, 2003, p. 37.

3. WRIGHT, Nicholas Thomas. História e escatologia: Jesus e a promessa da teologia natural. Rio de Janeiro: Thomas Nelson Brasil, 2021. p. 12-13.

4. RICOEUR, Paul. A hermenêutica bíblica. São Paulo: Loyola, 2006. p. 256-257. Apresentarei uma definição de “mito” adiante.

5. RICOEUR, Paul. Tempo e narrativa: a configuração do tempo na narrativa de ficção. São Paulo: WMF Martins Fontes, 2010, v. 2. p. 38-39.

6. AUERBACH, Erich. Mimesis: a representação da realidade na literatura ocidental. São Paulo: EdUSP; Perspectiva, 1971.

7. AUERBACH, 1971, p. 1-9.

8. AUERBACH, 1971, p. 12.

9. AUERBACH, 1971, p. 14-15.

10. AUERBACH, 1971, p.

17. Note que a discussão aqui não é se os personagens bíblicos são reais ou não, se são históricos ou ficcionais. Eu acredito que são reais. A questão posta é que, do ponto de vista literário, isso absolutamente não importa. A forma em que são apresentados é profundamente verdadeira porque trata da realidade humana em toda a sua contradição.

11. ALTER, Robert. A arte da narrativa bíblica. São Paulo: Companhia das Letras, 2007. p. 38.

12. MARGUERAT, Daniel; BOURQUIN, Yvan. Para ler as narrativas bíblicas: iniciação à análise narrativa. São Paulo: Loyola, 2009. p. 83.

13. ALTER, 2007, p.

46. Para Paul Ricoeur, as narrativas bíblicas podem ser entendidas como “quase históricas”, já que não têm a intenção criativa da ficção, mas também não oferecem evidências de invocar uma historiografia. Isso produz uma tremenda crise para o leitor de hoje, tempo em que a distinção entre ficção e história é mais claramente invocada. RICOEUR, 2006, p. 295.

14. ALTER, 2007, p. 47-48.

15. ALTER, 2007, p.

50. Para compreender melhor a questão da circularidade dos mitos antigos, sugiro a obra de Mircea Eliade (veja Referências) ou o resumo que apresento no capítulo 2 de Os outros da Bíblia.

16. ALTER, 2007, p. 57-58.

17. ALTER, 2007, p. 70.

18. PELLETIER, Anne-Marie. Bíblia e hermenêutica hoje. São Paulo: Loyola, 2006. p. 126-129.

19. MENDONÇA, José Tolentino. A leitura infinita: a Bíblia e sua interpretação. São Paulo: Paulinas; Pernambuco: Universidade Católica de Pernambuco, 2015. p. 54.

20. MARGUERAT; BOURQUIN, 2009, p. 34-35. Às vezes, problemas desse tipo se resolvem ao se afirmar, por exemplo, que, na primeira narrativa, Satanás não foi mencionado, mas sua ação foi permitida por Deus. A explicação posterior do segundo texto seria que foi ato exclusivo do diabo. É uma solução sistemática construída sobre algo que o primeiro texto não diz.

21. ALTER, 2007, p. 27-28.

22. PELLETIER, 2006, p. 118-119.

23. ZABATIERO, Júlio Paulo Tavares; LEONEL, João. Bíblia, literatura e linguagem. São Paulo: Paulus, 2011. p. 112.

24. ALTER, 2007, p. 40.

25. ALTER, 2007, p. 42.

26. MENDONÇA, 2015, p. 52.

27. BRUEGGEMANN, Walter. Teologia do Antigo Testamento: testemunho, disputa e defesa. Santo André: Academia Cristã; São Paulo: Paulus, 2014. p. 175.

28. BRUEGGEMANN, 2014, p. 177-178.

29. BRUEGGEMANN, 2014, p. 180.

30. BRUEGGEMANN, 2014, p. 915.

31. GONZÁLEZ, 2011, p. 94.

32. BRAKEMEIER, 2003, p. 14.

33. BRUEGGEMANN, 2014, p. 916.

34. BRUEGGEMANN, Walter. A imaginação profética. São Paulo: Paulinas, 1983. p. 12-13.

35. BRUEGGEMANN, 1983, p. 17-20.

36. RICOEUR, Paul. A ideologia e a utopia. Belo Horizonte: Autêntica, 2017. p. 29-33.

37. FRYE, Northrop. O código dos códigos: a Bíblia e a literatura. São Paulo: Boitempo, 2004. p. 9.

38. FRYE, 2004, p. 18.

39. FRYE, 2004, p. 55.

40. FRYE, 2004, p. 57-59. É sempre nesse sentido que uso o termo “mito” neste livro. Trata-se da narrativa com início, meio e fim que conta o significado essencial da origem de determinado grupo, podendo basear-se em um fato realmente ocorrido ou simplesmente inventado. Em nenhum dos casos o mito é uma “mentira”. Os próximos capítulos do livro ajudarão a compreender o que são mitos em sociedades, mesmo nas contemporâneas.

41. FRYE, 2004, p. 65-67.

42. MATA, Sérgio da. História & religião. Belo Horizonte: Autêntica, 2010. p. 81.

43. FRYE, 2004, p. 76-77.

44. FRYE, 2004, p. 80-83. São Patrício foi famoso por evangelizar a Irlanda. Naquele tempo, a doutrina da Trindade estava bem estabelecida, constando do Credo Niceno e do Constantinopolitano. Entretanto, usar a retórica racional dos credos de nada serviria entre o povo. Então, Patrício tomou um trevo e, com suas três folhas, explicou como Deus pode ser três e um ao mesmo tempo. O trevo é o símbolo cultural irlandês até hoje.

45. FRYE, 2004, p.

91. As considerações de Aristóteles sobre o universal da poesia e o particular da história podem ser verificadas em ARISTÓTELES. Poética. Livro IX, 50.

46. FRYE, 2004, p. 107-112.

47. FRYE, 2004, p. 115-116 48. FRYE, 2004, p. 245-247.

49. Traduzido no Hinário para o culto cristão da CBB com o título “Já refulge a glória eterna de Jesus” ou na Harpa cristã da Assembleia de Deus como “Vencendo vem Jesus”.

50. FRYE, 2004, p. 256-257.

51. GOLDINGAY, John. Teologia bíblica: o Deus das escrituras cristãs. Rio de Janeiro: Thomas Nelson Brasil, 2020. p. 89.

52. GEFFRÉ, Claude. Crer e interpretar: a virada da hermenêutica da teologia. Petrópolis: Vozes, 2004. p. 39.$nota$
  where curso_id = v_curso_id and ordem = 3
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. FEE, Gordon D.; STUART, Douglas. Entendes o que lês? Um guia para entender a Bíblia com auxílio da exegese e da hermenêutica. 2. ed. São Paulo: Vida Nova, 2009. p. 19-27.

2. GRONDIN, Jean. Paul Ricoeur. São Paulo: Loyola, 2015. p. 14-15. Uma obra que auxilia a compreender a hermenêutica filosófica de Paul Ricoeur, e da qual obtive algumas inspirações e referências bibliográficas, é BENTHO, Esdras Costa. Da História à Palavra: a teologia da revelação em Paul Ricoeur. São Paulo: Reflexão, 2016.

3. GRONDIN, 2015, p. 28.

4. GRONDIN, 2015, p. 46-49. Foi abordado, no capítulo anterior, o sentido do mito, tanto como uma narrativa com sentido (uma história com início, meio e fim) como uma via da reflexão a respeito da origem e essência de um povo. Os dois sentidos cabem aqui.

5. KÖRTNER, Ulrich H. J. Introdução à hermenêutica teológica. São Leopoldo: Sinodal/EST, 2009. p. 100.

6. CASSIRER, Ernst. Antropologia filosófica: ensaio sobre o homem. Introdução a uma filosofia da cultura humana. São Paulo: Mestre Jou, 1972. p. 49-51.

7. RICOEUR, Paul. O conflito das interpretações: Ensaios de hermenêutica. Porto: Rés, 1988. p. 14.

8. JUNG, Carl (org.). O homem e seus símbolos. Rio de Janeiro: HarperCollins Brasil, 2016. p. 18.

9. JUNG, 2016, p. 19.

10. ELIADE, Mircea. O mito do eterno retorno: arquétipos e repetição. Lisboa: Edições 70, 1984. p. 17-18.

11. ELIADE, 1984, p. 19.

12. OTTO, Rudolf. O sagrado: os aspectos irracionais na noção do divino e sua relação com o racional. São Leopoldo: Sinodal/EST; Petrópolis: Vozes, 2007. p. 173.

13. ELIADE, Mircea. Tratado de história das religiões. 5. ed. São Paulo: WMF Martins Fontes, 2016. p. 172-173.

14. RICOEUR, 1988, p. 29.

15. RICOEUR, Paul. A simbólica do mal. Lisboa: Edições 70, 2019. p. 366.

16. RICOEUR, 1988, p. 65-68.

17. CASSIRER, 1972, p. 66-67.

18. ELIADE, 2016, p. 363.

19. ELIADE, 2016, p. 369.

20. Vide algumas hipóteses em DICIONÁRIO DE SÍMBOLOS. “Logo da Apple: você sabe como surgiu o símbolo da maçã mordida?” Disponível em: www.dicionariodesimbolos.com.br/logo-apple-voce-sabe-como-surgiu-simbolo-da-macamordida. Acesso em: 29 set. 2022.

21. DONDIS, Donis A. Sintaxe da linguagem visual. 2. ed. São Paulo: Martins Fontes, 1997. p. 91.

22. DONDIS, 1997, p. 92-95.

23. BENDER, Arthur. Paixão e significado da marca. São Paulo: Integrare, 2012. p. 214-215. É interessante como livros de marketing, como este de Bender, são repletos de pequenas narrativas não apenas para ilustrar, mas para produzir emoção e engajamento.

24. BENDER, 2012, p. 247-269.

25. Sobre esse tipo de posicionamento estratégico, veja NEUMEIER, Marty. The brand gap: how to bridge the distance between business strategy and design. Ed. rev. Berkeley: New Riders, 2006.

26. MENDONÇA, 2015, p. 58.

27. SMITH, James K. A. Desejando o reino: culto, cosmovisão e formação cultural. São Paulo: Vida Nova, 2018, p. 46-47.

28. SMITH, 2018, p. 47-49.

29. SMITH, 2018, p. 50-53.

30. SMITH, 2018, p.

67. Smith trabalha o conceito de “imaginário social” com base em Charles Taylor, que se refere à maneira que as pessoas comuns imaginam seu entorno social por meio de imagens, histórias e lendas, sem se expressarem teoricamente. Daí a proximidade desse imaginário com o afetivo, e não com o cognitivo. SMITH, 2018, p. 66.

31. SMITH, 2018, p. 68-69.

32. SMITH, James K. A. Imaginando o reino: a dinâmica do culto. São Paulo: Vida Nova, 2019. p. 102-105.

33. SMITH, 2019, p. 117.

34. SMITH, 2018, p. 39.

35. SMITH, 2019, p. 130-131.

36. SMITH, 2019, p. 140.

37. SMITH, 2019, p. 140-141.

38. SMITH, 2019, p. 149-150.

39. SMITH, 2019, p. 152-154.

40. SMITH, 2018, p. 88.

41. RICOEUR, Paul. Tempo e narrativa: a intriga e a narrativa histórica. São Paulo: WMF Martins Fontes, 2010, v. 1, p. 2 42. RICOEUR, 2010, v. 1, p. 16.

43. RICOEUR, 2010, v. 1, p. 70-71.

44. RICOEUR, 2010, v. 1, p. 74.

45. RICOEUR, 2010, v. 1, p. 93.

46. RICOEUR, 2010, v. 1, p. 128.

47. RICOEUR, 2010, v. 1, p. 129.

48. ARISTÓTELES. Poética. Livro I, 2.

49. Marcelo Saldanha elaborou esse conceito a partir do desenvolvimento de Augusto Boal. SALDANHA, Marcelo Ramos. “Um teatro ‘não espetacular’: para além da catarse colonial”. Estudos teológicos, v. 58, n. 2. p. 356-369, jul./dez. 2018,. Disponível em: periodicos.est.edu.br/index.php/estudos_teologicos/article/view/3403. Acesso em: 29 set. 2022, p. 359.

50. RICOEUR, 2010, v. 1, p. 96.

51. RICOEUR, 2010, v. 1, p. 112.

52. RICOEUR, 2010, v. 1, p.

112. Ricoeur evita o uso da palavra “ficção” para a configuração do texto porque a reservou para abordar a diferença entre a narrativa ficcional e a narrativa histórica. Ele prefere tratar de “composição” ou “configuração”, sem colocar em jogo a questão da verdade. O sentido da intriga é o mythos aristotélico, o “agenciamento dos fatos”. RICOEUR, 2010, v. 1, p. 113.

53. RICOEUR, 2010, v. 1, p. 114-115.

54. RICOEUR, 2010, v. 1, p. 122-124.

55. ZABATIERO; LEONEL, 2011, p. 22.

56. LEWIS, Clive Staples. Um experimento em crítica literária. Rio de Janeiro: Thomas Nelson, 2019. p. 11.

57. Tabela baseada em GRONDIN, 2015, p. 96.

58. RICOEUR, Paul. Tempo e narrativa: O tempo narrado. São Paulo: WMF Martins Fontes, 2010, v. 3. p. 311.

59. RICOEUR, 2010, v. 1, p. 153.

60. RICOEUR, 2010, v. 1, p. 342.

61. RICOEUR, 2010, v. 2, p. 271.

62. RICOEUR, 2010, v. 3, p. 176.

63. RICOEUR, 2010, v. 3, 181-212.

64. Como bem demonstra PROST, Antoine. Doze lições sobre a história. Belo Horizonte: Autêntica, 2008. p. 75-6.

65. RICOEUR, 2010, v. 3, p. 318-319.

66. RICOEUR, 2010, v. 3, p. 319-323.

67. RICOEUR, 2010, v. 3, p. 323-325.

68. RICOEUR, 2010, v. 3, p. 326-327.

69. ISER, A. Wolfgang. O fictício e o imaginário: perspectivas de uma antropologia literária. Rio de Janeiro: EdUERJ, 1996. p. 14-16.

70. GEFFRÉ, 2004, p. 58.

71. GEFFRÉ, 2004, p. 59.

72. RICOEUR, Paul. Del texto a la acción: ensayos de hermenéutica II. México: Fondo de Cultura Económica, 2002. p. 108.

73. RICOEUR, 2002, p. 109.

74. ISER, Wolfgang. O ato da leitura: uma teoria do efeito estético. São Paulo: Editora 34, 1999, v. 2. p. 10.

75. RICOEUR, 2010, v. 3, p. 328.$nota$
  where curso_id = v_curso_id and ordem = 4
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. GOLDINGAY, 2020, p. 143.

2. RICOEUR, 2006, 117-129.

3. RICOEUR, 2006, p. 99.

4. Essas interpretações de sentido podem ser verificadas em KLEIN, William W.; HUBBARD JR., Robert L.; BLOMBERG, Craig L. Introdução à interpretação bíblica. Rio de Janeiro: Thomas Nelson Brasil, 2017. p. 335-347.

5. ARENDT, Hannah. A condição humana. 10. ed. Rio de Janeiro: Forense Universitária, 2007. p. 191-192.

6. RICOEUR, 2010, v. 3, p. 417.

7. RICOEUR, 2010, v. 3, p. 418.

8. RICOEUR, 2010, v. 3, p. 419-420.

9. RICOEUR, 2010, v. 3, p. 421.

10. RICOEUR, 2010, v. 3, p. 421.

11. RICOEUR, 2010, v. 3, p. 422.

12. CASSIRER, 1972, p. 92.

13. RICOEUR, 2017, p. 363.

14. RICOEUR, 2017, p. 34.

15. TAYLOR, George. “Identidade prospectiva”, p. 127-148. In.: NASCIMENTO, Fernando; SALLES, Walter. Paul Ricoeur: ética, identidade e reconhecimento. São Paulo: Loyola; Rio de Janeiro: PUC-Rio, 2013. p. 129-130.

16. RICOEUR, 2006, p. 290-291.

17. RITSCHL, Dietrich. Fundamentos da teologia cristã. São Leopoldo: Sinodal/EST, 2012. p. 24.

18. RITSCHL, 2012, p. 25.

19. KÖRTNER, 2009, p. 159-160.

20. ANDERSON, Benedict R. Comunidades imaginadas: reflexões sobre a origem e a difusão do nacionalismo. São Paulo: Companhia das Letras, 2008. p. 28-34.

21. GELLNER, Ernest. Naciones y nacionalismo. Madri, Espanha: Alianza, 2001. p. 20.

22. CATROGA, Fernando. Entre deuses e césares: secularização, laicidade e religião civil. Uma perspectiva histórica. Coimbra: Almedina, 2006. p. 96-97.

23. CATROGA, 2006, p. 132-133.

24. CATROGA, 2006, p. 168-171.

25. CATROGA, 2006, p. 262.

26. A construção do nacionalismo brasileiro é muito bem trabalhada por CARVALHO, José Murilo de. A formação das almas: o imaginário da República no Brasil. 2. ed. São Paulo: Companhia das Letras, 2017.

27. Como aponta SMITH, James K. A. Aguardando o Rei: reformando a teologia pública. São Paulo: Vida Nova, 2020. p. 43.

28. SMITH, 2018, p. 106-107.

29. HOBSBAWM, Eric. A invenção das tradições. 12. ed. Rio de Janeiro: Paz e Terra, 2018. p. 339-40.

30. SMITH, 2018, p. 109.

31. SMITH, 2018, p. 112.

32. ELIADE, 1984, p. 18-20.

33. ELIADE, Mircea. O sagrado e o profano: a essência das religiões. 2. ed. São Paulo: Martins Fontes, 2008. p. 165-167.

34. LOWENTHAL, David. The past is a foreign country – revisited. Cambridge: Cambridge University Press, 2015. p. 111.

35. LOWENTHAL, 2015, p. 113.

36. LOWENTHAL, 2015, p. 464-465.

37. LOWENTHAL, 2015, p. 477.

38. GIRARDET, Raoul. Mitos e mitologias políticas. São Paulo: Companhia das Letras, 1987. p.

12. “Conspiração” é a ideia de que forças malignas estão operando para destruir a nação. “Idade do Ouro” foi tratada anteriormente neste capítulo. “Salvador” é o herói que aparece para restaurar a ordem anterior, atacada pelos conspiradores. “Unidade” é o discurso do povo unido que deve extirpar aqueles que não cooperam para o bem da nação. Esses elementos fazem parte do mito político moderno, e você já deve tê-los visto em vários discursos políticos.

39. GIRARDET, 1987, p. 98.$nota$
  where curso_id = v_curso_id and ordem = 5
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. RICOEUR, 2010, v. 3, p. 421.

2. Essa linha tradicional pode ser vista em uma tabela cronológica em MAZZINGHI, Luca. História de Israel das origens ao período romano. Petrópolis: Vozes, 2017. p. 197-201.

3. BERLESI, Josué. História, arqueologia e cronologia do êxodo: historiografia e problematizações. São Leopoldo: Sinodal; EST, 2008. p.

70. Para maiores considerações sobre esse tema, veja FINKELSTEIN, Israel; SILBERMAN, Neil Asher. A Bíblia desenterrada: a nova visão arqueológica do antigo Israel e das origens dos textos sagrados. Petrópolis: Vozes, 2018.

4. Kaefer faz um levantamento das pesquisas atuais em KAEFER, José Ademar. Arqueologia das terras da Bíblia II. São Paulo: Paulus, 2016.

5. KAEFER, José Ademar. A Bíblia, a arqueologia e a história de Israel e Judá. São Paulo: Paulus, 2015. p. 11-25. Muitas hipóteses sobre a formação de Israel na Antiguidade têm sido levantadas. Algumas podem ser encontradas em: ALT, Albrecht. Terra prometida: ensaios sobre a história do povo de Israel. São Leopoldo: Sinodal, 1987. GOTTWALD, Norman K. As tribos de Iahweh: uma sociologia da religião de Israel liberto, 1250-1010 a.C. São Paulo: Paulinas, 1986. FINKELSTEIN, Israel. O reino esquecido: arqueologia e história de Israel Norte. São Paulo: Paulus, 2015. MENDONÇA, Élcio Valmiro Sales de. O primeiro Estado de Israel: redescobertas arqueológicas sobre suas origens. São Paulo: Recriar, 2020. Algumas contraposições que defendem a Bíblia como fonte histórica podem ser verificadas em: PROVAN, Iain; LONG, V. Philips; LONGMAN III, Tremper. Uma história bíblica de Israel. São Paulo: Vida Nova, 2016. RICHELLE, Matthieu. A Bíblia e a arqueologia. São Paulo: Vida Nova, 2017.

6. BRUEGGEMANN, 2014, p. 176.

7. BRAKEMEIER, 2003, p. 23.

8. CROATTO, José Severino. História da salvação: a experiência religiosa do povo de Deus. 2. ed. São Paulo: Paulinas, 1968. p. 39.

9. SCHREINER, Josef. Abraão, “Isaque e Jacó: a interpretação da época dos patriarcas em Israel”. p. 97-112. In.: SCHREINER, Josef (org.). O Antigo Testamento: um olhar atento para sua palavra e mensagem. São Paulo: Hagnos, 2012. p. 100.

10. BRUEGGEMANN, 2014, p. 250-253.

11. BRUEGGEMANN, 2014, p. 254-257.

12. BRUEGGEMANN, 2014, p. 844-845.

13. CROATTO, 1968, p. 131.

14. BRUEGGEMANN, 2014, p. 806-812.

15. BRUEGGEMANN, 2014, p. 361-362.

16. Aqui se trata da construção de uma “identidade prospectiva”, sugestão de Paul Ricoeur que mencionei na Primeira Parte.

17. GERSTENBERGER, Erhard S. Israel no tempo dos persas: séculos V e IV antes de Cristo. São Paulo: Loyola, 2014, p.

119. Sobre a importância do período persa na configuração de uma identidade judaica, vejam-se os artigos publicados em TERRA, Kenner; LELLIS, Nelson. Judaísmo e período persa: imaginários, textos e teologias. São Paulo: Recriar, 2021.

18. WON, Paulo. E Deus falou na língua dos homens: uma introdução à Bíblia. Rio de Janeiro: Thomas Nelson Brasil, 2020. p. 154-155.

19. Veja, por exemplo, a conclusão sobre a data e a composição da Torá em LASOR, William S.; HUBBARD, David A.; BUSH, Frederic W. Introdução ao Antigo Testamento. São Paulo: Vida Nova, 1999. p. 14.

20. REIMER, Haroldo. O antigo Israel: história, textos e representações. São Paulo: Fonte Editorial, 2017. p. 68-69.

21. REIMER, 2017, p. 74.

22. SCHNIEDEWIND, William M. Como a Bíblia tornou-se um livro: a textualização do antigo Israel. São Paulo: Loyola, 2011. p. 13.

23. SCHNIEDEWIND, 2011, p. 258.

24. GABEL, John B.; WHEELER, Charles B. A Bíblia como literatura: uma introdução. São Paulo: Loyola, 1993. p. 77.

25. SCARDELAI, Donizete. O escriba Esdras e o judaísmo: um estudo sobre Esdras na tradição judaica. São Paulo: Paulus, 2012. p. 82-83.

26. SCARDELAI, 2012, p. 87-88.

27. SCARDELAI, 2012, p. 255.

28. PELLETIER, 2006, p. 111.

29. SCARDELAI, 2012, p. 21-23.

30. ARENHOEVEL, Diego. “A era pós-exílica: época do anonimato”, p. 314-329. In.: SCHREINER, Josef. O Antigo Testamento: um olhar atento para sua palavra e mensagem. São Paulo: Hagnos, 2012. p. 319.

31. DONNER, Herbert. História de Israel e dos povos vizinhos: da época da divisão do reino até Alexandre Magno. São Leopoldo: Sinodal; Petrópolis: Vozes, 1997, v. 2. p. 494-495.

32. DONNER, 1997, p. 495.

33. DONNER, 1997, p. 490-491.

34. PAUL, André. O judaísmo tardio: história política. São Paulo: Paulinas, 1983. p. 94-95.

35. KESSLER, Rainer. História social do antigo Israel. São Paulo: Paulinas, 2009. p. 211.

36. WON, 2020, p. 56-63.

37. SCARDELAI, Donizete. Da religião bíblica ao judaísmo rabínico: origens da religião de Israel e seus desdobramentos na história do povo judeu. São Paulo: Paulus, 2008. p. 77.

38. CAMPBELL, Jonathan G. Deciphering the Dead Sea Scrolls. 2. ed. Oxford: Blackwell, 2002. p. 113-115.

39. MAZZINGHI, 2017, p. 141-145.

40. Para uma visão geral da variedade dos escritos do período, veja NASCIMENTO, José Roberto do. “Apócrifos e pseudepígrafos do Antigo Testamento e sua importância para uma adequada compreensão do cristianismo primitivo e do Novo Testamento”, Reflexus, v. 12, n. 20, 2018. p. 627-50. Disponível em: revista.fuv.edu.br/index.php/reflexus/article/view/627/736. Acesso em: 29 set. 2022.

41. ARENHOEVEL, 2012, p. 326-327.

42. KLEIN; HUBBARD; BLOMBERG, 2017, p. 87-88.

43. MAIER, Johann. Entre os dois Testamentos: história e religião na época do Segundo Templo. São Paulo: Loyola, 2005. p. 174.

44. KOESTER, Helmut. Introdução ao Novo Testamento: história, cultura e religião do período helenístico. São Paulo: Paulus, 2005, v. 1. p. 402.

45. BORGER, Hans. Uma história do povo judeu: de Canaã à Espanha. 5. ed. São Paulo: Sêfer, 2015. p. 246-248.

46. BORGER, 2015, p. 232, 244-245. Nesse tempo, também temos a circulação de documentos judaicos escritos por judeus convertidos a Jesus Cristo, os quais dariam origem ao Novo Testamento. Esse assunto será tratado na Parte III.

47. TREBOLLE BARRERA, Julio. A Bíblia hebraica e a Bíblia cristã: introdução à história da Bíblia. Petrópolis: Vozes, 1995. p. 197-198.

48. FRYE, 2004, p. 238.$nota$
  where curso_id = v_curso_id and ordem = 7
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. GUNNEWEG, Antonius H. J. História de Israel: dos primórdios até Bar Kochba e de Theodor Herzl até os nossos dias. São Paulo: Teológica; Loyola, 2005. p. 305-306.

2. GUNNEWEG, 2005, p. 308.

3. SCARDELAI, 2008, p. 161-162.

4. GOODMAN, Martin. A história do judaísmo. São Paulo: Planeta, 2020. p. 152-53.

5. GOODMAN, 2020, p. 196-197.

6. GOODMAN, 2020, p. 200.

7. LANGE, Nicholas. Povo judeu: grandes civilizações do passado. Barcelona: Folio, 2007. p. 42-43.

8. ROSENBERG, Roy. Guia conciso do judaísmo: história, prática, fé. Rio de Janeiro: Imago, 1992. p. 15-18.

9. LANGE, 2007, p. 34.

10. BORGER, 2015, p. 308.

11. LANGE, 2007, p. 38-39.

12. GOODMAN, 2020, p. 339.

13. BORGER, 2015, p. 363-364.

14. BORGER, Hans. Uma história do povo judeu: das margens do Reno ao Jordão. São Paulo: Sêfer, 2002, v. 2. p. 15.

15. BORGER, 2015, p. 426, 433.

16. BORGER, 2015, p. 449.

17. BORGER, 2002, p. 15-16.

18. BORGER, 2002, p. 70.

19. GOODMAN, 2020, p. 422.

20. BORGER, 2002, p. 271-273.

21. BORGER, 2002, p. 302-303. A cabala será tratada na próxima parte deste capítulo.

22. GOODMAN, 2020, p. 367.

23. LANGE, 2007, p. 98-100. O caraísmo e o cabalismo serão tratados na próxima parte deste capítulo.

24. ROSENBERG, 1992, p. 145-147.

25. GOODMAN, 2020, p. 552.

26. GOODMAN, 2020, p. 554.

27. GOODMAN, 2020, p. 575.

28. GOODMAN, 2020, p. 581.

29. GOODMAN, 2020, p. 593-594.

30. GOODMAN, 2020, p. 506-508.

31. GOODMAN, 2020, p. 525.

32. Marranos são os bnei anussim, judeus convertidos à força ao catolicismo ibérico do século XIV que vieram a compor parte da população brasileira.

33. GOODMAN, 2020, p. 611-612.

34. GOODMAN, 2020, p. 286.

35. GOODMAN, 2020, p. 53.

36. TREBOLLE BARRERA, 1995, p. 562.

37. KÖRTNER, 2009, p. 103-104.

38. PELLETIER, 2006, p. 87-88.

39. TREBOLLE BARRERA, 1995, p. 573.

40. PELLETIER, 2006, p. 89.

41. STEINSALTZ, Adin. Talmud essencial. São Paulo: Sêfer, 2019. p. 60.

42. STEINSALTZ, 2019, p. 68-69.

43. STEINSALTZ, 2019, p. 76.

44. STEINSALTZ, 2019, p. 79-81.

45. STEINSALTZ, 2019, p. 84-85.

46. GOODMAN, 2020, p. 309-310.

47. STEINSALTZ, 2019, p. 98.

48. GIGLIO, Auro del. Iniciação ao Talmud. São Paulo: Sêfer, 2000. p. 13-17.

49. GIGLIO, 2000, p. 84-85.

50. BORGER, 2015, p. 328.

51. STEINSALTZ, 2019, p. 300.

52. STEINSALTZ, 2019, p. 313.

53. STEINSALTZ, 2019, p. 308.

54. GOODMAN, 2020, p. 293.

55. WON, 2020, p. 90.

56. SHAPIRA, Anita. Israel: uma história. Rio de Janeiro; São Paulo: Paz e Terra, 2018. p. 33.

57. RAMOS, Marivan Soares. Por trás das escrituras: uma introdução à exegese judaica e cristã. São Paulo: Loyola, 2019. p. 43-47.

58. GOODMAN, 2020, p. 353.

59. BORGER, 2015, p. 345.

60. GOODMAN, 2020, p. 403-404.

61. GOODMAN, 2020, p. 400.

62. LAITMAN, Michael. O Zohar. Rio de Janeiro: Imago, 2012. p. 143.

63. LAITMAN, 2012, p. 143.

64. JACOBS, Joseph; BLAU, Ludwig. “Magen David (‘David’s shield’)”. Jewish Encyclopedia. Disponível em: www.jewishencyclopedia.com/articles/10257-magen-dawid. Acesso em: 29 set. 2022.

65. JEWISH Virtual Library. “Magen David: Star of David”. Disponível em: www.jewishvirtuallibrary.org/magen-david. Acesso em: 29 set. 2022.

66. Conforme a Enciclopédia Judaica.

67. CHABAD. “A estrela de Davi”. Disponível em: www.chabad.org.br/biblioteca/artigos/EstrelaDavi/home.html. Acesso em: 29 set. 2022.

68. JEWISH Virtual Library. “Jewish Practices & Rituals: Kippah (Yarmulke)”. Disponível em: www.jewishvirtuallibrary.org/kippah-yarmulke. Acesso em: 29 set. 2022.

69. JEWISH Virtual Library. “Jewish Practices & Rituals: The Mezuzah”. Disponível em: www.jewishvirtuallibrary.org/themezuzah. Acesso em: 29 set. 2022.

70. JACOBS, Joseph; EISENSTEIN, Judah. “Tallit”. Jewish Encyclopedia. Disponível em: www.jewishencyclopedia.com/articles/14210-tallit. Acesso em: 29 set. 2022.

71. KLUGE, Charlie. O talit: descubra os segredos milenares do manto de oração judaico. Rio de Janeiro: Renova, 2018. p. 32-36.

72. JEWISH Virtual Library. “Rosh HaShanah: The Shofar”. Disponível em: www.jewishvirtuallibrary.org/the-shofar. Acesso em: 29 set. 2022.

73. JEWISH Virtual Library. “Ancient Jewish History: The Menorah”. Disponível em: www.jewishvirtuallibrary.org/themenorah. Acesso em: 29 set. 2022.

74. JEWISH Virtual Library. “Jewish Holidays: Chanukah”. Disponível em: www.jewishvirtuallibrary.org/hannukah. Acesso em: 29 set. 2022.

75. JEWISH Virtual Library. “Ancient Jewish History: The Ark of the Covenant”. Disponível em: www.jewishvirtuallibrary.org/the-ark-of-the-convenant. Acesso em: 29 set. 2022.$nota$
  where curso_id = v_curso_id and ordem = 8
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. HOBSBAWM, E. J. Nações e nacionalismo desde 1780: programa, mito e realidade. Rio de Janeiro: Paz e Terra, 1990. p. 19.

2. HOBSBAWM, 1990, p. 27.

3. HOBSBAWM, 1990, p. 31-32.

4. SAND, Shlomo. A invenção do povo judeu: da Bíblia ao sionismo. São Paulo: Benvirá, 2011. p. 136-137.

5. SAND, 2011, p. 40.

6. GUNNEWEG, 2005, p. 309.

7. SHAPIRA, 2018, p. 24.

8. SHAPIRA, 2018, p. 31-32.

9. ARENDT, Hannah. Origens do totalitarismo. São Paulo: Companhia das Letras, 1989. p. 143.

10. SHAPIRA, 2018, p. 32.

11. SHAPIRA, 2018, p. 33-34.

12. BORGER, 2002, p. 427-428.

13. GUNNEWEG, 2005, p. 316-317.

14. SAND, Shlomo. A invenção da Terra de Israel: de Terra Santa a terra pátria. São Paulo: Benvirá, 2014. p. 213-216.

15. CROUZET, Maurice. A época contemporânea: o desmoronamento dos impérios coloniais; o surto das ciências e técnicas. São Paulo: Difusão Europeia do Livro, 1958, v. 3. p. 95. [História Geral das Civilizações.]

16. WILKINSON, Paul Richard. For Zion’s sake: Christian Zionism and the role of John Nelson Darby. Milton Keynes: Paternoster, 2007. p. 228.

17. LANGE, 2007, p. 70-73.

18. WILKINSON, 2007, p. 229.

19. LANGE, 2007, p. 76.

20. GUNNEWEG, 2005, p. 350.

21. GUNNEWEG, 2005, p. 349-350.

22. GOODMAN, 2020, p. 522.

23. SAND, 2014, p. 309.

24. GOODMAN, 2020, p. 582-583.

25. HOBSBAWM, 2018, p. 13.

26. HOBSBAWM, 2018, p. 21-22.

27. SHAPIRA, 2018, p. 25-26.

28. SHAPIRA, 2018, p. 27-28.

29. SAND, 2011, p. 138-139.

30. SAND, 2011, p. 228.

31. GOODMAN, 2020, p. 517.

32. SHAPIRA, 2018, p. 43.

33. GUNNEWEG, 2005, p. 323-325. A expressão foi traduzida para o português no livro de Gunneweg como “Fundação Nacional Judaica”, provavelmente referindo-se ao Fundo Nacional Judaico (Keren Kayemet LeYisrael).

34. SHAPIRA, 2018, p. 182.

35. SHAPIRA, 2018, p. 184-185.

36. SHAPIRA, 2018, p. 79-81.

37. SHAPIRA, 2018, p. 81-83.

38. SHAPIRA, 2018, p. 178-179.

39. SAND, 2011, p. 503.

40. SAND, 2011, p. 503-504.

41. GOODMAN, 2020, p. 524.

42. SHAPIRA, 2018, p. 312-313.

43. MISHORY, Alec. “Israel National Symbols: the Israeli flag”. Jewish Virtual Library. Disponível em: www.jewishvirtuallibrary.org/the-israeli-flag. Acesso em: 29 set. 2022.

44. GOODMAN, 2020, p. 517-519.

45. SHAPIRA, 2018, p.

314. É bom lembrar que estou usando o termo “mito” como uma história com início, meio e fim, uma “narrativa de essências” que conta aquilo que importa a um povo. O mito também se funda em fatos ocorridos na história. É preciso ressaltar isso repetidas vezes, em face do infeliz negacionismo do Holocausto corrente nos círculos antissemitas.

46. SHAPIRA, 2018, p. 323.

47. RICOEUR, 2010, v. 3, p. 318-323.$nota$
  where curso_id = v_curso_id and ordem = 9
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. MENDONÇA, 2015, p. 197.

2. IRVIN, Dale T.; SUNQUIST, Scott W. História do movimento cristão mundial: do cristianismo primitivo a 1453. São Paulo: Paulus, 2004, v. 1. p. 15-17.

3. STEGEMANN, Wolfgang. Jesus e seu tempo. São Leopoldo: Sinodal/EST, 2012. p. 90-99. Stegemann apresenta as chamadas “buscas do Jesus histórico”. Essa obra apresenta um bom conteúdo sobre esses debates. A historicidade do Novo Testamento é defendida na coletânea de BOCK, Darrel L. (org.). O Jesus histórico: critérios e contextos no estudo das origens cristãs. Rio de Janeiro: Thomas Nelson Brasil, 2020.

4. STEGEMANN, 2012, p. 154.

5. STERN, David H. Comentário judaico do Novo Testamento. São Paulo: Didática Paulista; Belo Horizonte: Atos, 2008. p. 291.

6. Tratei esse tema em Aqueles da Bíblia. Sugiro a leitura dos capítulos 8 e 9. Eles explicam a tensão política e religiosa do primeiro século, e as razões pelas quais Paulo consideraria aquele evento “escândalo para os judeus e loucura para os gentios” (1Coríntios 1:23).

7. KÖRTNER, 2009, p. 136-137.

8. RICOEUR, 1988, p. 374-377.

9. Esse processo foi, basicamente, o que compreendemos como mímesis I e mímesis II acontecendo na comunidade dos seguidores de Jesus. Eles tinham uma compreensão da realidade segundo a qual Jesus era o cumprimento das profecias do passado, e a fixaram em textos valendo-se de estratégias narrativas, contando uma história com um sentido próprio.

10. FOCANT, Camille. “Verdade histórica e verdade narrativa: o relato da Paixão em Marcos. p. 79-97”. In: HERMANS, Michel; SAUVAGE, Pierre (orgs.). Bíblia e história: Escritura, interpretação e ação no tempo. São Paulo: Loyola, 2006. p. 86-89.

11. WRIGHT, Nicholas Thomas. Como Deus se tornou rei. Rio de Janeiro: Thomas Nelson Brasil, 2019. p. 83.

12. WRIGHT, 2019, p. 86-99.

13. WRIGHT, Nicholas Thomas. Simplesmente Jesus. Rio de Janeiro: Thomas Nelson Brasil, 2020. p. 219-221.

14. Beber quatro taças de vinho na cerimônia do Pessach não é uma ordenança da Torá, mas estava presente na tradição judaica pelo menos desde o primeiro século. KEENER, Craig S. Comentário histórico-cultural da Bíblia: Novo Testamento. São Paulo: Vida Nova, 2017. p. 128-129.

15. WRIGHT, 2019, p. 128-129. Embora, para Frye, o mito não precise estar diretamente ligado à historicidade do passado (para ele, não seriam fatos históricos), em Wright a narrativa dos Evangelhos trata de um fato realmente ocorrido. Mas, ao mesmo tempo, essas narrativas são “mito” porque são “histórias que as comunidades contam para explicar e dar direção à própria vida”.

16. CULLMANN, Oscar. Cristo e o tempo. 2. ed. São Paulo: Fonte Editorial, 2020. p. 121-123.

17. CULLMANN, 2020, p. 124-126.

18. GOLDINGAY, 2020, p. 285-286.

19. WRIGHT, Nicholas Thomas. Paulo: uma biografia. Rio de Janeiro: Thomas Nelson Brasil, 2018. p. 462-66.

20. Como aponta SCHELLEY, Bruce L. História do cristianismo: uma obra completa e atual sobre a trajetória da igreja cristã desde as origens até o século 21. Rio de Janeiro: Thomas Nelson Brasil, 2018. p. 32.

21. SCHELLEY, 2018, p. 32-37.

22. Como sustenta Lucas Gesta, não foi Roma o principal centro cristão do cristianismo do primeiro século, mas Antioquia; tampouco foi a Europa a motriz intelectual e numérica da igreja, mas a Síria. PAIVA, Lucas Gesta Palmares Munhoz. “Os cristianismos orientais e seu desaparecimento na historiografia eclesiástica ocidental”. Teológica, Revista Brasileira de Teologia, Rio de Janeiro, n. 5, jan./jun. 2018. p. 76-94.

23. KLEIN; HUBBARD; BLOMBERG, 2017, p. 93-94. Um exemplo da aplicação das Escrituras hebraicas dentro de um molde narrativo cristológico pode ser encontrado na coletânea de pregações de CHO, Bernardo. O enredo da salvação: presença divina, vocação humana e redenção cósmica. São Paulo: Mundo Cristão, 2021.

24. GONZÁLEZ, Justo L. Atos, o evangelho do Espírito Santo. São Paulo: Hagnos, 2011. p. 36-39.

25. Essa é basicamente a tese do Justo González. GONZÁLEZ, 2011, p. 330-331.

26. CARSON, D. A. Introdução ao Novo Testamento. São Paulo: Vida Nova, 1997. p. 239.

27. MACDONALD, Dennis R. The Gospels and Homer: imitations of Greek epic in Mark and Luke-Acts. The New Testament and Greek literature, V. I. Londres: Rowman & Littlefield, 2015.

28. TREBOLLE BARRERA, 1995, p. 150-151.

29. JUSTER, Daniel. Raízes judaicas: entendendo as origens da nossa fé. Ed. rev. São Paulo: Impacto, 2018. p. 180-182.

30. IRVIN; SUNQUIST, 2004, p. 110.

31. PIZA, Pedro Luís de Toledo. “O judaísmo na perspectiva de Inácio de Antioquia”. Revista Alétheia, v. 9, n. 2. p. 86-96, fev. 2015. Disponível em: periodicos.ufrn.br/aletheia/article/view/6679. Acesso em: 29 set. 2022.

32. SELVATICI, Monica. “Identidades cristãs e práxis judaizantes na Ásia Menor romana do século II d.C.: um exame das epístolas de Inácio de Antioquia”. Diálogos. Maringá-PR, Brasil, v. 24, n. 2. p. 325-341, mai/ago. 2020. Disponível em: doi.org/10.4025/dialogos.v24i2.45651. Acesso em: 29 set. 2022, p. 338-339.

33. IRVIN; SUNQUIST, 2004, p. 93-95.

34. KINZIG, Wolfram. “‘Non-Separation’: closeness and co-operation between Jews and Christians in the fourth century”. Vigilae Christianae, v. 45, n. 1, mar. 1991. p. 27-53, E. J. Brill, Leiden. Disponível em: doi.org/10.1163/157007291X00233. Acesso em: 29 set. 2022, p. 28-29.

35. KINZIG, 1991, p. 42.

36. IRVIN; SUNQUIST, 2004, p. 171.

37. IRVIN; SUNQUIST, 2004, p. 172.

38. JUSTER, 2018, p. 178-179.

39. IRVIN; SUNQUIST, 2004, p. 172-173.

40. IRVIN; SUNQUIST, 2004, p. 173.

41. IRVIN; SUNQUIST, 2004, p. 139.

42. IRVIN; SUNQUIST, 2004, p. 152.

43. IRVIN; SUNQUIST, 2004, p. 170.

44. MCGRATH, Alister. Heresia: em defesa da fé. São Paulo: Hagnos, 2014. p. 61.

45. MCGRATH, 2014, p. 102-103.

46. TILLICH, Paul. História do pensamento cristão. São Paulo: ASTE, 2015. p. 18-21.

47. TILLICH, 2015, p. 37.

48. Essas assimilações não eram novidade para os judeus antigos. O judaísmo do tempo de Jesus já era profundamente influenciado pelo helenismo, como explorei em Aqueles da Bíblia.

49. A oposição de uma ortodoxia em formação contra ideias consideradas hereges pode ser verificada na lista de heresias clássicas levantadas por McGrath: o ebionismo, um modelo judaico no qual Jesus foi interpretado como profeta, mas não divino; o docetismo, cujas bases helenistas de pensamento relegaram a humanidade de Jesus apenas à aparência, e não à realidade concreta; o valentinianismo, espécie de cristianismo gnóstico; e o marcionismo, que basicamente negava o judaísmo e a Bíblia hebraica. Ou seja, como conclui McGrath a respeito das “heresias clássicas”, suas discussões envolvem o posicionamento de ideias postadas entre cristianismo, judaísmo e gnosticismo. MCGRATH, 2014, p. 134-169.

50. TREBOLLE BARRERA, 1995, p. 295.

51. TILLICH, 2015, p. 58.

52. IRVIN; SUNQUIST, 2004, p. 202.

53. IRVIN; SUNQUIST, 2004, p. 210-211. Sol Invictus, ou Sol Invencível, é o monoteísmo solar preferido dos imperadores do século III. Explicarei a razão para esse tipo de assimilação no próximo capítulo, quando tratar do desenvolvimento simbólico do cristianismo.

54. IRVIN; SUNQUIST, 2004, p. 213-214.

55. GONZÁLEZ, 2011, p. 164-170.

56. WON, 2020, p. 74-78.

57. CARSON, 1997, p. 548.

58. KÖRTNER, 2009, p. 122-123.$nota$
  where curso_id = v_curso_id and ordem = 11
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. IRVIN; SUNQUIST, 2004, p. 316-319.

2. IRVIN; SUNQUIST, 2004, p. 324-325.

3. IRVIN; SUNQUIST, 2004, p. 325.

4. IRVIN; SUNQUIST, 2004, p. 418-419.

5. IRVIN; SUNQUIST, 2004, p. 472-473.

6. IRVIN; SUNQUIST, 2004, p. 477-478.

7. IRVIN; SUNQUIST, 2004, p. 478.

8. IRVIN; SUNQUIST, 2004, p. 491-492.

9. IRVIN; SUNQUIST, 2004, p. 509-510.

10. LANGE, 2007, p. 34-35.

11. LANGE, 2007, p. 35-37.

12. CHADWICK, Henry; EVANS, Gilian. Igreja cristã. Barcelona: Folio, 2007. p. 222. [Grandes livros da religião.]

13. NOGUEIRA, Paulo Augusto de Souza. “Do silêncio do texto às imagens da ressurreição: cultura visual e interpretação bíblica”. p. 52-100. In: MENDONÇA, Kátia Marly Leite; RENDERS, Helmuth; HIGUET, Etienne Alfred. Religião e cultura visual no Brasil: desafios e métodos. Belém: EDUEPA, 2020. v. 1. p. 56. [Coleção Ciências da Religião.]

14. NOGUEIRA, 2020, p. 57.

15. KÖRTNER, 2009, p. 104.

16. KLEIN; HUBBARD; BLOMBERG, 2017, p. 98-99.

17. PELLETIER, 2006, p. 154.

18. GONZÁLEZ, Justo L. Retorno à história do pensamento cristão: três tipos de teologia. São Paulo: Hagnos, 2011b. p. 23- 39.

19. KLEIN; HUBBARD; BLOMBERG, 2017, p. 107-109.

20. RAMOS, 2019, p. 45.

21. KLEIN; HUBBARD; BLOMBERG, 2017, p. 110-111.

22. TILLICH, 2015, p. 146-147 23. TILLICH, 2015, p. 147-148.

24. RAMOS, 2019, p. 49.

25. Você encontrará uma excelente compilação dos símbolos utilizados na arte cristã, listados em ordem alfabética, em HEINZ-MOHR, Gerd. Dicionário dos símbolos: imagens e sinais da arte cristã. São Paulo: Paulus, 1994.

26. IRVIN; SUNQUIST, 2004, p. 112-113.

27. CULLMANN, Oscar. História da salvação. São Paulo: Fonte Editorial, 2020. p. 524-525.

28. TREVISAN, Armindo. O rosto de Cristo: a formação do imaginário e da arte cristã. Porto Alegre: AGE, 2003. p. 31.

29. Para entender melhor como isso aconteceu, sugiro a leitura de meus livros Os outros da Bíblia e Aqueles da Bíblia.

30. TREVISAN, 2003, p. 26-28.

31. TREVISAN, 2003, p. 29-30.

32. STAFFORD, Thomas Albert. Christian symbolism in the evangelical churches: with definitions of church terms and usages. New York: Abingdon-Cokesbury, c. 1942. p. 33.

33. STAFFORD, 1942, p. 34-53. Os triângulos costumam causar desconforto no evangélico quando encontra esse símbolo nas igrejas católicas, por exemplo. Especialmente quando aparece um olho em seu centro. Esse é, claro, um símbolo maçônico. Entretanto, antes de ser assumido pela maçonaria, era cristão. Portanto, não associe diretamente o uso de triângulos a tal movimento. Pode ter sido inserido pelos maçons em construções mais recentes, mas não necessariamente, dada a antiguidade da referência. O triângulo faz parte de um cânon cristão consagrado por sua relação com a Trindade.

34. TREVISAN, 2003, p. 34-36.

35. STAFFORD, 1942, p. 64-71.

36. WRIGHT, Nicholas Thomas. O dia em que a revolução começou: reinterpretando a crucificação de Jesus. Brasília: Chara, 2017. p. 208.

37. STAFFORD, 1942, p. 108-110. A arca como local de salvação da ira divina e, portanto, vinculada à igreja, aparece também na pintura cristã desde as catacumbas. HEINZ-MOHR, 1994, p. 29-30.

38. IRVIN; SUNQUIST, 2004, p. 586-587.

39. TILLICH, 2015, p. 109-110.

40. TILLICH, 2015, p. 110.$nota$
  where curso_id = v_curso_id and ordem = 12
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. LINDBERG, Carter. História da reforma. Rio de Janeiro: Thomas Nelson Brasil, 2017. p. 34-35.

2. LINDBERG, 2017, p. 27.

3. LINDBERG, 2017, p. 28.

4. KÖRTNER, 2009, p. 125.

5. THOMPSON, Mark D. “Sola Scriptura”. p. 129-164. In: BARRETT, Matthew. Teologia da Reforma. Rio de Janeiro: Thomas Nelson Brasil, 2017. p. 130-135.

6. Para compreender como funciona o princípio católico romano da igualdade entre tradição e Bíblia, veja TEMPESTA, Orani João. A Bíblia, tradição e magistério. Disponível em: www.cnbb.org.br/a-biblia-tradicao-e-magisterio/. Acesso: 29 set. 2022.

7. THOMPSON, 2017, p. 142.

8. BARRETT, Matthew. Teologia da Reforma. Rio de Janeiro: Thomas Nelson Brasil, 2017. p. 15.

9. BRAY, Gerald. História da interpretação bíblica. São Paulo: Vida Nova, 2017. p. 194.

10. IRVIN; SUNQUIST, 2004, p. 604.

11. PELLETIER, 2006, p. 26.

12. KÖRTNER, 2009, p. 111.

13. PELLETIER, 2006, p. 29.

14. RICOEUR, 2006, p. 282.

15. GEORGE, Timothy. Teologia dos reformadores. São Paulo: Vida Nova, 1993. p. 270-273.

16. KLEIN; HUBBARD; BLOMBERG, 2017, p. 116.

17. LINDBERG, 2017, p.

410. Veja também BRAKEMEIER, 2003, p. 34-35. Brakemeier apresenta o resultado da concepção de inspiração na ortodoxia protestante. Doravante, trata-se de três inspirações: pessoal, real e verbal. A “inspiração pessoal” seria o impulso do Espírito Santo que leva o autor a ter vontade de escrever; a “inspiração real” seria a sugestão do conteúdo, a causa do evangelho; e a “inspiração verbal” seria a sugestão das palavras, sendo a própria escolha de cada palavra uma autoria do Espírito Santo. Nesta última, os autores não são mais testemunhas, mas apenas “impressoras” do Espírito Santo.

18. TILLICH, 2015, p. 270-271.

19. TILLICH, 2015, p. 276.

20. LINDBERG, 2017, p. 235.

21. KÖRTNER, 2009, p. 126.

22. LINDBERG, 2017, p. 134-139.

23. Na numeração medieval do Decálogo, a proibição dos ídolos estava incluída no primeiro mandamento, tradição mantida por católicos e luteranos. A partir de Calvino, o “não farás imagem para adorar” foi entendido como um segundo mandamento separado e exclusivo do “não terás outros deuses”. LINDBERG, 2017, p. 432-437.

24. ROOKMAAKER, H. R. A arte moderna e a morte de uma cultura. Viçosa: Ultimato, 2015. p. 41.

25. KÖRTNER, 2009, p. 119.

26. LINDBERG, 2017, p. 432.

27. FINKELSTEIN; SILBERMAN, 2003, p. 33-36.

28. SIZER, Stephen. Christian Zionism: road-map to Armageddon? Downers Grove: InterVarsity Press, 2004. p. 28-29.

29. KARNAL, Leandro et. al. História dos Estados Unidos: das origens ao século XXI. São Paulo: Contexto, 2007. p. 44-50.

30. WILKINSON, 2007, p. 230-232.

31. KLEIN; HUBBARD; BLOMBERG, 2017, p. 113-115.

32. SIZER, 2004, p. 28.

33. MCDERMOTT, Gerald R. A importância de Israel: por que o cristão deve pensar de maneira diferente em relação ao povo e à terra. São Paulo: Vida Nova, 2018. p. 64-69.

34. GOLDMAN, Shalom. Zeal for Zion: Christians, Jews & the idea of the Promised Land. Chapel Hill: The University of North Carolina Press, 2009. p. 20-23.

35. OLSON, Roger E. História da teologia cristã: 2000 anos de tradição e reformas. São Paulo: Vida, 2001. p. 553-554.

36. GRENZ, Stanley J.; OLSON, Roger E. A teologia do século 20: Deus e o mundo numa era de transição. São Paulo: Cultura Cristã, 2003. p. 348.

37. OLSON, 2001, p. 576.

38. TORREY, R. A. (ed.). Os fundamentos: a famosa coletânea de textos das verdades bíblicas fundamentais. São Paulo: Hagnos, 2005. p. 13.

39. OLSON, 2001, p. 576.

40. OLSON, 2001, p. 570.

41. OLSON, 2001, p. 581-582.

42. SIZER, 2004, p. 50-51.

43. BASS, Clarence B. Backgrounds to dispensationalism: its historical genesis and ecclesiastical implications. Grand Rapids: Wm. B. Eerdmans, 1960. p. 100-102.

44. Irineu de Lyon (130–202) mencionou quatro dispensações: o pacto com Adão até o dilúvio; com Noé, até o Êxodo; com Moisés, até o nascimento de Jesus; e com Cristo, até o fim dos tempos. GONZÁLEZ, 2009, p.

94. Outra noção semelhante foi elaborada pelo abade Joaquim de Fiore (1135 –1202) ao retomar o trinitarismo econômico do segundo século, em que cada pessoa divina era associada a um período histórico. Assim, a era da criação e de Israel correspondia à primeira era; as esperanças messiânicas e o advento de Cristo correspondiam à segunda, na qual o tempo medieval de Fiore estava mergulhado. Mas viria ainda a terceira era, do Espírito Santo, inaugurando um tempo de iluminação. Suas ideias se espalharam e causaram controvérsias, sendo combatidas pelas autoridades eclesiásticas.

45. BASS, 1960, p. 103-104.

46. BASS, 1960, p. 109-112.

47. BASS, 1960, p. 130-132.

48. BASS, 1960, p. 138-139. Esse é um resumo que, certamente, os dispensacionalistas de outras vertentes criticarão como um “espantalho”. A descrição acima, que encontrei em Clarence Bass, é a mesma crença que encontro nas igrejas que frequento. É um espantalho, mas firmemente cravado nos campos evangélicos brasileiros.

49. BASS, 1960, p. 72-74. Eu mesmo encontrei registros de um “pastor darbysta” circulando entre os batistas alemães no Rio Grande do Sul, no final do século XIX.

50. WILKINSON, 2007, p. 241-244.

51. WEBER, Timothy P. On the road to Armageddon: how evangelicals became Israel’s best friend. Grand Rapids: Baker Academic, 2004. p. 34.

52. POCOCK, Michael. “The influence of premillennial eschatology on evangelical missionary theory and praxis from the late nineteenth century to the present”. International Bulletin of Missionary Research, New Heaven, v. 33, n. 3. p. 137-144, jul. 2009. p. 131.

53. WEBER, 2004, p. 36-39.

54. ICE, Thomas. “Lovers of Zion: a history of Christian Zionism”. Article Archives, Liberty University, 29. p. 1-27, 2009. Disponível em: digitalcommons.liberty.edu/pretrib_arch/29. Acesso em: 29 set. 2022. p. 17.

55. WILKINSON, 2007, p. 256-257.

56. LINDSAY, Hal. A agonia do grande planeta terra. 7 ed. São José dos Campos: CLC, 1984.

57. LAHAYE, Tim. Deixados para trás: uma história dos últimos dias. Rio de Janeiro: Thomas Nelson Brasil, 2019, v.

1. A série original conta com 12 livros, atualmente sendo publicados pela editora Thomas Nelson Brasil.

58. Esse é um tema longo e controverso que não pretendo abordar neste livro.

59. WILLIAMS, Joseph. “The pentecostalization of Christian Zionism”. Church History, v. 84, Issue 1. p. 159-194, 2015. Disponível em: doi.org/10.1017/S0009640714001747. Acesso em: 29 set. 2022. p. 163-165.

60. A chuva temporã é a chuva do outono, as “primeiras chuvas”, que acontecem no tempo do plantio das sementes. A chuva serôdia é a chuva da primavera, as “últimas chuvas”, que fortalecem as plantações e preparam o solo pouco antes da colheita. WALTON, John. Comentário histórico-cultural da Bíblia: Antigo Testamento. São Paulo: Vida Nova, 2018. p. 234.

61. WILLIAMS, 2015, p. 167.

62. TERRA, Kenner. “Experiência no Espírito, racionalidade e hermenêutica”, p. 173-205. In: SIQUEIRA, Gutierres; TERRA, Kenner. Autoridade bíblica e experiência no Espírito: a contribuição da hermenêutica pentecostal-carismática. Rio de Janeiro: Thomas Nelson Brasil, 2020. p. 198.

63. WILLIAMS, 2015, p. 170-175.

64. WILLIAMS, 2015, p. 179.

65. WILLIAMS, 2015, p. 183.$nota$
  where curso_id = v_curso_id and ordem = 13
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. Percebo isso claramente pelas formas como meus livros são entendidos pelos leitores. Há situações que me causam estranheza e me levam a perguntar: Como ele chegou a essa ideia? Se não há como controlar as interpretações dos leitores contemporâneos, imagine quando tratamos de um texto que foi escrito muitos séculos atrás.

2. GEFFRÉ, 2004, p. 191.

3. LEVINE, Amy-Jill; BRETTLER, Marc Z. A Bíblia com e sem Jesus: como judeus e cristãos leem as mesmas histórias com diferentes perspectivas. Rio de Janeiro: Thomas Nelson Brasil, 2022. p. 50.

4. TREBOLLE BARRERA, 1995, p. 597.

5. MAGALHÃES, Thamiris. “Cultura judaica e brasileira. Uma síntese?”, IHU On-line, Revista do Instituto Humanitas Unisinos, ed. 400, 2012. Disponível em: www.ihuonline.unisinos.br/artigo/4596-monica-grin-e-michel-gherman. Acesso em: 29 set. 2022.

6. ALVES, Eduardo Leandro. A sociedade brasileira e o pentecostalismo clássico: razões socioculturais entre a teologia pentecostal e a religiosidade brasileira. Rio de Janeiro: CPAD, 2021. p. 57.

7. ZUGNO, Vanildo Luiz. Vocês todos são irmãos! Reflexões sobre a identidade e vida religiosa. Porto Alegre: ESTEF, 2013. Disponível em: freivanildo.files.wordpress.com/2020/09/voces-todos-sao-irmaos.pdf. Acesso em: 29 set. 2022, p. 17.

8. Para entender melhor a origem e a influência do protestantismo norte-americano sobre o brasileiro, veja a pesquisa que publiquei em WACHHOLZ, Wilhelm; REINKE, André Daniel. “‘Pela paz em Jerusalém’: a origem do sionismo cristão, sua influência na igreja protestante brasileira e sua atuação no Congresso Nacional”, p. 253-273, Revista Brasileira de História das Religiões, v. 13, n. 37, maio/ago. 2020. Disponível em: periodicos.uem.br/ojs/index.php/RbhrAnpuh/article/view/51190. Acesso em 29 set. 2022, p. 262-264.

9. ALVES, 2021, p. 56-59.

10. SABINO, Igor. Por amor aos patriarcas: reflexões brasileiras sobre antissemitismo e sionismo cristãos. Brasília: Editora 371, 2020. p. 23.

11. RAMAGEM, Sonia Bloomfield. “Jews as perceived by neo-evangelicals in Brazil”, p. 235-249. In: Judaica Latinoamericana. Jerusalém: Universidad Hebrea, 2001. p. 242.

12. RAMAGEM, 2001, p. 246-247.

13. GHERMAN, Michel. “Deus e Diabo na Terra Santa: pentecostalismo brasileiro em Israel”. WebMosaica, Revista do Instituto Cultural Judaico Marc Chagall, v. 1, n. 1, jan.-jun. 2009, p.

58. Disponível em: seer.ufrgs.br/webmosaica/article/view/9767. Acesso em: 29 set. 2022.

14. GHERMAN, 2009, p. 59.$nota$
  where curso_id = v_curso_id and ordem = 15
    and position('NOTAS' in conteudo) = 0;
  update public.aulas
  set conteudo = conteudo || chr(10) || chr(10) || $nota$NOTAS

1. RICOEUR, 2010, v. 3, p. 387.

2. SMITH, James K. A. A queda da interpretação: fundamentos filosóficos para uma hermenêutica criacional. Rio de Janeiro: Thomas Nelson Brasil, 2021. p. 219-220.

3. RICOEUR, 2010, v. 3, p. 263.

4. SMITH, 2021, p. 253.

5. VOLF, Miroslav. Uma fé pública: como o cristão pode contribuir para o bem comum. São Paulo: Mundo Cristão, 2018. p. 156-159.

6. VOLF, 2018, p. 158.

7. MUELLER, Enio R. Teologia cristã: em poucas palavras. São Paulo: Teológica; São Leopoldo: Escola Superior de Teologia, 2005. p. 15-20.

8. MUELLER, 2005. p. 24-25.

9. MUELLER, 2005, p. 37.

10. AGOSTINHO. A doutrina cristã: manual de exegese e formação cristã. São Paulo: Paulus, 2002. [Patrística, 17]. Livro I, XXXVI, 40.

11. PELLETIER, 2006, p. 189-190.

12. VOLF, 2018, p. 159.

13. VOLF, 2018, p. 162.

14. GEFFRÉ, 2004, p. 146.$nota$
  where curso_id = v_curso_id and ordem = 16
    and position('NOTAS' in conteudo) = 0;
end
$migration$;
