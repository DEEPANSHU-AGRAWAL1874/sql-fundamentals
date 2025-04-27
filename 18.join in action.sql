select * from users_2021;
select * from users_2022;
select * from users_2023;

-- User 2021 & 2022

select  * from users_2021 as t_2021 INNER join users_2022 as t_2022 on t_2021.UserID = t_2022.UserID;
select  * from users_2022as t_2022 INNER join users_2021 as t_2021 on t_2021.UserID = t_2022.UserID;

-- User 2022 & 2023
select  * from users_2022 as t_2022 INNER join users_2023 as t_2023 on t_2022.UserID = t_2023.UserID;

-- User 2021 & 2023
select  * from users_2021 as t_2021 INNER join users_2023 as t_2023 on t_2021.UserID = t_2023.UserID;

-- User 2021, 2022 & 2023 
select * from users_2021 as t_2021 inner join users_2022 as t_2022 on t_2021.UserID = t_2022.UserID
inner join users_2023 as t_2023 on t_2023.UserID = t_2021.UserID;

-- left join
select * from users_2021 left join users_2022 on users_2021.UserID = users_2022.UserID;

select * from users_2023 left join users_2021 on users_2023.UserID = users_2021.UserID;

-- right join 

select * from users_2021 right join users_2022 on users_2021.UserID = users_2022.UserID;
select * from users_2023 right join users_2021 on users_2023.UserID = users_2021.UserID;

-- cross inner join

select * from users_2021 left join users_2022 on users_2021.UserID = users_2022.UserID;
select * from users_2021 right join users_2022 on users_2021.UserID = users_2022.UserID;

select * from users_2021 left join users_2022 on users_2021.UserID = users_2022.UserID
union
select * from users_2021 right join users_2022 on users_2021.UserID = users_2022.UserID;
