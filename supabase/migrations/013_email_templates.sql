-- =============================================================
-- Tabela `email_templates` — corpo/assunto editáveis dos 3 emails
-- automáticos (novo cadastro, boas-vindas no curso, lembrete de
-- inatividade). Bruno edita pelo /admin/templates.
--
-- Variáveis suportadas (substituídas pela Edge Function antes de
-- enviar via Resend):
--   {{nome_aluno}}        — profile.nome
--   {{email_aluno}}       — profile.email
--   {{nome_curso}}        — cursos.titulo
--   {{slug_curso}}        — cursos.slug
--   {{link_curso}}        — URL completa pro curso
--   {{link_admin}}        — URL pro painel admin
--   {{dias_inatividade}}  — só no template lembrete-inatividade
-- =============================================================

create table if not exists public.email_templates (
  id uuid primary key default gen_random_uuid(),
  chave text unique not null,
  descricao text not null,
  assunto text not null,
  corpo_html text not null,
  corpo_texto text,
  variaveis_disponiveis text[] not null default '{}',
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.email_templates is
  'Templates de email automático. Editáveis pelo /admin/templates. Cada chave dispara em um evento específico.';

-- Trigger pra atualizar updated_at
create or replace function public.tg_email_templates_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists set_email_templates_updated_at on public.email_templates;
create trigger set_email_templates_updated_at
  before update on public.email_templates
  for each row execute function public.tg_email_templates_updated_at();

-- RLS: só admin lê/edita. Service_role (Edge Function) bypassa.
alter table public.email_templates enable row level security;

drop policy if exists "email_templates_admin_select" on public.email_templates;
drop policy if exists "email_templates_admin_update" on public.email_templates;

create policy "email_templates_admin_select"
  on public.email_templates for select
  to authenticated
  using (
    exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true)
  );

create policy "email_templates_admin_update"
  on public.email_templates for update
  to authenticated
  using (
    exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true)
  )
  with check (
    exists (select 1 from public.profiles p where p.id = auth.uid() and p.is_admin = true)
  );

-- =============================================================
-- Seed dos 3 templates iniciais
-- =============================================================

insert into public.email_templates (chave, descricao, assunto, corpo_html, corpo_texto, variaveis_disponiveis)
values

-- 1. Notificação de novo cadastro (vai pro admin)
('novo-cadastro',
 'Email enviado ao administrador (você) quando alguém cria conta no site.',
 'Novo cadastro na Ekballo Academy: {{nome_aluno}}',
$html$<div style="font-family: system-ui, -apple-system, sans-serif; max-width: 560px; margin: 0 auto; padding: 24px; color: #1f2937;">
  <h2 style="color: #B43E0E; font-size: 20px; margin: 0 0 16px;">Novo cadastro na plataforma</h2>
  <p style="line-height: 1.6;">Acabou de chegar gente nova na Ekballo Academy:</p>
  <table style="border-collapse: collapse; margin: 16px 0;">
    <tr><td style="padding: 4px 16px 4px 0; color: #6b7280;">Nome</td><td style="padding: 4px 0;"><strong>{{nome_aluno}}</strong></td></tr>
    <tr><td style="padding: 4px 16px 4px 0; color: #6b7280;">Email</td><td style="padding: 4px 0;">{{email_aluno}}</td></tr>
  </table>
  <p style="line-height: 1.6;">Lembre-se: o cadastro só dá acesso ao /dashboard vazio. Para liberar um curso, é preciso matricular o aluno manualmente:</p>
  <p style="margin: 24px 0;">
    <a href="{{link_admin}}" style="display: inline-block; background: #D55416; color: #fff; padding: 10px 20px; border-radius: 6px; text-decoration: none; font-weight: 500;">Abrir painel de alunos</a>
  </p>
  <p style="color: #6b7280; font-size: 13px; margin-top: 32px;">Notificação automática da Ekballo Academy.</p>
</div>$html$,
$texto$Novo cadastro na Ekballo Academy

Nome: {{nome_aluno}}
Email: {{email_aluno}}

Pra liberar um curso, matricule o aluno em: {{link_admin}}$texto$,
 array['{{nome_aluno}}', '{{email_aluno}}', '{{link_admin}}']),

-- 2. Boas-vindas no curso (vai pro aluno recém-matriculado)
('boas-vindas-curso',
 'Email enviado ao aluno quando você o matricula em um curso.',
 'Bem-vindo(a) ao curso {{nome_curso}}',
$html$<div style="font-family: system-ui, -apple-system, sans-serif; max-width: 560px; margin: 0 auto; padding: 24px; color: #1f2937;">
  <h2 style="color: #B43E0E; font-size: 22px; margin: 0 0 16px;">Que alegria te ter no discipulado, {{nome_aluno}}!</h2>
  <p style="line-height: 1.7;">Você acabou de ser matriculado(a) no curso <strong>{{nome_curso}}</strong> dentro da Ekballo Academy.</p>
  <p style="line-height: 1.7;">Mais do que um curso, este é um caminho de aprendizado e crescimento espiritual. Estamos muito felizes em caminhar contigo nesta jornada e oramos para que cada conteúdo seja semente boa em tua vida.</p>
  <p style="line-height: 1.7;">Você pode começar agora mesmo:</p>
  <p style="margin: 24px 0;">
    <a href="{{link_curso}}" style="display: inline-block; background: #D55416; color: #fff; padding: 12px 24px; border-radius: 6px; text-decoration: none; font-weight: 500; font-size: 15px;">Acessar o curso →</a>
  </p>
  <p style="line-height: 1.7;">Faça com calma, uma aula por vez. Se tiver dúvidas, é só responder este email.</p>
  <p style="line-height: 1.7; margin-top: 32px;">Em Cristo,<br><strong>Bruno</strong></p>
  <p style="color: #6b7280; font-size: 13px; margin-top: 32px; border-top: 1px solid #e5e7eb; padding-top: 16px;">Ekballo Academy</p>
</div>$html$,
$texto$Que alegria te ter no discipulado, {{nome_aluno}}!

Você acabou de ser matriculado(a) no curso "{{nome_curso}}" dentro da Ekballo Academy. Mais do que um curso, é um caminho de aprendizado e crescimento espiritual. Estamos muito felizes em caminhar contigo.

Acesse agora: {{link_curso}}

Faça com calma, uma aula por vez. Se tiver dúvidas, é só responder este email.

Em Cristo,
Bruno
Ekballo Academy$texto$,
 array['{{nome_aluno}}', '{{nome_curso}}', '{{link_curso}}']),

-- 3. Lembrete de inatividade (vai pro aluno sem progresso há N dias)
('lembrete-inatividade',
 'Email enviado ao aluno matriculado que não acessou nenhuma aula nos últimos N dias (configurável no cron).',
 'Sentimos sua falta no curso {{nome_curso}}',
$html$<div style="font-family: system-ui, -apple-system, sans-serif; max-width: 560px; margin: 0 auto; padding: 24px; color: #1f2937;">
  <h2 style="color: #B43E0E; font-size: 20px; margin: 0 0 16px;">Olá, {{nome_aluno}}!</h2>
  <p style="line-height: 1.7;">Notamos que você ainda não começou (ou está há alguns dias sem voltar) ao curso <strong>{{nome_curso}}</strong>.</p>
  <p style="line-height: 1.7;">Sem pressão, sem cobrança — só queria te lembrar que o curso está aí, te esperando, e cada aula é curta. Bastam alguns minutos pra retomar:</p>
  <p style="margin: 24px 0;">
    <a href="{{link_curso}}" style="display: inline-block; background: #D55416; color: #fff; padding: 12px 24px; border-radius: 6px; text-decoration: none; font-weight: 500; font-size: 15px;">Continuar de onde parei →</a>
  </p>
  <p style="line-height: 1.7;">Se tiver qualquer dificuldade ou só quiser conversar, é só responder este email.</p>
  <p style="line-height: 1.7; margin-top: 32px;">Com carinho,<br><strong>Bruno</strong></p>
  <p style="color: #6b7280; font-size: 13px; margin-top: 32px; border-top: 1px solid #e5e7eb; padding-top: 16px;">Ekballo Academy</p>
</div>$html$,
$texto$Olá, {{nome_aluno}}!

Notamos que você ainda não começou (ou está há alguns dias sem voltar) ao curso "{{nome_curso}}". Sem pressão — só queria te lembrar que o curso está aí, e cada aula é curta.

Continuar: {{link_curso}}

Se tiver qualquer dificuldade ou só quiser conversar, é só responder este email.

Com carinho,
Bruno
Ekballo Academy$texto$,
 array['{{nome_aluno}}', '{{nome_curso}}', '{{link_curso}}', '{{dias_inatividade}}'])

on conflict (chave) do nothing;
