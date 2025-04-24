-- Task 4: BCNF

use training;

CREATE TABLE Product_Warehouses (
    product_id VARCHAR(10) PRIMARY KEY,
    warehouse_id VARCHAR(10)
);

INSERT INTO Product_Warehouses (product_id, warehouse_id)
VALUES
('P3', 'W1');