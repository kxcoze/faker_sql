DROP TABLE IF EXISTS Subscription CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Discount CASCADE;
DROP TABLE IF EXISTS Service CASCADE;
DROP TABLE IF EXISTS Trainer CASCADE;
DROP TABLE IF EXISTS Hall CASCADE;
DROP TABLE IF EXISTS Timetable CASCADE;
DROP TABLE IF EXISTS Customer_Subscription CASCADE;
DROP TABLE IF EXISTS Service_Trainer CASCADE;
DROP TABLE IF EXISTS Category_Percent CASCADE;

-- TODO:
-- [x] прописать айдишникам после типа -> GENERATED ALWAYS AS IDENTITY: 
-- [x] реализовать промежуточные отношения для реализации связи M:M
-- [x] добавить отношение Category_Percent для нормализации таблицы Trainer

CREATE TABLE IF NOT EXISTS Timetable (
    PRIMARY KEY (timetable_id),
    timetable_id INT GENERATED ALWAYS AS IDENTITY,
    timetable_time VARCHAR(100)
  );

CREATE TABLE IF NOT EXISTS Discount (
    PRIMARY KEY (discount_id),
    discount_id INT GENERATED ALWAYS AS IDENTITY,
    discount_amount INT
  );

CREATE TABLE IF NOT EXISTS Hall (
    PRIMARY KEY (hall_id),
    hall_id INT GENERATED ALWAYS AS IDENTITY,
    hall_name VARCHAR(30),
    timetable_id INT,
    FOREIGN KEY (timetable_id)
      REFERENCES Timetable(timetable_id)
      ON DELETE CASCADE
  );

CREATE TABLE IF NOT EXISTS Trainer (
    PRIMARY KEY (trainer_id),
    trainer_id INT GENERATED ALWAYS AS IDENTITY,
    trainer_name VARCHAR(50),
    trainer_gender CHAR(1),
    trainer_dob DATE,
    trainer_passport CHAR(11),
    trainer_category VARCHAR(70),
    trainer_tel VARCHAR(20),
    trainer_addr VARCHAR(100)
  );

CREATE TABLE IF NOT EXISTS Category_Percent (
	trainer_category VARCHAR(70),
	percent INT,
	PRIMARY KEY (trainer_category)
		REFERENCES TO Trainer(trainer_category)
		ON UPDATE
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Service (
    PRIMARY KEY (service_id),
    service_id INT GENERATED ALWAYS AS IDENTITY,
    service_name VARCHAR(30),
    service_price INT,
    service_dur INT,
    hall_id INT,

    FOREIGN KEY (hall_id)
      REFERENCES Hall(hall_id)
      ON DELETE CASCADE
  );
 
CREATE TABLE IF NOT EXISTS Service_Trainer (
	service_id INT REFERENCES TO Service ON UPDATE CASCADE ON DELETE CASCADE,
	trainer_id INT REFERENCES TO Trainer ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT service_trainer
		PRIMARY KEY service_trainer_pk (service_id, trainer_id)
);

CREATE TABLE IF NOT EXISTS Subscription (
	PRIMARY KEY (subscription_id),
	subscription_id INT GENERATED ALWAYS AS IDENTITY,
	subscription_price INT,
	subscription_name VARCHAR(20),
	service_id INT,
	
	FOREIGN KEY (service_id)
		REFERENCES Service(service_id)
		ON UPDATE 
		ON DELETE CASCADE
	-- FOREIGN KEY service_id
  );
  

CREATE TABLE IF NOT EXISTS Customer (
    PRIMARY KEY (customer_id),
    customer_id INT GENERATED ALWAYS AS IDENTITY,
    customer_name VARCHAR(50),
    customer_tel  VARCHAR(20),
    discount_id INT,
    FOREIGN KEY (discount_id)
      REFERENCES Discount(discount_id)
      ON DELETE CASCADE,
    -- FOREIGN KEY subscription_id
  );

CREATE TABLE IF NOT EXISTS Customer_Subscription (
	customer_id INT REFERENCES TO Customer ON UPDATE CASCADE ON DELETE CASCADE,
	subscription_id INT REFERENCES TO Subscription ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT customer_subscription_pk
		PRIMARY KEY (customer_id, subscription_id)
);
