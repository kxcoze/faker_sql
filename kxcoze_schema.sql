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
	customer_id				INT GENERATED ALWAYS AS IDENTITY,
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
	workshop_id				INT GENERATED ALWAYS AS IDENTITY,
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
		product_id 			INT GENERATED ALWAYS AS IDENTITY,
		product_name		VARCHAR(120) NOT NULL,
		product_price 		NUMERIC NOT NULL,
		product_desc		VARCHAR(255),
		product_quantity	INT
);

CREATE TABLE IF NOT EXISTS Orders_Product (
		orders_id 				INT REFERENCES Orders ON UPDATE CASCADE ON DELETE CASCADE,
		product_id 				INT REFERENCES Product ON DELETE CASCADE,
		orders_product_quantity	INT,
		CONSTRAINT orders_product_pk 
			PRIMARY KEY (orders_id, product_id)
);

CREATE TABLE IF NOT EXISTS Component (
		PRIMARY KEY (component_id),
		component_id 		INT GENERATED ALWAYS AS IDENTITY,
		component_name		VARCHAR(120) NOT NULL,
		component_time 		INT,
		component_quantity  INT,
		workshop_id			INT REFERENCES Workshop ON DELETE CASCAdE,
		product_id			INT REFERENCES Product ON DELETE CASCADE
);
