create database swiggy ;
use swiggy;
select * from restaurants ;


-- 1. Which restaurant of abohar is visied by least number of people?
select * from restaurants where city = "abohar" and rating_count =(select  min(rating_count) from restaurants where city  = 'abohar'); 

-- 2. Which restaurant has generated maximum revenue all over india?
select * from restaurants where cost * rating_count = (select max(cost * rating_count) from restaurants);

-- 3. How many restaurants are having rating more than the average rating?
SELECT  * from restaurants where rating > (select avg(rating) from restaurants);

-- 4. Which restaurant of Delhi has generated most revenue?
select * from restaurants where  city  = 'delhi' and cost * rating_count = (select max(cost * rating_count) from restaurants where city = 'delhi');

-- 5. Which restaurant chain has maximum number of restaurants?
SELECT name, count(name) as 'no._of_chain' from restaurants group by name ORDER BY count(name) desc limit 10;

-- 6. Which restaurant chain has generated maximum revenue?
select name , sum(cost * rating_count) as 'revenue' from restaurants group by name order by revenue desc limit 10;

-- 7. Which city has maximum number of restaurants?
select city ,count(*) as 'no_of_cities' from restaurants group by city order by count(*) desc limit 10;

select city ,count(city) as 'no_of_cities' from restaurants group by city order by count(city) desc limit 10;

-- 8. Which city has generated maximum revenue all over india?
select city , sum(cost*rating_count) from restaurants  group by city order by sum(cost*rating_count) desc limit 10;

-- 9. List 10 least expensive cuisines?
SELECT cuisine, avg(cost) from restaurants group by cuisine order by avg(cost) ASC limit 10;

-- 10. List 10 most expensive cuisines?
SELECT cuisine, avg(cost) from restaurants group by cuisine order by avg(cost) deSC limit 10;

-- 11. What is the city is having Biryani as most popular cuisine
select city , avg(cost), count(*) from restaurants where cuisine = 'Biryani' GROUP BY city order by count(*) DESC;

-- 12. List top 10 unique restaurants with unique name only thorughout the dataset as per generate maximum revenue (Single restaurant with that name)
select name , sum(cost * rating_count ) as 'revenue' from restaurants group by name having count(name) = 1 order by revenue desc limit 10;
