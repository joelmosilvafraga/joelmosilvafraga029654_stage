CREATE TABLE album_media (
  album_id    BIGINT NOT NULL,
  media_id    BIGINT NOT NULL,
  type        VARCHAR(30) NOT NULL,         -- COVER, THUMBNAIL, BACK_COVER...
  is_primary  BOOLEAN NOT NULL DEFAULT false,
  sort_order  INT NOT NULL DEFAULT 0,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT pk_album_media PRIMARY KEY (album_id, media_id),
  CONSTRAINT fk_album_media_album FOREIGN KEY (album_id) REFERENCES album(id) ON DELETE CASCADE,
  CONSTRAINT fk_album_media_media FOREIGN KEY (media_id) REFERENCES media_object(id) ON DELETE RESTRICT,

  CONSTRAINT ck_album_media_type CHECK (type IN ('COVER','THUMBNAIL','BACK_COVER','BOOKLET','OTHER')),
  CONSTRAINT ck_album_media_sort CHECK (sort_order >= 0)
);

-- garante: só 1 principal por tipo (ex.: 1 COVER principal por álbum)
CREATE UNIQUE INDEX ux_album_media_primary_per_type
  ON album_media(album_id, type)
  WHERE is_primary = true;

-- acelera listagens por álbum e tipo
CREATE INDEX ix_album_media_album_type
  ON album_media(album_id, type);
