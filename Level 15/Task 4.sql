SELECT 
    customer_id,
    ROUND(SUM(quantity * price), 2) AS total_spent,
    RANK() OVER (ORDER BY SUM(quantity * price) DESC) AS rank_position
FROM 
    customer_shopping_data
GROUP BY 
    customer_id
ORDER BY 
    rank_position
LIMIT 5;