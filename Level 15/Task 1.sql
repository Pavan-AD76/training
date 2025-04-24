use training;

desc customer_shopping_data;

select * from customer_shopping_data;

SELECT 
    ROUND(SUM(quantity * price) / COUNT(DISTINCT invoice_no), 2) AS average_order_value
FROM 
    customer_shopping_data;