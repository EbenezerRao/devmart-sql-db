-- 1. Identify "Whale" Customers (CTEs & Subqueries)
WITH whale_customer AS (
    SELECT 
        c.customer_name, 
        SUM(i.price) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items i ON o.order_id = i.order_id
    GROUP BY c.customer_name
)
SELECT customer_name, total_spent 
FROM whale_customer
WHERE total_spent > (SELECT AVG(total_spent) FROM whale_customer); 

-- 2. Logistics Bottleneck (Filtering & CASE Logic)
SELECT 
    o.order_id, 
    i.product_name,
    i.price,
    CASE 
        WHEN i.price > 100 THEN 'Expedite'
        ELSE 'Standard'
    END AS shipping_priority
FROM orders o
JOIN order_items i ON o.order_id = i.order_id
WHERE o.status = 'Pending';

-- 3. The Ghosts (LEFT JOIN for Missing Data)
SELECT DISTINCT c.customer_id, c.customer_name, o.order_id, i.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items i ON o.order_id = i.order_id;

-- 4. Item Ranking per Order (Window Functions)
SELECT order_id, product_name, price,
    RANK() OVER (
        PARTITION BY order_id
        ORDER BY price DESC
    ) AS item_rank
FROM order_items;
