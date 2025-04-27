use swiggy;
DROP TABLE IF EXISTS messy_indian_dataset;
CREATE TABLE IF NOT EXISTS messy_indian_dataset (
    id INT,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    purchase_amount DECIMAL(10, 2),
    purchase_date DATE
);

-- Insert messy data into the table for Indian users
INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
(1, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(2, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', NULL, '2023-02-15'),
(3, 'Amit Kumar', 35, 'Male', 'amit@example.com', '9876543212', 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(4, 'Ritu Singh', 28, 'Female', NULL, '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(5, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(6, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', 800.00, '2023-02-15'),
(7, 'Amit Kumar', NULL, 'Male', 'amit@example.com', NULL, 'Bangalore', 'Karnataka', 750.25, '2023-03-25'),
(8, 'Ritu Singh', 28, 'Female', 'ritu@example.com', '9876543213', 'Kolkata', 'West Bengal', 1200.75, '2023-04-10'),
(9, 'Ankit Tiwari', 32, 'Male', 'ankit@example.com', '9876543214', 'Lucknow', 'Uttar Pradesh', 900.00, '2023-05-20'),
(10, 'Swati Gupta', 27, 'Female', 'swati@example.com', '9876543215', 'Jaipur', 'Rajasthan', 1500.00, NULL);
select * from messy_indian_dataset;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to calculate age 
drop function if EXISTS CalculateAge;
delimiter //
create function  CalculateAge(birthdate Date) returns int
DETERMINISTIC
begin
    DECLARE age int;
    set age = YEAR(curdate()) - YEAR(birthdate) ;
    return age;
end  //
delimiter ;


select CalculateAge('1990-05-15') as age;
select CalculateAge('2004-07-18') as age;


-- function to calculate tax
drop function if EXISTS CalculateTax;
delimiter //
create function CalculateTax(amount decimal(10,2),tax_rate decimal(5,2))
returns decimal(10,2) 
DETERMINISTIC
begin
    declare tax decimal(10,2);
    set tax = amount * (tax_rate/100);
    return tax;
end //
delimiter ;
select CalculateTax(1000,18);
 
    
-- function to catagorise age 
drop  function if exists  GetAgeCategory ;
delimiter //
create function GetAgeCategory(age int ) returns varchar(20)
DETERMINISTIC
begin   
    declare category varchar(30);
    if age < 18 then set category = 'Child';
    elseif age between 18 and 65 then set category = 'Adult';
    else set category = 'senior';
    end if;
    return category;
end //
delimiter ;
select GetAgeCategory(89) as category;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- procedures 

-- 1, creating your first procedure 
drop procedure if exists GetUserByID;
delimiter // 
    create procedure GetUserByID(IN userID INT)
    begin 
        select * from messy_indian_dataset where id = userID;
        end // 
delimiter ;

 call GetUserByID(1) ;

-- 2. procedure to update purchase amount by percentage 
drop procedure if exists UpdatePurhaseAmount;
delimiter // 
    create procedure UpdatePurchaseAmount(IN percentage Decimal(5,2))
    begin 
        update messy_indian_dataset
            set purchase_amount = purchase_amount * (1 +percentage/100);
            select * from messy_indian_dataset;
        end // 
delimiter ;

 call UpdatePurchaseAmount(10) ;

-- 3. deleting low_rated restaurants and loggiing
create table if not exists deleted_rest_log(
                                    id int,
                                    name varchar(225),
                                    rating  decimal(3,2),
                                    deletion_time timestamp);
use swiggy;
drop procedure if exists Delete_low_rated_rest;
delimiter // 
    create procedure Delete_low_rated_rest(min_rating decimal(3,2))
    begin 
        insert into deleted_rest_log(id, name, rating,deletion_time)
            select id, name ,rating, now() from swiggy.restaurants 
                where rating <min_rating;
        delete from swiggy.restaurants
        where rating < min_rating;
        end // 
delimiter ;
call Delete_low_rated_rest(3.0);
SELECT * from restaurants;
select * from deleted_rest_log;
-- usage : Deleting restaurants with a rating below 3.0    

    
    