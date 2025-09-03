-- Create database
CREATE DATABASE pizzahut;
USE pizzahut;

-- Begin transaction
START TRANSACTION;

-- Orders table 
CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);

-- Order Details table 
CREATE TABLE order_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_details_id)
);

-- Pizza Types table 
CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) NOT NULL,
    name TEXT,
    category TEXT,
    ingredients TEXT,
    PRIMARY KEY (pizza_type_id)
);

-- Pizzas table 
CREATE TABLE pizzas (
    pizza_id VARCHAR(50) NOT NULL,
    pizza_type_id VARCHAR(50) NOT NULL,
    size TEXT,
    price DOUBLE,
    PRIMARY KEY (pizza_id)
);

-- Add FK order_details → orders
ALTER TABLE order_details
ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id);

-- pizza_id datatype in order_details to allow FK
ALTER TABLE order_details
MODIFY pizza_id VARCHAR(50) NOT NULL;

-- Add FK order_details → pizzas
ALTER TABLE order_details
ADD CONSTRAINT fk_pizza FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id);

-- Fix pizza_type_id datatype (ensure consistency)
ALTER TABLE pizza_types
MODIFY pizza_type_id VARCHAR(50) NOT NULL;

ALTER TABLE pizzas
MODIFY pizza_type_id VARCHAR(50) NOT NULL;

-- Add FK pizzas → pizza_types
ALTER TABLE pizzas
ADD CONSTRAINT fk_pizza_type FOREIGN KEY (pizza_type_id) REFERENCES pizza_types(pizza_type_id);

-- Fix pizza_id consistency
ALTER TABLE pizzas
MODIFY pizza_id VARCHAR(50) NOT NULL;

ALTER TABLE order_details
MODIFY pizza_id VARCHAR(50) NOT NULL;

-- Improve readability of other columns
ALTER TABLE pizzas
MODIFY size VARCHAR(10);

ALTER TABLE pizza_types
MODIFY name VARCHAR(100),
MODIFY category VARCHAR(50);

-- End transaction
COMMIT;
