-- ================================================================
-- Sistema de Férias — Schema Supabase
-- Execute este arquivo no SQL Editor do Supabase
-- ================================================================

-- 1. Tabela de funcionários
create table if not exists public.employees (
  id         uuid        default gen_random_uuid() primary key,
  name       text        not null unique,
  created_at timestamptz default now()
);

-- 2. Tabela de solicitações de férias
create table if not exists public.vacation_requests (
  id            uuid        default gen_random_uuid() primary key,
  employee_name text        not null,
  start_date    date        not null,
  end_date      date        not null,
  days          integer     not null,
  notes         text,
  created_at    timestamptz default now()
);

-- 3. Row Level Security — permite acesso anônimo (app interno)
alter table public.employees        enable row level security;
alter table public.vacation_requests enable row level security;

create policy "anon_all_employees"
  on public.employees for all to anon
  using (true) with check (true);

create policy "anon_all_vacation_requests"
  on public.vacation_requests for all to anon
  using (true) with check (true);

-- 4. Funcionários padrão
insert into public.employees (name) values
  ('THIAGO BELLON'),
  ('MARIANA DA CRUZ GUILHERME'),
  ('RAIANE DE OLIVEIRA BARBOSA'),
  ('JEAN CARLOS RODRIGUES MEDEIROS'),
  ('ALICE BRANDÃO'),
  ('RAFAEL BARBOSA ALVES'),
  ('MAYARA CAPESTRANO DE SOUZA FERREIRA')
on conflict (name) do nothing;
