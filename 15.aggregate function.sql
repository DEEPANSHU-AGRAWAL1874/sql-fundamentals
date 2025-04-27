-- showing the dataset
use gfg ;
select * from gfg.data;
-- finding the number of products in the dataset 
-- count
select count(*) as total_products from data ;
select product_name from data ;
select count(product_name) from data;

-- finding the average discount price in the data set 
select avg(discounted_price) as average_price from data ;
select avg(marked_price) as average_price from data ;
 
-- find the most expensive product on myntra 
select max(discounted_price) as average_price from data;
select max(marked_price) as average_price from data ;

-- find the least expensive product on myntra 
select MIN(discounted_price) as average_price from data;
select min(marked_price) as average_price from data ;
-- finding the total rating count of al product 
select sum(rating_count) as total_people_rated from data;

-- finding the unique brand
select distinct(brand_name) as unique_brands from data;
select count(distinct(brand_name)) as total_brands  from data;