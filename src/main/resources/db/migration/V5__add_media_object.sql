CREATE TABLE media_object (
  id                BIGSERIAL PRIMARY KEY,
  bucket            VARCHAR(100) NOT NULL,
  object_key        VARCHAR(400) NOT NULL UNIQUE,  -- ex: albums/123/covers/cover-1.jpg
  original_filename VARCHAR(255),
  content_type      VARCHAR(100) NOT NULL,         -- image/jpeg, image/png...
  size_bytes        BIGINT NOT NULL,
  etag              VARCHAR(128),
  created_at        TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT ck_media_size CHECK (size_bytes >= 0)
);

CREATE INDEX ix_media_bucket_key ON media_object (bucket, object_key);
