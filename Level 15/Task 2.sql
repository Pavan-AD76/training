use training;

SELECT 
    customer_id,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(quantity * price) AS total_spent
FROM 
    customer_shopping_data
GROUP BY 
    customer_id
HAVING 
    total_orders >= 5
ORDER BY 
    total_spent DESC
LIMIT 1;