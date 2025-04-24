-- TASK 1 - 1NF (atomic values)

use training;

CREATE TABLE Denormalized_Orders (
    order_id INT,
    order_date DATE,
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id)  
);

INSERT INTO Denormalized_Orders (order_id, order_date, customer_id, customer_name, customer_address, product_id, product_name, quantity, price)
VALUES
(101, '2023-01-01', 'C1', 'Alice', '123 Main St', 'P1', 'Laptop', 2, 1000.00),
(101, '2023-01-01', 'C1', 'Alice', '123 Main St', 'P2', 'Mouse', 3, 20.00),
(102, '2023-01-02', 'C2', 'Bob', '456 Oak Ave', 'P3', 'Keyboard', 1, 50.00);