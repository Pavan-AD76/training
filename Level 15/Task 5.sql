use training;

WITH orders_with_quarter AS (
    SELECT 
        customer_id,
        invoice_no,
        invoice_date,
        QUARTER(invoice_date) AS qtr,
        YEAR(invoice_date) AS yr
    FROM customer_shopping_data
),
latest_quarter AS (
    SELECT 
        MAX(CONCAT(YEAR(invoice_date), '-', QUARTER(invoice_date))) AS latest_qtr
    FROM customer_shopping_data
),
filtered_orders AS (
    SELECT 
        o.customer_id,
        CONCAT(o.yr, '-', o.qtr) AS year_quarter
    FROM orders_with_quarter o
    WHERE CONCAT(o.yr, '-', o.qtr) IN (
        SELECT 
            CONCAT(YEAR(invoice_date), '-', QUARTER(invoice_date) - 1)
        FROM customer_shopping_data
        WHERE CONCAT(YEAR(invoice_date), '-', QUARTER(invoice_date)) = (
            SELECT latest_qtr FROM latest_quarter
        )
        UNION
        SELECT latest_qtr FROM latest_quarter
    )
),
grouped AS (
    SELECT 
        customer_id,
        COUNT(DISTINCT year_quarter) AS active_quarters
    FROM filtered_orders
    GROUP BY customer_id
)
SELECT 
    COUNT(*) AS repeat_customers
FROM grouped
WHERE active_quarters = 2;