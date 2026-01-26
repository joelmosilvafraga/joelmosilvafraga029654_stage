CREATE TABLE role (
  id         BIGSERIAL PRIMARY KEY,
  name       VARCHAR(50) NOT NULL UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT ck_role_name CHECK (name IN ('ADMIN','USER'))
);
