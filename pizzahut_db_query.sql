-- Create database
CREATE DATABASE pizzahut;
USE pizzahut;

-- Begin transaction
START TRANSACTION;

-- Orders table (your code kept exactly as it is)
CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);

-- Order Details table (your code kept exactly as it is)
CREATE TABLE order_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_details_id)
);

-- Pizza Types table (newly added)
CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) NOT NULL,
    name TEXT,
    category TEXT,
    ingredients TEXT,
    PRIMARY KEY (pizza_type_id)
);

-- Pizzas table (newly added)
CREATE TABLE pizzas (
    pizza_id VARCHAR(50) NOT NULL,
    pizza_type_id VARCHAR(50) NOT NULL,
    size VARCHAR(10),
    price DOUBLE,
    PRIMARY KEY (pizza_id),
    CONSTRAINT fk_pizza_type FOREIGN KEY (pizza_type_id) REFERENCES pizza_types(pizza_type_id)
);

-- Add foreign key for order_details → orders
ALTER TABLE order_details
ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id);

-- Fix pizza_id datatype in order_details (to allow FK)
ALTER TABLE order_details
MODIFY pizza_id VARCHAR(50) NOT NULL;

-- Add foreign key for order_details → pizzas
ALTER TABLE order_details
ADD CONSTRAINT fk_pizza FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id);

-- End transaction
COMMIT;
