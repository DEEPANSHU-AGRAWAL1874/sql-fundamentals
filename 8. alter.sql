drop table if exists employee;
create table employee(
	employee_id int ,
	name varchar(50) not null, 
	age int check (age >=18),
	department varchar(50));
select * from employee; 
-- adding new column to table 
alter table employee add column mail varchar(50);
select * from employee;
-- rename column 
alter table employee rename column employee_id to id;
select * from employee;
-- drop the column 
alter table employee drop column mail;
select * from employee;