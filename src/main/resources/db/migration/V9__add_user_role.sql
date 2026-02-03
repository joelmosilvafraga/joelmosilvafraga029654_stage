CREATE TABLE user_role (
  user_id BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT pk_user_role PRIMARY KEY (user_id, role_id),
  CONSTRAINT fk_user_role_user FOREIGN KEY (user_id) REFERENCES app_user(id) ON DELETE CASCADE,
  CONSTRAINT fk_user_role_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE RESTRICT
);

CREATE INDEX ix_user_role_role ON user_role (role_id);


INSERT INTO user_role (user_id, role_id)
SELECT
  u.id  AS user_id,
  r.id  AS role_id
FROM app_user u
JOIN role r
  ON r.code =
    CASE u.username
      WHEN 'administrador'           THEN 'ADMIN'
      WHEN 'usuario_gestor'          THEN 'MANAGER'
      WHEN 'usuario_editor'          THEN 'EDITOR'
      WHEN 'usuario_1'               THEN 'USER'
      WHEN 'usuario_2'               THEN 'USER'
    END
ON CONFLICT (user_id, role_id) DO NOTHING;
