DROP TABLE IF EXISTS Room CASCADE;
DROP TABLE IF EXISTS Category CASCADE;
DROP TABLE IF EXISTS Reservation CASCADE;
DROP TABLE IF EXISTS Client CASCADE;

CREATE TABLE IF NOT EXISTS Category (
	category_id INT GENERATED ALWAYS AS IDENTITY,
	category_classif VARCHAR(30),
	category_desc VARCHAR(500),
	category_price MONEY,
	PRIMARY KEY(category_id)
);

CREATE TABLE IF NOT EXISTS Room (
	room_id INT GENERATED ALWAYS AS IDENTITY,
	room_date_in DATE,
	room_date_out DATE,
	category_id INT,
	PRIMARY KEY(room_id),
	FOREIGN KEY(category_id)
		REFERENCES Category(category_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Client (
	client_id INT GENERATED ALWAYS AS IDENTITY,
	client_name VARCHAR(50),
	client_tel VARCHAR(30),
	PRIMARY KEY(client_id)
);


CREATE TABLE IF NOT EXISTS Reservation (
	client_id INT REFERENCES Client(client_id) ON UPDATE CASCADE ON DELETE CASCADE,
	room_id INT REFERENCES Room(room_id) ON UPDATE CASCADE ON DELETE CASCADE,
	reservation_date DATE,
	CONSTRAINT client_room_pk
		PRIMARY KEY(client_id, room_id)
);

