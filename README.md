# DevMart E-Commerce Database 🛒
A fully relational PostgreSQL database designed to track customers, orders, and inventory for a tech-merchandise startup.

## 🗄️ Database Architecture
* **Customers:** Tracks demographic data and join dates.
* **Orders:** Tracks order status (Pending/Shipped) linked to customers.
* **Order Items:** Tracks individual products, prices, and links to specific orders.

## 🚀 Key SQL Concepts Demonstrated
* **Advanced Joins:** `INNER JOIN`, `LEFT JOIN` for identifying orphaned records.
* **Aggregations & Filtering:** `GROUP BY`, `HAVING` clauses.
* **Conditional Logic:** `CASE` statements for dynamic shipping priority flags.
* **Window Functions:** `RANK() OVER (PARTITION BY...)` to sort items within specific orders.
* **CTEs & Subqueries:** Common Table Expressions to calculate moving averages and identify high-value "Whale" customers.
* **Performance Tuning:** `CREATE INDEX` to eliminate Sequential Scans and optimize read times.
