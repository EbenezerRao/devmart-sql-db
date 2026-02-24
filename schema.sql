-- 1. Build Tables
CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50),
    join_date DATE
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items(
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 2. Inject Data
INSERT INTO customers (customer_id, customer_name, country, join_date) VALUES
(1, 'Ebenezer', 'India', '2023-10-01'),
(2, 'Ada Lovelace', 'UK', '2024-01-15'),
(3, 'Rahul Sharma', 'India', '2024-02-01'),
(4, 'Linus Torvalds', 'Finland', '2024-02-10');

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(101, 1, '2024-02-15', 'Shipped'),
(102, 1, '2024-02-18', 'Pending'),
(103, 2, '2024-02-19', 'Shipped'),
(104, 3, '2024-02-20', 'Shipped'),
(105, 4, '2024-02-21', 'Pending'),
(106, 1, '2024-02-22', 'Shipped');

INSERT INTO order_items (item_id, order_id, product_name, price) VALUES
(1001, 101, 'React Native Pro Course', 99.99),
(1002, 101, 'Mechanical Keyboard', 120.00),
(1003, 102, 'WikiMedia Contributor Hoodie', 45.00),
(1004, 103, 'AI/ML System Architecture Book', 65.50),
(1005, 104, 'DevFest Prayagraj Ticket', 15.00),
(1006, 105, 'Linux Kernel Source Code (Printed)', 250.00),
(1007, 106, 'Advanced SQL Query Guide', 35.00);

-- 3. Optimize Performance
CREATE INDEX idx_product_name ON order_items(product_name);
