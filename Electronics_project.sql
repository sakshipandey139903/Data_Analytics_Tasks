CREATE DATABASE electronics_shop;

USE electronics_shop;



CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO product
(product_id, product_name, category, brand, price, stock)
VALUES
(101, 'Laptop', 'Computer', 'Dell', 55000.00, 20),
(102, 'Smartphone', 'Mobile', 'Samsung', 25000.00, 35),
(103, 'Television', 'TV', 'LG', 45000.00, 15),
(104, 'Headphones', 'Audio', 'Sony', 5200.00, 50),
(105, 'Tablet', 'Computer', 'Lenovo', 76000.00, 25);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    product_id INT,
    quantity INT,
    status VARCHAR(30),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO orders
(order_id, customer_name, order_date, product_id, quantity, status)
VALUES
(201, 'Rahul Sharma', '2026-09-01', 101, 1, 'Completed'),
(202, 'Priya Singh', '2026-09-02', 102, 2, 'Completed'),
(203, 'Aman Verma', '2026-09-03', 103, 1, 'Pending'),
(204, 'Neha Gupta', '2026-09-04', 104, 2, 'Completed'),
(205, 'Rohit Kumar', '2026-09-05', 105, 1, 'Completed');

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
INSERT INTO sales
(sale_id, order_id, product_id, sale_date, quantity, total_amount)
VALUES
(301, 201, 101, '2026-09-01', 1, 55000.00),
(302, 202, 102, '2026-09-02', 2, 50000.00),
(303, 203, 103, '2026-09-03', 1, 45000.00),
(304, 204, 104, '2026-09-04', 2, 7000.00),
(305, 205, 105, '2026-09-05', 1, 22000.00);

CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    sale_id INT,
    product_id INT,
    return_date DATE,
    quantity INT,
    reason VARCHAR(200),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
INSERT INTO returns
(return_id, sale_id, product_id, return_date, quantity, reason)
VALUES
(401, 302, 102, '2026-09-05', 1, 'Screen issue'),
(402, 304, 104, '2026-09-06', 1, 'Sound problem'),
(403, 303, 103, '2026-09-07', 1, 'Damaged product'),
(404, 305, 105, '2026-09-08', 1, 'Battery issue'),
(405, 306, 106, '2026-09-09', 1, 'Not working');

SELECT product_name, price,
       CASE
           WHEN price >= 50000 THEN 'Best'
           WHEN price >= 45000 THEN 'Better'
           WHEN price >= 40000 THEN 'Good'
           ELSE 'Normal'
       END AS price_category
FROM product;
