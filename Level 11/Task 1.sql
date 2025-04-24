# Task 1: SQL CRUD Operations (MySQL)

use training;

CREATE TABLE employees (
    id INT primary key,
    e_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL
);

insert into employees values (1, 'Alice', 'Engineering', 75000), (2, 'Bob', 'Marketing', 65000), (3, 'Charlie', 'Engineering', 80000);

update employees 
set salary = '70000' 
where id = '2';

select * from employees where department = 'Engineering';

delete from employees where id = 3;

alter table employees add appraisal_percentage varchar(10);