# ecommerce-sql-database
A complete eCommerce database schema built using MySQL. Includes schema creation, sample data population, complex queries for analysis, optimized indexing, and view definitions to support application development and data analysis.
# 🛒 eCommerce SQL Database Project

This repository contains the full SQL setup for an eCommerce application using **MySQL**. It includes the database schema, sample data inserts, and advanced SQL queries for analysis and optimization.

---

## 📁 Contents

| File                             | Description                                         |
|----------------------------------|-----------------------------------------------------|
| `ecommerce_schema.sql`           | Creates all required tables for the eCommerce app  |
| `ecommerce_sample_data.sql`      | Populates tables with sample data for testing      |
| `ecommerce_analysis_queries.sql` | SQL queries: JOINs, subqueries, views, indexing    |

---

## 📌 Features Covered

### ✅ Schema Creation
- `users`, `products`, `orders`, `reviews`, `wishlists`, and more
- Proper datatypes, constraints, timestamps

### ✅ Sample Data
- Realistic entries across users, orders, carts, and categories

### ✅ SQL Concepts Demonstrated
- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- `INNER JOIN`, `LEFT JOIN`, simulated `RIGHT JOIN`
- Subqueries (`IN`, `AVG`, etc.)
- Aggregate functions (`SUM`, `AVG`, `COUNT`)
- Views for data analysis
- Index creation for performance optimization

---

## 🛠️ How to Use

1. Clone the repository or download the `.sql` files
2. Open **MySQL Workbench**
3. Run `ecommerce_schema.sql` to create tables
4. Run `ecommerce_sample_data.sql` to insert data
5. Run `ecommerce_analysis_queries.sql` to execute advanced queries

> 💡 Make sure to `USE ecommerce;` in MySQL before running queries.

---

## 📊 Example Queries

```sql
-- Get active users
SELECT * FROM users WHERE status = 'active';

-- Orders with customer names (JOIN)
SELECT o.order_number, u.name FROM orders o
INNER JOIN users u ON o.user_id = u.id;

-- Products above average price (Subquery)
SELECT title FROM products
WHERE price > (SELECT AVG(price) FROM products);
