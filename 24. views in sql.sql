use swiggy;
select * from restaurants;


 -- 1. create the view 
drop view if EXISTS rest;
 create view rest as (select name,city , rating, rating_count as 'orders', cuisine, cost, cost * rating_count as 'revenue' from restaurants );
select * from rest;

-- 2. create a view for end user 
drop view if exists user_view;
create view user_view as (select name,city , rating, rating_count as 'orders', cuisine, cost from restaurants );
select * from user_view;
 -- 3. create the view of sweet dishes 
drop view if exists rest_of_sweet;
create view rest_of_sweet as (select * from restaurants  where cuisine in('Sweets','Desserts','Bakery', 'Ice Cream'));
select * from rest_of_sweet;

select DISTINCT cuisine from restaurants ;

 -- 4. create the view of top 100 restaurants 
drop view if exists top_100;
create view top_100 as (select * from restaurants order by rating_count desc limit 100);
select * from top_100;

 -- 5. create the view of restraunts atleast 100 people visited 
 drop view if exists least_100;
create view least_100 as (select * from restaurants order by rating_count asc limit 100);
select * from least_100;

-- 6.create a view of top 1000 most expensive restaurants
 drop view if exists top_1000;
create view top_1000 as (select * from restaurants order by cost desc limit 1000);
select * from top_1000;

-- 7. create a view of top rated restaurants of each city 
drop view if exists top_rated_rest_as_per_city;
CREATE VIEW top_rated_rest_as_per_city AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY city ORDER BY rating DESC) AS 'rank'
    FROM restaurants
) AS ranked_table
WHERE ranked_table.rank = 1;
select * from top_rated_rest_as_per_city;


