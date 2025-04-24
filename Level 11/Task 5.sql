# Task 5: CTE and Window Functions

use training;

create table sales(sale_id int, sale_date varchar(10), amount decimal);

insert into sales values (1, '2023-10-01', 100), (2, '2023-10-02', 200), (3, '2023-10-03', 150), (4, '2023-10-04', 300);

WITH OctoberSales AS (
    SELECT *
    FROM sales
    WHERE sale_date BETWEEN '2023-10-01' AND '2023-10-31'
)
SELECT 
    sale_id,
    sale_date,
    amount,
    SUM(amount) OVER (ORDER BY sale_date) AS running_total
FROM OctoberSales;