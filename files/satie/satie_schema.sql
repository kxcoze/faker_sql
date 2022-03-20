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
DROP TABLE IF EXISTS Subscription_Service CASCADE;

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

-- Insert by your own hands!!!
CREATE TABLE IF NOT EXISTS Category_Percent (
	PRIMARY KEY (trainer_category),
	trainer_category VARCHAR(70),
	percent INT
);
INSERT INTO Category_Percent(trainer_category, percent) VALUES('тренер высшей квалификационной категории', '20');
INSERT INTO Category_Percent(trainer_category, percent) VALUES('тренер первой квалификационной категории', '15');
INSERT INTO Category_Percent(trainer_category, percent) VALUES('тренер второй квалификационной категории', '10');

CREATE TABLE IF NOT EXISTS Trainer (
    PRIMARY KEY (trainer_id),
    trainer_id INT GENERATED ALWAYS AS IDENTITY,
    trainer_name VARCHAR(50),
    trainer_gender CHAR(1),
    trainer_dob DATE,
    trainer_passport CHAR(11),
    trainer_category VARCHAR(70),
    trainer_tel VARCHAR(20),
    trainer_addr VARCHAR(100),

	FOREIGN KEY (trainer_category)
		REFERENCES Category_Percent(trainer_category)
		ON UPDATE CASCADE
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
	service_id INT REFERENCES Service ON UPDATE CASCADE ON DELETE CASCADE,
	trainer_id INT REFERENCES Trainer ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT service_trainer_pk
		PRIMARY KEY (service_id, trainer_id)
);

CREATE TABLE IF NOT EXISTS Subscription (
	PRIMARY KEY (subscription_id),
	subscription_id INT GENERATED ALWAYS AS IDENTITY,
	subscription_price INT,
	subscription_name VARCHAR(35)
  );
  
CREATE TABLE IF NOT EXISTS Subscription_Service (
	service_id INT REFERENCES Service ON UPDATE CASCADE ON DELETE CASCADE,
	subscription_id INT REFERENCES Subscription ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT service_sub_pk
		PRIMARY KEY (service_id, subscription_id)
);

CREATE TABLE IF NOT EXISTS Customer (
    PRIMARY KEY (customer_id),
    customer_id INT GENERATED ALWAYS AS IDENTITY,
    customer_name VARCHAR(50),
    customer_tel  VARCHAR(20),
    discount_id INT,
    FOREIGN KEY (discount_id)
      REFERENCES Discount(discount_id)
      ON DELETE CASCADE
    -- FOREIGN KEY subscription_id
  );

CREATE TABLE IF NOT EXISTS Customer_Subscription (
	customer_id INT REFERENCES Customer ON UPDATE CASCADE ON DELETE CASCADE,
	subscription_id INT REFERENCES Subscription ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT customer_subscription_pk
		PRIMARY KEY (customer_id, subscription_id)
);

INSERT INTO Timetable (timetable_time) VALUES('Ежедневно, 9:00-22:00');
INSERT INTO Timetable (timetable_time) VALUES('Ежедневно, 8:00-22:00');
INSERT INTO Timetable (timetable_time) VALUES('Ежедневно, 9:00-21:00');
INSERT INTO Timetable (timetable_time) VALUES('Пн-Пт, 6:00-21:00, Сб-Вс, 8:00-23:00');
INSERT INTO Timetable (timetable_time) VALUES('Ежедневно, 7:00-23:00');
INSERT INTO Timetable (timetable_time) VALUES('Пн-Пт, 7:00-21:00, Сб-Вс, 8:00-22:00');
INSERT INTO Discount (discount_amount) VALUES('25');
INSERT INTO Discount (discount_amount) VALUES('20');
INSERT INTO Discount (discount_amount) VALUES('15');
INSERT INTO Discount (discount_amount) VALUES('10');
INSERT INTO Hall (hall_name, timetable_id) VALUES('Бассейн', '3');
INSERT INTO Hall (hall_name, timetable_id) VALUES('Фитнес зал', '1');
INSERT INTO Hall (hall_name, timetable_id) VALUES('Тренажерный зал', '6');
INSERT INTO Hall (hall_name, timetable_id) VALUES('Спортзал', '1');
INSERT INTO Hall (hall_name, timetable_id) VALUES('Групповой зал', '3');
INSERT INTO Hall (hall_name, timetable_id) VALUES('Детская комната', '6');
-- Бассейн
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Бассейн', '800', '90', 1);
-- Фитнес зал
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Взрослый фитнес', '800', '60', 2);
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Детский фитнес', '300', '90', 2);
-- Залы
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Игривые виды спорта', '800', '90', 5);
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Тренажерный зал', '300', '60', 3);
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Детская комната', '300', '90', 6);
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Групповые программы', '500', '90', 5);
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Айкидо', '800', '90', 4);
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Карате', '400', '90', 4);
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Бокс', '400', '90', 4);
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Дзюдо', '500', '90', 4);
INSERT INTO Service (service_name, service_price, service_dur, hall_id) VALUES('Ушу', '500', '90', 4);
INSERT INTO Subscription (subscription_name, subscription_price) VALUES('Разовый (бассейн)', '1200');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('1', '1');
INSERT INTO Subscription (subscription_name, subscription_price) VALUES('Разовый (фитнес)', '900');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('2', '2');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('2', '3');
INSERT INTO Subscription (subscription_name, subscription_price) VALUES('Разовый (зал)', '1100');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('3', '4');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('3', '5');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('3', '6');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('3', '7');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('3', '8');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('3', '9');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('3', '10');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('3', '11');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('3', '12');
INSERT INTO Subscription (subscription_name, subscription_price) VALUES('Месячный (бассейн, фитнес, зал)', '2000');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '1');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '2');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '3');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '4');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '5');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '6');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '7');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '8');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '9');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '10');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '11');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('4', '12');
INSERT INTO Subscription (subscription_name, subscription_price) VALUES('Полугодовой (бассейн, фитнес, зал)', '9000');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '1');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '2');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '3');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '4');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '5');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '6');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '7');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '8');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '9');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '10');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '11');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('5', '12');
INSERT INTO Subscription (subscription_name, subscription_price) VALUES('Годовой (бассейн, фитнес, зал)', '15000');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '1');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '2');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '3');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '4');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '5');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '6');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '7');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '8');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '9');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '10');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '11');
INSERT INTO Subscription_Service (subscription_id, service_id) VALUES('6', '12');
