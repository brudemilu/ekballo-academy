-- Casamento Blindado 2.0 e Davi — acrescenta as secoes finais ausentes.
--
-- Rastreio verificado do acervo (cruza o sumario do PDF com os titulos das mesas
-- que ja existem no banco) apontou apenas tres livros com secao final faltando.
-- Estes sao os dois aproveitaveis: Casamento Blindado sem as Referencias
-- bibliograficas (pags. 290-293) e Davi sem as Notas (a partir da 351).
--
-- O terceiro, Deuses Falsos, fica de fora: esta despublicado porque o PDF-fonte
-- e traducao automatica ruim, e nao adianta extrair de fonte ruim.
--
-- A extracao para ao encontrar anuncio da editora ("compre agora e leia"), como
-- ja foi preciso fazer em "O Cristao em uma Sociedade nao Crista" e em "Os
-- Outros da Biblia".
--
-- Nao destrutiva: so INSERT condicional.

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'casamento-blindado';
  if v_curso_id is not null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    select v_curso_id, $t$Referências bibliográficas$t$, 26, $c$É possível resgatar o amor? UOL Notícias, Brasileiro casa cada vez mais tarde e separa-se mais jovem e com menos tempo de

casado, diz IBGE <https://noticias.uol.com.br/cotidiano/ultimas-noticias/2012/12/17/brasileirocasa-cada-vez-mais-tarde-e-separa-mais-jovem-e-com-menos-tempo-de-casado-diz-ibge.htm>. Acessado em 30 de maio de 2017. Portal Brasil, Em 10 anos, taxa de divórcios cresce mais de 160% no País <http://www.brasil.gov.br/cidadania-e-justica/2015/11/em-10-anos-taxa-de-divorcios-cresce-maisde-160-no-pais>. Acessado em 22 de maio de 2017.

Capítulo 1 BBC, Cidade do México estuda permitir casamentos renováveis a cada dois anos <http://www.bbc.com/portuguese/noticias/2011/09/110929_mexico_casamento_validade_fn.shtml>. Acessado em 22 de maio de 2017. Time, The Beta Marriage: How Millennials Approach ‘I Do’ <http://time.com/3024606/millennials

marriage-sex-relationships-hook-ups/>. Acessado em 8 de maio de 2017. Independent, 10-year relationship contracts could replace marriages and prevent divorce, say

relationship experts <http://www.independent.co.uk/life-style/love-sex/10-year-relationshipcontracts-could-replace-marriages-and-save-divorce-say-relationship-experts-a7456211.html>. Acessado em 19 de junho de 2017. Aeon, A temporary marriage makes more sense than marriage for life <https://aeon.co/ideas/a

temporary-marriage-makes-more-sense-than-marriage-for-life>. Acessado em 3 de julho de 2017. The New York Times, For Women Under 30, Most Births Occur Outside Marriage

<http://www.nytimes.com/2012/02/18/us/for-women-under-30-most-births-occur-outsidemarriage.html?_r=1>. Acessado em 22 de maio de 2017. Politifact Virginia, Beyer says more than half of moms under 30 are unwed <http://www.politifact.com/virginia/statements/2015/jun/22/don-beyer/beyer-says-more-halfmoms-under-30-are-unwed/>. Acessado em 22 de maio de 2017. Science Daily, Do children need both a mother and a father? <https://www.sciencedaily.com/releases/2010/01/100121135904.htm>. Acessado em 22 de maio de 2017. The Atlantic, Are Fathers Necessary? <http://www.theatlantic.com/magazine/archive/2010/07/are

fathers-necessary/8136/>. Acessado em 22 de maio de 2017. Daily Mail, The Facebook divorces: Social network site is cited in ‘a THIRD of splits’

<http://www.dailymail.co.uk/femail/article-2080398/Facebook-cited-THIRD-divorces.html>. Acessado em 22 de maio de 2017. Daily Mail, The marriage killer: One in five American divorces now involve Facebook

<http://www.dailymail.co.uk/news/article-1334482/The-marriage-killer-One-American-divorcesinvolve-Facebook.html>. Acessado em 22 de maio de 2017.

Covenant Eyes, Pornography Statistics: 2015 Report <http://www.covenanteyes.com/pornstats/>.

Acessado em 22 de maio de 2017. Barna Group, Porn in the Digital Age: New Research Reveals 10 Trends <https://www.barna.com/research/porn-in-the-digital-age-new-research-reveals-10-trends/>. Acessado em 22 de maio de 2017. Clergy sex addiction intensive <https://www.hopeandfreedom.com/clergy-sex-addiction-intensive>.

Acessado em 10 de julho de 2017. Motion Picture Association of America, Theatrical Market Statistics, 2015, p. 19,20

<http://www.mpaa.org/wp-content/uploads/2016/04/MPAA-Theatrical-Market-Statistics2015_Final.pdf>. Statistic Brain, Adult Film Industry Statistics & Demographics <http://www.statisticbrain.com/adult

film-industry-statistics-demographics/>. Acessado em 7 de julho de 2017. Huffington Post, Facebook, Divorce Linked In New Study <http://www.huffingtonpost.com/2013/06/06/facebook-divorce-linked-i_n_3399727.html>. Acessado em 18 de maio de 2017. R7, Mulheres são maioria nas universidades do mundo <http://noticias.r7.com/vestibular-e

concursos/noticias/mulheres-sao-maioria-nas-universidades-do-mundo-20111022.html>. Acessado em 22 de maio de 2017. Portal Brasil, Mulheres são maioria em universidades e cursos de qualificação <http://www.brasil.gov.br/economia-e-emprego/2016/03/mulheres-sao-maioria-em-universidadese-cursos-de-qualificacao>. Acessado em 22 de maio de 2017. Revista IstoÉ, 19 de novembro de 2008, ed. 2037. P. 68, Elas estão traindo mais <

http://istoe.com.br/1572_ELAS+ESTAO+TRAINDO+MAIS/>. Acessado em 22 de maio de 2017.

Capítulo 2 Covey, Stephen. Os 7 hábitos das pessoas altamente eficazes. 52a edição. Rio de Janeiro: Best Seller,

2014. p. 56-57.

Capítulo 4 Reuters, In love? It’s not enough to keep a marriage, study finds <http://www.reuters.com/article/2009/07/14/idUSSP483675>. Acessado em 18 de maio de 2017. Barna, New Marriage and Divorce Statistics Released <https://www.barna.com/research/new

marriage-and-divorce-statistics-released/>. Acessado em 18 de maio de 2017.

Capítulo 6 Wikipedia, 5 Whys <http://en.wikipedia.org/wiki/5_Whys>. Acessado em 18 de maio de 2017.

Capítulo 7 Ahlwardt, Peter; Reasonable and Theological Considerations about Thunder and Lightning (1745). Deutsche Welle, Benjamin Franklin inventa o para-raios <http://www.dw.com/pt-br/1752-benjamin

franklin-inventa-o-para-raios/a-314478>. Acessado em 19 de maio de 2017.

Capítulo 8 Wikipedia, Soul Mate <http://en.wikipedia.org/wiki/soulmate>. Acessado em 19 de maio de 2017.

Capítulo 11 Lexiophiles, E a vaca foi para o brejo! <http://www.lexiophiles.com/portugues/e-a-vaca-foi-para-o

brejo>. Acessado em 19 de maio de 2017. Guiness World Records, Most somersaults into underpants in 90 seconds

<http://www.guinnessworldrecords.com/world-records/most-somersaults-into-underpants-in-90- seconds>. Acessado em 20 de junho de 2017.

Capítulo 15 CBC News, Neuroscientists explore diferences in male, female brains <http://www.cbc.ca/news/health/men-women-brains-difference-1.3473154>. Acessado em 19 de maio de 2017. Brizendine, Louann. The Female Brain. Three Rivers Press, 2007. Gungor, Mark. Laugh Your Way to a Better Marriage. Atria Books, 2008. BBC, Women ‘better at multitasking’ than men, study finds <http://www.bbc.com/news/science

environment-24645100>. Acessado em 19 de maio de 2017.

Capítulo 16 Hooks, bell. Feminist Theory: From Margin to Center. Cambridge: South End Press, 2000 p.26. Veja só a razão disso no Brasil: 1977: É aprovada a Lei do Divórcio (nº 6.515), uma antiga

reivindicação do movimento feminista. <https://web.archive.org/web/20130110074328/http://www.brasil.gov.br/linhadotempo/epocas/1977/ do-divorcio>. Acessado em 19 de maio de 2017. BBC, Como vício em pornografia está afetando saúde sexual de jovens britânicos <www.bbc.com/portuguese/geral-37087394>. Acessado em 8 de maio de 2017. Your Brain on Porn, Porn-Induced Sexual Dysfunction <https://yourbrainonporn.com/porn-induced

ed-start-here>. Acessado em 8 de maio de 2017.

Capítulo 17 Merriam–Webster’s Collegiate Dictionary - etymology of husband, husbandry: ORIGIN late Old

English (in the senses ‘male head of a household’ and ‘manager, steward’), from Old Norse húsbóndi ‘master of a house,’ from hús ‘house’ + bóndi ‘occupier and tiller of the soil.’ The original sense of the verb was ‘till, cultivate’. Merriam-Webster, Inc.

Capítulo 19 Birnbaum, Gurit E.; Reis, Harry T.; Mizrahi, Moran; Kanat-Maymon, Yaniv; Sass, Omri; Granovski

Milner, Chen. Intimately Connected: The Importance of Partner Responsiveness for Experiencing Sexual Desire. Journal of Personality and Social Psychology, Vol 111(4), Oct 2016, 530-546. <https://www.researchgate.net/publication/305211692_Intimately_Connected_The_Importance_of_ Acessado em 13 de maio de 2017. Instituto Oncoguia, Fatores de risco para o câncer de ânus <http://www.oncoguia.org.br/conteudo/fatores-de-risco-para-o-cancer-de-anus/8378/973/>. Acessado em 5 de julho de 2017. WapTV Comunicação, Sexo Anal MATA! Você sabia? — Dra. Anete Guimarães <https://www.youtube.com/watch?v=2K-_IBVuj3k&feature=youtu.be>. Acessado em 5 de julho de 2017. R7, Cadeirantes têm vida sexualmente ativa quando são curiosos <http://noticias.r7.com/saude/noticias/cadeirantes-tem-vida-sexualmenteativa-quando-sao-curiosos20100328.html>. Acessado em 5 de julho de 2017.

Capítulo 20 BBC, Maioria das mulheres perde quase 90% dos óvulos até os 30 anos, diz estudo

<www.bbc.com/portuguese/ciencia/2010/01/100128_reservaovulosestudofn.shtml>. Acessado em 24 de maio de 2017.

IBGE, Estatísticas do Registro Civil 2015, v. 42, Rio de Janeiro, p. 35, “a maior proporção das

dissoluções se deu em famílias somente com filhos menores de idade” <http://biblioteca.ibge.gov.br/visualizacao/periodicos/135/rc_2015_v42.pdf>.

Capítulo 21 Exame, As 8 principais traições financeiras que minam os casamentos <http://exame.abril.com.br/seu

dinheiro/as-8-principais-traicoes-financeiras-que-minam-os-casamentos/>. Acessado em 6 de julho de 2017. Cahit Guven, Claudia Senik, Holger Stichnoth. You can’t be happier than your wife. Happiness Gaps

and Divorce. PSE Working Papers n2011-01, p. 21. 2011. <halshs-00555427>. Weiss, Yoram (1997) Tel-Aviv University: The Formation And Dissolution Of Families: Why Marry?

Who Marries Whom? And What Happens Upon Divorce, p. 112. <http://public.econ.duke.edu/~vjh3/e195S/readings/Weiss.pdf>.

Capítulo 22 Daily Mail, Why you should never go to bed angry: Bad memories are harder to shake after a good

night’s sleep <http://www.dailymail.co.uk/sciencetech/article-3982542/Why-never-bed-angry-Badmemories-harder-shake-good-night-s-sleep.html>. Acessado em 6 de julho de 2017. Marriage Gems, Avoid Divorce with 5:1 Ratio <https://marriagegems.com/tag/five-to-one-ratio/>.

Acessado em 24 de maio de 2017. Accountemps, FUNNY BUSINESS; Accountemps Survey: Executives Say Humor Is Key Part of

Cultural Fit. <accountemps.rhi.mediaroom.com/funny-business>. Acessado em 24 de maio de 2017. Daily Mail, House-cleaning causes the most marital dust-ups as majority of couples admit they row

over chores at least once a week <http://www.dailymail.co.uk/news/article-2265615/House-cleaningcauses-marital-dust-ups-majority-couples-admit-row-chores-week.html>. Acessado em 7 de julho de 2017.

Capítulo 23 Joel, S., Gordon, A., Impett, E. A., MacDonald, G., & Keltner, D. (2013). The things you do for me:

Perceptions of a romantic partner’s investments promote gratitude and commitment. Personality and Social Psychology Bulletin. <https://www.researchgate.net/publication/251878599_The_Things_You_Do_for_Me_Perceptions_ Acessado em 17 de maio de 2017. Science of relationships, The Silver Lining to Sacrificing for Your Partner <http://www.scienceofrelationships.com/home/2017/3/6/the-silver-lining-to-sacrificing-for-yourpartner.html>. Acessado em 7 de julho de 2017. Wieselquist, J., Rusbult, C. E., Foster, C. A., & Agnew, C. R. (1999). Commitment, pro-relationship

behavior, and trust in close relationships. Journal of Personality and Social Psychology. <https://www.ncbi.nlm.nih.gov/pubmed/10573874>. Acessado em 24 de maio de 2017. Grant, Adam. Dar e receber: uma abordagem revolucionária sobre sucesso, generosidade e influência.

Rio de Janeiro: Sextante, 2014.$c$
    where not exists (select 1 from public.aulas where curso_id = v_curso_id and ordem = 26);
  end if;

  select id into v_curso_id from public.cursos where slug = 'davi';
  if v_curso_id is not null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    select v_curso_id, $t$Notas$t$, 26, $c$INTRODUÇÃO

Boris Pasternak, fonte desconhecida. Carl Sandburg, Abraham Lincoln: The Prairie Years and the War Years, (Nova Iorque: Harcourt, Brace, Jovanovich, 1982).

CAPÍTULO UM G. Frederick Owen, Abraham to the Middle-East Crisis (Grand Rapids, Mich.: Eerdmans, 1939,1957), 45. F.B. Meyer, David: Shepherd, Psalmist, King (Fort Washington, Penn: Christian Literature Crusade, 1977), 14. Alan Redpath, The Making of a Man of God (Westwood, N.J.: Fleming H. Revell Co., 1962), 5.

CAPÍTULO DOIS Meyer, David, 18.

CAPÍTULO TRÊS C.F. Keil e E. Delitzsch, Commentary on the Old Testament, vol. 2 (Grand Rapids, Mich.: Eerdmans, 1960), 170.

8. C.H. Spurgeon, The Treasury of David, vol. 1 (McLean, Vir.: Macdonald, nd). 9. G. Campbell Morgan, The Unfolding Message of the Bible (Westwood, N.J.: Fleming H. Revell Co., 1961), 232.

CAPÍTULO CINCO 10. G.K. Chesterfield, citado emJohn Bartlett's Familiar Quotations, ed. Emily Morison Beck (Boston, Mass.: Little, Brown and Co., 1980), 742.

CAPÍTULO SEIS 11. H.G. Wells, The History of Mr. Polly (Nova Iorque: The Press of the Reader's Club, 1941), 5. 12. A.W. Tozer, The Pursuit of God (Camp Hill, Penn.: Christian Publications, 1982,1993), 21-22,27,29. 13. Ibid, 30.

CAPÍTULO SETE 14. Bruce Larsen e Keith Miller, The Edge of Adventure (Waco, Tex.: Word Books, 1974), 156. 15. Charles R. Swindoll, Growing Strong in the Seasons of Life, (Portland, Ore: Multnomah Press, 1983), 254-55.

CAPÍTULO NOVE 16. Wayne Dyer, Your Erroneous Zones (Nova Iorque: Avon Books, 1976), 218-219. 17. Redpath, The Making of a Man of God, 107.

CAPÍTULO ONZE 18. J. Sidlow Baxter, Mark These Men (Grand Rapids, Mich.: Zondervan, 1980), 35. 19. Alfred Edersheim, The Bible History, Old Testament, vol. 4 (Grand Rapids, Mich.: Eerdmans, 1959), 149. 20. F. B. Meyer, Christ in Isaiah (Fort Washington, Penn.: Christian Literature Crusade, nd), 9. 21. Ruth Harms Calkin, "Take Over", em Tell Me Again, Lord, I Forget (Wheaton, 111.: Tyndale House, 1974), 147.

22. Peter Marshall, John Doe, Disciple: Sermons for the Youngin Spirited. Catherine Marshall (Nova Iorque: McGraw-Hill, 1963), 219-20.

CAPÍTULO DOZE 23. Thomas Carlyle, citado emJohn Bartlett's Familiar Quotations, 474. 24. Owen, Abraham to the Middle-East Crisis, 5. 25. J. Oswald Sanders, Robust in Faith (Chicago, 111.: Moody Press 1965), 121. 26. Christian Neethling Barnard, One Life (Toronto, Ont.: Macmillan, 1969), 253-254. 27. C. S. Lewis, Screwtape Letters (Nova Iorque: Collier Books, Macmillan, 1959), 132.

CAPÍTULO CATORZE 28. Carolina Sandell Berg, "Security", The Speaker's Treasury of 400 Quotable Poems, compilado por Croft M. Pentz (Grand Rapids, Mich.: Zondervan), 42. 29. Martha Snell Nicholson, "Treasures", Ivory Palaces (Wilmington, Calif.: Martha Snell Nicholson, 1946), 67.

CAPÍTULO QUINZE 30. Karl Menninger, Martin Mayman e Paul Pruyser, The Vital Balance (Nova Iorque: Viking Press, 1963), 204-5. 31. Ibid, 22.

CAPÍTULO DEZESSEIS 32. Raymond Brown, Skilful Hands: A Biography of David (Fort Wa shington, Penn.: Christian Literature Crusade, 1972), 99. 33. Dietrich Bonhoeffer, Temptation (Nova Iorque: Macmillan, 1953), 116-117. 34. Meyer, David, 195. 35. Emily Dickinson, Laurel Poetry Series (Nova Iorque: Dell Publishing, 1960), 97.

CAPÍTULO DEZESSETE 36. Paul Tournier, Guilt and Grace (São Francisco, Calif.: Harper & Row, 1958), 97.

37. Alexander Whyte, Bible Characters (Grand Rapids, Mich.: Zondervan, 1952), 245.

CAPÍTULO DEZOITO 38. John W. Lawrence, Life's Choices (Portland, Ore.: MultnomahPress,

1975), 39. 39. Whyte, Bible Characters, 309.

CAPÍTULO DEZENOVE 40. Eugene Peterson, The Message, Proverbs (Colorado Springs, Colo.: NavPress, 1995), 18-19, 41. Hugh Stowell, "From Every Stormy Wind That Blows", The Hymnal for Worship and Celebration (Waco, Texas: Word Music, 1986), 432. 42. Thomas Moore, "Come, Ye Disconsolate", The Hymnal for Worship and Celebration (Waco, Texas.: Word Music, 1986), 416.

CAPÍTULO VINTE 43. Samuel Taylor Coleridge, "Youth and Age", Poems That Live Forever, selecionado por Hazel Felleman (Nova Iorque: Doubleday, 1965), 256. 44. The NIV Study Bible, Kenneth Barker, gen. ed. (Grand Rapids, Mich.: Zondervan, 1985), 447. 45. Brown, Skilful Hands, 108. 1 46. Samuel Johnson, citado em John Bartlett's Familiar Quotations, ed. Emily Morison Beck (Boston, Mass.: Little Brown, and Co., 1980), 354.

CAPÍTULO VINTE E UM 47. Whyte, Bible Characters, 297. 48. George Bernard Shaw, citado emjohn Bartlett's Familiar Quotations,

680. 49. Stuart Briscoe, What Works When Life Doesn't (Wheaton, 111.: Victor

Books,1976), 99. 50. Dale E. Galloway, You Can Win with Love (Irvine, Calif.: Harvest House, 1976), 129-130.

CAPÍTULO VINTE E DOIS 51. Charles Allen, You Are Never Alone, (Old Tappan, Nova Jersey: Fleming H. Revell,1978), 88. 52. Mary Boley Peters: "Whom Have We, Lord, but Thee", Hymnal of Worship and Remembrance (Kansas City, Kansas: Gospel Perpetuating Publishers, P.O. Box 2216, nd), 8.

CAPÍTULO VINTE E TRÊS 53. J. Oswald Sanders, Spiritual Leadership (Chicago, 111.: Moody Press, 1969), 169. 54. C. Neil Strait, Quote Unquote, compilado por Lloyd Cory (Wheaton, Hl.: Victor Books, 1977), 297.

CAPÍTULO VINTE E QUATRO 55. Owen, Abraham to the Middle-East Crisis, 54.

CONCLUSÃO 56. Eugene Peterson, The Message, New Testament (Colorado Springs, Colo.: (NavPress, 1993), 473.$c$
    where not exists (select 1 from public.aulas where curso_id = v_curso_id and ordem = 26);
  end if;

end
$migration$;
