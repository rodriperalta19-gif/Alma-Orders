-- ============================================================
-- CRM ALMA ORDERS — Base de datos Supabase
-- Ejecutá este SQL en el SQL Editor de Supabase
-- ============================================================

-- PROFESIONALES
create table if not exists profesionales (
  id text primary key,
  nombre text,
  apellido text,
  rubro text,
  especialidad text,
  ciudad text,
  provincia text,
  telefono text,
  whatsapp text,
  email text,
  plan text,
  fecha_alta date,
  fecha_vencimiento date,
  estado text,
  notas text,
  historial jsonb default '[]',
  created_at timestamp with time zone default now()
);

-- TIENDAS
create table if not exists tiendas (
  id text primary key,
  nombre text,
  propietario text,
  categoria text,
  ciudad text,
  telefono text,
  email text,
  plan text,
  fecha_alta date,
  fecha_vencimiento date,
  estado text,
  created_at timestamp with time zone default now()
);

-- COMERCIOS
create table if not exists comercios (
  id text primary key,
  nombre text,
  rubro text,
  responsable text,
  ciudad text,
  whatsapp text,
  email text,
  plan text,
  fecha_alta date,
  fecha_vencimiento date,
  estado text,
  created_at timestamp with time zone default now()
);

-- RIDERS
create table if not exists riders (
  id text primary key,
  nombre text,
  ciudad text,
  telefono text,
  vehiculo text,
  estado text,
  created_at timestamp with time zone default now()
);

-- EMBAJADORES
create table if not exists embajadores (
  id text primary key,
  nombre text,
  ciudad text,
  telefono text,
  email text,
  fecha_ingreso date,
  comercios_referidos integer default 0,
  profesionales_referidos integer default 0,
  riders_referidos integer default 0,
  created_at timestamp with time zone default now()
);

-- PROSPECTOS
create table if not exists prospectos (
  id text primary key,
  nombre text,
  apellido text,
  rubro text,
  ciudad text,
  telefono text,
  email text,
  origen text,
  estado text,
  fecha_contacto date,
  proximo_seguimiento date,
  observaciones text,
  historial jsonb default '[]',
  created_at timestamp with time zone default now()
);

-- ACTIVIDAD / NOTAS
create table if not exists actividad (
  id bigint generated always as identity primary key,
  texto text,
  tipo text,
  autor text,
  created_at timestamp with time zone default now()
);

-- ============================================================
-- PERMISOS: permitir acceso público (para el demo)
-- En producción deberías usar autenticación de Supabase
-- ============================================================
alter table profesionales enable row level security;
alter table tiendas enable row level security;
alter table comercios enable row level security;
alter table riders enable row level security;
alter table embajadores enable row level security;
alter table prospectos enable row level security;
alter table actividad enable row level security;

-- Políticas de acceso abierto (para demo/desarrollo)
create policy "allow all profesionales" on profesionales for all using (true) with check (true);
create policy "allow all tiendas" on tiendas for all using (true) with check (true);
create policy "allow all comercios" on comercios for all using (true) with check (true);
create policy "allow all riders" on riders for all using (true) with check (true);
create policy "allow all embajadores" on embajadores for all using (true) with check (true);
create policy "allow all prospectos" on prospectos for all using (true) with check (true);
create policy "allow all actividad" on actividad for all using (true) with check (true);
