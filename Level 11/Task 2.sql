use training;

create table departments (
	department_id int primary key,
    department_name varchar(50)
);

insert into departments values (1, 'Engineering'), (2, 'HR'), (3, 'Sales');

alter table employees drop column appraisal_percentage;
insert into employees values (4, 'Diana', 'HR', 60000), (5, 'Evan', NULL, 55000);

select employees.id,departments.department_name 
from employees inner join departments 
on employees.department = departments.department_name;

select employees.e_name , departments.department_name 
from employees left join departments 
on employees.department = departments.department_name;

select employees.e_name , departments.department_name 
from employees right join departments 
on employees.department = departments.department_name;

# Full outer join
select employees.e_name , departments.department_name 
from employees left join departments 
on employees.department = departments.department_name
UNION
select employees.e_name , departments.department_name 
from employees right join departments 
on employees.department = departments.department_name;
