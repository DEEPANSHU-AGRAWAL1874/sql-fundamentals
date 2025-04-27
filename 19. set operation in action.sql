select * from users_2021;
select * from users_2022;
SELECT * from users_2023;

-- union | remove the duplicates and join them 

select * from users_2021 union select * from users_2022;
select * from users_2021 union select * from users_2023;
select * from users_2022 union select * from users_2023;
select * from users_2021 union select * from users_2022 union select * from users_2023;

-- union all | it replicates the data 
select * from users_2021 union all select * from users_2022;

select * from users_2021 union all select * from users_2022 union all select * from users_2023;

-- EXcept | show all the data of dominatinng 
select * from users_2021 except select * from users_2022;
select * from users_2022 except select * from users_2021;

select * from users_2021 except select * from users_2023;
select * from users_2023 except select * from users_2021;
select * from users_2021 except select * from users_2022 except select * from users_2023;

select * from users_2023 except select * from users_2022 except select * from users_2021;

-- Intersect | showing the common data 

select * from users_2021 intersect select * from users_2022;
select * from users_2022 intersect select * from users_2023;
select * from users_2023 intersect select * from users_2021;

select * from users_2021 intersect select * from users_2022 intersect select * from users_2023;

-- 1. lis t the new  users added in 2022
select * from users.users_2022 except select * from users.users_2021;

-- 2. list the new user added in 2023 
select * from users_2023 except select * from users_2022;

-- 3. list the user who left us 
select  * from users_2021 except select * from users_2022 except select * from users_2023;

-- 4.  list all he users that are there throughout the year 2021 & 2022
select * from users_2022 union  select* from users_2021;

-- 5. list all the users that are there throughout the database 
select * from users_2021 union select * from users_2022 union select * from users_2023;

-- 6. list the users that are there from last 3 years 
select  * from users_2021 intersect select * from users_2022 intersect select * from users_2023;

-- 7. list the all the users except that users who are there with us from 3 years 
select * from users_2021 union select * from users_2022 union select * from users_2023 except
select  * from users_2021 intersect select * from users_2022 intersect select * from users_2023;

 -- operators with join 

select * from users_2021 as t_2021 left join users_2022 as t_2022 on t_2021.UserID = t_2022.UserID
union
select * from users_2021 as t_2021 right join users_2022 as t_2022 on t_2021.UserID = t_2022.UserID;

