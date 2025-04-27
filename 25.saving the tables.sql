-- select all the columns from the restaurants table with alias r
use swiggy;
select * from restaurants ;

-- create a new table name 'sirsa_restaurants ' containing restaurants of sirsa only 
drop table if exists sirsa_restaurants ;
create table if not exists sirsa_restaurants as
select * from restaurants where city = 'sirsa';
select * from sirsa_restaurants ;


-- create a new table name 'city_statistics' containing aggregated statistics for each city 
drop table if exists city_statistics;
create table if not exists city_statistics as
select city, avg(rating) as avg_rating,count(*) as nu_of_rest  from restaurants group by city;
select * from city_statistics ;


-- create a new table named ' expensive_restraunts ' containing restaurantswith a cost greater than 500
drop table if exists expensive_restaurats ;
create table if not exists expensive_restaurats  as
select * from restaurants where cost > 500;
select * from expensive_restaurats  ;


-- --------------------------------------------------------------------------------------------------------------------------------------------------------------
-- alias
-- Select all columns from the 'restaurants' table with alias 'r'
select * from restaurants as r ;
-- Select the city and the average cost of restaurants in each city using table aliases and aggregate functions
select city,avg(cost) from restaurants as rest group by city  ;
 
-- Select restaurants that have a higher rating than the average rating of all restaurants in the same city using self-referencing query with table aliases

select rest.* from restaurants as rest
where rest.rating > (select avg(rating) from restaurants where city = rest.city);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- temperary table 

create  TEMPORARY table temp_restaurants as select * from restaurants WHERE city = 'sirsa';
select *from temp_restaurants;

-- create a new temperary table named 'sirsa_restaurants' ontaining restrauants of sirsa only
create  TEMPORARY table temp_restaurants_sirsa as select * from restaurants WHERE city = 'sirsa';
select *from temp_restaurants_sirsa;
-- create a new temperary table named 'city statics ' containing aggrigate ststistics of each city 
drop table  if exists city_stats; 
create  TEMPORARY table city_stats as select city , avg(rating) as 'avg_rating',count(*) as no_of_restaurants from restaurants group by city ;
select *from city_stats;
-- create a new table named 'expensive_restraurants' containing with cost greater than 500
drop table if exists temp_expensive_restaurats ;
create  TEMPORARY table if not exists temp_expensive_restaurats  as
select * from restaurants where cost > 500;
select * from temp_expensive_restaurats  ;