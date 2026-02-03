INSERT INTO album_artist_role (code, description, active, created_at)
VALUES
  ('PRIMARY',        'Artista ou banda principal do álbum',                      true, now()),
  ('FEATURED',       'Participação especial (feat.)',                           true, now()),
  ('GUEST',          'Artista convidado',                                        true, now()),
  ('COLLABORATOR',   'Colaborador geral (participação sem “feat.” formal)',      true, now()),
  ('COMPOSER',       'Compositor das músicas',                                  true, now()),
  ('LYRICIST',       'Autor das letras',                                        true, now()),
  ('ARRANGER',       'Responsável pelos arranjos',                              true, now()),
  ('PRODUCER',       'Produtor musical',                                        true, now()),
  ('EXEC_PRODUCER',  'Produtor executivo',                                      true, now()),
  ('ENGINEER',       'Engenheiro de som',                                       true, now()),
  ('MIXING',         'Responsável pela mixagem',                                true, now()),
  ('MASTERING',      'Responsável pela masterização',                           true, now()),
  ('CONDUCTOR',      'Regente',                                                 true, now()),
  ('ORCHESTRA',      'Orquestra ou grupo instrumental',                          true, now()),
  ('REMIXER',        'Responsável por remix',                                   true, now()),
  ('DJ',             'DJ ou performance eletrônica',                             true, now()),
  ('SOUNDTRACK',     'Participação vinculada a trilha sonora',                   true, now())
ON CONFLICT (code) DO UPDATE
SET
  description = EXCLUDED.description,
  active      = EXCLUDED.active;
