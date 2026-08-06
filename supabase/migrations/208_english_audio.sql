-- =============================================================
-- EKBALLO ENGLISH · Áudio pré-gerado (voz neural), em vez da voz
-- do navegador
--
-- O player usava speechSynthesis, ou seja, a voz de cada aparelho.
-- No iPhone o sistema tem vozes boas; no Chrome do computador sai
-- uma voz compacta que o aluno não entende — e pronúncia é
-- justamente o que ele veio aprender. Voz de referência num curso
-- de idioma não pode variar conforme quem abre.
--
-- Agora cada frase tem MP3 próprio, gerado uma vez com Edge TTS
-- (en-US-AriaNeural, -6%) por scripts/gerar-audios-english.mjs.
-- Arquivos em public/english/audio/ — entram na imagem Docker,
-- tocam offline e não custam nada em runtime. O speechSynthesis
-- continua como plano B para o que não tiver arquivo.
-- =============================================================

alter table english_exercicios add column if not exists audio_url text;

update english_exercicios set audio_url = '/english/audio/i-am-fifteen-years-old-4fef5e.mp3' where audio_texto = 'I am fifteen years old.';
update english_exercicios set audio_url = '/english/audio/good-evening-6a4f54.mp3' where audio_texto = 'Good evening';
update english_exercicios set audio_url = '/english/audio/church-2f1899.mp3' where audio_texto = 'church';
update english_exercicios set audio_url = '/english/audio/i-am-bruno-f9557e.mp3' where audio_texto = 'I am Bruno';
update english_exercicios set audio_url = '/english/audio/i-am-twelve-years-old-c3b436.mp3' where audio_texto = 'I am twelve years old';
update english_exercicios set audio_url = '/english/audio/what-is-your-name-21eb49.mp3' where audio_texto = 'What is your name?';
update english_exercicios set audio_url = '/english/audio/how-are-you-303189.mp3' where audio_texto = 'How are you?';
update english_exercicios set audio_url = '/english/audio/four-five-six-a21ed0.mp3' where audio_texto = 'four, five, six';
update english_exercicios set audio_url = '/english/audio/good-morning-33e888.mp3' where audio_texto = 'Good morning!';
update english_exercicios set audio_url = '/english/audio/this-is-my-friend-b05a1d.mp3' where audio_texto = 'This is my friend';
update english_exercicios set audio_url = '/english/audio/good-afternoon-13fd0a.mp3' where audio_texto = 'Good afternoon';
update english_exercicios set audio_url = '/english/audio/the-bible-e87a6c.mp3' where audio_texto = 'The Bible';
update english_exercicios set audio_url = '/english/audio/the-lord-bless-you-and-keep-you-e7d1a3.mp3' where audio_texto = 'The Lord bless you and keep you';
update english_exercicios set audio_url = '/english/audio/i-am-happy-9bdfe7.mp3' where audio_texto = 'I am happy';
update english_exercicios set audio_url = '/english/audio/see-you-later-c11a58.mp3' where audio_texto = 'See you later';
update english_exercicios set audio_url = '/english/audio/god-bless-you-0c7c05.mp3' where audio_texto = 'God bless you.';
update english_exercicios set audio_url = '/english/audio/goodbye-b5b29c.mp3' where audio_texto = 'Goodbye';
update english_exercicios set audio_url = '/english/audio/how-old-are-you-c0dcba.mp3' where audio_texto = 'How old are you?';
update english_exercicios set audio_url = '/english/audio/god-is-good-271a9e.mp3' where audio_texto = 'God is good';
update english_exercicios set audio_url = '/english/audio/where-are-you-from-7bc5e7.mp3' where audio_texto = 'Where are you from?';
update english_exercicios set audio_url = '/english/audio/i-am-ten-years-old-a010b3.mp3' where audio_texto = 'I am ten years old';
update english_exercicios set audio_url = '/english/audio/i-am-tired-f6a25d.mp3' where audio_texto = 'I am tired';
update english_exercicios set audio_url = '/english/audio/and-you-bc6d2a.mp3' where audio_texto = 'And you?';
update english_exercicios set audio_url = '/english/audio/city-2c5489.mp3' where audio_texto = 'city';
update english_exercicios set audio_url = '/english/audio/i-am-from-brazil-b4c5cc.mp3' where audio_texto = 'I am from Brazil.';
update english_exercicios set audio_url = '/english/audio/i-am-ten-years-old-317abd.mp3' where audio_texto = 'I am ten years old.';
update english_exercicios set audio_url = '/english/audio/i-live-in-sao-paulo-4f58e0.mp3' where audio_texto = 'I live in São Paulo';
update english_exercicios set audio_url = '/english/audio/let-us-pray-5df340.mp3' where audio_texto = 'Let us pray';
update english_exercicios set audio_url = '/english/audio/good-morning-0f7689.mp3' where audio_texto = 'Good morning';
update english_exercicios set audio_url = '/english/audio/one-two-three-aebcc2.mp3' where audio_texto = 'one, two, three';
update english_exercicios set audio_url = '/english/audio/how-are-you-today-f24d13.mp3' where audio_texto = 'How are you today?';
update english_exercicios set audio_url = '/english/audio/hello-f7ff9e.mp3' where audio_texto = 'Hello';
update english_exercicios set audio_url = '/english/audio/thank-you-6b50e3.mp3' where audio_texto = 'Thank you';
update english_exercicios set audio_url = '/english/audio/i-am-fine-thank-you-240adb.mp3' where audio_texto = 'I am fine thank you';
update english_exercicios set audio_url = '/english/audio/the-bible-03982a.mp3' where audio_texto = 'the Bible';
update english_exercicios set audio_url = '/english/audio/nice-to-meet-you-5d2038.mp3' where audio_texto = 'Nice to meet you';
update english_exercicios set audio_url = '/english/audio/how-old-are-you-917f66.mp3' where audio_texto = 'How old are you';
update english_exercicios set audio_url = '/english/audio/city-427162.mp3' where audio_texto = 'City';
update english_exercicios set audio_url = '/english/audio/i-am-fine-thank-you-054378.mp3' where audio_texto = 'I am fine, thank you';
update english_exercicios set audio_url = '/english/audio/i-am-from-brazil-3f6144.mp3' where audio_texto = 'I am from Brazil';
update english_exercicios set audio_url = '/english/audio/god-bless-you-0a9b16.mp3' where audio_texto = 'God bless you!';
update english_exercicios set audio_url = '/english/audio/seven-eight-nine-ten-f168fc.mp3' where audio_texto = 'seven, eight, nine, ten';
update english_exercicios set audio_url = '/english/audio/country-8e68b3.mp3' where audio_texto = 'country';
update english_exercicios set audio_url = '/english/audio/my-name-is-ana-0b0b09.mp3' where audio_texto = 'My name is Ana';
update english_exercicios set audio_url = '/english/audio/god-bless-you-6a5fea.mp3' where audio_texto = 'God bless you';
update english_exercicios set audio_url = '/english/audio/nice-to-meet-you-55c5a3.mp3' where audio_texto = 'Nice to meet you!';
