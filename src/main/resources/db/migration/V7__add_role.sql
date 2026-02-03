CREATE TABLE role (
  id           BIGSERIAL PRIMARY KEY,
  code         VARCHAR(50) NOT NULL UNIQUE,   -- ROLE_ADMIN, ROLE_USER, etc
  description  VARCHAR(150) NOT NULL,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);


INSERT INTO role (code, description)
VALUES
  ('ADMIN',  'Acesso total ao sistema'),
  ('MANAGER','Gerencia artistas e álbuns'),
  ('EDITOR', 'Pode criar e editar conteúdos'),
  ('USER',   'Acesso básico de leitura'),
  ('VIEWER', 'Somente consulta')
ON CONFLICT (code) DO NOTHING;
