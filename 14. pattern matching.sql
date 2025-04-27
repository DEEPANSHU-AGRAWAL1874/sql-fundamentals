use gfg;
select * from data;

-- find the productwhere the prooduct name ends with s 
select * from data where product_name like '%s';
-- find the productwhere the prooduct name starts with s 
select * from data where product_name like 's%';

-- find the product where the brand name contains 'ad'
select * from data where brand_name like '%ad%';

-- find the product where the name starts with P and ends with s 
select * from data where product_name like 'p%s';

-- find the product where the product name contains 'sho'
select * from data where product_name like '%SHO%';

-- find the product where the brand name is exactly of 6 characters long 
select * from data where brand_name like '______';
-- find the brand name where the second haracter of brandname is S
select * from data where brand_name like '_s%';
-- 