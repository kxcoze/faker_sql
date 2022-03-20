DROP TABLE IF EXISTS Player CASCADE;
DROP TABLE IF EXISTS Stat CASCADE;
DROP TABLE IF EXISTS Info CASCADE;


CREATE TABLE IF NOT EXISTS Player (
	id 						INT GENERATED ALWAYS AS IDENTITY,
	name 					VARCHAR(64),
	date_birth		DATE,
	height 				NUMERIC(5, 2),
	weight 				NUMERIC(5, 2), -- in Kilograms
	salary				MONEY,

	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Stat (
	id 			 			INT GENERATED ALWAYS AS IDENTITY,
	goals 		 		INT,
	assists 	 		INT,
	penalty_time 	INTERVAL,
	playtime			INTERVAL,
	player_id			INT,

	PRIMARY KEY (id),
	FOREIGN KEY (player_id)
		REFERENCES Player(id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Info (
	id 					INT GENERATED ALWAYS AS IDENTITY,
	position		VARCHAR(32),
	grip_type		VARCHAR(16),
	skate_size	NUMERIC(4, 2),
	player_id		INT,

	PRIMARY KEY (id),
	FOREIGN KEY (player_id)
		REFERENCES Player(id)
		ON DELETE CASCADE
);
