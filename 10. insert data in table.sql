Drop table if exists Employees;
create table if not exists Employees(
	employee_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    department_id int,
    hire_date date);
select * from employees;

-- insert values in single row 
insert into Employees (employee_id,first_name, 
last_name, department_id,hire_date)
 values
	(1, 'Ashish','jangra',1 ,'2021-07-16');
select * from employees;

-- insert multiple rows 

insert into Employees(employee_id, first_name,
last_name,department_id,hire_date)
Values 
(2, 'Manish','kumar',2,'2021-10-16'),
(3,'sakshi','awasthi',2,'2021-10-16'),
(4,'Avneet','kour', 3,'2021-10-16');
select * from employees;

-- adding partial data
insert into Employees (first_name,last_name)
values 
('Ashish', 'Jangra');
select* from employees;

-- storing data in different order 
insert into employees (department_id,hire_date,last_name,first_name)
values 
	(11,'2022-10-10','Sakari','prakash');
select * from employees;

-- insert data without order 
insert into employees()
	values (11,'Deepanshu','Agrawal',1,'2026-3-12');
select* from employees;

-- adding current data with default values 
create table exampletable (
	employee_id serial primary key,
    name varchar(50) not null,
    hire_date timestamp default current_timestamp,
    status varchar(20) default 'Active');
select * from exampletable;

insert into ExampleTable(name) values ('Ashish');
Select * from ExampleTable; 

insert into ExampleTable(name) values ('Ashish'),('Manish'),('Parag');
Select * from ExampleTable;

insert into ExampleTable(name,status) values ('Ashish','Inactive'),('Manish','Inactive'),('Parag','Inactive');
Select * from ExampleTable; 