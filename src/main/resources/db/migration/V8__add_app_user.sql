CREATE TABLE app_user (
  id            BIGSERIAL PRIMARY KEY,
  username      VARCHAR(120) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  enabled       BOOLEAN NOT NULL DEFAULT true,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX ix_app_user_username ON app_user (username);

INSERT INTO app_user (username, password_hash, enabled)
VALUES
  ('administrador',   '$2a$10$5igV0e7hIs0nKScuO50lJezI1uHPhcPLFuji4qN4FSij3FsZPuJfW', true),
  ('usuario_gestor', '$2a$10$5igV0e7hIs0nKScuO50lJezI1uHPhcPLFuji4qN4FSij3FsZPuJfW', true),
  ('usuario_editor',  '$2a$10$5igV0e7hIs0nKScuO50lJezI1uHPhcPLFuji4qN4FSij3FsZPuJfW', true),
  ('usuario_1',    '$2a$10$5igV0e7hIs0nKScuO50lJezI1uHPhcPLFuji4qN4FSij3FsZPuJfW', true),
  ('usuario_2',  '$2a$10$5igV0e7hIs0nKScuO50lJezI1uHPhcPLFuji4qN4FSij3FsZPuJfW', true)
ON CONFLICT (username) DO NOTHING;
