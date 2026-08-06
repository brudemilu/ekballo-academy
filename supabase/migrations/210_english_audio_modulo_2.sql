-- =============================================================
-- EKBALLO ENGLISH · Áudio do Módulo 2
--
-- Mesmo caminho do 208: MP3 pré-gerado com voz neural
-- (en-US-AriaNeural, -6%) por scripts/gerar-audios-english.mjs,
-- servido estático de public/english/audio.
-- =============================================================

alter table english_exercicios add column if not exists audio_url text;

update english_exercicios set audio_url = '/english/audio/father-32c8bb.mp3' where audio_texto = 'father';
update english_exercicios set audio_url = '/english/audio/i-like-music-e4cad1.mp3' where audio_texto = 'I like music';
update english_exercicios set audio_url = '/english/audio/i-like-to-read-e0cc14.mp3' where audio_texto = 'I like to read';
update english_exercicios set audio_url = '/english/audio/i-have-a-book-e6e982.mp3' where audio_texto = 'I have a book';
update english_exercicios set audio_url = '/english/audio/i-live-in-a-house-c0592b.mp3' where audio_texto = 'I live in a house.';
update english_exercicios set audio_url = '/english/audio/i-do-not-like-f91bf3.mp3' where audio_texto = 'I do not like';
update english_exercicios set audio_url = '/english/audio/my-name-is-ana-and-i-am-from-brazil-c26f1a.mp3' where audio_texto = 'My name is Ana and I am from Brazil.';
update english_exercicios set audio_url = '/english/audio/i-live-with-my-family-c9ef4b.mp3' where audio_texto = 'I live with my family';
update english_exercicios set audio_url = '/english/audio/i-am-a-student-1d2d5e.mp3' where audio_texto = 'I am a student';
update english_exercicios set audio_url = '/english/audio/book-e7e694.mp3' where audio_texto = 'book';
update english_exercicios set audio_url = '/english/audio/bedroom-009e05.mp3' where audio_texto = 'bedroom';
update english_exercicios set audio_url = '/english/audio/mother-5116e4.mp3' where audio_texto = 'mother';
update english_exercicios set audio_url = '/english/audio/i-am-happy-today-403af1.mp3' where audio_texto = 'I am happy today.';
update english_exercicios set audio_url = '/english/audio/i-sleep-d14071.mp3' where audio_texto = 'I sleep';
update english_exercicios set audio_url = '/english/audio/this-is-my-house-d67534.mp3' where audio_texto = 'This is my house.';
update english_exercicios set audio_url = '/english/audio/i-like-music-428e01.mp3' where audio_texto = 'I like music.';
update english_exercicios set audio_url = '/english/audio/i-like-to-read-aa43c1.mp3' where audio_texto = 'I like to read.';
update english_exercicios set audio_url = '/english/audio/the-teacher-is-at-school-b4f953.mp3' where audio_texto = 'The teacher is at school';
update english_exercicios set audio_url = '/english/audio/this-is-my-sister-34e8e5.mp3' where audio_texto = 'This is my sister.';
update english_exercicios set audio_url = '/english/audio/i-am-from-brazil-and-i-like-music-c68e58.mp3' where audio_texto = 'I am from Brazil and I like music';
update english_exercicios set audio_url = '/english/audio/this-is-my-brother-1c3305.mp3' where audio_texto = 'This is my brother';
update english_exercicios set audio_url = '/english/audio/i-work-753109.mp3' where audio_texto = 'I work';
update english_exercicios set audio_url = '/english/audio/table-c3ee13.mp3' where audio_texto = 'table';
update english_exercicios set audio_url = '/english/audio/i-live-in-a-house-237495.mp3' where audio_texto = 'I live in a house';
update english_exercicios set audio_url = '/english/audio/kitchen-2f56c0.mp3' where audio_texto = 'kitchen';
update english_exercicios set audio_url = '/english/audio/the-table-is-in-the-kitchen-974742.mp3' where audio_texto = 'The table is in the kitchen';
update english_exercicios set audio_url = '/english/audio/god-is-good-271a9e.mp3' where audio_texto = 'God is good';
update english_exercicios set audio_url = '/english/audio/i-love-my-family-8a6f49.mp3' where audio_texto = 'I love my family.';
update english_exercicios set audio_url = '/english/audio/i-am-from-brazil-3f6144.mp3' where audio_texto = 'I am from Brazil';
update english_exercicios set audio_url = '/english/audio/i-like-my-school-d5e6e3.mp3' where audio_texto = 'I like my school';
update english_exercicios set audio_url = '/english/audio/sister-1dd09b.mp3' where audio_texto = 'sister';
update english_exercicios set audio_url = '/english/audio/every-day-a3fd74.mp3' where audio_texto = 'every day';
update english_exercicios set audio_url = '/english/audio/student-204036.mp3' where audio_texto = 'student';
update english_exercicios set audio_url = '/english/audio/school-655f83.mp3' where audio_texto = 'school';
update english_exercicios set audio_url = '/english/audio/i-wake-up-every-morning-ec6f34.mp3' where audio_texto = 'I wake up every morning.';
update english_exercicios set audio_url = '/english/audio/teacher-4a82cb.mp3' where audio_texto = 'teacher';
update english_exercicios set audio_url = '/english/audio/brother-d67cca.mp3' where audio_texto = 'brother';
update english_exercicios set audio_url = '/english/audio/i-work-every-day-d08b06.mp3' where audio_texto = 'I work every day';
update english_exercicios set audio_url = '/english/audio/house-5be934.mp3' where audio_texto = 'house';
update english_exercicios set audio_url = '/english/audio/music-3a01be.mp3' where audio_texto = 'music';
update english_exercicios set audio_url = '/english/audio/i-go-to-school-every-day-df57b8.mp3' where audio_texto = 'I go to school every day.';
update english_exercicios set audio_url = '/english/audio/food-39ccb3.mp3' where audio_texto = 'food';
update english_exercicios set audio_url = '/english/audio/i-sleep-every-night-05fe81.mp3' where audio_texto = 'I sleep every night';
update english_exercicios set audio_url = '/english/audio/i-wake-up-71411f.mp3' where audio_texto = 'I wake up';
update english_exercicios set audio_url = '/english/audio/this-is-my-family-ae101f.mp3' where audio_texto = 'This is my family';
update english_exercicios set audio_url = '/english/audio/my-name-is-ana-0b0b09.mp3' where audio_texto = 'My name is Ana';
update english_exercicios set audio_url = '/english/audio/i-like-aab1cd.mp3' where audio_texto = 'I like';
update english_exercicios set audio_url = '/english/audio/i-eat-f0b222.mp3' where audio_texto = 'I eat';
update english_exercicios set audio_url = '/english/audio/i-am-a-student-d0a39e.mp3' where audio_texto = 'I am a student.';
