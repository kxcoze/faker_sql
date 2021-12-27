DROP TABLE IF EXISTS flight CASCADE;
DROP TABLE IF EXISTS plane CASCADE;
DROP TABLE IF EXISTS class CASCADE;
DROP TABLE IF EXISTS crew CASCADE;
DROP TABLE IF EXISTS price CASCADE;
DROP TABLE IF EXISTS passenger CASCADE;
DROP TABLE IF EXISTS List CASCADE;
DROP TABLE IF EXISTS Trip CASCADE;
DROP TABLE IF EXISTS access_plane CASCADE;

CREATE TABLE IF NOT EXISTS List (
	PRIMARY KEY(list_id),
	list_id INT GENERATED ALWAYS AS IDENTITY,
	list_departure VARCHAR(100),
	list_arrive VARCHAR(100),
	list_length INT,
	list_fuel INT
);

CREATE TABLE IF NOT EXISTS Trip (
	PRIMARY KEY(trip_id),
	trip_id INT GENERATED ALWAYS AS IDENTITY,
	trip_name VARCHAR(50),
	trip_code CHAR(6),
	trip_time INTERVAL,
	list_id INT,

	FOREIGN KEY (list_id)
	REFERENCES list(list_id)
	ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Price (
	PRIMARY KEY(price_id),
	price_id INT GENERATED ALWAYS AS IDENTITY, 
	price_rate VARCHAR(20),
	price_cost INT,
	price_summary VARCHAR(350),
	trip_id INT,

	FOREIGN KEY (trip_id)
	REFERENCES trip(trip_id)
	ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Class (
	PRIMARY KEY(class_id),
	class_id INT GENERATED ALWAYS AS IDENTITY,
	class_classif VARCHAR(30),
	class_summary VARCHAR(350),
	class_type VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Crew (
	PRIMARY KEY(crew_id),
	crew_id INT GENERATED ALWAYS AS IDENTITY,
	crew_captian VARCHAR(50),
	crew_navigator VARCHAR(50),
	crew_steward1 VARCHAR(50),
	crew_steward2 VARCHAR(50),
	crew_steward3 VARCHAR(50),
	crew_level INT
);

CREATE TABLE IF NOT EXISTS Access_Plane(
	crew_id INT REFERENCES crew(crew_id) ON UPDATE CASCADE ON DELETE CASCADE,
	class_id INT REFERENCES class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT ACCESS_TO_plane_PK PRIMARY KEY (crew_id, class_id)
);

CREATE TABLE IF NOT EXISTS Plane (
	PRIMARY KEY(plane_id),
	plane_id INT GENERATED ALWAYS AS IDENTITY,
	-- Perhaps bortnumber is id?
	plane_type VARCHAR(30),
	plane_places INT,
	class_id INT,

	FOREIGN KEY (class_id)
	REFERENCES Class(class_id)
	ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Flight (
	PRIMARY KEY (flight_id), 
	flight_id INT GENERATED ALWAYS AS IDENTITY,
	flight_departure TIMESTAMP, 
	flight_arrive TIMESTAMP,
    crew_id INT,
	trip_id INT, 
	plane_id INT,

	FOREIGN KEY(crew_id)
	REFERENCES Crew(crew_id)
	ON DELETE CASCADE,

	FOREIGN KEY(plane_id)
	REFERENCES Plane(plane_id)
	ON DELETE CASCADE,

	FOREIGN KEY(trip_id)
	REFERENCES Trip(trip_id)
	ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Passenger (
	PRIMARY KEY (passenger_id),
	passenger_id INT GENERATED ALWAYS AS IDENTITY,
	passenger_name VARCHAR(50),
	passenger_passport VARCHAR(11),
	passenger_number VARCHAR(4),
	price_id INT,
    flight_id INT,

    FOREIGN KEY(flight_id)
	REFERENCES Flight(flight_id)
	ON DELETE CASCADE,

	FOREIGN KEY(price_id)
	REFERENCES Price(price_id)
	ON DELETE CASCADE
);

