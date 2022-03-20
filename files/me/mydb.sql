DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS Worker CASCADE;
DROP TABLE IF EXISTS Workshop CASCADE;
DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Orders_Product CASCADE;
DROP TABLE IF EXISTS Component CASCADE;

/*
TODO:
1) Rename the variable names
2) change register of variables
3) upgrade the data types of variables(add DEFAULT, NOT NULL, UNIQUE)
4) change the size of variables
*/

CREATE TABLE IF NOT EXISTS Customer (
	  PRIMARY KEY (customer_id),
		customer_id				INT,
		customer_name			VARCHAR(120) NOT NULL,
		customer_inn 			INT UNIQUE NOT NULL,
		customer_addr			VARCHAR(100),
		customer_tel			VARCHAR(30),
		customer_passport		VARCHAR(30)
);

-- Iron component made in Workshop №1
-- Plastic component made in Workshop №2
-- Glass component made in Workshop №3
-- Electronic component made in Workshop №4
CREATE TABLE IF NOT EXISTS Workshop (
		PRIMARY KEY (workshop_id),
		workshop_id				INT,
		workshop_name 			VARCHAR(30) NOT NULL,
		workshop_dir_name 		VARCHAR(120) NOT NULL,
		-- Unique address or Constant address?
		workshop_addr			VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Worker (
		PRIMARY KEY (worker_id),
		worker_id				INT GENERATED ALWAYS AS IDENTITY,
		worker_name				VARCHAR(120) NOT NULL,
		worker_inn				INT UNIQUE NOT NULL,
		worker_addr				VARCHAR(100),
		worker_tel				VARCHAR(30),
		worker_passport			VARCHAR(30),
		workshop_id				INT,
		CONSTRAINT worker_workshop
			FOREIGN KEY (workshop_id)
				REFERENCES Workshop(workshop_id)
				ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Orders (
		PRIMARY KEY (orders_id),
		orders_id				INT GENERATED ALWAYS AS IDENTITY,
		orders_addr 			VARCHAR(100),
		orders_date				DATE DEFAULT CURRENT_DATE,
		orders_passport 	 	VARCHAR(30) NOT NULL,
		customer_id				INT,
		CONSTRAINT orders_customer
			FOREIGN KEY (customer_id)
		  	REFERENCES Customer(customer_id)
		  	ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Product (
		PRIMARY KEY (product_id),
		product_id 			INT,
		product_name		VARCHAR(120) NOT NULL,
		product_price 		NUMERIC NOT NULL,
		product_desc		VARCHAR(255),
		product_rem			INT
);

CREATE TABLE IF NOT EXISTS Orders_Product (
		orders_id 			INT REFERENCES Orders ON UPDATE CASCADE ON DELETE CASCADE,
		product_id 			INT REFERENCES Product ON DELETE CASCADE,
		product_amount 		INT,
		CONSTRAINT orders_product_pk 
			PRIMARY KEY (orders_id, product_id)
);

CREATE TABLE IF NOT EXISTS Component (
		PRIMARY KEY (component_id),
		component_id 		INT GENERATED ALWAYS AS IDENTITY,
		component_name		VARCHAR(120) NOT NULL,
		workshop_id			INT REFERENCES Workshop,
		product_id			INT REFERENCES Product
);

-- Workshop inserts
INSERT INTO Workshop (workshop_id, workshop_name, workshop_dir_name, workshop_addr)
VALUES (1, 'Цех по металлу', 'В. А. Семенов', 'Сектор А');

INSERT INTO Workshop (workshop_id, workshop_name, workshop_dir_name, workshop_addr)
VALUES (2, 'Цех по пластмассе', 'И. П. Шопен', 'Сектор А');

INSERT INTO Workshop (workshop_id, workshop_name, workshop_dir_name, workshop_addr)
VALUES (3, 'Цех по стеклу', 'А. А. Харитонов', 'Сектор Б');

INSERT INTO Workshop (workshop_id, workshop_name, workshop_dir_name, workshop_addr)
VALUES (4, 'Цех по электронике', 'Ю. С. Иванов', 'Сектор Г');

-- Worker inserts
INSERT INTO Worker (workshop_id, worker_name, worker_inn, worker_addr, worker_tel, worker_passport)
VALUES (1,  'С. Е. Горький', 5324128, 'г. Краснодар, ул. Ветрова 44а/6, к. 56', '89421775400', '0401 478543');

INSERT INTO Worker (workshop_id, worker_name, worker_inn, worker_addr, worker_tel, worker_passport)
VALUES (2,  'М. И. Увальский', 4521988, 'г. Санкт-Петербург, ул. Набережная 14, к. 4', '+7(913)566-43-91', '0509 444917');

INSERT INTO Worker (workshop_id, worker_name, worker_inn, worker_addr, worker_tel, worker_passport)
VALUES (2,  'Г. М. Рогожин', 7931120, 'г. Москва, ул. Краснофлотская 30, к. 98', '+7(919)888-41-91', '0715 864147');

-- Customer inserts
INSERT INTO Customer
Values (322, 'Vasya Pupkin', 8412904, 'st. Junkline, 74a', '904-432-12', 'Citizen of Artoszka, 94820');

INSERT INTO Customer
Values (102, 'Evgeniy Trubach', 3495213, 'Petyagorsk, st. Central 245', '89189435432', '0721 157368');

INSERT INTO Customer
Values (105, 'Bogdan Kuznecov', 4215694, 'Novgorod, st. Pribrezhnaya 49b', '+7(919)6544384', '0613 124864');


-- Orders inserts
INSERT INTO Orders (customer_id, orders_addr, orders_date, orders_passport)
Values (102, 'Petyagorsk, st. Central 245', '2018-04-19', 'N\A');

INSERT INTO Orders (customer_id, orders_addr, orders_passport)
Values (105, 'Novgorod, st. Konsomol 59/2', 'N\A');

INSERT INTO Orders (customer_id, orders_addr, orders_date, orders_passport)
Values (102, 'Petyagorsk, st. Central 245', '2020-05-15', 'N\A');


-- Product inserts
INSERT INTO Product (product_id, product_name, product_price, product_desc, product_rem)
Values (3041, 'Трехвальная КПП', 50000.0, '', 2);

INSERT INTO Product (product_id, product_name, product_price, product_desc, product_rem)
Values (6054, 'Генератор переменного тока', 15000.0, '', 12);


-- Orders_Product inserts
INSERT INTO Orders_Product (orders_id, product_id, product_amount)
VALUES (1, 3041, 1),
			 (1, 6054, 1),
			 (2, 3041, 4);


-- Component inserts
/* product_id 3041 */
INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Корпус КПП', 2, 3041);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Муфта переключения передач', 2, 3041);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Шток переключения передач', 1, 3041);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Ручка переключения передач', 2, 3041);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Первичный вал', 1, 3041);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Вторичный вал', 1, 3041);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Нейтральная передача', 1, 3041);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Синхронизатор 1-2 передачи', 1, 3041);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Синхронизатор 3-4 передачи', 1, 3041);

/* product_id 6504*/
INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Щетки', 2, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Щеткодержатель', 2, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Коллектор', 2, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Обмотка якоря', 2, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Якорь', 1, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Статор', 2, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Контактное кольцо', 1, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Обмотка статора', 2, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Ротор', 1, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Вентилятор', 1, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Корпус генератора', 1, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Привод', 1, 6054);

INSERT INTO Component (component_name, workshop_id, product_id)
VALUES ('Станина', 1, 6054);
