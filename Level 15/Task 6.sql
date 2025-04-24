use training;

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    age INT
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE
);

CREATE TABLE payment_methods (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) UNIQUE
);

CREATE TABLE shopping_malls (
    mall_id INT AUTO_INCREMENT PRIMARY KEY,
    mall_name VARCHAR(50) UNIQUE
);

CREATE TABLE invoices (
    invoice_no VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    invoice_date DATE,
    mall_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (mall_id) REFERENCES shopping_malls(mall_id)
);

CREATE TABLE invoice_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_no VARCHAR(20),
    category_id INT,
    quantity INT,
    price DECIMAL(10,2),
    method_id INT,
    FOREIGN KEY (invoice_no) REFERENCES invoices(invoice_no),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (method_id) REFERENCES payment_methods(method_id)
);