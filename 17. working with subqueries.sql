-- basic sub query: find the average rating of the products 
select avg(rating) as 'avg_rating' from gfg.products;

-- subqueryin where clause : find the brand names with a rating higher than the average rating 
select brand_name from products where rating > (select avg(rating) as 'avg_rating' from gfg.products);

-- subquery in select clause: retreve the product name along with the rating of the prduct s;
select product_name,rating , (select avg(rating) from products) as 'avg_rating'
from gfg.products;
-- subquery with multiple results : find the total rating of products for each brand compared to the overall average rating count
select brand_name,
	(select sum(rating_count) from gfg.products where brand_name = p.brand_name) as total_rating_count
from (select distinct brand_name from gfg.products) as p;
select brand_name,
	(select sum(rating_count) from gfg.products where brand_name = p.brand_name) as total_rating_count
from (select distinct brand_name from gfg.products) as p;