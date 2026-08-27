-- Os Outros da Bíblia — acrescenta a seção de Referências.
--
-- O livro traz uma seção de Referências (págs. 300-324) que nunca foi carregada:
-- o curso terminava na Conclusão, com 11 mesas. São ~59 mil caracteres de
-- citações — o mesmo tipo de perda encontrada em "O Cristão em uma Sociedade
-- não Cristã".
--
-- A extração para na pág. 324: da 325 em diante são anúncios de outros títulos
-- da editora, com ISBN e "compre agora e leia".
--
-- Não destrutiva: só INSERT, e apenas se a ordem 12 ainda não existir.

do $migration$
declare
  v_curso_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'os-outros-da-biblia';
  if v_curso_id is null then
    raise exception 'curso nao encontrado';
  end if;

  insert into public.aulas (curso_id, titulo, ordem, conteudo)
  select v_curso_id, $t$Referências$t$, 12, $c$ACQUAROLI, Armando Rafael Castro. Marduk x Yhwh: duelo de gigantes. In: DIETRICH, Luiz José; LORASCHI, Celso. Idolatria: a questão é ter ou não ter imagens? Petrópolis: Vozes, 2015. p. 375-382. [Estudos Bíblicos; n. 124]

AGOSTINHO. Confissões. Disponível em: <https://sumateologica.files.wordpress.com/2009/07/santo_agostinho_-_confissoes.pdf>. Acesso em: 19 jun. 2018.

ALFÖDY, Géza. A história social de Roma. Lisboa: Editorial Presença, 1989.

AS GRANDES religiões. v. 1. São Paulo: Editora Abril, 1973.

ASHERI, David. O Estado persa. São Paulo: Perspectiva, 2006.

AYMARD, André; AUBOYER, Jeannine. O Oriente e a Grécia Antiga: civilizações imperiais do Oriente. 2. ed. [História Geral das Civilizações] São Paulo: Difusão Europeia do Livro, 1957.

BACHA, Lourdes Maria Silva. Escritos do Antigo Egito. Rio de Janeiro: Artium, 1997.

BAILEY, Cyril. O legado de Roma. Rio de Janeiro: Imago Editora, 1992.

BASILICA of Santa Sabina, Rome. Khan Academy, 2016. Disponível em: <https://www.khanacademy.org/humanities/medieval-world/early-christian1/v/santasabina-rome>. Acesso em: 14 ago. 2018.

BATISTA, Keila Fernandes. O debate historiográfico acerca da ideia da “prostituição sagrada” no Antigo Crescente Fértil. Revista Vernáculo, n. 28, 2011, p. 187-213. Disponível em: <https://revistas.ufpr.br/vernaculo/article/view/31635>. Acesso em: 16 jul. 2018.

BAUZÁ, Hugo Francisco. Qué es un mito: una aproximación a la mitología clásica. Buenos Aires: Fondo de Cultura Económica, 2005. p. 19-25.

BENDER, André Luis. O código de Hammurabi e o Antigo Testamento. Vox Concordiana, vol. 10, n.1, p. 37-80, 1995.

BÍBLIA de Jerusalém. São Paulo: Paulus, 2002.

BONNHOEFFER, Dietrich. Discipulado. São Leopoldo: Sinodal, 1980.

BOTTÉRO, Jean; MORRISON, Ken (Orgs.). Cultura, pensamento e escrita. São Paulo: Ática, 1995.

BOUZON, Emanuel. Ensaios babilônicos: sociedade, economia e cultura na Babilônia précristã. Porto Alegre: EDIPUCRS, 1998.

BRAUDEL, Fernand. Memórias do Mediterrâneo: pré-história e antiguidade. Lisboa: Terramar; Rio de Janeiro: Multinova, 2001.

BRADLEY, Henry. Língua. In: BAILEY, Cyril. O legado de Roma. Rio de Janeiro: Imago Editora, 1992.

BRIZZI, Giovanni. O guerreiro, o soldado e o legionário: os exércitos do mundo clássico. São Paulo: Madras, 2003.

BURKE, Peter. Hibridismo cultural. São Leopoldo: Unisinos, 2009.

CAHILL, Thomas. A dádiva dos judeus. Rio de Janeiro: Objetiva, 1999.

CAIRNS, Earle Edwin. O cristianismo através dos séculos: uma história da igreja cristã. 3. ed. São Paulo: Vida Nova, 2008.

CALVINO. As Institutas ou Tratado de Religião Cristã, Volume II.

CARCOPINO, Jérôme. La vida cotidiana en Roma en el apogeo del imperio. Madrid: Ediciones Temas de Hoy, 2001.

CARDOSO, Ciro Flamarion. Deuses, múmias e ziggurats: uma comparação das religiões antigas do Egito e da Mesopotâmia. Porto Alegre: EDIPUCRS, 1999.

______. O Egito Antigo. 8. ed. São Paulo: Brasiliense, 1982.

______. Sociedades do Antigo Oriente próximo. São Paulo: Ática, 1986.

CARRIÉ, Jean-Michel. O soldado. In: GIARDINA, Andrea (Org.). O homem romano. Lisboa: Editorial Presença, 1992.

CARSON, D. A.; MOO, Douglas J.; MORRIS, Leon. Introdução ao Novo Testamento. São Paulo: Vida Nova, 1997.

CASTORIADIS, Cornelius. As encruzilhadas do Labirinto II: os domínios do homem. Rio de Janeiro: Paz e Terra, 1987.

CERNY, J. Linguagem e escrita. In: HARRIS, J. R. (Org.). O legado do Egito. Rio de Janeiro: Imago, 1993.

CHAMPLIN, Russel Norman. O Antigo Testamento interpretado: versículo por versículo: Volume 1: Gênesis, Êxodo, Levítico, Números. 2. ed. São Paulo: Hagnos, 2001.

______. O Antigo Testamento interpretado: versículo por versículo: Volume 4: Salmos, Provérbios, Eclesiastes, Cantares. 2. ed. São Paulo: Hagnos, 2001.

______. O Antigo Testamento interpretado: versículo por versículo: Volume 6: dicionário. 2. ed. São Paulo: Hagnos, 2001.

______. O Novo Testamento interpretado: versículo por versículo: Volume 2: Lucas e João. Guaratinguetá: Voz Bíblica, s.d.

______. O Novo Testamento interpretado: versículo por versículo: Volume 3: Atos e Romanos. Guaratinguetá: A Voz Bíblica, s.d.

______. O Novo Testamento interpretado: versículo por versículo: Volume 4: 1Coríncios, 2Coríntios, Gálatas e Efésios. Guaratinguetá: A Voz Bíblica, s.d.

______. O Novo Testamento interpretado: versículo por versículo: Volume 5: Filipenses, Colossenses, 1Tessalonicenses, 2Tessalonicenses, 1Timóteo, 2Timóteo, Tito, Filemom e Hebreus. Guaratinguetá: A Voz Bíblica, s.d.

COLEMAN, William L. Manual dos tempos e costumes bíblicos. Venda Nova, MG: Betânia, 1991.

COMBLIN, José. Fé e liberdade na carta a Filêmon. In: Revista de Interpretação Bíblica Latino-Americana, n. 28, p. 99-102, 1997.

COMBY, Jean. Vida e religiões no Império Romano no tempo das primeiras comunidades cristãs. São Paulo: Paulinas, 1988.

CONNOLLY, Peter. Las legiones romanas. Madrid: Espasa-Calpe, 1981.

CONTENEAU, Georges. A civilização de Assur e Babilônia. Rio de Janeiro: Otto Pierre, 1979.

CORNELL, Tim; MATTHEWS, John. A civilização romana. Barcelona: Ediciones Folio, 2008.

CULLMANN, Oscar. Cristo e política. Rio de Janeiro: Paz e Terra, 1968.

DANDAMAEV, Muhammad A.; LUKONIN, Vladimir Grigor’evich; KOHL, Philip L. DADSON, D. J. The culture and social institutions of ancient Iran. Cambridge: Cambridge University Press, 1989.

DAVIS, John D. Novo dicionário da Bíblia. São Paulo: Hagnos, 2005.

DAY, John. Yahweh and the Gods and Goddesses of Canaan. Sheffield: Sheffield Academic Press, 2000.

DONNER, Herbert. História de Israel e dos povos vizinhos. Volume 2: Da época da divisão do reino até Alexandre Magno. São Leopoldo: Sinodal, 1997.

DREHER, Martin. História do povo de Jesus: uma leitura latino-americana. 2. ed. São Leopoldo: Sinodal, 2017.

DU BREUIL, Paul. Zoroastro: religião e filosofia. São Paulo: IBRASA, 1987.

DURANDO, Furio. A Grécia Antiga. Barcelona: Ediciones Folio, 2005.

ELIADE, Mircea. O mito do eterno retorno: arquétipos e repetição. Lisboa: Edições 70, 1984.

______. O sagrado e o profano: a essência das religiões. 2. ed. São Paulo: Martins Fontes, 2008.

______. Tratado de história das religiões. 4. ed. São Paulo: WMF Martins Fontes, 2010.

ELLUL, Jacques. Política de Deus, política do homem. São Paulo: Fonte Editorial, 2006.

ÉPOCA Clássica. Barcelona: Ediciones Folio, 2001. [Grande História Universal, v. 3].

EZQUERRA, Jaime Alvar. Saber ver a arte mesopotâmica e persa. São Paulo: Martins Fontes, 1991.

FINLEY, Moses. A economia antiga. Porto: Edições Afrontamento, 1986.

______. A política no Mundo Antigo. Rio de Janeiro: Zahar, 1985.

FRANGIOTTI, Roque. Cristãos, judeus, pagãos: acusações, críticas e conflitos no cristianismo antigo. Aparecida: Ideias & Letras, 2006.

FULLERTON, Mark D. Arte grega. São Paulo: Odysseus, 2002.

FUNARI, Pedro Paulo. Grécia e Roma. 3. ed. São Paulo: Contexto, 2004.

GABRIELLI, Maysa Monção. Gilgamesh. São Paulo: Editorial Cone Sul, 1998.

GERSTENBERGER, Erhard S. Deus no Antigo Testamento. São Paulo: Aste, 1981.

______. Israel no tempo dos persas: séculos V e IV antes de Cristo. São Paulo: Edições Loyola, 2014.

GIARDINA, Andrea. O homem romano. Lisboa: Editorial Presença, 1992.

GONZÁLEZ, Justo. Atos: o evangelho do Espírito Santo. São Paulo: Hagnos, 2011.

GONZÁLEZ, Justo. Breve dicionário de teologia. São Paulo: Hagnos, 2009.

______. Cultura & Evangelho: o lugar da cultura no plano de Deus. São Paulo: Hagnos, 2011.

______. História ilustrada do cristianismo: a era dos mártires até a era dos sonhos frustrados. São Paulo: Vida Nova, 2011.

GRIMAL, Pierre. A civilização romana. Lisboa: Edições 70, 2009.

______. A mitologia grega. 4. ed. São Paulo: Brasiliense, 1987.

______. O amor em Roma. São Paulo: Martins Fontes, 1991.

______. O império romano. Lisboa: Edições 70, 1993.

GRIMBERG, Carl. História Universal 2: os persas, de Micenas à Grécia Clássica. Lisboa: Publicações Europa-América, [s.d.].

GUARELLI, Paul; NIKIPROWETZKY, V. Oriente Próximo asiático: impérios mesopotâmicos, Israel. São Paulo: Pioneira, EDUSP, 1982.

GUARINELLO, Norberto Luiz. Imperialismo greco-romano. São Paulo: Editora Ática, 1987.

GUNNEWEG, Antonius H. J. Teologia bíblica do Antigo Testamento: uma história da religião de Israel da perspectiva bíblico-teológica. São Paulo: Editora Teológica: Edições Loyola, 2005.

GUSSO, Antônio Renato. Panorama histórico de Israel para estudantes da Bíblia. Curitiba: A.D. Santos Editora, 2003.

HALLEY, Henry H. Manual bíblico: um comentário abreviado da Bíblia. São Luiz: Livraria Editora Evangélica, 1963.

HARDEN, Donald. Os fenícios. Lisboa: Editorial Verbo, 1971. [Historia Mundi, v. 9]

HARRIS, J. R. (Org.). O legado do Egito. Rio de Janeiro: Imago, 1993.

HAMMURABI REI DA BABILÔNIA; BOUZON, Emanuel. O código de Hammurabi. 9. ed. Petrópolis: Vozes, 2001.

HERM, Gehard. A civilização dos fenícios. Rio de Janeiro: Otto Pierre, 1979.

HERM, Gerhard. O reino púrpura da Antiguidade. São Paulo: Melhoramentos, 1976.

HERÓDOTO. História. Disponível em: <http://www.ebooksbrasil.org/eLibris/historiaherodoto.html>. Acesso em: 19 jun. 2018.

HISTÓRIA das religiões: origem e desenvolvimento das religiões. Barcelona: Ediciones Folio, 2008.

HORSLEY, Richard A. Bandidos, profetas e messias: movimentos populares no tempo de Jesus. São Paulo: Paulus, 1995.

______. Jesus e o império: O Reino de Deus e a nova desordem mundial. São Paulo: Paulus, 2004.

______. Paulo e o império: religião e poder na sociedade imperial romana. São Paulo: Paulus, 2004.

JARDÉ, Auguste. A Grécia antiga e a vida grega: geografia, história, literatura, artes, religião, vida pública e privada. São Paulo: EPU, 1977.

JONES, Landon. O Deus de Israel: na teologia do Antigo Testamento. São Paulo: Hagnos, 2015.

JOSEFO, Flávio. História dos hebreus. 8. ed. Rio de Janeiro: CPAD, 2004.

JUNG, Carl Gustav. O homem e seus símbolos. 4. ed. Rio de Janeiro: Nova Fronteira, s.d.

KAISER JR., Walter. Teologia do Antigo Testamento. 2. ed. São Paulo: Vida Nova, 2007.

KELLER, Timothy. Deuses falsos: eles prometem sexo, poder e dinheiro, mas é disso que você precisa? Rio de Janeiro: Thomas Nelson Brasil, 2010.

KOCHAV, Sarah. Israel. Barcelona: Ediciones Folio, 2006.

LADD, George Eldon. Teologia do Novo Testamento. São Paulo: Exodus, 1997.

LANGE, Nicholas de. Povo judeu. Barcelona: Ediciones Folio, 2007.

LASOR, William; HUBBARD, David; BUSH, Frederic. Introdução ao Antigo Testamento. São Paulo: Vida Nova, 1999.

LAWRENCE, Paul. Atlas histórico e geográfico da Bíblia. Barueri: Sociedade Bíblica do Brasil, 2008.

LEICK, Gwendolyn. Mesopotâmia: a invenção da cidade. Rio de Janeiro: Imago, 2003.

LEMCHE, Niels Peter. The Canaanites and their land: the tradition of the Canaanites. Sheffield: JSOT Press, 1999.

LÉVÊQUE, Pierre. O mundo helenístico. Lisboa: Edições 70, 1987.

LEVI, Peter. A civilização grega. Barcelona: Ediciones Folio, 2008.

LEWIS, C. S. Cristianismo puro e simples. Rio de Janeiro: Thomas Nelson Brasil, 2017.

______. Surpreendido pela alegria. São Paulo: Mundo Cristão, 1998.

LIBERATI, Anna Maria; BOURBON, Fabio. A Roma antiga. Barcelona: Ediciones Folio, 2005.

LIVERANI, Mario. Antigo Oriente: História, Sociedade e Economia. São Paulo: USP, 2016.

______. Para além da Bíblia: história antiga de Israel. São Paulo: Paulus; Loyola, 2008.

MACALISTER, R. A. Stewart. The Philistines: their history and civilization. Chicago: Argonaut Publishers, 1965.

MAGALHÃES FILHO, Glauco Barreira. O imaginário em As crônicas de Nárnia. São Paulo: Mundo Cristão, 2005.

MARCONDES, Danilo. Iniciação à história da filosofia: dos pré-socráticos a Wittgenstein. Rio de Janeiro: Jorge Zahar Ed., 1997.

MARTÍNEZ-PINNA NIETO, Jorge. Mito y ritual en el antiguo Occidente mediterráneo. Málaga, Espanha: UMA, 2002.

MAZAR, Amihai. Arqueologia na terra da Bíblia: 10000-586 a.C. São Paulo: Paulinas, 2003.

MAZZINGHI, Luca. História de Israel das origens ao período romano. Petrópolis: Vozes, 2017.

MCEVEDY, Colin. Atlas da História Antiga. São Paulo: Verbo; EDUSP, 1979.

MCGRATH, Alister. Heresia: em defesa da fé. São Paulo: Hagnos, 2014.

MÍGUEZ, Néstor. Para além do espírito do Império: novas perspectivas em política e religião. São Paulo: Paulinas, 2012.

MILLER, Stephen M.; HUBER, Robert V. A Bíblia e sua história: o surgimento e o impacto da Bíblia. Barueri: Sociedade Bíblica do Brasil, 2006.

MONEY, Netta Kemp de. Geografia histórica do mundo bíblico. Miami: Editora Vida, 1977.

MONTIEL, Juan Francisco Martos. Sexo y ritual: la prostitución sagrada en la antigua Grecia. In: MARTÍNEZ-PINNA NIETO, Jorge. Mito y ritual en el antiguo Occidente mediterráneo. Málaga, Espanha: UMA, 2002.

MOURA, Rogério Lima. A cidade de Ugarit: contribuições para o estudo da religião do antigo Israel. Revista Nunes, Ano XII, n. 32, jan./abr. 2016, p. 1-20. Disponível em: <http://revistas.pucsp.br/index.php/nures/article/view/28747>. Acesso em: 04 jul. 2018.

MOURREAU, Jean-Jacques. A Pérsia dos grandes reis e de Zoroastro. Rio de Janeiro: Otto Pierre, 1978.

MÜLLER, Werner; VOGEL, Gunther. Atlas de arquitectura. 1. Generalidades. De Mesopotamia a Bizancio. Madrid: Alianza Editorial, 1984.

O LIVRO das religiões. São Paulo: Globo Livros, 2014.

O LIVRO dos mortos do antigo Egito: o primeiro livro da humanidade. São Paulo: Hemus, 1982.

OTTO, Rudolf. O sagrado: os aspectos irracionais na noção do divino e sua relação com o racional. São Leopoldo: Sinodal/EST; Petrópolis: Vozes, 2007.

PACHECO, Júlio Franclim do Couto e. Ludlul Bel Nemeqi: poema do justo sofredor. Disponível em: <http://diocese-aveiro.pt/cultura/mesopotamia-textos-sapienciais-2-ludlulbel-nemeqi-poema-do-justo-sofredor/>. Acesso em: 15 jun. 2018.

PASCALE, Maria Aparecida. Qual é o nome dele? Estudos Bíblicos, v. 31, n. 124, p. 355- 364, out/dez 2014.

PETIT, Paul. História Antiga. São Paulo: Difusão Europeia do Livro, 1971.

POSENER, Georges. Literatura. In: HARRIS, J. R. (Org.). O legado do Egito. Rio de Janeiro: Imago, 1993.

PRIETO, Christine. Cristianismo e paganismo: a pregação do Evangelho no mundo grecoromano. São Paulo: Paulus, 2007.

PROVAN, Iain; LONG, V. Philips; LONGMAN III, Tremper. Uma história bíblica de Israel. São Paulo: Vida Nova, 2016.

RAMOS, José Augusto. Ugarit, Fenícia e Canaã: questões de metodologia e delimitação historiográfica. Cadmo, n. 1, 1991, p. 45-63. Disponível em: <https://digitalisdsp.uc.pt/jspui/handle/10316.2/24269>. Acesso em 04 jul. 2018.

REINHARD, Feldmeier. O Deus dos vivos: uma doutrina bíblica de Deus. São Leopoldo: Sinodal/EST, 2015.

RICHARDSON, Don. O fator Melquisedeque: o testemunho de Deus nas culturas através do mundo. São Paulo: Vida Nova, 1995.

ROAF, Michael. Mesopotâmia. [Grandes civilizações do passado]. Barcelona: Ediciones Folio, 2006.

ROGERSON, John. Terras da Bíblia. Barcelona: Ediciones Folio, 2006.

RUBINI, Ademir. As carnes sacrificadas aos ídolos. Idolatria: a questão é ter ou não ter imagens? Petrópolis: Vozes, 2015. p. 405-416. [Estudos Bíblicos; n. 124]

SALAZAR, Fernando Elorrieta. Cusco y el Valle Sagrado de los Incas. 2. ed. Lima: Tankar, 2005.

SALES, José das Candeias. Organizando simbolicamente o panteão do antigo egipto: as tríades divinas. Revista Mundo Antigo, Ano 5, v. 5, n. 9, mai. 2016. Disponível em: <http://www.nehmaat.uff.br/revista/2016-A/artigo12-2016-A.pdf>. Acesso em: 22 jun. 2018.

SAYÃO, Luiz. O problema do mal no Antigo Testamento: o caso de Habacuque. São Paulo: Hagnos, 2012.

SCHEID, John. O sacerdote. In: GIARDINA, Andrea (Org.). O homem romano. Lisboa: Editorial Presença, 1992.

SILIOTTI, Alberto. Antigo Egito. [Grandes civilizações do passado]. Barcelona: Ediciones Folio, 2006.

SILVA, Airton José da. Akitu – Festival do Ano Novo na Babilônia. Disponível em: <https://blog.airtonjo.com/2017/10/akitu-festival-do-ano-novo-na-babilonia.html>. Acesso em: 13 jun. 2018.

______. Histórias de criação e dilúvio na antiga Mesopotâmia. Disponível em: <https://airtonjo.com/site1/cosmogonias.htm>. Acesso em: 14 jun. 2018.

SOARES, Dionísio Oliveira. As influências persas no chamado judaísmo pós-exílico. Revista Theos, Campinas, 6. ed., v. 5, n. 2, dez. 2009. Disponível em: <http://www.revistatheos.com.br/Artigos/Artigo_06_2_02.pdf>. Acesso em: 28 jul. 2018.

SOUZA, João Francisco de. Considerações gerais sobre os fenícios. Revista de História, v. 26, n. 54, 1963, p. 309-332. Disponível em: <http://www.revistas.usp.br/revhistoria/article/view/121967>. Acesso em: 4 jul. 2018.

STEVENSON, G. H. Comunicações e comércio. In: BAILEY, Cyril. O legado de Roma. Rio de Janeiro: Imago Editora, 1992.

TAMEZ, Elsa. Quetzalcóatl e o Deus Cristão: aliança e luta de deuses. In: ZWETSCH, Roberto (Org.). 500 anos de invasão, 500 anos de resistência. São Paulo: Paulinas: CEDI, 1992. p. 125-170.

TEXTOS Sacros. [As grandes religiões]. São Paulo: Editora Abril, 1973.

THÉBERT, Yvon. O escravo. In: GIARDINA, Andrea (Org.). O homem romano. Lisboa: Editorial Presença, 1992.

THIEL, Winfried. A sociedade de Israel na época pré-estatal. São Leopoldo: Sinodal; São Paulo: Paulinas, 1993.

TILLICH, Paul. História do pensamento cristão. 5. ed. São Paulo: ASTE, 2015.

TOGNINI, Enéias. Geografia da Terra Santa e das terras bíblicas. São Paulo: Hagnos, 2009.

TOGNINI, Enéas. O Período Interbíblico: 400 anos de silêncio profético. São Paulo: Hagnos, 2009.

TOLKIEN, J. R. R. Sobre histórias de fadas. São Paulo: Conrad Editora do Brasil, 2006.

TRAUNECKER, Claude. Os deuses do Egito. Brasília: Editora Universidade de Brasília, 1995.

VAUX, Roland de. Instituições de Israel no Antigo Testamento. São Paulo: Editora Teológica, 2003.

VERNANT, Jean-Pierre. As origens do pensamento grego. Rio de Janeiro: Difel, 2002.

VERNANT, Jean-Pierre. Mito e religião na Grécia antiga. Campinas: Papirus, 1992.

VEYNE, Paul. História da vida privada 1: do Império Romano ao ano mil. São Paulo: Companhia das Letras, 1994.

WAGNER, Carlos Gonzáles; CABRERO, Luis Ruiz. El sacrificio molk. Madrid: Ediciones del Orto, 2007.

WOLFF, Hans Walter. Antropologia do Antigo Testamento. São Paulo: Hagnos, 2007.

WOLTERS, Albert M. Creation Regained: Biblical Basics for a Reformational Worldwiew. 2. ed. Grand Rapids: Eerdmans Publishing, 2005.

[1] CALVINO. As Institutas ou Tratado de religião cristã, Volume II, 2, 15.

[2] AGOSTINHO. Confissões, XXIII.

[3] OTTO, Rudolf. O sagrado: os aspectos irracionais na noção do divino e sua relação com o racional. São Leopoldo: Sinodal/EST; Petrópolis: Vozes, 2007. p. 97-98.

[4] OTTO, 2007, p. 58-62.

[5] OTTO, 2007, p. 44-55.

[6] OTTO, 2007, p. 68.

[7] O profano tem sido popularmente entendido como maldito, maligno. Quando alguém diz “isso é uma profanação”, geralmente está associando a tornar imunda uma coisa pura. Não é esse o sentido que Eliade usa; ele trata o profano como o que não é sagrado, que permanece cotidiano, secular, lugar comum da nossa vida. Não há nada de “maldito” nisso.

[8] ELIADE, Mircea. O sagrado e o profano: a essência das religiões. 2. ed. São Paulo: Martins Fontes, 2008, p. 17.

[9] ELIADE, 2008, p. 20.

[10] ELIADE, 2008, p. 26.

[11] ELIADE, 2008, p. 63.

[12] ELIADE, 2008, p. 69.

[13] GONZÁLEZ, Justo L. Cultura & Evangelho: o lugar da cultura no plano de Deus. São Paulo: Hagnos, 2011.

[14] GONZÁLEZ, 2011, p. 37.

[15] GONZÁLEZ, 2011, p. 38-39.

[16] GONZÁLEZ, 2011, p. 40-46.

[17] BAUZÁ, Hugo Francisco. Qué es un mito: una aproximación a la mitología clásica. Buenos Aires: Fondo de Cultura Económica, 2005. p. 19-25.

[18] BAUZÁ, 2005, p. 33.

[19] GONZÁLEZ, 2011, p. 46-47.

[20] GONZÁLEZ, 2011, p. 51-58.

[21] GONZÁLEZ, 2011, p. 60.

[22] GONZÁLEZ, 2011, p. 61-67.

[23] WOLTERS, Albert M. Creation Regained: Biblical Basics for a Reformational Worldwiew. 2. ed. Grand Rapids: Eerdmans Publishing, 2005.

[24] Uma notável descrição do desenvolvimento da cultura inca pode ser encontrada em SALAZAR, Fernando Elorrieta. Cusco y el Valle Sagrado de los Incas. 2. ed. Lima: Tankar, 2005. Uma observação: “Inca” era a nomenclatura do rei dos antigos quéchuas, assim como “César” era o governante dos antigos romanos. Costuma-se usar o termo “inca” para essa cultura porque ela floresceu justamente no período imperialista dos quéchuas sobre outros povos.

[25] RICHARDSON, Don. O fator Melquisedeque: o testemunho de Deus nas culturas através do mundo. São Paulo: Vida Nova, 1995. p. 28-33.

[26] TAMEZ, Elsa. Quetzalcóatl e o Deus cristão: aliança e luta de deuses. In.: ZWETSCH, Roberto (Org.). 500 anos de invasão, 500 anos de resistência. São Paulo: Paulinas: CEDI, 1992. p. 125-170.

[27] O neoplatonismo parte do princípio de que a matéria é má e o espírito é bom. Daí a dificuldade dos adeptos desse pensamento entenderem a encarnação de Cristo, produzindo a heresia de Cerinto, no século II e, mais tarde, a ariana. Penso aqui em um “neoplatonismo invertido” porque é comum as pessoas considerarem elementos físicos (comida, roupa, construções) como neutras ou boas, enquanto qualquer dado espiritual não cristão é essencialmente mau.

[28] CONTENEAU, Georges. A civilização de Assur e Babilônia. Rio de Janeiro: Otto Pierre, 1979. p. 11-14.

[29] LIVERANI, Mario. Antigo Oriente: História, Sociedade e Economia. São Paulo: USP, 2016, p. 45-46.

[30] CONTENEAU, 1979, p. 21-31.

[31] LIVERANI, 2016, p. 52-53.

[32] LIVERANI, 2016, p. 64-65.

[33] BOUZON, Emanuel. Ensaios babilônicos: sociedade, economia e cultura na Babilônia pré-cristã. Porto Alegre: EDIPUCRS, 1998.

[34] LEICK, Gwendolyn. Mesopotâmia: a invenção da cidade. Rio de Janeiro: Imago, 2003.

[35] LIVERANI, 2016, p. 258-264.

[36] Não vou detalhar a história dos assírios e babilônios neste capítulo, que pretende dar uma noção geral de todos os mesopotâmicos, comum a todos eles. Trataremos deles novamente no capítulo sobre os persas, comparando o tipo de império e de dominação que cada um deles exercia — o que influenciou diretamente a história bíblica dos hebreus.

[37] MÜLLER, Werner; VOGEL, Gunther. Atlas de arquitectura. 1. Generalidades. De Mesopotamia a Bizancio. Madrid: Alianza Editorial, 1974, p. 83-85.

[38] MÜLLER; VOGEL, 1974, p. 87.

[39] MÜLLER; VOGEL, 1974, p. 100.

[40] BOTTÉRO, Jean. A escrita e a formação da inteligência na Mesopotâmia Antiga. In: BOTTÉRO, Jean; MORRISON, Ken (orgs.). Cultura, pensamento e escrita. São Paulo: Ática, 1995. p. 9-46.

[41] ROAF, Michael. Mesopotâmia. [Grandes civilizações do passado]. Barcelona: Ediciones Folio, 2006, p. 122.

[42] HAMMURABI REI DA BABILÔNIA; BOUZON, Emanuel. O código de Hammurabi. 9. ed. Petrópolis: Vozes, 2001.

[43] HAMMURABI REI DA BABILÔNIA; BOUZON, 2001, p. 148, 181.

[44] CONTENEAU, 1979, p. 83-88.

[45] CARDOSO, Ciro Flamarion. Deuses, múmias e ziggurats: uma comparação das religiões antigas do Egito e da Mesopotâmia. Porto Alegre: EDIPUCRS, 1999. p. 79-80.

[46] CARDOSO, 1999, p. 81-86.

[47] CONTENEAU, 1979, p. 88-94.

[48] CONTENEAU, 1979, p. 107-108. Sobre a prostituição cultural, trataremos mais detalhadamente nos cultos dos cananeus e dos gregos.

[49] CONTENEAU, 1979, p. 108-112.

[50] CONTENEAU, 1979, p. 148-181.

[51] MÜLLER; VOGEL, 1974, p. 95-96.

[52] CARDOSO, 1999, p. 90-94.

[53] MÜLLER e VOGEL, 1974, p. 99.

[54] Uma boa e objetiva explicação das cosmogonias mesopotâmicas pode ser encontrada em SILVA, Airton José da. Histórias de criação e dilúvio na antiga Mesopotâmia. Disponível em: <https://airtonjo.com/site1/cosmogonias.htm>. Acesso em: 14 jun. 2018.

[55] GABRIELLI, Maysa Monção. Gilgamesh. São Paulo: Editorial Cone Sul, 1998.

[56] ELIADE, Mircea. O mito do eterno retorno: arquétipos e repetição. Lisboa: Edições 70, 1984.

[57] A festa do Ano Novo (Akîtu) está bem detalhada em CONTENEAU, 1979, p. 119-146. Na Internet, uma fonte confiável pode ser encontrada em SILVA, Airton José da. Akitu – Festival do Ano Novo na Babilônia. Disponível em: <https://blog.airtonjo.com/2017/10/akitu-festival-do-ano-novo-na-babilonia.html>. Acesso em: 13 jun. 2018.

[58] CONTENEAU, 1979, p. 129.

[59] CARDOSO, 1999, p. 37-40.

[60] CARDOSO, 1999, p. 41-42.

[61] CARDOSO, 1999, p. 130-138.

[62] PACHECO, Júlio Franclim do Couto e. Ludlul Bel Nemeqi: poema do justo sofredor. Disponível em: <http://diocese-aveiro.pt/cultura/mesopotamia-textos-sapienciais-2-ludlul-bel-nemeqi-poema-do-justo-sofredor/>. Acesso em: 15 jun. 2018.

[63] PACHECO, p. 14. O excerto corresponde às linhas 36 a 42 da Tabuinha II.

[64] CARDOSO, 1999, p. 42.

[65] LASOR, William; HUBBARD, David; BUSH, Frederic. Introdução ao Antigo Testamento. São Paulo: Vida Nova, 1999, p. 44-46.

[66] VAUX, Roland de. Instituições de Israel no Antigo Testamento. São Paulo: Editora Teológica, 2003, p. 219-222.

[67] VAUX, 2003, p. 414-415.

[68] BENDER, André Luis. O código de Hammurabi e o Antigo Testamento. Vox Concordiana, v. 10, n.1, p. 37-80, 1995.

[69] VAUX, 2003, p. 314-320.

[70] DAVIS, John D. Novo dicionário da Bíblia. São Paulo: Hagnos, 2005, p. 146.

[71] “Nem em Jerusalém, nem aqui”, conforme o diálogo de Jesus com a mulher samaritana, diante do lugar sagrado dos patriarcas em Siquém/Sicar (João 4).

[72] REINHARD, Feldmeier. O Deus dos vivos: uma doutrina bíblica de Deus. São Leopoldo: Sinodal/EST, 2015, p. 326

[73] CHAMPLIN, Russel Norman. O Antigo Testamento interpretado: versículo por versículo: Volume 6: dicionário. 2. ed. São Paulo: Hagnos, 2001, p. 3742-3742.

[74] VAUX, 2003, p. 391.

[75] JONES, Landon. O Deus de Israel: na teologia do Antigo Testamento. São Paulo: Hagnos, 2015, p. 90-95.

[76] ACQUAROLI, Armando Rafael Castro. Marduk x Yhwh: duelo de gigantes. In: DIETRICH, Luiz José; LORASCHI, Celso. Idolatria: a questão é ter ou não ter imagens? Petrópolis: Vozes, 2015, p. 375-382. [Estudos Bíblicos; n. 124], p. 380.

[77] LAWRENCE, Paul. Atlas histórico e geográfico da Bíblia. Barueri: Sociedade Bíblica do Brasil, 2008, p. 17.

[78] HALLEY, Henry H. Manual bíblico: um comentário abreviado da Bíblia. São Luiz: Livraria Editora Evangélica, 1963. p. 75.

[79] LIVERANI, Mario. Para além da Bíblia: história antiga de Israel. São Paulo: Paulus; Loyola, 2008, p. 291.

[80] ELIADE, Mircea. Tratado de história das religiões. 4. ed. São Paulo: Editora WMF Martins Fontes, 2010, p. 171- 172.

[81] BÍBLIA de Jerusalém, 2002, p. 797.

[82] CAHILL, Thomas. A dádiva dos judeus. Rio de Janeiro: Objetiva, 1999, p. 250.

[83] KAISER JR., Walter. Teologia do Antigo Testamento. 2. ed. São Paulo: Vida Nova, 2007, p. 112.

[84] ELIADE, 2008, p. 97-98.

[85] HERÓDOTO. História. Livro II (Euterpe), V.

[86] Uma pesquisa na Internet pode revelar quanta controvérsia há sobre esse tema. O rio mais longo do mundo pode ser o Amazonas ou o Nilo, dependendo de onde se considerar o seu início, pois não há certeza sobre o local exato da nascente de cada um deles.

[87] SILIOTTI, Alberto. Antigo Egito. [Grandes civilizações do passado]. Barcelona: Ediciones Folio, 2006, p. 16.

[88] CARDOSO, Ciro Flamarion. O Egito Antigo. 8. ed. São Paulo: Brasiliense, 1982, p. 20,28-29.

[89] CARDOSO, Ciro Flamarion. Sociedades do Antigo Oriente próximo. São Paulo: Ática, 1986, p. 63-65.

[90] SILIOTTI, 2006, p. 30.

[91] CARDOSO, 1982, p. 7.

[92] CARDOSO, 1982, p. 24.

[93] CARDOSO, 1982, p. 47-48.

[94] CARDOSO, 1982, p. 49-79.

[95] CARDOSO, 1986, p. 66-74.

[96] BRAUDEL, Fernand. Memórias do Mediterrâneo: pré-história e antiguidade. Lisboa: Terramar; Rio de Janeiro: Multinova, 2001, p. 89-90.

[97] MÜLLER, Werner; VOGEL, Gunther. Atlas de arquitectura. 1. Generalidades. De Mesopotamia a Bizancio. Madrid: Alianza Editorial, 1974, p. 105.

[98] MÜLLER; VOGEL, 1974, p. 109.

[99] CARDOSO, 1982, p. 93-94.

[100] CERNY, J. Linguagem e escrita. In: HARRIS, J. R. (Org.). O legado do Egito. Rio de Janeiro: Imago, 1993. p. 224-229.

[101] POSENER, Georges. Literatura. In: HARRIS, J. R. (Org.). O legado do Egito. Rio de Janeiro: Imago, 1993, p. 263-266.

[102] BACHA, Lourdes Maria Silva. Escritos do Antigo Egito. Rio de Janeiro: Artium, 1997, p. 204.

[103] BACHA, 1997, p. 197.

[104] HARRIS, J. R. (Org.). O legado do Egito. Rio de Janeiro: Imago, 1993, p. 125-149.

[105] AYMARD, André; AUBOYER, Jeannine. O Oriente e a Grécia Antiga: civilizações imperiais do Oriente. 2. ed. [História Geral das Civilizações] São Paulo: Difusão Europeia do Livro, 1957, p. 49-51.

[106] CARDOSO, 1999, p. 24-26.

[107] TRAUNECKER, Claude. Os deuses do Egito. Brasília: Editora Universidade de Brasília, 1995, p. 24.

[108] CARDOSO, 1982, p. 87.

[109] TRAUNECKER, 1995, p. 43-50.

[110] TRAUNECKER, 1995, p. 57.

[111] TRAUNECKER, 1995, p. 60-72.

[112] TRAUNECKER, 1995, p. 73-80.

[113] SALES, José das Candeias. Organizando simbolicamente o panteão do antigo egipto: as tríades divinas. Revista Mundo Antigo, Ano 5, v. 5, n. 9, mai. 2016. Disponível em: <http://www.nehmaat.uff.br/revista/2016-A/artigo12-2016- A.pdf>. Acesso em: 22 jun. 2018.

[114] CARDOSO, 1999, p. 62-63.

[115] BACHA, 1997, p. 38-40.

[116] TRAUNECKER, 1995, p. 30-32.

[117] BRAUDEL, 2001, p. 88-89.

[118] TRAUNECKER, 1995, p. 120.

[119] CARDOSO, 1999, p. 68-76.

[120] TRAUNECKER, 1995, p. 25-26.

[121] CARDOSO, 1999, p. 64.

[122] MÜLLER; VOGEL, 1974, p. 115-119.

[123] CARDOSO, 1982, p. 92.

[124] MÜLLER; VOGEL, 1974, p. 125.

[125] MÜLLER; VOGEL, 1974, p. 121.

[126] MÜLLER; VOGEL, 1974, p. 126.

[127] BACHA, 1997, p. 51-55.

[128] BACHA, 1997, p. 52.

[129] BACHA, 1997, p. 55-57.

[130] BACHA, 1997, p. 71-105.

[131] TRAUNECKER, 1995, p. 32.

[132] CARDOSO, 1999, p. 103-114.

[133] O LIVRO dos mortos do antigo Egito: o primeiro livro da humanidade. São Paulo: Hemus, 1982.

[134] O LIVRO dos mortos do antigo Egito, 1982, p. 137.

[135] CERNY, 1993, p. 211.

[136] WILLIAMS, Ronald J. Egito e Israel. In: HARRIS, J. R. (Org.). O legado do Egito. Rio de Janeiro: Imago, 1993. p. 287.

[137] WILLIAMS, 1993, p. 290.

[138] CHAMPLIN, Russel Norman. O Antigo Testamento interpretado: versículo por versículo: Volume 4: Salmos, Provérbios, Eclesiastes, Cantares. 2. ed. São Paulo: Hagnos, 2001, p. 2533.

[139] KAISER JR., Walter. Teologia do Antigo Testamento. 2. ed. São Paulo: Vida Nova, 2007, p. 105-112.

[140] GUARELLI, Paul; NIKIPROWETZKY, V. Oriente Próximo asiático: impérios mesopotâmicos, Israel. São Paulo: Pioneira, EDUSP, 1982, p. 275-283.

[141] GONZÁLEZ, Justo. Breve dicionário de teologia. São Paulo: Hagnos, 2009, p. 153.

[142] GUARELLI; NIKIPROWETZKY, 1982, p. 286-287.

[143] WOLFF, Hans Walter. Antropologia do Antigo Testamento. São Paulo: Hagnos, 2007, p. 29-31.

[144] WOLFF, 2007, p. 161-177.

[145] JONES, Landon. O Deus de Israel: na teologia do Antigo Testamento. São Paulo: Hagnos, 2015, p. 146-148.

[146] CHAMPLIN, Russel Norman. O Antigo Testamento interpretado: versículo por versículo: Volume 1: Gênesis, Êxodo, Levítico, Números. 2. ed. São Paulo: Hagnos, 2001, p. 330-332.

[147] TOGNINI, Enéias. Geografia da Terra Santa e das terras bíblicas. São Paulo: Hagnos, 2009, p. 77-81.

[148] TOGNINI, 2009, p. 83-103.

[149] LAWRENCE, Paul. Atlas histórico e geográfico da Bíblia. Barueri: Sociedade Bíblica do Brasil, 2008, p. 52-53.

[150] TOGNINI, 2009, p. 199-204.

[151] LEMCHE, Niels Peter. The Canaanites and their land: the tradition of the Canaanites. Sheffield: JSOT Press, 1999, p. 152-154.

[152] LIVERANI, Mario. Antigo Oriente: História, Sociedade e Economia. São Paulo: Editora da USP, 2016, p. 453- 456.

[153] LIVERANI, 2016, p. 458-465.

[154] THIEL, Winfried. A sociedade de Israel na época pré-estatal. São Leopoldo: Sinodal; São Paulo: Paulinas, 1993, p. 51-52.

[155] LIVERANI, 2016, p. 470-471.

[156] HERM, Gehard. A civilização dos fenícios. Rio de Janeiro: Otto Pierre, 1979. p. 32.

[157] HARDEN, Donald. Os fenícios. Lisboa: Editorial Verbo, 1971. [Historia Mundi, v. 9], p. 172-173.

[158] HARDEN, 1971, p. 174-183.

[159] SOUZA, João Francisco de. Considerações gerais sobre os fenícios. Revista de História, v. 26, n. 54, 1963, p. 309-332. Disponível em: <http://www.revistas.usp.br/revhistoria/article/view/121967>. Acesso em: 4 jul. 2018. p. 317- 323.

[160] HERM, Gerhard. O reino púrpura da Antiguidade. São Paulo: Melhoramentos, 1976.

[161] RAMOS, José Augusto. Ugarit, Fenícia e Canaã: questões de metodologia e delimitação historiográfica. Cadmo, n. 1, 1991, p. 45-63. Disponível em: <https://digitalis-dsp.uc.pt/jspui/handle/10316.2/24269>. Acesso em 04 jul. 2018.

[162] MOURA, Rogério Lima. A cidade de Ugarit: contribuições para o estudo da religião do antigo Israel. Revista Nunes, Ano XII, n. 32, jan./abr. 2016, p. 1-20. Disponível em: <http://revistas.pucsp.br/index.php/nures/article/view/28747>. Acesso em: 04 jul. 2018. p. 3.

[163] MOURA, 2016, p. 6.

[164] ROGERSON, John. Terras da Bíblia. Barcelona: Ediciones Folio, 2006, p. 16.

[165] CERNY, J. Linguagem e escrita. In.: HARRIS, J. R. (Org.). O legado do Egito. Rio de Janeiro: Imago, 1993, p. 223-224.

[166] HERM, 1979, p. 92-93.

[167] RENDTORFF, Rolf. El, Baal e Javé. In: GERSTENBERGER, Erhard S. Deus no Antigo Testamento. São Paulo: Aste, 1981. p. 156-172.

[168] MOURA, 2016, p. 7-9.

[169] GUNNEWEG, Antonius H. J. Teologia bíblica do Antigo Testamento: uma história da religião de Israel da perspectiva bíblico-teológica. São Paulo: Editora Teológica: Edições Loyola, 2005, p. 63-65.

[170] MOURA, 2016, p. 15.

[171] GUNNEWEG, 2005, p. 68-69.

[172] DAY, John. Yahweh and the Gods and Goddesses of Canaan. Sheffield: Sheffield Academic Press, 2000, p. 13- 41.

[173] DAY, 2000, p. 47,57.

[174] DAY, 2000, p. 68-69.

[175] DAY, 2000, p. 93-95.

[176] HARDEN, 1971, p. 83-84.

[177] HARDEN, 1971, p. 83.

[178] DAY, 2000, p. 129.

[179] HARDEN, 1971, p. 85-86.

[180] MOURA, 2016, p. 14-15.

[181] ELIADE, Mircea. O sagrado e o profano: a essência das religiões. 2. ed. São Paulo: Martins Fontes, 2008, p. 120-122.

[182] HARDEN, 1971, p. 102.

[183] Não há consenso de que a prática da prostituição sagrada fosse literal ou realmente comum na Antiguidade. BATISTA, Keila Fernandes. O debate historiográfico acerca da ideia da “prostituição sagrada” no Antigo Crescente Fértil. Revista Vernáculo, n. 28, 2011, p. 187-213. Disponível em: <https://revistas.ufpr.br/vernaculo/article/view/31635>. Acesso em: 16 jul. 2018. p. 190.

[184] WAGNER, Carlos Gonzáles; CABRERO, Luis Ruiz. El sacrificio molk. Madrid: Ediciones del Orto, 2007, p. 22- 23.

[185] WAGNER e CABRERO, 2007, p. 30-33.

[186] WAGNER e CABRERO, 2007, p. 38-41.

[187] HERM, 1979, p. 164.

[188] WAGNER e CABRERO, 2007, p. 78. Tradução livre.

[189] WAGNER e CABRERO, 2007, p. 86. Tradução livre.

[190] GUNNEWEG, 2005, p. 65-68.

[191] A lista dos povos apresentada será baseada nos estudos de TOGNINI, 2009, p. 36-48.

[192] BRAUDEL, Fernand. Memórias do Mediterrâneo: pré-história e antiguidade. Lisboa: Terramar; Rio de Janeiro: Multinova, 2001, p. 180-182.

[193] LIVERANI, 2016, p. 517-519.

[194] LIVERANI, 2016, p. 523.

[195] LIVERANI, 2016, p. 538.

[196] MACALISTER, R. A. Stewart. The Philistines: their history and civilization. Chicago: Argonaut Publishers, 1965, p. 87-89.

[197] MAZAR, Amihai. Arqueologia na terra da Bíblia: 10000-586 a.C. São Paulo: Paulinas, 2003, p. 301-302.

[198] MAZAR, 2003, p. 322.

[199] MACALISTER, 1965, p. 90-106.

[200] LIVERANI, 2016, p. 583-585.

[201] LIVERANI, 2016, p. 587-588.

[202] LIVERANI, 2016, p. 594-595.

[203] LIVERANI, 2016, p. 595-599.

[204] LIVERANI, 2016, p. 587.

[205] DAVIS, 2005, p. 105.

[206] TOGNINI, Enéas. O Período Interbíblico: 400 anos de silêncio profético. São Paulo: Hagnos, 2009. p. 82.

[207] MILLER, Stephen M.; HUBER, Robert V. A Bíblia e sua história: o surgimento e o impacto da Bíblia. Barueri: Sociedade Bíblica do Brasil, 2006, p. 16.

[208] PROVAN, Iain; LONG, V. Philips; LONGMAN III, Tremper. Uma história bíblica de Israel. São Paulo: Vida Nova, 2016, p. 96.

[209] VAUX, 2003, p. 257-258.

[210] MONEY, Netta Kemp de. Geografia histórica do mundo bíblico. Miami: Editora Vida, 1977, p. 160-163.

[211] LASOR, William; HUBBARD, David; BUSH, Frederic. Introdução ao Antigo Testamento. São Paulo: Vida Nova, 1999, p. 199-200.

[212] VAUX, Roland de. Instituições de Israel no Antigo Testamento. São Paulo: Editora Teológica, 2003, p. 158-160.

[213] É na conveniência diplomática que devemos compreender os casamentos de Salomão, não no caráter erótico. No mundo antigo, a diplomacia não ocorria entre países, pois eles não existiam. O que determinava um Estado eram as dinastias monárquicas — famílias que controlavam seus respectivos povos. A maneira de fazer um tratado entre dois reinos era firmando uma parentela, o que acontecia por meio do casamento. Quando nascia um filho, a aliança ficava ainda mais forte, pois havia um indivíduo com o sangue das duas dinastias.

[214] LASOR; HUBBARD; BUSH, 1999, p. 210-213.

[215] LASOR; HUBBARD; BUSH, 1999, p. 217.

[216] LASOR; HUBBARD; BUSH, 1999, p. 210.

[217] HERÓDOTO, Livro II, XLIV.

[218] LASOR; HUBBARD; BUSH, 1999, p. 159.

[219] Como no caso de Ifigênia, sacrificada por Agamenom antes de partir para Troia, conforme registrado em um poema de Eurípedes. Mesmo nesse caso, Ifigênia era uma jovem, não uma criança.

[220] KELLER, Timothy. Deuses falsos: eles prometem sexo, poder e dinheiro, mas é disso que você precisa? Rio de Janeiro: Thomas Nelson Brasil, 2010, p. 28-29.

[221] LASOR; HUBBARD; BUSH, 1999, p. 218.

[222] KOCHAV, Sarah. Israel. Barcelona: Ediciones Folio, 2006. p. 38-57.

[223] MAZAR, 2003, p. 466-471.

[224] DAY, 2000, p. 49-60.

[225] ELLUL, Jacques. Política de Deus, política do homem. São Paulo: Fonte Editorial, 2006. p. 135-139.

[226] DAVIS, 2005, p. 574.

[227] DAY, 2000, p. 95-98.

[228] DAY, 2000, p. 128.

[229] LASOR; HUBBARD; BUSH, 1999, p. 219.

[230] Essa é uma especulação sem maiores bases técnicas. Não é possível saber em que momento os hebreus abandonaram a pronúncia do nome divino e o substituíram por Adonai. Se não pronunciavam o nome divino naquela época, a disputa pode fazer sentido nesses termos. Se não, ela ocorreu apenas em saber quem era o verdadeiro Deus.

[231] OTTO, 2007, p. 167.

[232] ELIADE, 2008, p. 103-106. Essa interessante característica do Ser Supremo ausente também aparece nas religiões africanas, como Olorum, entre os iorubas.

[233] RICHARDSON, Don. O fator Melquisedeque: o testemunho de Deus nas culturas através do mundo. São Paulo: Vida Nova, 1995, p. 24-25.

[234] Em seu texto, Richardson afirma (p. 25) que Abraão chamava Deus de Javé (Iahweh); mas Êxodo 6:3 afirma que ele recebeu a revelação de Shaddai. De qualquer maneira, essa diferença não invalida o argumento central do autor, que é o fato de Abraão e Melquisedeque usarem nomes diferentes para o mesmo Deus.

[235] RICHARDSON, 1995, p. 26-27.

[236] RICHARDSON, 1995, p. 27-58.

[237] PASCALE, Maria Aparecida. Qual é o nome dele? Estudos Bíblicos, v. 31, n. 124, p. 355-364, out/dez 2014, p. 358.

[238] AYMARD, André; AUBOYER, Jeannine. O Oriente e a Grécia Antiga: Civilizações imperiais do Oriente. 2. ed. [História Geral das Civilizações] São Paulo: Difusão Europeia do Livro, 1957, p. 187.

[239] MCEVEDY. Colin. Atlas da História Antiga. São Paulo: Verbo; EDUSP, 1979, p. 15.

[240] AYMARD; AUBOYER, 1957, p. 200.

[241] GRIMBERG, Carl. História Universal 2: os persas, de Micenas à Grécia Clássica. Lisboa: Publicações EuropaAmérica, [s.d.], p. 10-13.

[242] LIVERANI, Mario. Antigo Oriente: História, Sociedade e Economia. São Paulo: USP, 2016, p. 737-740.

[243] AYMARD; AUBOYER, 1957, p. 199.

[244] LIVERANI, 2016, p. 741-746.

[245] ÉPOCA Clássica. Barcelona: Ediciones Folio, 2001. [Grande História Universal, v. 3]. p. 26.

[246] DANDAMAEV, Muhammad A.; LUKONIN, Vladimir Grigor’evich; KOHL, Philip L. DADSON, D. J. The culture and social institutions of ancient Iran. Cambridge: Cambridge University Press, 1989, p. 90-95.

[247] ROAF, Michael. Mesopotâmia. [Grandes civilizações do passado]. Barcelona: Ediciones Folio, 2006, p. 212.

[248] ROAF, 2006, p. 213.

[249] ÉPOCA Clássica, 2001, p. 29.

[250] DANDAMAEV, Muhammad A.; LUKONIN, Vladimir Grigor’evich; KOHL, Philip L. DADSON, D. J. The culture and social institutions of ancient Iran. Cambridge: Cambridge University Press, 1989, p. 95-96.

[251] MOURREAU, Jean-Jacques. A Pérsia dos grandes reis e de Zoroastro. Rio de Janeiro: Otto Pierre, 1978.

[252] AYMARD; AUBOYER, 1957, p. 203-208.

[253] EZQUERRA, Jaime Alvar. Saber ver a arte mesopotâmica e persa. São Paulo: Martins Fontes, 1991, p. 68-70.

[254] DANDAMAEV; LUKONIN; KOHL; DADSON, 1989, p. 144.

[255] ROAF, 2006, p. 210, 218.

[256] LIVERANI, 2016, p. 751.

[257] LIVERANI, 2016, p. 647-649.

[258] LIVERANI, 2016, p. 674.

[259] LIVERANI, 2016, p. 727-736.

[260] LIVERANI, 2016, p. 756-757.

[261] LIVERANI, 2016, p. 757.

[262] ASHERI, David. O Estado persa. São Paulo: Perspectiva, 2006.

[263] ÉPOCA Clássica, 2001, p. 56-57.

[264] ELIADE, Mircea. O sagrado e o profano: a essência das religiões. 2. ed. São Paulo: Martins Fontes, 2008, p. 104.

[265] DANDAMAEV; LUKONIN; KOHL; DADSON, 1989, p. 326-327.

[266] DU BREUIL, Paul. Zoroastro: religião e filosofia. São Paulo: IBRASA, 1987, p. 19-23.

[267] DU BREUIL, 1987, p. 26.

[268] DU BREUIL, 1987, p. 37-44.

[269] DU BREUIL, 1987, p. 46-54.

[270] HISTÓRIA das religiões: origem e desenvolvimento das religiões. Barcelona: Ediciones Folio, 2008, p. 58-59.

[271] GERSTENBERGER, Erhard S. Israel no tempo dos persas: séculos V e IV antes de Cristo. São Paulo: Edições Loyola, 2014, p. 84.

[272] DU BREUIL, 1987, p. 51-52.

[273] O LIVRO das religiões. São Paulo: Globo Livros, 2014. p. 65.

[274] DU BREUIL, 1987, p. 55-62.

[275] GERSTENBERGER, 2014. p. 85-87.

[276] DU BREUIL, 1987, p. 62-65.

[277] O LIVRO das religiões, 2014, p. 63.

[278] DU BREUIL, 1987, p. 66-67.

[279] DU BREUIL, 1987, p. 75-87.

[280] GERSTENBERGER, 2014. p. 87-88.

[281] MAZZINGHI, Luca. História de Israel das origens ao período romano. Petrópolis: Vozes, 2017, p. 85-87.

[282] MAZZINGHI, 2017, p. 89-94.

[283] DONNER, Herbert. História de Israel e dos povos vizinhos. Volume 2: Da época da divisão do reino até Alexandre Magno. São Leopoldo: Sinodal, 1997, p. 381-386.

[284] LASOR, William; HUBBARD, David; BUSH, Frederic. Introdução ao Antigo Testamento. São Paulo: Vida Nova, 1999, p. 421-422.

[285] LASOR; HUBBARD; BUSH, 1999, p. 348.

[286] Considera-se esta data como símbolo do início do exílio porque é a partir dela que temos a soma aproximada dos 70 anos profetizados por Jeremias (Jeremias 25:11-12), que marca o tempo de domínio babilônico até sua queda ante os persas e também a restauração judaica em Canaã (a partir de 536 a.C.).

[287] GUSSO, Antônio Renato. Panorama histórico de Israel para estudantes da Bíblia. Curitiba: A.D. Santos Editora, 2006, p. 108-110.

[288] Como no caso da anciã Ana, que profetizou no templo a respeito de Jesus, a qual se denominava da tribo de Aser (Lucas 2:36-38).

[289] MAZZINGHI, 2017, p. 105-106.

[290] MAZZINGHI, 2017, p. 107-112.

[291] LIVERANI, 2016, p. 724.

[292] MAZZINGHI, 2017, p. 114.

[293] GUSSO, 2003, p. 156-157.

[294] A data é motivo de controvérsia, pois ela é determinada a partir da suposição de que o Artaxerxes que o texto se refere seja Artaxerxes I; mas há quem defenda que se trata de Artaxerxes II, o que situaria a história depois de Neemias, em 398 a.C. MAZZINGHI, 2017, p. 118-119.

[295] GUSSO, 2003, p. 160.

[296] GERSTENBERGER, 2014. p. 97-100.

[297] GERSTENBERGER, 2014. p. 124-126, 128.

[298] DAVIS, 2005, p. 429.

[299] GERSTENBERGER, 2014. p. 132-149.

[300] MAZZINGHI, 2017, p. 123-126.

[301] MAZZINGHI, 2017, p. 128.

[302] O assunto é bastante controverso e motivo de amplo debate. Um resumo dessa questão pode ser encontrada em: SOARES, Dionísio Oliveira. As influências persas no chamado judaísmo pós-exílico. Revista Theos, Campinas, 6. ed., v. 5, n. 2, dez. 2009. Disponível em: <https://www.scribd.com/document/81033022/As-influencias-persas-no-chamadojudaismo-pos-exilico>. Acesso em: 28 ju;. 2018.

[303] SAYÃO, Luiz. O problema do mal no Antigo Testamento: o caso de Habacuque. São Paulo: Hagnos, 2012, p. 34.

[304] TILLICH, Paul. História do pensamento cristão. 5. ed. São Paulo: ASTE, 2015, p. 119-120.

[305] SAYÃO, 2012, p. 44-45.

[306] LEWIS, C. S. Cristianismo puro e simples. Rio de Janeiro: Thomas Nelson Brasil, 2017. p. 78-79.

[307] Por isso você vê torcedores gregos nas Olimpíadas levantando faixas com o nome do país: Hellas. Os substantivos “Grécia” e “grego” são latinos, termos que os romanos usavam para designar os helenos. Em nosso texto, manteremos gregos, já que somos latinos e assim os conhecemos.

[308] LEVI, Peter. A civilização grega. Barcelona: Ediciones Folio, 2008. p. 12-16.

[309] BRAUDEL, Fernand. Memórias do Mediterrâneo: pré-história e antiguidade. Lisboa: Terramar; Rio de Janeiro: Multinova, 2001, p. 257.

[310] BRAUDEL, 2001, p. 257-262.

[311] JARDÉ, Auguste. A Grécia antiga e a vida grega: geografia, história, literatura, artes, religião, vida pública e privada. São Paulo: EPU, 1977, p. 5-7.

[312] DURANDO, Furio. A Grécia Antiga. Barcelona: Ediciones Folio, 2005, p. 54-55.

[313] FINLEY, Moses. A economia antiga. Porto: Edições Afrontamento, 1986, p. 35.

[314] FINLEY, 1986, p. 84-100.

[315] FINLEY, 1986, p. 182, 193.

[316] LEVI, 2008, p. 102.

[317] BRIZZI, Giovanni. O guerreiro, o soldado e o legionário: os exércitos do mundo clássico. São Paulo: Madras, 2003. p. 11-20.

[318] BRAUDEL, 2001, p. 262-263.

[319] VERNANT, Jean Pierre. As origens do pensamento grego. Rio de Janeiro: Difel, 2002. p. 65-69.

[320] VERNANT, 2002, p. 53-55.

[321] FINLEY, Moses. A política no Mundo Antigo. Rio de Janeiro: Zahar, 1985, p. 90-92.

[322] CASTORIADIS, Cornelius. As encruzilhadas do Labirinto II: os domínios do homem. Rio de Janeiro: Paz e Terra, 1987, p. 294-299.

[323] VERNANT, 2002, p. 141-142.

[324] MARCONDES, Danilo. Iniciação à história da filosofia: dos pré-socráticos a Wittgenstein. Rio de Janeiro: Jorge Zahar Ed., 1997, p. 19-27.

[325] DURANDO, 2005, p. 92.

[326] DURANDO, 2005, p. 130-135.

[327] MÜLLER, Werner; VOGEL, Gunther. Atlas de arquitectura. 1. Generalidades. De Mesopotamia a Bizancio. Madrid: Alianza Editorial, 1984, p. 155-163.

[328] DURANDO, 2005, p. 144-146.

[329] FULLERTON, Mark D. Arte grega. São Paulo: Odysseus, 2002. p. 26-31.

[330] LEVI, 2008, p. 67-69.

[331] LÉVÊQUE, Pierre. O mundo helenístico. Lisboa: Edições 70, 1987, p. 100-102.

[332] VERNANT, Jean-Pierre. Mito e religião na Grécia antiga. Campinas: Papirus, 1992. p. 9-30.

[333] VERNANT, 1992, p. 37-45.

[334] TEXTOS Sacros. [As grandes religiões]. São Paulo: Editora Abril, 1973. p. 154-155.

[335] GRIMAL, Pierre. A mitologia grega. 4. ed. São Paulo: Brasiliense, 1987. p. 42-64.

[336] VERNANT, 1992, p. 49-57.

[337] VERNANT, 1992, p. 61-67.

[338] VERNANT, 1992, p. 77-92.

[339] ELIADE, Mircea. Tratado de história das religiões. 4. ed. São Paulo: Editora WMF Martins Fontes, 2010, p. 287-289.

[340] MONTIEL, Juan Francisco Martos. Sexo y ritual: la prostitución sagrada en la antigua Grecia. In.: MARTÍNEZ- PINNA NIETO, Jorge. Mito y ritual en el antiguo Occidente mediterráneo. Málaga, Espanha: UMA, 2002. p. 7-38.

[341] JARDÉ, 1977, p. 132.

[342] GRIMAL, 1987, p. 25-30.

[343] GRIMAL, 1987, p. 36-41.

[344] VERNANT, 1992, p. 67-71.

[345] LÉVÊQUE, Pierre. O mundo helenístico. Lisboa: Edições 70, 1987. p. 9-17.

[346] LÉVÊQUE, 1987, p. 19-45.

[347] LÉVÊQUE, 1987, p. 51-53.

[348] LÉVÊQUE, 1987, p. 99.

[349] JOSEFO, Flávio. História dos hebreus. 8. ed. Rio de Janeiro: CPAD, 2004. Livro XI, Capítulo 8, 452.

[350] GUSSO, Antônio Renato. Panorama histórico de Israel para estudantes da Bíblia. Curitiba: A.D. Santos Editora, 2003, p. 177.

[351] LÉVÊQUE, 1987, p. 50-51.

[352] Os livros apócrifos ou deuterocanônicos não fazem parte da atual Bíblia Hebraica nem do Antigo Testamento protestante, mas sete deles estão na Bíblia católica. São eles: Tobias, Judite, Sabedoria, Eclesiástico, Baruque, 1Macabeus e 2Macabeus. Ainda há acréscimos nos livros canônicos de Ester e de Daniel. MILLER, Stephen M.; HUBER, Robert V. A Bíblia e sua história: o surgimento e o impacto da Bíblia. Barueri: Sociedade Bíblica do Brasil, 2006, p. 50.

[353] MILLER; HUBER, 2006, p. 48-51.

[354] LÉVÊQUE, 1987, p. 47.

[355] GUSSO, 2006, p. 181-189.

[356] MAZZINGHI, Luca. História de Israel das origens ao período romano. Petrópolis: Vozes, 2017, p. 145-148.

[357] CHAMPLIN, Russel Norman. O Novo Testamento interpretado: versículo por versículo: Volume 2: Lucas e João. Guaratinguetá: Voz Bíblica, s.d. p. 485.

[358] Essa é a tese do teólogo Justo González: que a evangelização de gentios não foi um processo natural da igreja, mas algo revelado e impulsionado pelo Espírito Santo. GONZÁLEZ, Justo. Atos, o evangelho do Espírito Santo. São Paulo: Hagnos, 2011. p. 34-37.

[359] GONZÁLEZ, 2011, p. 114-117.

[360] GONZÁLEZ, 2011, p. 168-173.

[361] GONZÁLEZ, 2009, p. 166.

[362] O modelo congregacional de governo da Igreja é adotado por congregacionais, batistas, metodistas e pentecostais de maneira geral.

[363] É possível que Mateus tenha sido escrito originalmente em aramaico, mas logo traduzido para o grego. Isso é motivo de discussão acadêmica, tendendo os conservadores a considerarem o texto original em grego mesmo. Independente disso, o fato é que esse evangelho foi disseminado e conhecido no dialeto da Ática. CARSON, D. A.; MOO, Douglas J.; MORRIS, Leon. Introdução ao Novo Testamento. São Paulo: Vida Nova, 1997. p. 72-79.

[364] Há uma ampla discussão sobre a autoria e origem geográfica das obras atribuídas a João, bem descrita em CARSON; MOO; MORRIS, 1997, p. 155-193.

[365] Há muitos teólogos que negam esse fato; para estes João não está usando o conceito grego, mas judaico, atrelado à Palavra e à Sabedoria do Antigo Testamento. Outros, nem isso: que seu conceito de Logos é completamente novo. Eu tenho problemas em acreditar que João ignorasse o fato de estar usando uma palavra recheada de significados para um determinado público e que pudesse apresentar essa palavra em outro sentido que não o conhecido, pelo menos na sua base fundamental. Não posso conceber que ele fosse ignorante (por não saber o que significava) ou irresponsável (por usar um termo consagrado na tradição sem pesar como soaria aos ouvidos da plateia).

[366] CHAMPLIN, s.d., Volume 2, p. 256.

[367] CONZÁLEZ, 2011, P. 106-108.

[368] TILLICH, Paul. História do pensamento cristão. 5 ed. São Paulo: ASTE, 2015, p. 37.

[369] LADD, George Eldon. Teologia do Novo Testamento. São Paulo: Exodus, 1997. p. 563-566.

[370] LADD, 1997, p. 340.

[371] CARSON; MOO; MORRIS, 1997, p. 242-244.

[372] CHAMPLIN, Russel Norman. O Novo Testamento interpretado: versículo por versículo: Volume 4: 1Coríncios, 2Coríntios, Gálatas e Efésios. Guaratinguetá: A Voz Bíblica, s.d., p. 258.

[373] CHAMPLIN, Russel Norman. O Novo Testamento interpretado: versículo por versículo: Volume 5: Filipenses, Colossenses, 1Tessalonicenses, 2Tessalonicenses, 1Timóteo, 2Timóteo, Tito, Filemom e Hebreus. Guaratinguetá: A Voz Bíblica, s.d., p. 422.

[374] CHAMPLIN, Russel Norman. O Novo Testamento interpretado: versículo por versículo: Volume 3: Atos e Romanos. Guaratinguetá: A Voz Bíblica, s.d., p. 377.

[375] RICHARDSON, Don. O fator Melquisedeque: o testemunho de Deus nas culturas através do mundo. São Paulo: Vida Nova, 1995, p. 9-22.

[376] MARCONDES, 1997, p. 42-44.

[377] MARCONDES, 1997, p. 48.

[378] FRANGIOTTI, Roque. Cristãos, judeus, pagãos: acusações, críticas e conflitos no cristianismo antigo. Aparecida: Ideias & Letras, 2006, p. 228.

[379] BONNHOEFFER, Dietrich. Discipulado. São Leopoldo: Sinodal, 1980, p. 9.

[380] RUBINI, Ademir. As carnes sacrificadas aos ídolos. Idolatria: a questão é ter ou não ter imagens? Petrópolis: Vozes, 2015. p. 405-416. [Estudos Bíblicos; n. 124]

[381] PRIETO, Christine. Cristianismo e paganismo: a pregação do Evangelho no mundo greco-romano. São Paulo: Paulus, 2007, p. 34-43.

[382] FRANGIOTTI, 2006, p. 228-229.

[383] FRANGIOTTI, 2006, p. 230-238.

[384] FRANGIOTTI, 2006, p. 239-248.

[385] MCGRATH, Alister. Heresia: em defesa da fé. São Paulo: Hagnos, 2014. p. 33-43.

[386] MARCONDES, 1997, p. 105.

[387] CORNELL, Tim; MATTHEWS, John. A civilização romana. Barcelona: Ediciones Folio, 2008, p. 11-17.

[388] FUNARI, Pedro Paulo. Grécia e Roma. 3. ed. São Paulo: Contexto, 2004, p. 81-82.

[389] FUNARI, 2004, p. 82.

[390] CORNELL; MATTHEWS, 2008, p. 19-20.

[391] LIBERATI, Anna Maria; BOURBON, Fabio. A Roma antiga. Barcelona: Ediciones Folio, 2005. p. 21-24.

[392] LIBERATI, Anna Maria; BOURBON, Fabio. A Roma antiga. Barcelona: Ediciones Folio, 2005, p. 20-21.

[393] GRIMAL, Pierre. O império romano. Lisboa: Edições 70, 1993, p. 9-17.

[394] GUARINELLO, Norberto Luiz. Imperialismo greco-romano. São Paulo: Editora Ática, 1987, p. 38-39.

[395] GRIMAL, 1993, p. 56-57.

[396] GUARINELLO, 1987, p. 79-81.

[397] MÍGUEZ, Néstor. Para além do espírito do Império: novas perspectivas em política e religião. São Paulo: Paulinas, 2012, p. 18-21.

[398] GRIMAL, 2009, p. 128.

[399] CARRIÉ, Jean-Michel. O soldado. In: GIARDINA, Andrea (Org.). O homem romano. Lisboa: Editorial Presença, 1992, p. 90-91.

[400] CONNOLLY, Peter. Las legiones romanas. Madrid: Espasa-Calpe, 1981, p. 41.

[401] CONNOLLY, 1981, p. 42.

[402] CARRIÉ, 1992, p. 94-95.

[403] CARRIÉ, 1992, p. 104-105.

[404] GRIMAL, 2009, p. 139-141.

[405] CONNOLLY, 1981, p. 48-51.

[406] PETIT, Paul. História Antiga. São Paulo: Difusão Europeia do Livro, 1971.

[407] COLEMAN, William L. Manual dos tempos e costumes bíblicos. Venda Nova, MG: Betânia, 1991, p. 223-224.

[408] THÉBERT, Yvon. O escravo. In: GIARDINA, Andrea (Org.). O homem romano. Lisboa: Editorial Presença, 1992, p. 125-126.

[409] GRIMAL, Pierre. A civilização romana. Lisboa: Edições 70, 2009, p. 69-70.

[410] GRIMAL, 2009, p. 77-78.

[411] GRIMAL, 2009, p. 89-94.

[412] GRIMAL, 1991, p. 117-119.

[413] GRIMAL, Pierre. O amor em Roma. São Paulo: Martins Fontes, 1991, p. 62.

[414] VEYNE, Paul. História da vida privada 1: do Império Romano ao ano mil. São Paulo: Companhia das Letras, 1994, p. 23.

[415] VEYNE, 1994, p. 40-42.

[416] GRIMAL, 2009, p. 74-75.

[417] VEYNE, 1994, p. 30-31.

[418] THÉBERT, 1992, p. 119-121.

[419] VEYNE, 1994, p. 63-79.

[420] VEYNE, 1994, p. 94-96.

[421] ALFÖDY, Géza. A história social de Roma. Lisboa: Editorial Presença, 1989.

[422] CARCOPINO, Jérôme. La vida cotidiana en Roma en el apogeo del imperio. Madrid: Ediciones Temas de Hoy, 2001. p. 81-83.

[423] VEYNE, 1994, p. 97-101.

[424] VEYNE, 1994, p. 103-108.

[425] HORSLEY, Richard A. Paulo e o império: religião e poder na sociedade imperial romana. São Paulo: Paulus, 2004, p. 112.

[426] BRADLEY, Henry. Língua. In: BAILEY, Cyril. O legado de Roma. Rio de Janeiro: Imago Editora, 1992. p. 387- 720.

[427] MÜLLER; VOGEL, 1984, p. 203-253.

[428] CARCOPINO, 2001, p. 43-70.

[429] STEVENSON, G. H. Comunicações e comércio. In: BAILEY, Cyril. O legado de Roma. Rio de Janeiro: Imago Editora, 1992. p. 159-192.

[430] VEYNE, 1994, p. 202-203.

[431] SCHEID, John. O sacerdote. In: GIARDINA, Andrea (Org.). O homem romano. Lisboa: Editorial Presença, 1992. p. 51-53.

[432] AS GRANDES religiões. v. 1. São Paulo: Editora Abril, 1973. p. 46-48.

[433] SCHEID, 1992, p. 53.

[434] GRIMAL, 2009, p. 63.

[435] HISTÓRIA das religiões, 2008, p. 88.

[436] HISTÓRIA das religiões, 2008, p. 76.

[437] SCHEID, 1992, p. 55-65.

[438] GRIMAL, 1993, p. 58-59.

[439] Grifo nosso. COMBY, Jean. Vida e religiões no Império Romano no tempo das primeiras comunidades cristãs. São Paulo: Paulinas, 1988, p. 18.

[440] HORSLEY, 2004, p. 29.

[441] GRIMAL, 2009, p. 82-83.

[442] GRIMAL, 2009, p. 86-87.

[443] COMBY, 1988, p. 23-24.

[444] CORNELL; MATTHEWS, 2008, p. 96.

[445] GRIMAL, 2009, p. 84.

[446] COMBY, 1988, p. 25-26.

[447] AS GRANDES religiões, 1973, p. 122.

[448] HISTÓRIA das religiões, 2008, p. 95.

[449] GRIMAL, 2009, p. 84-85.

[450] AS GRANDES religiões, 1973, p. 125.

[451] COMBY, 1988, p. 28-34.

[452] As alianças de Judá com Roma estão detalhadas no primeiro livro dos Macabeus, nos capítulos 8, 12 e 15. Também houve apoio de Esparta, bem menos importante.

[453] Chamamos de “Canaã” a região dos antigos reinos de Judá e Israel até os persas. No domínio dos gregos, você deve ter percebido que falamos mais em Judeia — uma vez que a os eventos mais importantes ocorreram nessa região. Quando tratamos da relação dos romanos, surgiu um complicador: nosso foco voltou para todo o território que era chamado de Canaã no Antigo Testamento. O problema é que esse termo caiu em total desuso. Como Judeia corresponde apenas à parte sul do território, e os romanos passaram a chamar toda a província de Siro-Palestina a partir de Adriano (imperador entre 117 e 138 d.C.), resolvemos utilizar, nesta parte, a nomenclatura Palestina. Sabemos que o termo provoca controvérsia, mas isso ocorre por questões políticas contemporâneas, e não pela validade do termo em si.

[454] MAZZINGHI, Luca. História de Israel das origens ao período romano. Petrópolis: Vozes, 2017, p. 148, 159- 160.

[455] HORSLEY, Richard A. Jesus e o Império: O Reino de Deus e a nova desordem mundial. São Paulo: Paulus, 2004. p. 37-40.

[456] MAZZINGHI, 2017, p. 163-170.

[457] TOGNINI, O Período Interbíblico, 2009, p. 167-168.

[458] MAZZINGHI, 2017, p. 176-178.

[459] HORSLEY, Richard A. Bandidos, profetas e messias: movimentos populares no tempo de Jesus. São Paulo: Paulus, 1995, p. 210-211.

[460] HORSLEY, 2004. p. 45-60.

[461] CULLMANN, Oscar. Cristo e política. Rio de Janeiro: Paz e Terra, 1968, p. 12.

[462] CULLMANN, 1968, p. 19-20.

[463] Há até mesmo a possiblidade de que o enigmático termo Iscariotes, de Judas, seja uma forma aramaica de sicarii, o que significaria que entre os doze havia um nacionalista radical que pode ser comparado aos terroristas da atualidade. CULLMANN, 1968, p. 16-17.

[464] CULLMANN, 1968, p. 38-43.

[465] CULLMANN, 1968, p. 49-61.

[466] COMBLIN, José. Fé e liberdade na carta a Filêmon. In: Revista de Interpretação Bíblica Latino-Americana, n. 28, p. 99-102, 1997.

[467] HORSLEY, 2004, p. 143.

[468] GONZÁLEZ, Justo. História ilustrada do cristianismo: a era dos mártires até a era dos sonhos frustrados. São Paulo: Vida Nova, 2011, p. 331.

[469] DREHER, Martin. História do povo de Jesus: uma leitura latino-americana. 2. ed. São Leopoldo: Sinodal, 2017, p. 18-19.

[470] DREHER, 2017, p. 39.

[471] CARSON, D. A.; MOO, Douglas J.; MORRIS, Leon. Introdução ao Novo Testamento. São Paulo: Vida Nova, 1997, p. 528-531.

[472] CULLMANN, 1968, p. 63-73.

[473] FRANGIOTTI, Roque. Cristãos, judeus, pagãos: acusações, críticas e conflitos no cristianismo antigo. Aparecida: Ideias & Letras, 2006, p. 48-49.

[474] FRANGIOTTI, 2006, p. 65-67.

[475] FRANGIOTTI, 2006, p. 67-69.

[476] FRANGIOTTI, 2006, p. 109-12.

[477] CAIRNS, Earle Edwin. O cristianismo através dos séculos: uma história da igreja cristã. 3. ed. São Paulo: Vida Nova, 2008. p. 77-80.

[478] GONZÁLEZ,, 2011, p. 133-134.

[479] BASILICA of Santa Sabina, Rome. Khan Academy, 2016. Disponível em: <https://www.khanacademy.org/humanities/medieval-world/early-christian1/v/santa-sabina-rome>. Acesso em: 14 ago. 2018.

[480] MAGALHÃES FILHO, Glauco Barreira. O imaginário em As crônicas de Nárnia. São Paulo: Mundo Cristão, 2005, p. 34.

[481] JUNG, Carl Gustav. O homem e seus símbolos. 4. ed. Rio de Janeiro: Nova Fronteira, s.d., p. 67-75.

[482] MAGALHÃES FILHO, 2005. p. 109.

[483] MAGALHÃES FILHO, 2005. p. 81, 92.

[484] FRANGIOTTI, Roque. Cristãos, judeus, pagãos: acusações, críticas e conflitos no cristianismo antigo. Aparecida: Ideias & Letras, 2006, p. 117-126.

[485] LEWIS, C. S. Surpreendido pela alegria. São Paulo: Mundo Cristão, 1998, p. 241.

[486] BURKE, Peter. Hibridismo cultural. São Leopoldo: Unisinos, 2009, p. 13-14.

[487] BURKE, 2009, p. 24.

[488] BURKE, 2009, p. 114.

[489] LANGE, Nicholas de. Povo judeu. Barcelona: Ediciones Folio, 2007. p. 78-120.

[490] FRANGIOTTI, 2006, p. 259-262.

[491] TOLKIEN, J. R. R. Sobre histórias de fadas. São Paulo: Conrad Editora do Brasil, 2006, p. 76-77.

[492] TOLKIEN, 2006, p. 81.$c$
  where not exists (
    select 1 from public.aulas where curso_id = v_curso_id and ordem = 12
  );
end
$migration$;
