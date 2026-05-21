# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project location

The Next.js app lives at `Plataforma de Cursos/ekballo-academy/` relative to the repo root. The path contains spaces — quote it (`cd "Plataforma de Cursos/ekballo-academy"`) and use `@/` (mapped to that directory in `tsconfig.json`) for imports inside the app.

`Cursos/` (sibling folder) holds source material (e.g. the Keller docx) used to author lesson content — it isn't shipped with the app.

## Commands

All commands run from inside `Plataforma de Cursos/ekballo-academy/`:

- `npm install` — install deps (first run only)
- `npm run dev` — Next dev server on `http://localhost:3000`
- `npm run build` — production build
- `npm run start` — serve the production build
- `npm run lint` — Next's ESLint

There is no test runner configured. No typecheck script either — rely on `npm run build` or your editor's TS server.

## Mock mode vs. Supabase mode (most important thing to understand)

The app has **two runtime modes** toggled by `NEXT_PUBLIC_MOCK_MODE`:

- `NEXT_PUBLIC_MOCK_MODE=true` (default in `.env.local`) — all data reads return fixtures from [lib/mock-data.ts](lib/mock-data.ts); auth is bypassed; middleware is a no-op; the mock user is a hard-coded admin (`MOCK_PROFILE`).
- `NEXT_PUBLIC_MOCK_MODE=false` — real Supabase via `@supabase/ssr`; middleware enforces auth and admin role.

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

### Schema drift to watch

[supabase/migrations/001_initial_schema.sql](supabase/migrations/001_initial_schema.sql) is **out of date** relative to the TypeScript types and the Supabase code paths in `lib/db.ts`. The migration does not include:

- `atividades.tipo`, `atividades.razao`
- `respostas.alternativa_id` (and the column is also `texto not null`, which conflicts with MC answers having null `texto`)
- The `alternativas` table

If you switch to real Supabase, the MC features (`aulaCompleta`, `listAlternativasByAtividade`, `salvarRespostaAlternativa`) will fail. Adding a second migration to bring the schema in line is a known follow-up — don't assume the SQL file is canonical.

### Tailwind palette

Custom palette in [tailwind.config.ts](tailwind.config.ts): `bege` (warm cream → chocolate), `laranja` (terracotta CTA), `oliveira` (warm olive). `mesa` is a **backwards-compatibility alias for `bege`** — existing pages and components still use `mesa-*` classes heavily. Either prefix works; don't rip out `mesa-*` for cosmetic consistency.

### Conventions worth knowing

- All user-facing strings, domain terms, comments, and many identifiers are in Brazilian Portuguese. Keep new copy in Portuguese unless the user asks otherwise.
- Server components do data fetching via `lib/db.ts`; client components ("use client") handle form state and writes. Don't import `@/lib/supabase/server` from a client component.
- After a client write, call `router.refresh()` so the server re-renders the unlock state — see [components/MultiplaEscolhaForm.tsx](components/MultiplaEscolhaForm.tsx) for the pattern.
- The mock banner ([components/MockBanner.tsx](components/MockBanner.tsx)) is rendered globally in [app/layout.tsx](app/layout.tsx) and only appears when `NEXT_PUBLIC_MOCK_MODE=true` — useful sanity check that env was picked up.
