DROP TABLE IF EXISTS Room CASCADE;
DROP TABLE IF EXISTS Category CASCADE;
DROP TABLE IF EXISTS Reservation CASCADE;
DROP TABLE IF EXISTS Client CASCADE;
DROP TABLE IF EXISTS Residence CASCADE;

CREATE TABLE IF NOT EXISTS Category (
	category_id INT GENERATED ALWAYS AS IDENTITY,
	category_classif VARCHAR(30),
	category_desc TEXT,
	category_price NUMERIC(10,2),
	category_c INT, 
	PRIMARY KEY(category_id)
);

CREATE TABLE IF NOT EXISTS Room (
	room_number INT,
	category_id INT,
	PRIMARY KEY(room_number),
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


CREATE TABLE IF NOT EXISTS Residence (
	room_number INT REFERENCES Room(room_number),
	client_id INT REFERENCES Client(client_id),
	residence_date DATE
);



CREATE TABLE IF NOT EXISTS Reservation (
	client_id INT,
	room_number INT,
	reservation_date DATE,
	FOREIGN KEY(client_id)
		REFERENCES Client(client_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);




