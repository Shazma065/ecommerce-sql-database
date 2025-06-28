
USE ecommerce;

-- a. SELECT, WHERE, ORDER BY, GROUP BY
SELECT * FROM users WHERE status = 'active';
SELECT title, price, discount FROM products WHERE discount IS NOT NULL;
SELECT * FROM orders ORDER BY created_at DESC;
SELECT status, COUNT(*) AS user_count FROM users GROUP BY status;

-- b. JOINS
-- INNER JOIN: Orders with User Details
SELECT o.order_number, u.name, o.total_amount
FROM orders o
INNER JOIN users u ON o.user_id = u.id;

-- LEFT JOIN: All users with their orders (if any)
SELECT u.name, o.order_number
FROM users u
LEFT JOIN orders o ON u.id = o.user_id;

-- RIGHT JOIN simulated via LEFT JOIN flipped (MySQL doesn't support RIGHT JOIN directly)
SELECT o.order_number, u.name
FROM orders o
LEFT JOIN users u ON u.id = o.user_id;

-- c. Subqueries
-- Products priced above average
SELECT title, price FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Users who have placed at least one order
SELECT name FROM users
WHERE id IN (SELECT user_id FROM orders);

-- d. Aggregate functions
-- Total revenue from orders
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- Average price of products
SELECT AVG(price) AS average_price FROM products;

-- Number of products per category
SELECT cat_id, COUNT(*) AS product_count FROM products GROUP BY cat_id;

-- e. Views
-- View: Active users
CREATE OR REPLACE VIEW active_users AS
SELECT id, name, email FROM users WHERE status = 'active';

-- View: Product summary
CREATE OR REPLACE VIEW product_summary AS
SELECT id, title, price, stock FROM products WHERE status = 'active';

-- f. Indexes
CREATE INDEX idx_user_id ON orders(user_id);
CREATE INDEX idx_product_id ON carts(product_id);
CREATE INDEX idx_email ON users(email);
