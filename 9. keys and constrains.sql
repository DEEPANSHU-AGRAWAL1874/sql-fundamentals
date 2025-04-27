-- primary key 
drop table if exists employee;
create table if not exists employee(
	employee_id int primary key ,
    name varchar(50),
    department varchar(50));
select * from employee;

composite key 
 drop table if exists Orders ;
Create table Orders(
	 order_id Serial,
    customer_id int,
      order_date date,
     primary key(order_id,customer_id));
select * from Orders ;
 drop table if exists Orders;


-- Foreign key 
create table Orders (
order_id serial primary key,
customer_id int,
order_date date,
foreign key(customer_id) references employee (employee_id));
select*from Orders;

-- unique constraints 
alter table employee add column email Varchar(50) unique;

select * from employee;

create table if not exists Employees(
	employee_id serial primary key,
    email varchar(50) unique,
    phone int unique,
    name varchar(50),
    department varchar(50),
    unique(email, phone));
    select * from Employees;
    
-- check constrains
drop table if exists  employees ;
create table if not exists Employees(
	employee_id serial primary key,
    email varchar(50) unique,
    age int check(age >= 18),
    phone int unique,
    name varchar(50),
    department varchar(50),
    unique(email, phone));
    select * from Employees;