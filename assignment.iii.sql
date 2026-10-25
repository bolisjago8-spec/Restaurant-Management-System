
-- 1. Create customers table
CREATE TABLE customers (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(20)
);

-- 2. Create food table
CREATE TABLE food (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    food_name VARCHAR(50),
    price NUMERIC(10,2)
);

-- 3. Create orders table
CREATE TABLE orders (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    food_id INT REFERENCES food(id),
    quantity INT
);

-- 4. Insert customers
INSERT INTO customers (name, phone)
VALUES
('John', '0781000001'),
('Mary', '0781000002'),
('David', '0781000003'),
('Sarah', '0781000004'),
('Peter', '0781000005');

-- 5. Insert food
INSERT INTO food (food_name, price)
VALUES
('Pizza', 8000),
('Burger', 5000),
('Chicken', 7000),
('Rice', 3000),
('Chips', 2500);

-- 6. Insert orders
INSERT INTO orders (customer_id, food_id, quantity)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 3),
(5, 5, 2);

-- 7. Display all customers
SELECT * FROM customers;

-- 8. Display food above 5000
SELECT * FROM food
WHERE price > 5000;

-- 9. Display orders with customer names
SELECT customers.name, orders.quantity
FROM customers
JOIN orders
ON customers.id = orders.customer_id;

-- 10. Update a food price
UPDATE food
SET price = 9000
WHERE food_name = 'Pizza';

-- 11. Add a food category column
ALTER TABLE food
ADD COLUMN category VARCHAR(50);

-- 12. Insert one more food
INSERT INTO food (food_name, price, category)
VALUES ('Fish', 9000, 'Seafood');

-- 13. Display all food
SELECT * FROM food;
