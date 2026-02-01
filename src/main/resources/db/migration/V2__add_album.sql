CREATE TABLE album_type (
  id BIGSERIAL PRIMARY KEY,
  code VARCHAR(30) UNIQUE NOT NULL,
  description VARCHAR(150) NOT NULL
);

INSERT INTO album_type (code, description) VALUES
('STUDIO','Álbum de estúdio'),
('LIVE','Álbum ao vivo'),
('COMPILATION','Coletânea'),
('EP','Extended Play'),
('SINGLE','Single')
ON CONFLICT (code) DO UPDATE
SET description = EXCLUDED.description;

CREATE TABLE album (
  id            BIGSERIAL PRIMARY KEY,
  title         VARCHAR(250) NOT NULL,
  release_year  INT,
  album_type_id BIGINT NOT NULL, -- FK continua numérica (padrão)
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT now(),

  CONSTRAINT ck_album_release_year
    CHECK (release_year IS NULL OR (release_year BETWEEN 1900 AND 3000)),

  CONSTRAINT fk_album_album_type
    FOREIGN KEY (album_type_id) REFERENCES album_type(id),

	CONSTRAINT uk_album_title_year UNIQUE (title, release_year,  album_type_id)
);

CREATE INDEX ix_album_title ON album (title);
CREATE INDEX ix_album_release_year ON album (release_year);
CREATE INDEX ix_album_album_type_id ON album (album_type_id);

INSERT INTO album (title, release_year, album_type_id, created_at, updated_at)
SELECT v.title, v.release_year, t.id, now(), now()
FROM (
  VALUES
  -- =========================
  -- TITÃS (álbuns de estúdio)
  -- =========================
  ('Titãs', 1984, 'STUDIO'),
  ('Televisão', 1985, 'STUDIO'),
  ('Cabeça Dinossauro', 1986, 'STUDIO'),
  ('Jesus Não Tem Dentes no País dos Banguelas', 1987, 'STUDIO'),
  ('Õ Blésq Blom', 1989, 'STUDIO'),
  ('Tudo ao Mesmo Tempo Agora', 1991, 'STUDIO'),
  ('Titanomaquia', 1993, 'STUDIO'),
  ('Domingo', 1995, 'STUDIO'),
  ('Volume Dois', 1998, 'STUDIO'),
  ('As Dez Mais', 1999, 'STUDIO'),
  ('A Melhor Banda de Todos os Tempos da Última Semana', 2001, 'STUDIO'),
  ('Como Estão Vocês?', 2003, 'STUDIO'),
  ('Sacos Plásticos', 2009, 'STUDIO'),
  ('Nheengatu', 2014, 'STUDIO'),
  ('Doze Flores Amarelas', 2018, 'STUDIO'),
  ('Titãs Trio Acústico', 2021, 'STUDIO'),
  ('Olho Furta-cor', 2022, 'STUDIO'),

  -- =========================
  -- SKANK (álbuns de estúdio)
  -- =========================
  ('Skank', 1992, 'STUDIO'),
  ('Calango', 1994, 'STUDIO'),
  ('O Samba Poconé', 1996, 'STUDIO'),
  ('Siderado', 1998, 'STUDIO'),
  ('Maquinarama', 2000, 'STUDIO'),
  ('Cosmotron', 2003, 'STUDIO'),
  ('Carrossel', 2006, 'STUDIO'),
  ('Estandarte', 2008, 'STUDIO'),
  ('Velocia', 2014, 'STUDIO'),

  -- ==================================
  -- CAPITAL INICIAL (álbuns de estúdio)
  -- ==================================
  ('Capital Inicial', 1986, 'STUDIO'),
  ('Independência', 1987, 'STUDIO'),
  ('Você não Precisa Entender', 1988, 'STUDIO'),
  ('Todos os Lados', 1989, 'STUDIO'),
  ('Eletricidade', 1991, 'STUDIO'),
  ('Rua 47', 1995, 'STUDIO'),
  ('Atrás dos Olhos', 1998, 'STUDIO'),
  ('Rosas e Vinho Tinto', 2002, 'STUDIO'),
  ('Gigante!', 2004, 'STUDIO'),
  ('MTV Especial: Aborto Elétrico', 2005, 'STUDIO'),
  ('Eu Nunca Disse Adeus', 2007, 'STUDIO'),
  ('Das Kapital', 2010, 'STUDIO'),
  ('Saturno', 2012, 'STUDIO'),
  ('Sonora', 2018, 'STUDIO')

) AS v(title, release_year, type_code)
JOIN album_type t ON t.code = v.type_code;



INSERT INTO album (title, release_year, album_type_id, created_at, updated_at)
SELECT v.title, v.year, t.id, now(), now()
FROM (
VALUES

-- =========================
-- OS PARALAMAS DO SUCESSO
-- =========================
('Cinema Mudo', 1983, 'STUDIO'),
('O Passo do Lui', 1984, 'STUDIO'),
('Selvagem?', 1986, 'STUDIO'),
('Bora-Bora', 1988, 'STUDIO'),
('Big Bang', 1989, 'STUDIO'),
('Os Grãos', 1991, 'STUDIO'),
('Severino', 1994, 'STUDIO'),
('Hey Na Na', 1998, 'STUDIO'),
('Longo Caminho', 2002, 'STUDIO'),
('Hoje', 2005, 'STUDIO'),
('Brasil Afora', 2009, 'STUDIO'),
('Sinais do Sim', 2017, 'STUDIO'),

-- =========================
-- JOTA QUEST
-- =========================
('Jota Quest', 1996, 'STUDIO'),
('De Volta ao Planeta', 1998, 'STUDIO'),
('Oxigênio', 2000, 'STUDIO'),
('Discotecagem Pop Variada', 2002, 'STUDIO'),
('Até Onde Vai', 2005, 'STUDIO'),
('La Plata', 2008, 'STUDIO'),
('Funky Funky Boom Boom', 2013, 'STUDIO'),
('Pancadélico', 2015, 'STUDIO'),

-- =========================
-- CHARLIE BROWN JR
-- =========================
('Transpiração Contínua Prolongada', 1997, 'STUDIO'),
('Preço Curto... Prazo Longo', 1999, 'STUDIO'),
('Nadando com os Tubarões', 2000, 'STUDIO'),
('Bocas Ordinárias', 2002, 'STUDIO'),
('Tamo Aí na Atividade', 2004, 'STUDIO'),
('Ritmo, Ritual e Responsa', 2007, 'STUDIO'),
('Camisa 10 Joga Bola Até na Chuva', 2009, 'STUDIO'),
('La Familia 013', 2013, 'STUDIO'),

-- =========================
-- BARÃO VERMELHO
-- =========================
('Barão Vermelho', 1982, 'STUDIO'),
('Barão Vermelho 2', 1983, 'STUDIO'),
('Maior Abandonado', 1984, 'STUDIO'),
('Declare Guerra', 1986, 'STUDIO'),
('Rock''n Geral', 1987, 'STUDIO'),
('Carnaval', 1988, 'STUDIO'),
('Na Calada da Noite', 1991, 'STUDIO'),
('Carne Crua', 1994, 'STUDIO'),

-- =========================
-- CÁSSIA ELLER
-- =========================
('Cássia Eller', 1990, 'STUDIO'),
('O Marginal', 1992, 'STUDIO'),
('Cássia Eller (1994)', 1994, 'STUDIO'),
('Veneno Antimonotonia', 1997, 'STUDIO'),
('Com Você... Meu Mundo Ficaria Completo', 1999, 'STUDIO'),

-- =========================
-- MARISA MONTE
-- =========================
('Mais', 1991, 'STUDIO'),
('Verde, Anil, Amarelo, Cor-de-Rosa e Carvão', 1994, 'STUDIO'),
('Barulhinho Bom', 1996, 'STUDIO'),
('Memórias, Crônicas e Declarações de Amor', 2000, 'STUDIO'),
('Universo ao Meu Redor', 2006, 'STUDIO'),
('Infinito Particular', 2006, 'STUDIO'),
('O Que Você Quer Saber de Verdade', 2011, 'STUDIO'),
('Portas', 2021, 'STUDIO'),

-- =========================
-- GILBERTO GIL
-- =========================
('Louvação', 1967, 'STUDIO'),
('Gilberto Gil', 1968, 'STUDIO'),
('Refazenda', 1975, 'STUDIO'),
('Realce', 1979, 'STUDIO'),
('Raça Humana', 1984, 'STUDIO'),
('Quanta', 1997, 'STUDIO'),
('Ok Ok Ok', 2018, 'STUDIO'),

-- =========================
-- CAETANO VELOSO
-- =========================
('Caetano Veloso', 1968, 'STUDIO'),
('Tropicália ou Panis et Circencis', 1968, 'STUDIO'),
('Transa', 1972, 'STUDIO'),
('Bicho', 1977, 'STUDIO'),
('Estrangeiro', 1989, 'STUDIO'),
('Livro', 1997, 'STUDIO'),
('Meu Coco', 2021, 'STUDIO'),

-- =========================
-- LULU SANTOS
-- =========================
('Tempos Modernos', 1982, 'STUDIO'),
('O Ritmo do Momento', 1983, 'STUDIO'),
('Tudo Azul', 1984, 'STUDIO'),
('Normal', 1985, 'STUDIO'),
('Toda Forma de Amor', 1988, 'STUDIO'),
('Liga Lá', 1997, 'STUDIO'),
('Baby Baby!', 2010, 'STUDIO')

) AS v(title, year, type_code)
JOIN album_type t ON t.code = v.type_code;



INSERT INTO album (title, release_year, album_type_id, created_at, updated_at)
SELECT v.title, v.year, t.id, now(), now()
FROM (
VALUES

-- =========================
-- METALLICA
-- =========================
('Kill ''Em All',1983,'STUDIO'),
('Ride the Lightning',1984,'STUDIO'),
('Master of Puppets',1986,'STUDIO'),
('...And Justice for All',1988,'STUDIO'),
('Metallica (Black Album)',1991,'STUDIO'),
('Load',1996,'STUDIO'),
('Reload',1997,'STUDIO'),
('St. Anger',2003,'STUDIO'),
('Death Magnetic',2008,'STUDIO'),
('Hardwired... to Self-Destruct',2016,'STUDIO'),
('72 Seasons',2023,'STUDIO'),

-- =========================
-- NIRVANA
-- =========================
('Bleach',1989,'STUDIO'),
('Nevermind',1991,'STUDIO'),
('In Utero',1993,'STUDIO'),

-- =========================
-- PEARL JAM
-- =========================
('Ten',1991,'STUDIO'),
('Vs.',1993,'STUDIO'),
('Vitalogy',1994,'STUDIO'),
('No Code',1996,'STUDIO'),
('Yield',1998,'STUDIO'),
('Binaural',2000,'STUDIO'),
('Riot Act',2002,'STUDIO'),
('Pearl Jam',2006,'STUDIO'),
('Backspacer',2009,'STUDIO'),
('Lightning Bolt',2013,'STUDIO'),
('Gigaton',2020,'STUDIO'),

-- =========================
-- RED HOT CHILI PEPPERS
-- =========================
('The Red Hot Chili Peppers',1984,'STUDIO'),
('Freaky Styley',1985,'STUDIO'),
('The Uplift Mofo Party Plan',1987,'STUDIO'),
('Mother''s Milk',1989,'STUDIO'),
('Blood Sugar Sex Magik',1991,'STUDIO'),
('Californication',1999,'STUDIO'),
('By the Way',2002,'STUDIO'),
('Stadium Arcadium',2006,'STUDIO'),
('I''m with You',2011,'STUDIO'),
('The Getaway',2016,'STUDIO'),
('Unlimited Love',2022,'STUDIO'),

-- =========================
-- LINKIN PARK
-- =========================
('Hybrid Theory',2000,'STUDIO'),
('Meteora',2003,'STUDIO'),
('Minutes to Midnight',2007,'STUDIO'),
('A Thousand Suns',2010,'STUDIO'),
('Living Things',2012,'STUDIO'),
('The Hunting Party',2014,'STUDIO'),
('One More Light',2017,'STUDIO'),

-- =========================
-- COLDPLAY
-- =========================
('Parachutes',2000,'STUDIO'),
('A Rush of Blood to the Head',2002,'STUDIO'),
('X&Y',2005,'STUDIO'),
('Viva la Vida or Death and All His Friends',2008,'STUDIO'),
('Mylo Xyloto',2011,'STUDIO'),
('Ghost Stories',2014,'STUDIO'),
('A Head Full of Dreams',2015,'STUDIO'),
('Everyday Life',2019,'STUDIO'),
('Music of the Spheres',2021,'STUDIO'),

-- =========================
-- U2
-- =========================
('Boy',1980,'STUDIO'),
('October',1981,'STUDIO'),
('War',1983,'STUDIO'),
('The Unforgettable Fire',1984,'STUDIO'),
('The Joshua Tree',1987,'STUDIO'),
('Achtung Baby',1991,'STUDIO'),
('Zooropa',1993,'STUDIO'),
('Pop',1997,'STUDIO'),
('All That You Can''t Leave Behind',2000,'STUDIO'),
('How to Dismantle an Atomic Bomb',2004,'STUDIO'),
('Songs of Innocence',2014,'STUDIO'),
('Songs of Experience',2017,'STUDIO'),

-- =========================
-- QUEEN
-- =========================
('Queen',1973,'STUDIO'),
('Queen II',1974,'STUDIO'),
('Sheer Heart Attack',1974,'STUDIO'),
('A Night at the Opera',1975,'STUDIO'),
('A Day at the Races',1976,'STUDIO'),
('News of the World',1977,'STUDIO'),
('Jazz',1978,'STUDIO'),
('The Game',1980,'STUDIO'),
('Hot Space',1982,'STUDIO'),
('The Works',1984,'STUDIO'),
('A Kind of Magic',1986,'STUDIO'),
('The Miracle',1989,'STUDIO'),
('Innuendo',1991,'STUDIO'),
('Made in Heaven',1995,'STUDIO'),

-- =========================
-- THE BEATLES
-- =========================
('Please Please Me',1963,'STUDIO'),
('With the Beatles',1963,'STUDIO'),
('A Hard Day''s Night',1964,'STUDIO'),
('Beatles for Sale',1964,'STUDIO'),
('Help!',1965,'STUDIO'),
('Rubber Soul',1965,'STUDIO'),
('Revolver',1966,'STUDIO'),
('Sgt. Pepper''s Lonely Hearts Club Band',1967,'STUDIO'),
('The Beatles (White Album)',1968,'STUDIO'),
('Abbey Road',1969,'STUDIO'),
('Let It Be',1970,'STUDIO'),

-- =========================
-- PINK FLOYD
-- =========================
('The Piper at the Gates of Dawn',1967,'STUDIO'),
('A Saucerful of Secrets',1968,'STUDIO'),
('More',1969,'STUDIO'),
('Ummagumma',1969,'STUDIO'),
('Atom Heart Mother',1970,'STUDIO'),
('Meddle',1971,'STUDIO'),
('The Dark Side of the Moon',1973,'STUDIO'),
('Wish You Were Here',1975,'STUDIO'),
('Animals',1977,'STUDIO'),
('The Wall',1979,'STUDIO'),
('The Final Cut',1983,'STUDIO'),
('A Momentary Lapse of Reason',1987,'STUDIO'),
('The Division Bell',1994,'STUDIO'),

-- =========================
-- AC/DC
-- =========================
('High Voltage',1975,'STUDIO'),
('T.N.T.',1975,'STUDIO'),
('Dirty Deeds Done Dirt Cheap',1976,'STUDIO'),
('Let There Be Rock',1977,'STUDIO'),
('Powerage',1978,'STUDIO'),
('Highway to Hell',1979,'STUDIO'),
('Back in Black',1980,'STUDIO'),
('For Those About to Rock We Salute You',1981,'STUDIO'),
('The Razors Edge',1990,'STUDIO'),
('Ballbreaker',1995,'STUDIO'),
('Stiff Upper Lip',2000,'STUDIO'),
('Black Ice',2008,'STUDIO'),
('Rock or Bust',2014,'STUDIO'),
('Power Up',2020,'STUDIO'),

-- =========================
-- IMAGINE DRAGONS
-- =========================
('Night Visions',2012,'STUDIO'),
('Smoke + Mirrors',2015,'STUDIO'),
('Evolve',2017,'STUDIO'),
('Origins',2018,'STUDIO'),
('Mercury – Act 1',2021,'STUDIO'),
('Mercury – Act 2',2022,'STUDIO'),
('Loom',2024,'STUDIO'),

-- =========================
-- ARCTIC MONKEYS
-- =========================
('Whatever People Say I Am, That''s What I''m Not',2006,'STUDIO'),
('Favourite Worst Nightmare',2007,'STUDIO'),
('Humbug',2009,'STUDIO'),
('Suck It and See',2011,'STUDIO'),
('AM',2013,'STUDIO'),
('Tranquility Base Hotel & Casino',2018,'STUDIO'),
('The Car',2022,'STUDIO')

) AS v(title, year, type_code)
JOIN album_type t ON t.code = v.type_code;


INSERT INTO album (title, release_year, album_type_id, created_at, updated_at)
SELECT v.title, v.year, t.id, now(), now()
FROM (
VALUES

-- =========================
-- BON JOVI (STUDIO)
-- =========================
('Bon Jovi',1984,'STUDIO'),
('7800° Fahrenheit',1985,'STUDIO'),
('Slippery When Wet',1986,'STUDIO'),
('New Jersey',1988,'STUDIO'),
('Keep the Faith',1992,'STUDIO'),
('These Days',1995,'STUDIO'),
('Crush',2000,'STUDIO'),
('Bounce',2002,'STUDIO'),
('Have a Nice Day',2005,'STUDIO'),
('Lost Highway',2007,'STUDIO'),
('The Circle',2009,'STUDIO'),
('What About Now',2013,'STUDIO'),
('This House Is Not for Sale',2016,'STUDIO'),
('2020',2020,'STUDIO'),
('Forever',2024,'STUDIO'),

-- =========================
-- EVANESCENCE (STUDIO)
-- =========================
('Fallen',2003,'STUDIO'),
('The Open Door',2006,'STUDIO'),
('Evanescence',2011,'STUDIO'),
('The Bitter Truth',2021,'STUDIO')

) AS v(title, year, type_code)
JOIN album_type t ON t.code = v.type_code;


INSERT INTO album (title, release_year, album_type_id, created_at, updated_at)
SELECT v.title, v.year, t.id, now(), now()
FROM (
  VALUES

  -- =========================
  -- MICHEL TELÓ (STUDIO)
  -- =========================
  ('Balada Sertaneja', 2009, 'STUDIO'),

  -- =========================
  -- GUNS N'' ROSES (STUDIO)
  -- =========================
  ('Appetite for Destruction', 1987, 'STUDIO'),
  ('G N'' R Lies', 1988, 'STUDIO'),
  ('Use Your Illusion I', 1991, 'STUDIO'),
  ('Use Your Illusion II', 1991, 'STUDIO'),
  ('The Spaghetti Incident?', 1993, 'STUDIO'),
  ('Chinese Democracy', 2008, 'STUDIO'),

  -- =========================
  -- MIKE SHINODA (STUDIO)
  -- =========================
  ('Post Traumatic', 2018, 'STUDIO'),
  ('Dropped Frames, Vol. 1', 2020, 'STUDIO'),
  ('Dropped Frames, Vol. 2', 2020, 'STUDIO'),
  ('Dropped Frames, Vol. 3', 2020, 'STUDIO'),

  -- =========================
  -- STEREOPHONICS (STUDIO)
  -- =========================
  ('Word Gets Around', 1997, 'STUDIO'),
  ('Performance and Cocktails', 1999, 'STUDIO'),
  ('Just Enough Education to Perform', 2001, 'STUDIO'),
  ('You Gotta Go There to Come Back', 2003, 'STUDIO'),
  ('Language. Sex. Violence. Other?', 2005, 'STUDIO'),
  ('Pull the Pin', 2007, 'STUDIO'),
  ('Keep Calm and Carry On', 2009, 'STUDIO'),
  ('Graffiti on the Train', 2013, 'STUDIO'),
  ('Keep the Village Alive', 2015, 'STUDIO'),
  ('Scream Above the Sounds', 2017, 'STUDIO'),
  ('Kind', 2019, 'STUDIO'),
  ('Oochya!', 2022, 'STUDIO'),
  ('Make ''Em Laugh, Make ''Em Cry, Make ''Em Wait', 2025, 'STUDIO'),

  -- =========================
  -- SERJ TANKIAN (STUDIO)
  -- =========================
  ('Elect the Dead', 2007, 'STUDIO'),
  ('Imperfect Harmonies', 2010, 'STUDIO'),
  ('Harakiri', 2012, 'STUDIO'),
  ('Orca', 2013, 'STUDIO'),
  ('Covers, Collaborations & Collages', 2025, 'STUDIO'),

  -- =========================
  -- DJAVAN (STUDIO)
  -- =========================
  ('A Voz, o Violão, a Música de Djavan', 1976, 'STUDIO'),
  ('Djavan', 1979, 'STUDIO'),
  ('Alumbramento', 1980, 'STUDIO'),
  ('Seduzir', 1981, 'STUDIO'),
  ('Luz', 1982, 'STUDIO'),
  ('Lilás', 1984, 'STUDIO'),
  ('Meu Lado', 1986, 'STUDIO'),
  ('Não É Azul, mas É Mar', 1987, 'STUDIO'),
  ('Djavan (1989)', 1989, 'STUDIO'),
  ('Coisa de Acender', 1992, 'STUDIO'),
  ('Novena', 1994, 'STUDIO'),
  ('Malásia', 1996, 'STUDIO'),
  ('Bicho Solto', 1998, 'STUDIO'),
  ('Milagreiro', 2001, 'STUDIO'),
  ('Vaidade', 2004, 'STUDIO'),
  ('Matizes', 2007, 'STUDIO'),
  ('Ária', 2010, 'STUDIO'),
  ('Rua dos Amores', 2012, 'STUDIO'),
  ('Vidas pra Contar', 2015, 'STUDIO'),
  ('Vesúvio', 2018, 'STUDIO'),
  ('D', 2022, 'STUDIO'),
  ('Origem', 2024, 'STUDIO')

) AS v(title, year, type_code)
JOIN album_type t ON t.code = v.type_code;


INSERT INTO album (title, release_year, album_type_id, created_at, updated_at)
SELECT v.title, v.year, t.id, now(), now()
FROM (
VALUES

-- =========================
-- MICHEL TELÓ
-- =========================
('Michel Teló – Ao Vivo', 2012, 'LIVE'),
('Bem Sertanejo – O Musical (Ao Vivo)', 2017, 'LIVE'),

-- =========================
-- GUNS N'' ROSES
-- =========================
('Live Era ''87–''93', 1999, 'LIVE'),

-- =========================
-- MIKE SHINODA
-- =========================
('Live in London', 2019, 'LIVE'),

-- =========================
-- STEREOPHONICS
-- =========================
('Live from Dakota', 2006, 'LIVE'),
('Decade in the Sun: Live at Cardiff Castle', 2008, 'LIVE'),

-- =========================
-- SERJ TANKIAN
-- =========================
('Elect the Dead Symphony (Live with Orchestra)', 2010, 'LIVE'),

-- =========================
-- DJAVAN
-- =========================
('Djavan Ao Vivo', 1999, 'LIVE'),
('Multishow Ao Vivo – Djavan', 2011, 'LIVE'),
('Voz & Violão – Ao Vivo', 2015, 'LIVE')

) AS v(title, year, type_code)
JOIN album_type t
  ON t.code = v.type_code;



INSERT INTO album (title, release_year, album_type_id, created_at, updated_at)
SELECT v.title, v.year, t.id, now(), now()
FROM (
VALUES

-- =========================
-- METALLICA
-- =========================
('Live Shit: Binge & Purge', 1993, 'LIVE'),
('S&M', 1999, 'LIVE'),
('Orgullo, Pasión y Gloria: Tres Noches en la Ciudad de México', 2009, 'LIVE'),
('Through the Never (Live)', 2013, 'LIVE'),
('S&M2', 2020, 'LIVE'),

-- =========================
-- NIRVANA
-- =========================
('MTV Unplugged in New York', 1994, 'LIVE'),
('From the Muddy Banks of the Wishkah', 1996, 'LIVE'),
('Live at Reading', 2009, 'LIVE'),

-- =========================
-- PEARL JAM
-- =========================
('Live on Two Legs', 1998, 'LIVE'),
('Live at the Gorge 05/06', 2007, 'LIVE'),
('Let’s Play Two', 2017, 'LIVE'),
('Gigaton Tour Live', 2022, 'LIVE'),

-- =========================
-- RED HOT CHILI PEPPERS
-- =========================
('Live in Hyde Park', 2004, 'LIVE'),

-- =========================
-- LINKIN PARK
-- =========================
('Live in Texas', 2003, 'LIVE'),
('Road to Revolution: Live at Milton Keynes', 2008, 'LIVE'),
('One More Light Live', 2017, 'LIVE'),

-- =========================
-- COLDPLAY
-- =========================
('Live 2003', 2003, 'LIVE'),
('LeftRightLeftRightLeft', 2009, 'LIVE'),
('Ghost Stories Live 2014', 2014, 'LIVE'),

-- =========================
-- U2
-- =========================
('Under a Blood Red Sky', 1983, 'LIVE'),
('Rattle and Hum', 1988, 'LIVE'),
('Zoo TV Live', 1993, 'LIVE'),
('Live from Paris', 2007, 'LIVE'),

-- =========================
-- QUEEN
-- =========================
('Live Killers', 1979, 'LIVE'),
('Live Magic', 1986, 'LIVE'),
('Live at Wembley ''86', 1992, 'LIVE'),
('Queen Rock Montreal', 2007, 'LIVE'),

-- =========================
-- THE BEATLES
-- =========================
('Live at the Hollywood Bowl', 1977, 'LIVE'),

-- =========================
-- PINK FLOYD
-- =========================
('Delicate Sound of Thunder', 1988, 'LIVE'),
('Pulse', 1995, 'LIVE'),

-- =========================
-- AC/DC
-- =========================
('If You Want Blood You''ve Got It', 1978, 'LIVE'),
('AC/DC Live', 1992, 'LIVE'),
('Live at River Plate', 2012, 'LIVE'),

-- =========================
-- IMAGINE DRAGONS
-- =========================
('Live at AllSaints Studios', 2013, 'LIVE'),

-- =========================
-- ARCTIC MONKEYS
-- =========================
('Live at the Royal Albert Hall', 2020, 'LIVE')

) AS v(title, year, type_code)
JOIN album_type t
  ON t.code = v.type_code;




-- Nirvana
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('Incesticide', 1992, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Nirvana', 2002, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Sliver: The Best of the Box', 2005, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- Pearl Jam
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('Lost Dogs', 2003, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('rearviewmirror (greatest hits 1991–2003)', 2004, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- Red Hot Chili Peppers
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('What Hits!?', 1992, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Greatest Hits', 2003, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- Linkin Park
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('Papercuts – Singles Collection 2000–2023', 2024, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- Coldplay (eles têm muitas compilações oficiais e “curadorias”; aqui vai uma principal)
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('Coldplay: Reimagined', 2017, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- U2
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('The Best of 1980–1990', 1998, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('The Best of 1990–2000', 2002, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('U218 Singles', 2006, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- Queen
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('Greatest Hits', 1981, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Greatest Hits II', 1991, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Greatest Hits III', 1999, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Absolute Greatest', 2009, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- The Beatles
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('1962–1966', 1973, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('1967–1970', 1973, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Anthology 1', 1995, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Anthology 2', 1996, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Anthology 3', 1996, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('1', 2000, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- Pink Floyd
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('Relics', 1971, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('A Collection of Great Dance Songs', 1981, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Works', 1983, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Echoes: The Best of Pink Floyd', 2001, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- AC/DC
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('’74 Jailbreak', 1984, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Who Made Who', 1986, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Bonfire', 1997, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now()),
('Backtracks', 2009, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());

-- Imagine Dragons (1 coletânea)
INSERT INTO album (title, release_year, album_type_id, created_at, updated_at) VALUES
('Reflections (from the Vault of Smoke + Mirrors)', 2025, (SELECT id FROM album_type WHERE code='COMPILATION'), now(), now());


INSERT INTO album (title, release_year, album_type_id, created_at, updated_at)
SELECT v.title, v.year, t.id, now(), now()
FROM (
VALUES

-- =========================
-- METALLICA (principais singles)
-- =========================
('Enter Sandman', 1991, 'SINGLE'),
('Nothing Else Matters', 1992, 'SINGLE'),
('The Unforgiven', 1991, 'SINGLE'),
('One', 1989, 'SINGLE'),
('Master of Puppets', 1986, 'SINGLE'),

-- =========================
-- NIRVANA
-- =========================
('Smells Like Teen Spirit', 1991, 'SINGLE'),
('Come as You Are', 1992, 'SINGLE'),
('Lithium', 1992, 'SINGLE'),
('In Bloom', 1992, 'SINGLE'),
('Heart-Shaped Box', 1993, 'SINGLE'),

-- =========================
-- PEARL JAM
-- =========================
('Alive', 1991, 'SINGLE'),
('Jeremy', 1992, 'SINGLE'),
('Even Flow', 1992, 'SINGLE'),
('Black', 1991, 'SINGLE'),
('Better Man', 1995, 'SINGLE'),

-- =========================
-- RED HOT CHILI PEPPERS
-- =========================
('Under the Bridge', 1992, 'SINGLE'),
('Give It Away', 1991, 'SINGLE'),
('Californication', 2000, 'SINGLE'),
('Scar Tissue', 1999, 'SINGLE'),
('Can''t Stop', 2002, 'SINGLE'),

-- =========================
-- LINKIN PARK
-- =========================
('In the End', 2001, 'SINGLE'),
('Numb', 2003, 'SINGLE'),
('Crawling', 2001, 'SINGLE'),
('Somewhere I Belong', 2003, 'SINGLE'),
('What I''ve Done', 2007, 'SINGLE'),

-- =========================
-- COLDPLAY
-- =========================
('Yellow', 2000, 'SINGLE'),
('The Scientist', 2002, 'SINGLE'),
('Clocks', 2002, 'SINGLE'),
('Viva la Vida', 2008, 'SINGLE'),
('Fix You', 2005, 'SINGLE'),

-- =========================
-- U2
-- =========================
('With or Without You', 1987, 'SINGLE'),
('One', 1992, 'SINGLE'),
('Beautiful Day', 2000, 'SINGLE'),
('Sunday Bloody Sunday', 1983, 'SINGLE'),
('I Still Haven''t Found What I''m Looking For', 1987, 'SINGLE'),

-- =========================
-- QUEEN
-- =========================
('Bohemian Rhapsody', 1975, 'SINGLE'),
('We Will Rock You', 1977, 'SINGLE'),
('We Are the Champions', 1977, 'SINGLE'),
('Another One Bites the Dust', 1980, 'SINGLE'),
('Don''t Stop Me Now', 1979, 'SINGLE'),

-- =========================
-- THE BEATLES
-- =========================
('Hey Jude', 1968, 'SINGLE'),
('Let It Be', 1970, 'SINGLE'),
('Come Together', 1969, 'SINGLE'),
('Help!', 1965, 'SINGLE'),
('I Want to Hold Your Hand', 1963, 'SINGLE'),

-- =========================
-- PINK FLOYD
-- =========================
('Another Brick in the Wall (Part 2)', 1979, 'SINGLE'),
('Money', 1973, 'SINGLE'),
('Wish You Were Here', 1975, 'SINGLE'),
('Time', 1973, 'SINGLE'),
('Comfortably Numb', 1979, 'SINGLE'),

-- =========================
-- AC/DC
-- =========================
('Highway to Hell', 1979, 'SINGLE'),
('Back in Black', 1980, 'SINGLE'),
('Thunderstruck', 1990, 'SINGLE'),
('You Shook Me All Night Long', 1980, 'SINGLE'),
('T.N.T.', 1975, 'SINGLE'),

-- =========================
-- IMAGINE DRAGONS
-- =========================
('Radioactive', 2012, 'SINGLE'),
('Demons', 2013, 'SINGLE'),
('Believer', 2017, 'SINGLE'),
('Thunder', 2017, 'SINGLE'),
('Whatever It Takes', 2017, 'SINGLE'),

-- =========================
-- ARCTIC MONKEYS
-- =========================
('I Bet You Look Good on the Dancefloor', 2005, 'SINGLE'),
('When the Sun Goes Down', 2006, 'SINGLE'),
('Do I Wanna Know?', 2013, 'SINGLE'),
('R U Mine?', 2012, 'SINGLE'),
('505', 2007, 'SINGLE')

) AS v(title, year, type_code)
JOIN album_type t
  ON t.code = v.type_code;




INSERT INTO album (title, release_year, album_type_id, created_at, updated_at)
SELECT v.title, v.year, t.id, now(), now()
FROM (
VALUES

-- =========================
-- METALLICA
-- =========================
('The $5.98 E.P. – Garage Days Re-Revisited', 1987, 'EP'),
('Beyond Magnetic', 2011, 'EP'),

-- =========================
-- NIRVANA
-- =========================
('Hormoaning', 1992, 'EP'),

-- =========================
-- PEARL JAM
-- (não possui EPs oficiais tradicionais amplamente catalogados)

-- =========================
-- RED HOT CHILI PEPPERS
-- =========================
('Rock & Roll Hall of Fame Covers EP', 2012, 'EP'),

-- =========================
-- LINKIN PARK
-- =========================
('Collision Course (with Jay-Z)', 2004, 'EP'),

-- =========================
-- COLDPLAY
-- =========================
('Safety EP', 1998, 'EP'),
('The Blue Room', 1999, 'EP'),
('Prospekt’s March', 2008, 'EP'),

-- =========================
-- U2
-- =========================
('Wide Awake in America', 1985, 'EP'),

-- =========================
-- QUEEN
-- (não possui EPs oficiais relevantes)

-- =========================
-- THE BEATLES
-- =========================
('Magical Mystery Tour (EP original UK)', 1967, 'EP'),

-- =========================
-- PINK FLOYD
-- (não possui EPs oficiais clássicos)

-- =========================
-- AC/DC
-- =========================
('74 Jailbreak (formato EP internacionalmente)', 1984, 'EP'),

-- =========================
-- IMAGINE DRAGONS
-- =========================
('Imagine Dragons EP', 2009, 'EP'),
('Hell and Silence', 2010, 'EP'),
('It’s Time', 2011, 'EP'),

-- =========================
-- ARCTIC MONKEYS
-- =========================
('Five Minutes with Arctic Monkeys', 2005, 'EP'),
('Who the F*** Are Arctic Monkeys?', 2006, 'EP')

) AS v(title, year, type_code)
JOIN album_type t
  ON t.code = v.type_code;


COMMIT;