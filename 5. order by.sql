use employees;
select * from employees;
-- Sorting the data based on age
select * from employees order by age;
select * from employees order by age asc;
select * from employees order by age desc;
-- Sorting the data based on multiple columns
select * from employees order by department asc, age asc;
-- Sorting sales data based on age
select * from employees where department = 'sales' order by age asc;
-- Sorted age data of not null values
select * from employees where age is not null order by age asc ;
-- Sorted age data of not null values with limit 5
select * from employees where age is not null order by age asc limit 5;
-- Sorting the data based on the length fo the name
select* from employees order by length(name);