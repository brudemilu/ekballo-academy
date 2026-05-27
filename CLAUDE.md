# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project location

The Next.js app lives at the **repo root** (`/Users/brunofernandes/Projects/ekballo-academy/`). `@/` in `tsconfig.json` is mapped to this root. There is no nested `Plataforma de Cursos/…` directory — earlier versions of this file mentioned one; ignore.

## Commands

All commands run from the repo root:

- `npm install` — install deps (first run only)
- `npm run dev` — Next dev server on `http://localhost:3000`
- `npm run build` — production build
- `npm run start` — serve the production build
- `npm run lint` — Next's ESLint

No test runner. No typecheck script — rely on `npm run build` or your editor's TS server.

## Mock mode vs. Supabase mode (most important thing to understand)

The app has **two runtime modes** toggled by `NEXT_PUBLIC_MOCK_MODE`:

- `NEXT_PUBLIC_MOCK_MODE=true` — all data reads return fixtures from [lib/mock-data.ts](lib/mock-data.ts); auth is bypassed; middleware is a no-op; the mock user is a hard-coded admin (`MOCK_PROFILE`). This is the **local default** in `.env.local`.
- `NEXT_PUBLIC_MOCK_MODE=false` — real Supabase via `@supabase/ssr`; middleware enforces auth and admin role. This is what runs on **Vercel** (Production + Preview).

**The mock/real switch lives in three places — keep them in sync when adding features:**

1. [lib/db.ts](lib/db.ts) — every server-side data function starts with `if (isMockMode()) { ... }` and otherwise calls Supabase. This is the **single facade for data access**. Server components should import from here, not from `@/lib/supabase/server` directly. If you add a new query, add both branches.
2. [lib/supabase/middleware.ts](lib/supabase/middleware.ts) — short-circuits to `NextResponse.next()` when mock mode is on. The real branch handles session refresh, redirects unauthenticated users away from `/dashboard` / `/cursos` / `/admin`, redirects authed users away from `/login` / `/cadastro`, and checks `profile.is_admin` for `/admin/*`.
3. Client components that write data ([components/AtividadeForm.tsx](components/AtividadeForm.tsx), [components/MultiplaEscolhaForm.tsx](components/MultiplaEscolhaForm.tsx)) — they read `NEXT_PUBLIC_MOCK_MODE` directly to either fake the save or upsert via the browser Supabase client.

The mock dataset is server-side module state. The one piece of **mutable** mock state is `MOCK_MC_ANSWERS` in [lib/mock-data.ts](lib/mock-data.ts) (multiple-choice answers per student). The client posts to [app/api/mock/salvar-mc/route.ts](app/api/mock/salvar-mc/route.ts) to mutate it on the server so that a subsequent server-rendered page sees the answer when deciding whether the next aula is unlocked. Reflection (`reflexao`) answers in mock mode are **not** persisted — saving them is a 400ms `setTimeout` only.

## Architecture

### Domain model (Portuguese throughout)

Entities and their relationships — names are Brazilian Portuguese and match both DB tables and TS types in [lib/types.ts](lib/types.ts):

- `profiles` (aluno = student): created by a Supabase trigger on `auth.users` insert; `is_admin` boolean gates `/admin`; `turma` is the cohort name.
- `cursos` (courses) → `aulas` (lessons) → `atividades` (activities) → `alternativas` (multiple-choice options).
- `atividades.tipo` is either `"reflexao"` (free-text) or `"multipla_escolha"` (MC, has alternatives with one `correta`). `razao` is the post-answer explanation shown for MC.
- `respostas` (answers): unique on `(atividade_id, aluno_id)` — single upsert per student per activity. For reflexao, `texto` is filled; for MC, `alternativa_id` is filled. `comentario_lider` / `comentario_lider_em` is the pastoral feedback (only admin can write).
- `matriculas` (enrollments) and `progresso` (lessons-completed marker) track student state per course/lesson.

### Lesson-unlock logic

A course is a linear chain of aulas. Unlock rule lives in [lib/db.ts](lib/db.ts):

- `aulaCompleta(alunoId, aulaId)` — true if **every** MC activity on the aula has the correct alternative selected. Aulas without MCs are trivially complete.
- `listAulasComStatus(cursoId, alunoId)` — walks the aulas in `ordem` and stamps each with `desbloqueada` (previous aula is complete) and `completa`. Page-level redirects ([app/cursos/[slug]/aulas/[aulaId]/page.tsx](app/cursos/[slug]/aulas/[aulaId]/page.tsx)) and the "next" button enforce this.

Reflexao activities do **not** affect unlocking — they're optional and exist for pastoral devolutiva.

### Routes (Next 15 App Router)

- Public: `/`, `/manifesto`, `/login`, `/cadastro`, `/auth/callback`
- Student: `/dashboard`, `/cursos/[slug]`, `/cursos/[slug]/aulas/[aulaId]`
- Admin (gated): `/admin`, `/admin/respostas` (with `?status=pendentes|comentadas&curso=<slug>` filters), `/admin/respostas/[respostaId]`, `/admin/respostas/exportar` (CSV `route.ts`), `/admin/alunos`, `/admin/cursos`

Pages are async server components. They call `getCurrentSession()` first and `redirect("/login")` if null — this works in both modes because the mock branch returns `MOCK_PROFILE`.

### Migrations

Schema is the union of five migrations in [supabase/migrations/](supabase/migrations/), **all applied** to the live Supabase project:

1. `001_initial_schema.sql` — base tables (profiles, cursos, aulas, atividades, respostas, matriculas, progresso), trigger `on_auth_user_created`, RLS policies. **Originally seeded a "Mesa Aberta" course with 7 aulas**; that seed block is commented out (removed by migration 005 — current starting course is "Ego Transformado", from migration 004).
2. `002_multipla_escolha.sql` — adds `atividades.tipo`/`razao`, the `alternativas` table, `respostas.alternativa_id`, makes `respostas.texto` nullable, RLS for alternativas.
3. `003_lock_security_definer.sql` — revokes EXECUTE on `handle_new_user` from anon/authenticated/public, switches `is_admin(uuid)` to `SECURITY INVOKER`. Cleared advisor warnings 0028/0029.
4. `004_curso_ego_transformado.sql` — seeds the "Ego Transformado" (Timothy Keller) course: 4 aulas, 10 multiple-choice atividades, 40 alternativas.
5. `005_remove_mesa_aberta.sql` — removes the Mesa Aberta course and its dependents (aulas, atividades, matriculas) from the live DB. Idempotent (no-op if already gone).

For new schema changes, write `006_*.sql` (and so on) and apply via the **Supabase MCP** `apply_migration` tool — this keeps the Supabase `_migrations` table aligned with the repo. Always run `get_advisors` after DDL.

### Gerador de imagens (3 entradas, 1 template compartilhado)

A plataforma gera imagens compartilháveis (Instagram/WhatsApp) via Next.js `ImageResponse` (Vercel `@vercel/og`, edge runtime). Templates pré-existentes: `pergaminho` / `bloco` / `reflexao` no devocional; `classico` / `moderno` na bíblia. Adicionado depois: **`cinematografico`** — fundo gerado por IA (Google Imagen via Gemini API), overlay sacro navy/dourado, tipografia Cormorant Italic.

**Três rotas, uma função render:**

- [app/api/og/devocional/route.tsx](app/api/og/devocional/route.tsx) — `?dia=N&f=feed|story&tema=...` (templates: pergaminho/bloco/reflexao/cinematografico)
- [app/api/og/biblia/route.tsx](app/api/og/biblia/route.tsx) — `?livro=N&cap=N&v=1,2,3&versao=ACF&f=...&tema=...` (classico/moderno/cinematografico)
- [app/api/og/livre/route.tsx](app/api/og/livre/route.tsx) — `?verso=...&ref=...&top=...&sub=...&brand=...&bg=...&f=...` (só cinematografico; usado pelo gerador admin)

O cinematográfico vive em [lib/cinematografico.tsx](lib/cinematografico.tsx) (shared render) + [lib/imagen.ts](lib/imagen.ts) (chamada Imagen, Edge-compatível). As três rotas chamam `renderCinematografico(payload, formato)` com um payload comum (`verseText, ref, topLabel?, subRef?, brand?, bgTema?`).

**Env vars (opcionais):** `GEMINI_API_KEY` ativa a IA; sem ela tudo continua funcionando mas o fundo cai em gradiente CSS. `GEMINI_IMAGE_MODEL` (default `gemini-2.5-flash-image-preview`, gratuito no AI Studio).

**Página admin:** [/admin/imagens](app/admin/imagens/page.tsx) — gerador livre com preview ao vivo, form em [components/GeradorImagemForm.tsx](components/GeradorImagemForm.tsx).

### Tailwind palette

Custom palette in [tailwind.config.ts](tailwind.config.ts): `bege` (warm cream → chocolate), `laranja` (terracotta CTA), `oliveira` (warm olive). `mesa` is a **backwards-compatibility alias for `bege`** — existing pages and components still use `mesa-*` classes heavily. Either prefix works; don't rip out `mesa-*` for cosmetic consistency.

## Live infrastructure & operations

The platform is fully wired to live infra. Two MCP servers ([.mcp.json](.mcp.json)) cover most operations; one REST API call is needed for a specific gap.

### Supabase

- **Project ref**: `yasfxwqomvhmxxqnunat`
- **URL**: `https://yasfxwqomvhmxxqnunat.supabase.co`
- **MCP server**: configured in [.mcp.json](.mcp.json) — `https://mcp.supabase.com/mcp?project_ref=yasfxwqomvhmxxqnunat`
- **First-time auth per Claude Code session**: tools `mcp__supabase__authenticate` + `mcp__supabase__complete_authentication` (OAuth callback URL flow).

**Use the Supabase MCP for everything DB-related.** Do not suggest copy-pasting SQL into the dashboard SQL Editor.

| Need | Tool |
|---|---|
| Check schema state | `list_tables`, `list_migrations` |
| Apply DDL | `apply_migration` (saves to Supabase migrations table) |
| Run a one-off query / DML | `execute_sql` |
| **Always after DDL** | `get_advisors` with `type: security` (and `performance`) |
| Read project URL / anon key | `get_project_url`, `get_publishable_keys` |
| Inspect runtime issues | `get_logs` |

**Admin user creation**: the MCP does NOT have a "create auth user" tool. Workaround is direct insert into `auth.users` + `auth.identities` with `crypt(password, gen_salt('bf'))` (pgcrypto is enabled by default). Three gotchas to avoid:

1. `auth.identities.email` is a **generated column** — do not include it in the INSERT column list.
2. **GoTrue rejects NULLs in token columns.** The 8 fields `confirmation_token`, `recovery_token`, `email_change_token_new`, `email_change_token_current`, `email_change`, `phone_change`, `phone_change_token`, `reauthentication_token` must be `''`, not NULL — otherwise login fails with `Scan error on column "confirmation_token": converting NULL to string is unsupported`. Set them explicitly in the INSERT.
3. The `on_auth_user_created` trigger creates the matching `profiles` row, which you then promote to admin (`update profiles set is_admin = true ...`) in the same DO block.

The full SQL template lives in the project's persistent memory ([reference-supabase-mcp](file:///Users/brunofernandes/.claude/projects/-Users-brunofernandes-Projects-ekballo-academy/memory/reference_supabase_mcp.md)).

### Vercel

- **Project**: `ekballo-academy`, id `prj_KeusyMMak65qDBYv7T82b7kUvRPj`
- **Team**: `Bruno Fernandes' projects`, id `team_bE7ISUdQjMw5FZ89UHYNHCaV`
- **Repo source**: `brudemilu/ekballo-academy` (repoId `1245667173`), `master` → production
- **Production URL**: `https://ekballo-academy.vercel.app`
- **MCP server**: `https://mcp.vercel.com/` (added via [.mcp.json](.mcp.json) or `claude mcp add`)

**The Vercel MCP is read-only for env vars.** Re-authenticating with broader scopes does NOT add env var write tools — the official server at `mcp.vercel.com` simply doesn't expose them. Don't waste user time reauthorizing trying to "get more access".

**Vercel MCP good for**: `list_projects`, `get_project`, `list_deployments`, `get_deployment`, `get_deployment_build_logs`, `get_runtime_logs`, `deploy_to_vercel` (triggers a redeploy of the local working dir against the linked project).

**For env var writes, use the REST API with a Bearer token** stored at `~/.vercel-token` (chmod 600). If the file is missing, ask the user to create one at [vercel.com/account/tokens](https://vercel.com/account/tokens) (scope: the team `Bruno Fernandes' projects`, not "Full Account").

```bash
TOKEN=$(cat ~/.vercel-token)
PROJECT=prj_KeusyMMak65qDBYv7T82b7kUvRPj
TEAM=team_bE7ISUdQjMw5FZ89UHYNHCaV

# List env vars (returns id, key, target, type)
curl -s "https://api.vercel.com/v9/projects/$PROJECT/env?teamId=$TEAM" \
  -H "Authorization: Bearer $TOKEN"

# Update existing var (PATCH). For type=sensitive (the default here):
#   - do NOT include `type` in the body
#   - target=development is rejected; use production + preview only
curl -s -X PATCH "https://api.vercel.com/v9/projects/$PROJECT/env/$ENV_ID?teamId=$TEAM" \
  -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" \
  -d '{"value":"...","target":["production","preview"]}'

# Trigger a fresh production deployment from master
curl -s -X POST "https://api.vercel.com/v13/deployments?teamId=$TEAM&forceNew=1" \
  -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" \
  -d '{"name":"ekballo-academy","project":"'$PROJECT'","target":"production",
       "gitSource":{"type":"github","repoId":1245667173,"ref":"master"}}'
```

### Environment variables

All three Vercel env vars are `type=sensitive`, targeting Production + Preview only.

| Variable | Vercel value | `.env.local` |
|---|---|---|
| `NEXT_PUBLIC_MOCK_MODE` | `false` | `true` (keeps local in mock) |
| `NEXT_PUBLIC_SUPABASE_URL` | `https://yasfxwqomvhmxxqnunat.supabase.co` | same |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | legacy JWT (anon, public role) | same |

`.env.local` is gitignored. If you ever need the anon key value, get it from `mcp__supabase__get_publishable_keys` (the `legacy` / `anon` key, not the `service_role`).

### Admin user

One admin currently exists in production: `brunosantospmb@gmail.com`. The password is **not stored in this repo or in memory** — if needed, ask the user, or rotate via SQL through the Supabase MCP:

```sql
update auth.users
set encrypted_password = crypt('NEW_PASSWORD', gen_salt('bf'))
where email = 'brunosantospmb@gmail.com';
```

## Conventions worth knowing

- All user-facing strings, domain terms, comments, and many identifiers are in Brazilian Portuguese. Keep new copy in Portuguese unless the user asks otherwise.
- Server components do data fetching via `lib/db.ts`; client components ("use client") handle form state and writes. Don't import `@/lib/supabase/server` from a client component.
- After a client write, call `router.refresh()` so the server re-renders the unlock state — see [components/MultiplaEscolhaForm.tsx](components/MultiplaEscolhaForm.tsx) for the pattern.
- The mock banner ([components/MockBanner.tsx](components/MockBanner.tsx)) is rendered globally in [app/layout.tsx](app/layout.tsx) and only appears when `NEXT_PUBLIC_MOCK_MODE=true` — useful sanity check that env was picked up.
