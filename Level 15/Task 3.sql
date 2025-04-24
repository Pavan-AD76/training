use training;

SELECT 
    gender,
    ROUND(SUM(quantity * price), 2) AS total_spent,
    ROUND(AVG(quantity * price), 2) AS average_spent,
    ROUND(MAX(quantity * price), 2) AS max_spent,
    ROUND(MIN(quantity * price), 2) AS min_spent
FROM 
    customer_shopping_data
GROUP BY 
    gender;
