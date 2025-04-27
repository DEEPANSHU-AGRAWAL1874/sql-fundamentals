use employees;
select * from employees;
-- basic case for sales team 
select name,
case department
	when 'sales' then 'sales team'
    else 'other'
end as department from employees;

-- basic case for sales and marketing team 
select name ,
case department
	when 'sales' then 'sales team'
    when 'marketing' then 'marketing team'
    else 'other'
end as department from employees;

-- case with respect to age 
select name,
case 
	when age <30 then 'young'
    when age >=30 and age <= 40 then 'mid-aged'
	else 'Senior'
end as employee_name from employees;

-- nested cases 
select name ,
case 
	when age < 30 then 
		case 
			when department = 'seles' then 'Jr Sales'
			else 'Junior'
		end
	when age >=30 and age <= 40 then 'Middle'
    else 'Senior'
end as employee_name from employees;


-- dealing with null department 
select name ,
case 
	when department is null then 'No Department assign'
    else department
end as department_status from employees;
