# Create the Stored Procedure
DELIMITER $$

CREATE PROCEDURE CalculateAvgSalary(IN dept_name VARCHAR(100))
BEGIN
    DECLARE avgSal DECIMAL(10,2);
    
    SELECT AVG(salary) INTO avgSal
    FROM employees
    WHERE department = dept_name;
    
    UPDATE department_stats
    SET avg_salary = avgSal
    WHERE department = dept_name;
END $$

DELIMITER ;