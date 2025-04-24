-- Task 5: 4NF

use training;

CREATE TABLE Customer_Addresses (
    customer_id VARCHAR(10),
    address VARCHAR(255),
    PRIMARY KEY (customer_id, address),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customer_Addresses (customer_id, address)
VALUES
('C1', '123 Main St'),
('C1', '456 Park Ave');

CREATE TABLE Customer_Phones (
    customer_id VARCHAR(10),
    phone_number VARCHAR(20),
    PRIMARY KEY (customer_id, phone_number),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customer_Phones (customer_id, phone_number)
VALUES
('C1', '555-1234'),
('C1', '555-5678');
