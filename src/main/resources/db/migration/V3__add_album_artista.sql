CREATE TABLE album_artist (
  album_id  BIGINT NOT NULL,
  artist_id BIGINT NOT NULL,
  role      VARCHAR(30) NOT NULL DEFAULT 'MAIN',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT pk_album_artist PRIMARY KEY (album_id, artist_id),
  CONSTRAINT fk_album_artist_album FOREIGN KEY (album_id) REFERENCES album(id) ON DELETE CASCADE,
  CONSTRAINT fk_album_artist_artist FOREIGN KEY (artist_id) REFERENCES artist(id) ON DELETE RESTRICT,

  CONSTRAINT ck_album_artist_role CHECK (role IN ('MAIN','FEAT','PRODUCER','COMPOSER','OTHER'))
);

CREATE INDEX ix_album_artist_artist ON album_artist (artist_id);
