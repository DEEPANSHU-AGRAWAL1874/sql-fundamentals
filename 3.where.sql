use employees;
select * from employees;
 
 -- employees with age more than 30
 select * from employees where age > 30;
 
 -- employees with age more than 30 for sales 
 select * from employees where age >30 and department = 'Sales';

-- Employees with age in range 30 - 40 years
select * from employees where age >= 30 and age <= 40;
select * from employees where age between 30 and 40;

 -- Employees from Sales or Marketing
select * from employees where department  = 'Sales' or department = 'Marketing';


 -- Searching for name starting with Jo
 select * from employees where name like 'Jo%';
 
  -- Getting only not null data of departments
select * from employees where department is not null;
-- Getting only not null data throught the table
select * from employees where department is not null and age is not null;

-- Getting data using IN command
select * from employees where department in ( 'Sales','Marketing');
-- Getting data using  NOT IN command
select * from employees where department NOT in ( 'Sales','Marketing');

-- Marketing or Sales people witha ge more than 30
select * from employees where (department in ('sales','marketing')) and age > 30;