-- =============================================================
-- EKBALLO ENGLISH · Áudio do Módulo 3
--
-- Mesmo caminho do 208/210: MP3 pré-gerado com a MESMA voz neural
-- (en-US-AriaNeural, -6%) por scripts/gerar-audios-english.mjs.
-- Voz única em todo o curso — a pronúncia de referência não pode
-- trocar de professor no meio da jornada.
-- =============================================================

alter table english_exercicios add column if not exists audio_url text;

update english_exercicios set audio_url = '/english/audio/i-drink-water-59ed8b.mp3' where audio_texto = 'I drink water.';
update english_exercicios set audio_url = '/english/audio/i-wear-a-shirt-6ee1be.mp3' where audio_texto = 'I wear a shirt.';
update english_exercicios set audio_url = '/english/audio/i-need-money-7ab8ea.mp3' where audio_texto = 'I need money';
update english_exercicios set audio_url = '/english/audio/where-is-the-bus-ef5332.mp3' where audio_texto = 'Where is the bus?';
update english_exercicios set audio_url = '/english/audio/dress-9dbfbe.mp3' where audio_texto = 'dress';
update english_exercicios set audio_url = '/english/audio/the-store-is-on-this-street-7a3f0d.mp3' where audio_texto = 'The store is on this street.';
update english_exercicios set audio_url = '/english/audio/my-shirt-is-blue-c168db.mp3' where audio_texto = 'My shirt is blue';
update english_exercicios set audio_url = '/english/audio/here-you-are-527660.mp3' where audio_texto = 'Here you are';
update english_exercicios set audio_url = '/english/audio/i-wear-shoes-8d5abb.mp3' where audio_texto = 'I wear shoes';
update english_exercicios set audio_url = '/english/audio/i-drink-water-every-day-b57b7f.mp3' where audio_texto = 'I drink water every day.';
update english_exercicios set audio_url = '/english/audio/how-much-is-it-c098be.mp3' where audio_texto = 'How much is it?';
update english_exercicios set audio_url = '/english/audio/water-6d5a45.mp3' where audio_texto = 'water';
update english_exercicios set audio_url = '/english/audio/this-shirt-is-mine-1bd927.mp3' where audio_texto = 'This shirt is mine';
update english_exercicios set audio_url = '/english/audio/i-wear-a-coat-today-9ec890.mp3' where audio_texto = 'I wear a coat today.';
update english_exercicios set audio_url = '/english/audio/i-want-6c3482.mp3' where audio_texto = 'I want';
update english_exercicios set audio_url = '/english/audio/please-cae355.mp3' where audio_texto = 'please';
update english_exercicios set audio_url = '/english/audio/the-house-is-white-0b9d72.mp3' where audio_texto = 'The house is white.';
update english_exercicios set audio_url = '/english/audio/blue-4c9a82.mp3' where audio_texto = 'blue';
update english_exercicios set audio_url = '/english/audio/shoes-19f319.mp3' where audio_texto = 'shoes';
update english_exercicios set audio_url = '/english/audio/red-789880.mp3' where audio_texto = 'red';
update english_exercicios set audio_url = '/english/audio/where-is-the-store-759e1d.mp3' where audio_texto = 'Where is the store';
update english_exercicios set audio_url = '/english/audio/bread-6ff291.mp3' where audio_texto = 'bread';
update english_exercicios set audio_url = '/english/audio/shirt-faa5d6.mp3' where audio_texto = 'shirt';
update english_exercicios set audio_url = '/english/audio/it-is-delicious-064975.mp3' where audio_texto = 'It is delicious';
update english_exercicios set audio_url = '/english/audio/store-3a2129.mp3' where audio_texto = 'store';
update english_exercicios set audio_url = '/english/audio/i-wear-a-shirt-c6c968.mp3' where audio_texto = 'I wear a shirt';
update english_exercicios set audio_url = '/english/audio/thank-you-for-the-food-182427.mp3' where audio_texto = 'Thank you for the food';
update english_exercicios set audio_url = '/english/audio/my-shoes-are-red-d0733e.mp3' where audio_texto = 'My shoes are red';
update english_exercicios set audio_url = '/english/audio/bus-32c70c.mp3' where audio_texto = 'bus';
update english_exercicios set audio_url = '/english/audio/coat-09d5f6.mp3' where audio_texto = 'coat';
update english_exercicios set audio_url = '/english/audio/my-shirt-is-blue-7f8ccb.mp3' where audio_texto = 'My shirt is blue.';
update english_exercicios set audio_url = '/english/audio/i-need-help-69f881.mp3' where audio_texto = 'I need help';
update english_exercicios set audio_url = '/english/audio/coffee-44213f.mp3' where audio_texto = 'coffee';
update english_exercicios set audio_url = '/english/audio/i-eat-bread-9c2292.mp3' where audio_texto = 'I eat bread';
update english_exercicios set audio_url = '/english/audio/i-drink-water-11c18a.mp3' where audio_texto = 'I drink water';
update english_exercicios set audio_url = '/english/audio/can-i-have-some-water-dd2961.mp3' where audio_texto = 'Can I have some water';
update english_exercicios set audio_url = '/english/audio/white-528cef.mp3' where audio_texto = 'white';
update english_exercicios set audio_url = '/english/audio/money-c95259.mp3' where audio_texto = 'money';
update english_exercicios set audio_url = '/english/audio/the-food-is-delicious-a282f6.mp3' where audio_texto = 'The food is delicious.';
update english_exercicios set audio_url = '/english/audio/street-d3a9fb.mp3' where audio_texto = 'street';
update english_exercicios set audio_url = '/english/audio/i-am-hungry-37ac64.mp3' where audio_texto = 'I am hungry.';
update english_exercicios set audio_url = '/english/audio/i-eat-rice-every-day-bccf41.mp3' where audio_texto = 'I eat rice every day';
update english_exercicios set audio_url = '/english/audio/i-am-thirsty-06a93a.mp3' where audio_texto = 'I am thirsty';
update english_exercicios set audio_url = '/english/audio/green-bc74f4.mp3' where audio_texto = 'green';
update english_exercicios set audio_url = '/english/audio/let-us-eat-ac278e.mp3' where audio_texto = 'Let us eat';
update english_exercicios set audio_url = '/english/audio/can-i-have-some-water-872d58.mp3' where audio_texto = 'Can I have some water?';
update english_exercicios set audio_url = '/english/audio/i-am-hungry-1bca1a.mp3' where audio_texto = 'I am hungry';
update english_exercicios set audio_url = '/english/audio/rice-693927.mp3' where audio_texto = 'rice';
