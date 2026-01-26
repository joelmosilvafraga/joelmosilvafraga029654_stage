CREATE TABLE album (
  id           BIGSERIAL PRIMARY KEY,
  title        VARCHAR(250) NOT NULL,
  release_year INT,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT ck_album_release_year
    CHECK (release_year IS NULL OR (release_year BETWEEN 1900 AND 3000))
);

CREATE INDEX ix_album_title ON album (title);
CREATE INDEX ix_album_release_year ON album (release_year);
