

USE Superstore_Sales_DW
GO
-- SOLUTION ???

CREATE TABLE shipping(
	shipping_id INT IDENTITY,
	shipping_method VARCHAR(20) UNIQUE NOT NULL,

	CONSTRAINT PK_shipping PRIMARY KEY (shipping_id)
)



CREATE TABLE customer(
	customer_index INT IDENTITY,
	customer_id VARCHAR(10) UNIQUE NOT NULL,
	customer_name VARCHAR(50) NOT NULL,
	segment VARCHAR(20) NOT NULL,

	CONSTRAINT PK_customer PRIMARY KEY (customer_index)
)



CREATE TABLE [product](
	product_index INT IDENTITY,
	product_id VARCHAR(20) UNIQUE NOT NULL,
	product_name VARCHAR(255) NOT NULL,
	category VARCHAR(20) NOT NULL,
	sub_category VARCHAR(20) NOT NULL,

	CONSTRAINT PK_product PRIMARY KEY (product_index)
)



CREATE TABLE place(
	place_id INT IDENTITY,
	city VARCHAR(50) NOT NULL,
	[state] VARCHAR(50) NOT NULL,
	region VARCHAR(5) NOT NULL,
	postal_code INT NOT NULL,

	CONSTRAINT PK_place PRIMARY KEY (place_id)
)



CREATE TABLE fact_sales(
	order_id VARCHAR(20),
	order_date DATE NOT NULL,
	shipping_date DATE NOT NULL,
	quantity INT NOT NULL,
	sales DECIMAL(10, 2) NOT NULL,
	discount DECIMAL(2, 2) NOT NULL,
	profit DECIMAL(10, 2) NOT NULL,
	shipping_id INT NOT NULL,
	customer_index INT NOT NULL,
	product_index INT NOT NULL,
	place_id INT NOT NULL,

	CONSTRAINT PK_fact_sales PRIMARY KEY (order_id),
	CONSTRAINT FK_sales_shipping FOREIGN KEY (shipping_id) REFERENCES shipping (shipping_id),
	CONSTRAINT FK_sales_customer FOREIGN KEY (customer_index) REFERENCES customer (customer_index),
	CONSTRAINT FK_sales_product FOREIGN KEY (product_index) REFERENCES [product] (product_index),
	CONSTRAINT FK_sales_place FOREIGN KEY (place_id) REFERENCES place (place_id),
)





--DROP TABLE fact_sales
--DROP TABLE place
--DROP TABLE [product]
--DROP TABLE customer
--DROP TABLE shipping