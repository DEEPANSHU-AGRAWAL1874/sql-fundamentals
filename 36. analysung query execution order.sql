select name , city 
from messy_indian_dataset;
-- from 
-- select 

select name , city , purchase_amount 
from messy_indian_dataset
    where purchase_amount > 1000;
-- from 
-- where 
-- select 


select name , city , purchase_amount 
from messy_indian_dataset
    where purchase_amount > 1000
    order by purchase_amount desc;
-- from 
-- where 
-- select 
-- order by 

select city , avg(purchase_amount) as avg_purchase 
    from messy_indian_dataset
        group by city ;
-- from        
-- group by 
-- SELECT

select city , avg(purchase_amount) as avg_purchase 
    from messy_indian_dataset
        group by city 
        having avg(purchase_amount) >1000;
        
-- from        
-- group by 
-- having 
-- SELECT

drop table states ;
create table states (state  varchar(50), region varchar(50) );
insert into states (state, region) values ('Maharastra' ,'west'),('delhi' ,'north'), ('karnataka', 'south'),
                                            ('westbengal','east'), ('rajasthan','west');
select m.name,m.city ,s.region 
    from messy_indian_dataset m
        join states s on m.states = s.states;
-- from 
-- join 
-- select

SELECT name, city, purchase_amount
	FROM messy_indian_dataset
		WHERE purchase_amount > (SELECT AVG(purchase_amount) FROM messy_indian_dataset);
-- 1. Subquery(FROM)
-- 2. Subquery(SELECT)
-- 3. FROM
-- 4. WHERE
-- 5. SELECT



-- Final

-- Order of Execution
-- 1. FROM: Determines the source tables and joins if any.
-- 2. WHERE: Applies row filtering.
-- 3. GROUP BY: Groups rows by specified columns.
-- 4. HAVING: Applies group filtering.
-- 5. SELECT: Determines which columns to include in the final result set.
-- 6. ORDER BY: Sorts the result set.
-- 7. LIMIT: Restricts the number of rows in the result set.