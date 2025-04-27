use swiggy;
select * from restaurants;

-- create new column contaiing average rating of restaurents through the dataset 
select *, round(avg(rating)  over(),2) as 'avg_rating'  from restaurants;

-- create new column contaiing average rating_count of restaurents through the dataset 
select *, round(avg(rating_count)  over(),2) as 'avg_rating_count'  from restaurants;

-- create new column contaiing average cost of  restaurents through the dataset 
select *, round(avg(cost) over(),2) as 'avg_cost'  from restaurants;

-- creating the new coolumn for averege,min, max of cost , rating,rating_count of reataurants through the dataset
select id, name,city , cuisine,rating,
    round( max(rating) over(),2) as 'max_rating',
    round( avg(rating) over(),2) as 'avg_rating',    
    round( min(rating) over(),2) as 'min_rating',

    round( max(cost) over(),2) as 'max_cost',
    round( avg(cost) over(),2) as 'avg_cost',    
    round( min(cost) over(),2) as 'min_cost'
    
from restaurants;

-- creating column containing average cost of the city where the specific restaurents is from 
select * ,round(avg(cost) over(partition by city )) as 'avg_cost' from restaurants ;

-- create column containing avg cost of the cuisine which that specifies restaurants is serving 
select * ,round(avg(cost) over(partition by cuisine )) as 'avg_cost' from restaurants ;

--  create both columns together 
select * ,round(avg(cost) over(partition by city )) as 'avg_cost_city' ,
round(avg(cost) over(partition by cuisine )) as 'avg_cost_cuisine' from restaurants ;

-- list the restaurants whose cost is more than the average cost of the retaurants 
select * from restaurants where cost > (select avg(cost) from restaurants);
 select * from (select*,avg(cost) over() as 'avg_Cost' from restaurants) t where t.cost > t.avg_cost;
 
-- list the restaurants whose cuisine cost is more than the average cost 
select * from (select * , avg(cost) over(PARTITION BY cuisine) as 'avg_cost' from restaurants) t where t.cost > t.avg_cost;

