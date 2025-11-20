
-- Billing System SQL Project

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    address TEXT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount_paid DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Sample Data

INSERT INTO customers VALUES
(1, 'Aarav Kumar', '9876543210', 'aarav@example.com', 'Bangalore'),
(2, 'Likhitha', '8765432109', 'likhitha@example.com', 'Mangalore');

INSERT INTO products VALUES
(1, 'Milk', 50.00, 100),
(2, 'Bread', 30.00, 50),
(3, 'Oil', 120.00, 40);

INSERT INTO orders VALUES
(101, 1, '2025-01-20'),
(102, 2, '2025-01-20');

INSERT INTO order_items VALUES
(201, 101, 1, 2, 100.00),
(202, 101, 2, 1, 30.00),
(203, 102, 3, 1, 120.00);

INSERT INTO payments VALUES
(301, 101, 130.00, 'UPI', '2025-01-20'),
(302, 102, 120.00, 'Cash', '2025-01-20');
