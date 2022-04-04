DROP TABLE IF EXISTS Player CASCADE;
DROP TABLE IF EXISTS Stat CASCADE;
DROP TABLE IF EXISTS Info CASCADE;


CREATE TABLE IF NOT EXISTS Player (
	id 				INT GENERATED ALWAYS AS IDENTITY,
	name 			VARCHAR(64),
	height 			NUMERIC(5, 2) CHECK(height >= 170 AND height <= 220),
	weight 			NUMERIC(5, 2), -- in Kilograms
	salary			MONEY,

	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Stat (
	id 			 	INT GENERATED ALWAYS AS IDENTITY,
	goals 		 	INT,
	assists 	 	INT,
	playtime		INTERVAL,
	penalty_time 	INTERVAL,
	player_id		INT,

	PRIMARY KEY (id),
	FOREIGN KEY (player_id)
		REFERENCES Player(id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Info (
	id 				INT GENERATED ALWAYS AS IDENTITY,
	position		VARCHAR(32),
	grip_type		VARCHAR(6) CHECK(lower(grip_type) = 'левша' OR lower(grip_type) = 'правша'),
	skate_size		NUMERIC(4, 2),
	player_id		INT,
	CONSTRAINT check_valid_position CHECK(
		position ILIKE 'нападающий (%)' OR
		position ILIKE 'защитник (%)' OR
		position ILIKE 'голкипер'
	),
	PRIMARY KEY (id),
	FOREIGN KEY (player_id)
		REFERENCES Player(id)
		ON DELETE CASCADE
);
