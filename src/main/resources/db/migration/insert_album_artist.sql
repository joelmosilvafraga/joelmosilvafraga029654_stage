WITH
role_main AS (
  SELECT id AS role_id
  FROM album_artist_role
  WHERE code = 'PRIMARY'
),
artist_titas AS (
  SELECT id AS artist_id
  FROM artist
  WHERE name = 'Titãs'
),
albums_titas AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Titãs', 1984),
    ('Televisão', 1985),
    ('Cabeça Dinossauro', 1986),
    ('Jesus Não Tem Dentes no País dos Banguelas', 1987),
    ('Õ Blésq Blom', 1989),
    ('Tudo ao Mesmo Tempo Agora', 1991),
    ('Titanomaquia', 1993),
    ('Domingo', 1995),
    ('Volume Dois', 1998),
    ('As Dez Mais', 1999),
    ('A Melhor Banda de Todos os Tempos da Última Semana', 2001),
    ('Como Estão Vocês?', 2003),
    ('Sacos Plásticos', 2009),
    ('Nheengatu', 2014),
    ('Doze Flores Amarelas', 2018),
    ('Titãs Trio Acústico', 2021),
    ('Olho Furta-cor', 2022)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_titas al
CROSS JOIN artist_titas ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (
  SELECT id AS role_id
  FROM album_artist_role
  WHERE code = 'PRIMARY'
),
artist_skank AS (
  SELECT id AS artist_id
  FROM artist
  WHERE name = 'Skank'
),
albums_skank AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Skank', 1992),
    ('Calango', 1994),
    ('O Samba Poconé', 1996),
    ('Siderado', 1998),
    ('Maquinarama', 2000),
    ('Cosmotron', 2003),
    ('Carrossel', 2006),
    ('Estandarte', 2008),
    ('Velocia', 2014)
  )
)

INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_skank al
CROSS JOIN artist_skank ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (
  SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'
),
artist_x AS (
  SELECT id AS artist_id FROM artist WHERE name = 'Capital Inicial'
),
albums_x AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Capital Inicial', 1986),
    ('Independência', 1987),
    ('Você não Precisa Entender', 1988),
    ('Todos os Lados', 1989),
    ('Eletricidade', 1991),
    ('Rua 47', 1995),
    ('Atrás dos Olhos', 1998),
    ('Rosas e Vinho Tinto', 2002),
    ('Gigante!', 2004),
    ('MTV Especial: Aborto Elétrico', 2005),
    ('Eu Nunca Disse Adeus', 2007),
    ('Das Kapital', 2010),
    ('Saturno', 2012),
    ('Sonora', 2018)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (
  SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'
),
artist_x AS (
  SELECT id AS artist_id FROM artist WHERE name = 'Os Paralamas do Sucesso'
),
albums_x AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Cinema Mudo', 1983),
    ('O Passo do Lui', 1984),
    ('Selvagem?', 1986),
    ('Bora-Bora', 1988),
    ('Big Bang', 1989),
    ('Os Grãos', 1991),
    ('Severino', 1994),
    ('Hey Na Na', 1998),
    ('Longo Caminho', 2002),
    ('Hoje', 2005),
    ('Brasil Afora', 2009),
    ('Sinais do Sim', 2017)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;



WITH
role_main AS (
  SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'
),
artist_x AS (
  SELECT id AS artist_id FROM artist WHERE name = 'Jota Quest'
),
albums_x AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Jota Quest', 1996),
    ('De Volta ao Planeta', 1998),
    ('Oxigênio', 2000),
    ('Discotecagem Pop Variada', 2002),
    ('Até Onde Vai', 2005),
    ('La Plata', 2008),
    ('Funky Funky Boom Boom', 2013),
    ('Pancadélico', 2015)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;



WITH
role_main AS (
  SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'
),
artist_x AS (
  SELECT id AS artist_id FROM artist WHERE name = 'Charlie Brown Jr.'
),
albums_x AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Transpiração Contínua Prolongada', 1997),
    ('Preço Curto... Prazo Longo', 1999),
    ('Nadando com os Tubarões', 2000),
    ('Bocas Ordinárias', 2002),
    ('Tamo Aí na Atividade', 2004),
    ('Ritmo, Ritual e Responsa', 2007),
    ('Camisa 10 Joga Bola Até na Chuva', 2009),
    ('La Familia 013', 2013)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (
  SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'
),
artist_x AS (
  SELECT id AS artist_id FROM artist WHERE name = 'Barão Vermelho'
),
albums_x AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Barão Vermelho', 1982),
    ('Barão Vermelho 2', 1983),
    ('Maior Abandonado', 1984),
    ('Declare Guerra', 1986),
    ('Rock''n Geral', 1987),
    ('Carnaval', 1988),
    ('Na Calada da Noite', 1991),
    ('Carne Crua', 1994)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (
  SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'
),
artist_x AS (
  SELECT id AS artist_id FROM artist WHERE name = 'Cássia Eller'
),
albums_x AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Cássia Eller', 1990),
    ('O Marginal', 1992),
    ('Cássia Eller (1994)', 1994),
    ('Veneno Antimonotonia', 1997),
    ('Com Você... Meu Mundo Ficaria Completo', 1999)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (
  SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'
),
artist_x AS (
  SELECT id AS artist_id FROM artist WHERE name = 'Marisa Monte'
),
albums_x AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Mais', 1991),
    ('Verde, Anil, Amarelo, Cor-de-Rosa e Carvão', 1994),
    ('Barulhinho Bom', 1996),
    ('Memórias, Crônicas e Declarações de Amor', 2000),
    ('Universo ao Meu Redor', 2006),
    ('Infinito Particular', 2006),
    ('O Que Você Quer Saber de Verdade', 2011),
    ('Portas', 2021)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (
  SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'
),
artist_x AS (
  SELECT id AS artist_id FROM artist WHERE name = 'Gilberto Gil'
),
albums_x AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Louvação', 1967),
    ('Gilberto Gil', 1968),
    ('Refazenda', 1975),
    ('Realce', 1979),
    ('Raça Humana', 1984),
    ('Quanta', 1997),
    ('Ok Ok Ok', 2018)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;

WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Caetano Veloso'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Caetano Veloso', 1968),
    ('Tropicália ou Panis et Circencis', 1968),
    ('Transa', 1972),
    ('Bicho', 1977),
    ('Estrangeiro', 1989),
    ('Livro', 1997),
    ('Meu Coco', 2021)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;

WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Lulu Santos'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Tempos Modernos', 1982),
    ('O Ritmo do Momento', 1983),
    ('Tudo Azul', 1984),
    ('Normal', 1985),
    ('Toda Forma de Amor', 1988),
    ('Liga Lá', 1997),
    ('Baby Baby!', 2010)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Metallica'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Kill ''Em All', 1983),
    ('Ride the Lightning', 1984),
    ('Master of Puppets', 1986),
    ('...And Justice for All', 1988),
    ('Metallica (Black Album)', 1991),
    ('Load', 1996),
    ('Reload', 1997),
    ('St. Anger', 2003),
    ('Death Magnetic', 2008),
    ('Hardwired... to Self-Destruct', 2016),
    ('72 Seasons', 2023)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Nirvana'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Bleach', 1989),
    ('Nevermind', 1991),
    ('In Utero', 1993)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Pearl Jam'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Ten', 1991),
    ('Vs.', 1993),
    ('Vitalogy', 1994),
    ('No Code', 1996),
    ('Yield', 1998),
    ('Binaural', 2000),
    ('Riot Act', 2002),
    ('Pearl Jam', 2006),
    ('Backspacer', 2009),
    ('Lightning Bolt', 2013),
    ('Gigaton', 2020)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Red Hot Chili Peppers'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('The Red Hot Chili Peppers', 1984),
    ('Freaky Styley', 1985),
    ('The Uplift Mofo Party Plan', 1987),
    ('Mother''s Milk', 1989),
    ('Blood Sugar Sex Magik', 1991),
    ('Californication', 1999),
    ('By the Way', 2002),
    ('Stadium Arcadium', 2006),
    ('I''m with You', 2011),
    ('The Getaway', 2016),
    ('Unlimited Love', 2022)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Linkin Park'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Hybrid Theory', 2000),
    ('Meteora', 2003),
    ('Minutes to Midnight', 2007),
    ('A Thousand Suns', 2010),
    ('Living Things', 2012),
    ('The Hunting Party', 2014),
    ('One More Light', 2017)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Coldplay'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Parachutes', 2000),
    ('A Rush of Blood to the Head', 2002),
    ('X&Y', 2005),
    ('Viva la Vida or Death and All His Friends', 2008),
    ('Mylo Xyloto', 2011),
    ('Ghost Stories', 2014),
    ('A Head Full of Dreams', 2015),
    ('Everyday Life', 2019),
    ('Music of the Spheres', 2021)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'U2'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Boy', 1980),
    ('October', 1981),
    ('War', 1983),
    ('The Unforgettable Fire', 1984),
    ('The Joshua Tree', 1987),
    ('Achtung Baby', 1991),
    ('Zooropa', 1993),
    ('Pop', 1997),
    ('All That You Can''t Leave Behind', 2000),
    ('How to Dismantle an Atomic Bomb', 2004),
    ('Songs of Innocence', 2014),
    ('Songs of Experience', 2017)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al
CROSS JOIN artist_x ar
CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id)
DO UPDATE SET role_id = EXCLUDED.role_id;

WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Queen'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Queen', 1973),
    ('Queen II', 1974),
    ('Sheer Heart Attack', 1974),
    ('A Night at the Opera', 1975),
    ('A Day at the Races', 1976),
    ('News of the World', 1977),
    ('Jazz', 1978),
    ('The Game', 1980),
    ('Hot Space', 1982),
    ('The Works', 1984),
    ('A Kind of Magic', 1986),
    ('The Miracle', 1989),
    ('Innuendo', 1991),
    ('Made in Heaven', 1995)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'The Beatles'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Please Please Me', 1963),
    ('With the Beatles', 1963),
    ('A Hard Day''s Night', 1964),
    ('Beatles for Sale', 1964),
    ('Help!', 1965),
    ('Rubber Soul', 1965),
    ('Revolver', 1966),
    ('Sgt. Pepper''s Lonely Hearts Club Band', 1967),
    ('The Beatles (White Album)', 1968),
    ('Abbey Road', 1969),
    ('Let It Be', 1970)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Pink Floyd'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('The Piper at the Gates of Dawn', 1967),
    ('A Saucerful of Secrets', 1968),
    ('More', 1969),
    ('Ummagumma', 1969),
    ('Atom Heart Mother', 1970),
    ('Meddle', 1971),
    ('The Dark Side of the Moon', 1973),
    ('Wish You Were Here', 1975),
    ('Animals', 1977),
    ('The Wall', 1979),
    ('The Final Cut', 1983),
    ('A Momentary Lapse of Reason', 1987),
    ('The Division Bell', 1994)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'AC/DC'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('High Voltage', 1975),
    ('T.N.T.', 1975),
    ('Dirty Deeds Done Dirt Cheap', 1976),
    ('Let There Be Rock', 1977),
    ('Powerage', 1978),
    ('Highway to Hell', 1979),
    ('Back in Black', 1980),
    ('For Those About to Rock We Salute You', 1981),
    ('The Razors Edge', 1990),
    ('Ballbreaker', 1995),
    ('Stiff Upper Lip', 2000),
    ('Black Ice', 2008),
    ('Rock or Bust', 2014),
    ('Power Up', 2020)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Imagine Dragons'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Night Visions', 2012),
    ('Smoke + Mirrors', 2015),
    ('Evolve', 2017),
    ('Origins', 2018),
    ('Mercury – Act 1', 2021),
    ('Mercury – Act 2', 2022),
    ('Loom', 2024)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Arctic Monkeys'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Whatever People Say I Am, That''s What I''m Not', 2006),
    ('Favourite Worst Nightmare', 2007),
    ('Humbug', 2009),
    ('Suck It and See', 2011),
    ('AM', 2013),
    ('Tranquility Base Hotel & Casino', 2018),
    ('The Car', 2022)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Bon Jovi'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Bon Jovi', 1984),
    ('7800° Fahrenheit', 1985),
    ('Slippery When Wet', 1986),
    ('New Jersey', 1988),
    ('Keep the Faith', 1992),
    ('These Days', 1995),
    ('Crush', 2000),
    ('Bounce', 2002),
    ('Have a Nice Day', 2005),
    ('Lost Highway', 2007),
    ('The Circle', 2009),
    ('What About Now', 2013),
    ('This House Is Not for Sale', 2016),
    ('2020', 2020),
    ('Forever', 2024)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Evanescence'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Fallen', 2003),
    ('The Open Door', 2006),
    ('Evanescence', 2011),
    ('The Bitter Truth', 2021)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Michael Teló'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Balada Sertaneja', 2009)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Guns N’ Roses'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Appetite for Destruction', 1987),
    ('G N'' R Lies', 1988),
    ('Use Your Illusion I', 1991),
    ('Use Your Illusion II', 1991),
    ('The Spaghetti Incident?', 1993),
    ('Chinese Democracy', 2008)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Mike Shinoda'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Post Traumatic', 2018),
    ('Dropped Frames, Vol. 1', 2020),
    ('Dropped Frames, Vol. 2', 2020),
    ('Dropped Frames, Vol. 3', 2020)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Stereophonics'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Word Gets Around', 1997),
    ('Performance and Cocktails', 1999),
    ('Just Enough Education to Perform', 2001),
    ('You Gotta Go There to Come Back', 2003),
    ('Language. Sex. Violence. Other?', 2005),
    ('Pull the Pin', 2007),
    ('Keep Calm and Carry On', 2009),
    ('Graffiti on the Train', 2013),
    ('Keep the Village Alive', 2015),
    ('Scream Above the Sounds', 2017),
    ('Kind', 2019),
    ('Oochya!', 2022),
    ('Make ''Em Laugh, Make ''Em Cry, Make ''Em Wait', 2025)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Serj Tankian'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Elect the Dead', 2007),
    ('Imperfect Harmonies', 2010),
    ('Harakiri', 2012),
    ('Orca', 2013),
    ('Covers, Collaborations & Collages', 2025),
    ('Elect the Dead Symphony (Live with Orchestra)', 2010)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Djavan'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('A Voz, o Violão, a Música de Djavan', 1976),
    ('Djavan', 1979),
    ('Alumbramento', 1980),
    ('Seduzir', 1981),
    ('Luz', 1982),
    ('Lilás', 1984),
    ('Meu Lado', 1986),
    ('Não É Azul, mas É Mar', 1987),
    ('Djavan (1989)', 1989),
    ('Coisa de Acender', 1992),
    ('Novena', 1994),
    ('Malásia', 1996),
    ('Bicho Solto', 1998),
    ('Milagreiro', 2001),
    ('Vaidade', 2004),
    ('Matizes', 2007),
    ('Ária', 2010),
    ('Rua dos Amores', 2012),
    ('Vidas pra Contar', 2015),
    ('Vesúvio', 2018),
    ('D', 2022),
    ('Origem', 2024),
    ('Djavan Ao Vivo', 1999),
    ('Multishow Ao Vivo – Djavan', 2011),
    ('Voz & Violão – Ao Vivo', 2015)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Michael Teló'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Michel Teló – Ao Vivo', 2012),
    ('Bem Sertanejo – O Musical (Ao Vivo)', 2017)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Guns N’ Roses'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live Era ''87–''93', 1999)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Mike Shinoda'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live in London', 2019)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Stereophonics'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live from Dakota', 2006),
    ('Decade in the Sun: Live at Cardiff Castle', 2008)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Metallica'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live Shit: Binge & Purge', 1993),
    ('S&M', 1999),
    ('Orgullo, Pasión y Gloria: Tres Noches en la Ciudad de México', 2009),
    ('Through the Never (Live)', 2013),
    ('S&M2', 2020),

    ('Enter Sandman', 1991),
    ('Nothing Else Matters', 1992),
    ('The Unforgiven', 1991),
    ('One', 1989),
    ('Master of Puppets', 1986),

    ('The $5.98 E.P. – Garage Days Re-Revisited', 1987),
    ('Beyond Magnetic', 2011)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Nirvana'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('MTV Unplugged in New York', 1994),
    ('From the Muddy Banks of the Wishkah', 1996),
    ('Live at Reading', 2009),

    ('Smells Like Teen Spirit', 1991),
    ('Come as You Are', 1992),
    ('Lithium', 1992),
    ('In Bloom', 1992),
    ('Heart-Shaped Box', 1993),

    ('Hormoaning', 1992)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Pearl Jam'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live on Two Legs', 1998),
    ('Live at the Gorge 05/06', 2007),
    ('Let’s Play Two', 2017),
    ('Gigaton Tour Live', 2022),

    ('Alive', 1991),
    ('Jeremy', 1992),
    ('Even Flow', 1992),
    ('Black', 1991),
    ('Better Man', 1995)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Red Hot Chili Peppers'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live in Hyde Park', 2004),

    ('Under the Bridge', 1992),
    ('Give It Away', 1991),
    ('Californication', 2000),
    ('Scar Tissue', 1999),
    ('Can''t Stop', 2002),

    ('Rock & Roll Hall of Fame Covers EP', 2012)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Linkin Park'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live in Texas', 2003),
    ('Road to Revolution: Live at Milton Keynes', 2008),
    ('One More Light Live', 2017),

    ('In the End', 2001),
    ('Numb', 2003),
    ('Crawling', 2001),
    ('Somewhere I Belong', 2003),
    ('What I''ve Done', 2007),

    ('Collision Course (with Jay-Z)', 2004)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Coldplay'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live 2003', 2003),
    ('LeftRightLeftRightLeft', 2009),
    ('Ghost Stories Live 2014', 2014),

    ('Yellow', 2000),
    ('The Scientist', 2002),
    ('Clocks', 2002),
    ('Viva la Vida', 2008),
    ('Fix You', 2005),

    ('Safety EP', 1998),
    ('The Blue Room', 1999),
    ('Prospekt’s March', 2008)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'U2'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Under a Blood Red Sky', 1983),
    ('Rattle and Hum', 1988),
    ('Zoo TV Live', 1993),
    ('Live from Paris', 2007),

    ('With or Without You', 1987),
    ('One', 1992),
    ('Beautiful Day', 2000),
    ('Sunday Bloody Sunday', 1983),
    ('I Still Haven''t Found What I''m Looking For', 1987),

    ('Wide Awake in America', 1985)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Queen'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live Killers', 1979),
    ('Live Magic', 1986),
    ('Live at Wembley ''86', 1992),
    ('Queen Rock Montreal', 2007),

    ('Bohemian Rhapsody', 1975),
    ('We Will Rock You', 1977),
    ('We Are the Champions', 1977),
    ('Another One Bites the Dust', 1980),
    ('Don''t Stop Me Now', 1979)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'The Beatles'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live at the Hollywood Bowl', 1977),

    ('Hey Jude', 1968),
    ('Let It Be', 1970),
    ('Come Together', 1969),
    ('Help!', 1965),
    ('I Want to Hold Your Hand', 1963),

    ('Magical Mystery Tour (EP original UK)', 1967)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Pink Floyd'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Delicate Sound of Thunder', 1988),
    ('Pulse', 1995),

    ('Another Brick in the Wall (Part 2)', 1979),
    ('Money', 1973),
    ('Wish You Were Here', 1975),
    ('Time', 1973),
    ('Comfortably Numb', 1979)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'AC/DC'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('If You Want Blood You''ve Got It', 1978),
    ('AC/DC Live', 1992),
    ('Live at River Plate', 2012),

    ('Highway to Hell', 1979),
    ('Back in Black', 1980),
    ('Thunderstruck', 1990),
    ('You Shook Me All Night Long', 1980),
    ('T.N.T.', 1975),

    ('74 Jailbreak (formato EP internacionalmente)', 1984)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Imagine Dragons'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live at AllSaints Studios', 2013),

    ('Radioactive', 2012),
    ('Demons', 2013),
    ('Believer', 2017),
    ('Thunder', 2017),
    ('Whatever It Takes', 2017),

    ('Imagine Dragons EP', 2009),
    ('Hell and Silence', 2010),
    ('It’s Time', 2011)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Arctic Monkeys'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Live at the Royal Albert Hall', 2020),

    ('I Bet You Look Good on the Dancefloor', 2005),
    ('When the Sun Goes Down', 2006),
    ('Do I Wanna Know?', 2013),
    ('R U Mine?', 2012),
    ('505', 2007),

    ('Five Minutes with Arctic Monkeys', 2005),
    ('Who the F*** Are Arctic Monkeys?', 2006)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRIMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Nirvana'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Incesticide', 1992),
    ('Nirvana', 2002),
    ('Sliver: The Best of the Box', 2005)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Pearl Jam'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Lost Dogs', 2003),
    ('rearviewmirror (greatest hits 1991–2003)', 2004)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Red Hot Chili Peppers'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('What Hits!?', 1992),
    ('Greatest Hits', 2003)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Linkin Park'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Papercuts – Singles Collection 2000–2023', 2024)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Coldplay'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Coldplay: Reimagined', 2017)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'U2'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('The Best of 1980–1990', 1998),
    ('The Best of 1990–2000', 2002),
    ('U218 Singles', 2006)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Queen'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Greatest Hits', 1981),
    ('Greatest Hits II', 1991),
    ('Greatest Hits III', 1999),
    ('Absolute Greatest', 2009)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'The Beatles'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('1962–1966', 1973),
    ('1967–1970', 1973),
    ('Anthology 1', 1995),
    ('Anthology 2', 1996),
    ('Anthology 3', 1996),
    ('1', 2000)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'Pink Floyd'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('Relics', 1971),
    ('A Collection of Great Dance Songs', 1981),
    ('Works', 1983),
    ('Echoes: The Best of Pink Floyd', 2001)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;


WITH
role_main AS (SELECT id AS role_id FROM album_artist_role WHERE code = 'PRYMARY'),
artist_x  AS (SELECT id AS artist_id FROM artist WHERE name = 'AC/DC'),
albums_x  AS (
  SELECT a.id AS album_id
  FROM album a
  WHERE (a.title, a.release_year) IN (
    ('’74 Jailbreak', 1984),
    ('Who Made Who', 1986),
    ('Bonfire', 1997),
    ('Backtracks', 2009)
  )
)
INSERT INTO album_artist (album_id, artist_id, role_id)
SELECT al.album_id, ar.artist_id, rm.role_id
FROM albums_x al CROSS JOIN artist_x ar CROSS JOIN role_main rm
ON CONFLICT (album_id, artist_id) DO UPDATE SET role_id = EXCLUDED.role_id;
