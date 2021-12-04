DROP TABLE IF EXISTS Subscription CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Discount CASCADE;
DROP TABLE IF EXISTS Service CASCADE;
DROP TABLE IF EXISTS Trainer CASCADE;
DROP TABLE IF EXISTS Hall CASCADE;
DROP TABLE IF EXISTS Timetable CASCADE;

-- TODO:
-- прописать айдишникам после типа -> GENERATED ALWAYS AS IDENTITY
-- реализовать промежуточные отношения для реализации связи M:M
-- добавить отношение Category_Percent для нормализации таблицы Trainer

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

CREATE TABLE IF NOT EXISTS TRAINER (
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

CREATE TABLE IF NOT EXISTS Service (
    PRIMARY KEY (service_id),
    service_id INT GENERATED ALWAYS AS IDENTITY,
    service_name VARCHAR(30),
    trainer_id INT,
    service_price INT,
    service_dur INT,
    hall_id INT,

    FOREIGN KEY (trainer_id)
      REFERENCES Trainer(trainer_id)
      ON DELETE CASCADE,

    FOREIGN KEY (hall_id)
      REFERENCES Hall(hall_id)
      ON DELETE CASCADE
  );

CREATE TABLE IF NOT EXISTS Subscription (
  PRIMARY KEY (subscription_id),
  subscription_id INT GENERATED ALWAYS AS IDENTITY,
  subscription_price INT,
  service_id INT,
  subscription_name VARCHAR(20),
  -- FOREIGN KEY service_id
  CONSTRAINT subscription_service
    FOREIGN KEY (service_id)
      REFERENCES Service(service_id)
      ON DELETE CASCADE
  );

CREATE TABLE IF NOT EXISTS Customer (
    PRIMARY KEY (customer_id),
    customer_id INT GENERATED ALWAYS AS IDENTITY,
    customer_name VARCHAR(50),
    customer_tel  VARCHAR(20),
    discount_id INT,
    subscription_id INT,
    FOREIGN KEY (discount_id)
      REFERENCES Discount(discount_id)
      ON DELETE CASCADE,

    FOREIGN KEY (subscription_id)
      REFERENCES Subscription(subscription_id)
      ON DELETE CASCADE
    -- FOREIGN KEY subscription_id
  );
