use training;

insert into employees values (6, 'Fiona', 'Sales', 50000), (7, 'George', 'Sales', 48000);

# WHERE Clause
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE department = 'Engineering'
GROUP BY department;
  
# HAVING Clause
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;