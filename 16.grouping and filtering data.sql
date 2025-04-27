use gfg; 
SELECT * from products ;

-- 1. Finding the names of unique brands
select DISTINCT brand_name from products ;

-- 2. Finding the number of unique brands
select count(DISTINCT brand_name)from products;

-- 3. Finding the number of products in each brands
select brand_tag ,count(product_tag) from products group by brand_tag;

-- 4. Finding the top 5 brand who has the most number of products | different product in their inventory
select brand_tag , count(product_tag) as 'products' from products group by brand_tag 
order by products desc
limit 5;

-- 5. Finding the top 5 brand who sold the most number of products
select brand_tag , count(rating_count) as 'product_sold' from products group by brand_tag 
order by product_sold desc
limit 5;

-- 6. Finding the top 5 most expensive brands based on their discounted price
select brand_tag ,round(avg(discounted_price)) as 'average_price' from products group by brand_tag 
order by average_price  desc
limit 5;

-- 7. Finding the top 5 least expensive brands based on their discounted price
select brand_tag ,round(avg(discounted_price)) as 'average_price' from products group by brand_tag 
order by average_price  asc
limit 5;

-- 8. Finding the top 10 best-selling product categories 
select product_tag,sum(rating_count) as 'product_sold' from products group by product_tag 
order by product_sold  desc
limit 10;

-- 9. Finding the top 10 brands who gives maximum discount
select brand_tag ,avg(discount_percent) as 'avg_discount' from products group by brand_tag 
order by avg_discount  DESC
limit 5;

-- 10. Finding the top 5 most expensive product categories
SELECT product_tag , avg(discounted_price) as 'average_price' 
from products group by product_tag 
ORDER BY average_price desc
limit 5;

-- 11. Brand Report Card
select brand_tag ,
    sum(rating_count) as 'people_rated',
    min(marked_price) as 'min_mar_price',
    avg(marked_price) as 'avg_mar_price',
    max(marked_price) as 'max_mar_price'
from products group by brand_tag ;

-- 12. Which product_category of any brand is sold the most?
select brand_tag, product_tag , sum(rating_count) as 'people_rated' from products 
GROUP BY  brand_tag , product_tag 
order by people_rated desc
limit 10;

-- 13. list of top 5 brand which has sold most no. of tshirts 
select brand_tag, product_tag, sum(rating_count) as 'orders' , avg(discounted_price) as 'average_price'
from products 
where product_tag = 'tshirts'
GROUP BY brand_tag
order by orders desc limit 10;

-- 14. list of top  5 brands which has sold most of shirts 
select brand_tag, product_tag, sum(rating_count) as 'orders' , avg(discounted_price) as 'average_price'
from products 
where product_tag = 'shirts'
GROUP BY brand_tag
order by orders desc limit 5;

--  15. list of top 5 brands which sold most no. jeans 
select brand_tag, product_tag, sum(rating_count) as 'orders' , avg(discounted_price) as 'average_price'
from products 
where product_tag = 'jeans'
GROUP BY brand_tag
order by orders desc limit 10;

-- 16. lis top 5 brands whish has sold most number of dresses 
select brand_tag, product_tag, sum(rating_count) as 'orders' , avg(discounted_price) as 'average_price'
from products 
where product_tag = 'dresses'
GROUP BY brand_tag
order by orders desc limit 10;

-- 17. most popular product name listed on mintra 
select product_name , count(product_name) as 'name_count' from products 
group by product_name order by name_count desc limit 10;

-- 18.number of products sold forevery rating (0 -5)
select rating, count(rating) as 'frequency' from products 
group by rating order by frequency asc ;

-- 19. nimber of product sold for every rating by nike 
select rating, count(rating) as 'frequency' from products 
where brand_tag = 'nike' 
group by rating order by frequency asc ;

-- 20. number of product sold for every rating in tshirts catagory 
select rating, rating_count as 'frequency' from products 
where product_tag = 'tshirts' 
group by rating order by rating asc ;

-- 21. Relation between price of the tshirts and its rating wrt to people rated 
select product_tag  , rating, round(avg(rating_count)) as 'product_count',
round(avg(discounted_price)) from products
where product_tag = 'tshirts'
group by rating
order by rating asc;

 -- 22. find the average rating for each product catagory (product_tag ) along with the number of prducts and total rating
select product_tag, avg(rating) as 'avg_rating', count(*) as 'total_product', sum(rating_count) as 'total_rating_count'
from products
group by product_tag
order by avg_rating asc; 

-- 23. finf the bnd with the highest average rating among the products with a discounted price greater than 5000
select brand_tag, avg(rating) as 'avg_rating', sum(rating_count)
from products
where discounted_price > 5000
group by brand_tag
order by avg_rating desc; 









