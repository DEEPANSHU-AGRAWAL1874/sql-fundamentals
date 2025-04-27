use swiggy;
SELECT * from restaurants;

-- 1. find the restaurent id from the link 
select *, substring_index(link, '-', -1) as id from restaurants;

-- 2. updating the restaurant_id in the original table 
create table if not  exists rest_1 as 
        (select *, substring_index(link, '-', -1) as new_id from restaurants);
select * from rest_1;
drop table if exists rest_2;
-- 3. clean the name column and update it on the TABLE
create table if not exists rest_2 as 
(select*, (lower(trim(name))) as new_name from rest_1 );
select * from rest_2;

-- 4. clean the city and cuisine columnm and update it on the table 
create table if not exists rest_3 as 
(select new_id , new_name,  (lower(trim(city))) as new_city ,rating, rating_count, lower(trim(cuisine)) as clean_cuisine, cost  from rest_2 );
select * from rest_3;

-- 5. remove the odd cuisines from the table 
select distinct clean_cuisine from rest_3;
create table if not exists rest_4 as 
    (select * from rest_3 where clean_cuisine not in ('combo' ,'na' ,'discount offer from the garden cafe xpress kankurgachi' ,
    'svanidhi food vendor ' , 'tex-mex'
,'special discount fom the (hotel swagath)' , ' free delivery ! limited stock !'
));
select * from rest_4;
drop table  if exists rest_1,rest_2,rest_3;
