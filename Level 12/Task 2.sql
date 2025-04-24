-- Task 2: 2NF

use training;

CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255)
);

INSERT INTO Customers (customer_id, customer_name, customer_address)
SELECT DISTINCT customer_id, customer_name, customer_address
FROM Denormalized_Orders;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, order_date, customer_id)
SELECT DISTINCT order_id, order_date, customer_id
FROM Denormalized_Orders;
