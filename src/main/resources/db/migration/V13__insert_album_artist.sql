INSERT INTO album_artist (album_id, artist_id, role_id, created_at)
SELECT alb.id, art.id, r.id, now()
FROM album alb
JOIN artist art       ON art.name = 'Metallica'
JOIN artist_role r    ON r.code = 'PRIMARY'
WHERE (alb.title, alb.release_year) IN (
  ('Kill Em All', 1983),
  ('Ride the Lightning', 1984),
  ('Master of Puppets', 1986),
  ('...And Justice for All', 1988),
  ('Metallica (Black Album)', 1991),
  ('Load', 1996),
  ('Reload', 1997),
  ('St. Anger', 2003)
)
AND NOT EXISTS (
  SELECT 1
  FROM album_artist aa
  WHERE aa.album_id = alb.id
    AND aa.artist_id = art.id
    AND aa.role_id  = r.id
);

INSERT INTO album_artist (album_id, artist_id, role_id, created_at)
SELECT alb.id, art.id, r.id, now()
FROM album alb
JOIN artist art       ON art.name = 'Titãs'
JOIN artist_role r    ON r.code = 'PRIMARY'
WHERE (alb.title, alb.release_year) IN (
  ('Titãs', 1984),
  ('Televisão', 1985),
  ('Cabeça Dinossauro', 1986),
  ('Jesus Não Tem Dentes no País dos Banguelas', 1987),
  ('Õ Blésq Blom', 1989),
  ('Titanomaquia', 1993),
  ('Nheengatu', 2014)
)
AND NOT EXISTS (
  SELECT 1
  FROM album_artist aa
  WHERE aa.album_id = alb.id
    AND aa.artist_id = art.id
    AND aa.role_id  = r.id
);

INSERT INTO album_artist (album_id, artist_id, role_id, created_at)
SELECT alb.id, art.id, r.id, now()
FROM album alb
JOIN artist art       ON art.name = 'Skank'
JOIN artist_role r    ON r.code = 'PRIMARY'
WHERE (alb.title, alb.release_year) IN (
  ('Skank', 1992),
  ('Calango', 1994),
  ('O Samba Poconé', 1996),
  ('Siderado', 1998),
  ('Maquinarama', 2000),
  ('Cosmotron', 2003),
  ('Velocia', 2014)
)
AND NOT EXISTS (
  SELECT 1
  FROM album_artist aa
  WHERE aa.album_id = alb.id
    AND aa.artist_id = art.id
    AND aa.role_id  = r.id
);

INSERT INTO album_artist (album_id, artist_id, role_id, created_at)
SELECT alb.id, art.id, r.id, now()
FROM album alb
JOIN artist art       ON art.name = 'Capital Inicial'
JOIN artist_role r    ON r.code = 'PRIMARY'
WHERE (alb.title, alb.release_year) IN (
  ('Capital Inicial', 1986),
  ('Independência', 1987),
  ('Utopia', 1988),
  ('Atrás dos Olhos', 1998),
  ('Rosas e Vinho Tinto', 2002),
  ('Das Kapital', 2010),
  ('Sonora', 2018)
)
AND NOT EXISTS (
  SELECT 1
  FROM album_artist aa
  WHERE aa.album_id = alb.id
    AND aa.artist_id = art.id
    AND aa.role_id  = r.id
);