-- create database gfg;
use gfg;
-- showing the Dataset
select * from data;
# sowing specific columns
select product_name,brand_name from data;
# showing specific column in specific order 
select brand_name,product_name from data;
# create new column wit mathenetical function | making discount Amount
select product_name, brand_name,marked_price,discounted_price,
marked_price - discounted_price as discounted_amount from data ;
# create new column wit mathenetical function | making rating count  + rating
select product_name, brand_name,rating, rating_count ,
rating * rating_count as rating_filter from data ;
--  create new column wit mathenetical function | making discount percentage
select product_name, brand_name,marked_price,discounted_price,
(((marked_price - discounted_price)/marked_price))*100 as discounted_percent from data; 
-- finding unique values 
select DISTINCT(brand_name) as unique_brand  from data;
-- adding where clause 
select product_name, brand_name , marked_price, 
discounted_price from data where brand_tag = 'adidas';
-- adding  distinct with where \unique products served as adidas
select DISTINCT(product_tag), brand_name from data where brand_tag = 'adidas';
-- adding distinct with where | unique prouct serves by adidas 
select count(DISTINCT(product_tag)) from data where brand_tag = 'Adidas';
-- product with multiple where cluse with and 
select product_name, brand_name , marked_price, discounted_price from data where brand_tag = 'Adidas' and discounted_price > 5000;
select product_name, brand_name , marked_price, discounted_price from data where 
discounted_price > 5000 and discounted_price < 8000;
select product_name, brand_name , marked_price, discounted_price from data where 
discounted_price between 5000 and 8000;

-- adding more filters 
select product_name, brand_tag, marked_price, discounted_price from data 
where (discounted_price between 5000 and 8000) and brand_tag = 'Adidas' and rating > 4;

-- lets go one step ahead 
select product_name, brand_tag , marked_price, discounted_price from data
 where (discounted_price between 3000 and 5000)
 and brand_tag = 'Puma'
 and rating > 4
 and rating_count > 10;

-- one more 
select count(DISTINCT(product_tag)) from data where brand_tag = 'adidas';
-- using or 
select product_name , product_tag , discounted_price from data
where( brand_tag = 'Adidas' or brand_tag = 'puma') and discounted_price between 3000 and 5000;
-- using not 
select product_name , product_tag , discounted_price from data
where not ( brand_tag = 'Adidas' or brand_tag = 'puma') and discounted_price between 3000 and 5000; 

-- using in 
select product_name , product_tag ,brand_tag, discounted_price from data
where brand_tag IN ('Adidas','puma') and discounted_price between 3000 and 5000;

-- using not in 
select product_name , product_tag ,brand_tag, discounted_price from data
where brand_tag not IN ('Adidas','puma') and discounted_price between 3000 and 5000;