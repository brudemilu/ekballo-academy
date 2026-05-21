# Como rodar a Ekballo Academy na sua máquina

Tempo total: **~2 minutos** (3 minutos se você nunca instalou o Node.js).

## 1. Verifique se você tem o Node.js instalado

Abra o **Terminal** do Mac (Cmd + Espaço, digite "Terminal", Enter) e cole:

```bash
node --version
```

- Se aparecer algo como `v22.x.x` (qualquer número 18 ou maior) → ✅ pode pular pro passo 2.
- Se aparecer "command not found" → instale o Node.js em [nodejs.org](https://nodejs.org/pt-br) (baixe a versão LTS, "next" ou "recommended", e clique no instalador).

## 2. Cole estes 3 comandos no Terminal (um de cada vez)

```bash
cd /Users/brunofernandes/Projects/ekballo-academy
```

```bash
npm install
```

> Esse pode demorar 1-2 minutos na primeira vez. É normal aparecer alguns avisos amarelos (warnings) — pode ignorar.

```bash
npm run dev
```

## 3. Abra o navegador

Quando você ver no Terminal a mensagem `▲ Next.js ... Local: http://localhost:3000`, abra seu navegador e cole:

**[http://localhost:3000](http://localhost:3000)**

Pronto. Você está navegando na plataforma com dados de demonstração.

---

## O que testar

A plataforma vem com **modo demonstração ativo** — não precisa de Supabase, banco de dados ou cadastro. Tudo já está populado com dados de teste.

### Como aluno
1. Clique em **Comece agora** ou **Entrar** na landing
2. Em **Login**, basta clicar em "Entrar" (já vem com seu e-mail preenchido)
3. Você cai no **Dashboard** com a lista de cursos
4. Abra **Ego Transformado** → veja as 4 aulas com questões de múltipla escolha
5. Abra qualquer aula → leia o conteúdo, responda as questões; cada aula só libera a próxima quando todas as MCs forem respondidas corretamente
6. Cada resposta "salva" (em modo demo, sem persistir após reload)

### Como admin
1. No canto superior direito, clique em **Painel admin** (botão verde)
2. Veja o painel com alunos, cursos e respostas
3. Entre em **Respostas** → veja as reflexões registradas no mock
4. Filtre por "Aguardando devolutiva" ou por curso
5. Clique numa resposta → leia a reflexão completa, escreva uma devolutiva
6. Veja **outras reflexões deste discípulo** no fim da página
7. Volte e tente **Exportar CSV** (baixa um arquivo com todas as respostas formatadas pra Excel)
8. Em **Alunos**, veja a lista completa com turmas e contagem de respostas
9. Em **Cursos**, veja matrículas e taxa de conclusão por curso

---

## Quando quiser parar o servidor

No Terminal onde está rodando, aperte **Control + C**.

## Quando quiser sair do modo demo (usar Supabase de verdade)

Abra o arquivo `.env.local` na pasta do projeto e mude:

```env
NEXT_PUBLIC_MOCK_MODE=false
```

Aí preencha as 3 variáveis do Supabase (passo a passo no `README.md`).

---

## Se algo der errado

- **"Port 3000 is already in use"** → você já tem outro app rodando nessa porta. No Terminal: `npx next dev -p 3001` (vai abrir em http://localhost:3001 em vez de 3000).
- **"command not found: npm"** → o Node.js não está instalado. Volte pro passo 1.
- **Página em branco ou erro estranho** → no Terminal, aperte Control+C, rode `npm run dev` de novo. Recarregue o navegador.
- **Alguma outra coisa** → me chama com a print do erro do Terminal.
