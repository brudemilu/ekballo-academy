# Ekballo Academy

> Famílias fortes. Discípulos maduros. Mais que encontros. Uma transformação.
> Na mesa somos formados pelo Espírito, somos enviados.

Plataforma de cursos e discipulado da comunidade Ekballo. Construída com Next.js 15, Supabase e Tailwind. Hospedada gratuitamente na Vercel.

---

## O que está pronto

- **Landing institucional** com identidade Ekballo (`/`)
- **Manifesto** longo da mesa (`/manifesto`)
- **Cadastro e login** com confirmação por e-mail (`/cadastro`, `/login`)
- **Dashboard do aluno** com lista de cursos (`/dashboard`)
- **Página de curso** com aulas e progresso (`/cursos/[slug]`)
- **Página de aula** com conteúdo, vídeo opcional e atividades de reflexão escrita
- **Painel admin** (`/admin`) com:
  - Estatísticas de alunos, cursos e respostas
  - Banco de respostas com filtros (todas / pendentes / comentadas) e por curso
  - Devolutiva pastoral em cada resposta
  - Lista de alunos
  - Lista de cursos com matrículas e taxa de conclusão
  - Exportação de respostas em CSV
- **Schema SQL completo** com Row Level Security e o curso de partida "Ego Transformado" (Timothy Keller) — 4 aulas com 10 atividades de múltipla escolha

---

## Deploy passo a passo (do zero ao site no ar)

> Tempo estimado: 30 a 45 minutos. Custo: R$ 0 nos planos gratuitos.

### Passo 1 — Criar projeto no Supabase (banco + autenticação)

1. Acesse [supabase.com](https://supabase.com) e faça login (use o GitHub).
2. Clique em **New project**.
3. Escolha um nome (ex: `ekballo-academy`), gere uma senha forte e selecione a região mais próxima (**South America - São Paulo**).
4. Aguarde ~2 minutos enquanto o projeto provisiona.
5. Vá em **SQL Editor → New query**.
6. Cole TODO o conteúdo do arquivo `supabase/migrations/001_initial_schema.sql` e clique em **Run**. Deve aparecer "Success. No rows returned" (com avisos sobre criação de tabelas — isso é normal).
7. Vá em **Project Settings → API** e copie:
   - **Project URL** (algo como `https://abcdefgh.supabase.co`)
   - **anon public** key (uma string longa começando com `eyJ...`)

### Passo 2 — Configurar variáveis de ambiente locais

1. No seu computador, dentro da pasta do projeto, copie o arquivo de exemplo:

   ```bash
   cp .env.example .env.local
   ```

2. Abra `.env.local` e preencha com os valores que copiou do Supabase:

   ```env
   NEXT_PUBLIC_SUPABASE_URL=https://seu-projeto.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbG...sua-chave
   NEXT_PUBLIC_SITE_URL=http://localhost:3000
   ```

### Passo 3 — Rodar localmente (testar antes de subir)

```bash
npm install
npm run dev
```

Abra [http://localhost:3000](http://localhost:3000). Você deve ver a landing.

Crie uma conta em `/cadastro` e confirme o e-mail (chega em segundos).

**Para virar administrador**, abra o Supabase → **SQL Editor** e rode:

```sql
update profiles set is_admin = true where email = 'seu@email.com';
```

Recarregue o site. Você verá o botão "Painel admin" no canto superior direito.

### Passo 4 — Subir o código no GitHub

1. Crie um repositório novo em [github.com/new](https://github.com/new) (nome sugerido: `ekballo-academy`, pode ser privado).
2. No terminal, dentro da pasta do projeto:

   ```bash
   # O git já está inicializado. Atualize com qualquer mudança e suba:
   git add .
   git commit -m "Primeiro commit — Ekballo Academy"
   git branch -M main
   git remote add origin https://github.com/SEU-USUARIO/ekballo-academy.git
   git push -u origin main
   ```

> **Observação:** o `.env.local` está no `.gitignore` e não será enviado ao GitHub — isso é correto, suas chaves do Supabase ficam só no seu computador e na Vercel.

### Passo 5 — Deploy na Vercel

1. Acesse [vercel.com/new](https://vercel.com/new) e faça login (com GitHub).
2. Clique em **Import** ao lado do repositório `ekballo-academy`.
3. Em **Environment Variables**, adicione as três variáveis do `.env.local`:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - `NEXT_PUBLIC_SITE_URL` (deixe `https://ekballo-academy.vercel.app` por enquanto — você troca depois)
4. Clique em **Deploy**. Em ~2 minutos seu site está no ar.
5. Volte em **Project Settings → Environment Variables** e atualize `NEXT_PUBLIC_SITE_URL` com o domínio definitivo da Vercel.

### Passo 6 — Configurar a URL do site no Supabase

Para o e-mail de confirmação levar pro lugar certo:

1. Supabase → **Authentication → URL Configuration**.
2. Em **Site URL**, coloque o domínio Vercel (ex: `https://ekballo-academy.vercel.app`).
3. Em **Redirect URLs**, adicione `https://ekballo-academy.vercel.app/auth/callback`.
4. Salve.

### Passo 7 (opcional) — Domínio próprio

Quando quiser usar `academy.ekballo.com.br`:

1. Vercel → **Project Settings → Domains** → adicione o domínio.
2. A Vercel vai te dar registros DNS (CNAME) para configurar no seu provedor.
3. Atualize no Supabase a Site URL para o novo domínio.

---

## Como criar mais conteúdo

Por enquanto, cursos, aulas e atividades são criados direto no Supabase:

1. Supabase → **Table Editor**.
2. Tabela `cursos` → **Insert row** → preencha `slug`, `titulo`, `descricao`, marque `publicado: true`.
3. Tabela `aulas` → **Insert row** → escolha o `curso_id`, preencha `titulo`, `conteudo` (texto puro, parágrafos separados por linha em branco), opcionalmente `video_url` (URL embed do YouTube ou Vimeo).
4. Tabela `atividades` → **Insert row** → escolha o `aula_id`, escreva a `pergunta` reflexiva.

> Em uma próxima fase, podemos construir uma interface de admin para criar/editar tudo pela tela. Por enquanto, o Table Editor do Supabase já é bem confortável.

---

## Estrutura do projeto

```
ekballo-academy/
├── app/                          # rotas Next.js (App Router)
│   ├── page.tsx                  # landing
│   ├── manifesto/                # manifesto da mesa
│   ├── login/                    # entrada
│   ├── cadastro/                 # criação de conta
│   ├── auth/callback/            # confirmação de e-mail
│   ├── dashboard/                # área do aluno (lista de cursos)
│   ├── cursos/[slug]/            # página de curso
│   │   └── aulas/[aulaId]/       # página de aula com atividades
│   └── admin/                    # painel pastoral
│       ├── page.tsx              # dashboard admin
│       ├── respostas/            # banco de respostas
│       │   ├── [respostaId]/     # detalhe + comentário
│       │   └── exportar/         # CSV
│       ├── alunos/               # lista de discípulos
│       └── cursos/               # cursos + métricas
├── components/                   # UI reutilizável
│   ├── Logo.tsx
│   ├── UserMenu.tsx
│   ├── AtividadeForm.tsx         # formulário de resposta do aluno
│   ├── ComentarioForm.tsx        # devolutiva do líder
│   └── MarcarConcluida.tsx
├── lib/
│   ├── supabase/                 # clientes browser, server, middleware
│   └── types.ts
├── supabase/
│   └── migrations/
│       ├── 001_initial_schema.sql  # banco base + RLS
│       ├── 002_multipla_escolha.sql
│       ├── 003_lock_security_definer.sql
│       ├── 004_curso_ego_transformado.sql # curso de partida
│       └── 005_remove_mesa_aberta.sql     # remove seed antigo
├── middleware.ts                  # protege rotas e valida admin
├── tailwind.config.ts             # paleta Ekballo (mesa + oliveira)
└── package.json
```

---

## O que pode evoluir nas próximas fases

- **Editor de cursos visual** dentro do `/admin/cursos` (sem precisar abrir o Supabase)
- **Pagamentos** com Stripe ou Mercado Pago para os cursos pagos
- **Comunidade / fórum** dentro de cada curso
- **Notificações por e-mail** quando o líder responde uma reflexão
- **Vídeo upload** direto pelo Supabase Storage (em vez de só link YouTube)
- **Certificado de conclusão** em PDF ao completar um curso
- **Multi-idioma** (PT/EN) se houver alunos de fora

---

## Stack técnica

- **Framework**: Next.js 15 (App Router, Server Components)
- **Linguagem**: TypeScript
- **Banco**: Supabase (PostgreSQL gerenciado)
- **Autenticação**: Supabase Auth (email + senha, Row Level Security)
- **UI**: Tailwind CSS 3 com paleta customizada Ekballo
- **Hosting**: Vercel (free tier)
- **Custo total nos planos gratuitos**: R$ 0/mês para até ~50.000 usuários ativos por mês

---

## Suporte

Dúvidas técnicas, ideias de evolução ou ajustes — me chame que continuamos a construção.
