use swiggy;
select * from restaurants;

-- 1. rank every restaurants from most expensive to least expensive 
select *, rank() over(order by cost desc )  from restaurants ;

-- 2. rank every restaurants from most visited to least  visited 
select * ,rank() over (order by rating_count desc ) as 'rank' from restaurants ;

-- 3. rank every restaurants from most expensive to least expensive as per the city 
select * , rank() over(PARTITION BY city order by cost desc) as 'rank' from restaurants;

-- 4. dense rank  every restaurantsfrom most expensive toleast expensive as per their city 
select * , dense_rank() over(order  by cost desc) from restaurants;

-- 5. row number every restaurants from most expensive to least expensive as per the city 
select * , row_number() over(PARTITION BY city ORDER BY cost desc ) as 'rank'  from restaurants ;

-- 6. rank every restaurants from most expensive to least expensiveas pe the city along with its city [Adilabad -1 , Adilabad - 2]
select * ,concat(city, ' - ',row_number() over(PARTITION BY city  order by cost desc)) as 'rank' from restaurants;

-- 7.FInd top 5 resturants of every city as per their revenue 
select * , cost * rating_count as 'revenue',
ROW_NUMBER() over(PARTITION BY city order by rating_count*cost desc ) as 'rank'
 from restaurants;

select * from
    (select * , cost * rating_count as 'revenue',
    ROW_NUMBER() over(PARTITION BY city order by rating_count*cost desc ) as 'rank'
    from restaurants) t
where t.rank <6; 
 
-- 8. find top 5 restaurants of every cuisine as per their revenue 
select * from
    (select * , cost * rating_count as 'revenue',
    ROW_NUMBER() over(PARTITION BY cuisine order by rating_count*cost desc ) as 'rank'
    from restaurants) t
where t.rank <6; 

