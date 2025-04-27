select * from messy_indian_dataset;

-- find the rows with missing values in any column 
select * from messy_indian_dataset where name is null or age is null or gender is null or email is null or phone_number is null
 or state is null or purchase_amount is null or purchase_date is null or city is null;

-- find rows without missing values 
select * from messy_indian_dataset where name  is not null and age is not null  and gender is not null  and email is not null  and phone_number is not null
 and state is not null  and purchase_amount is not null  and purchase_date is not null and city is not null;
 
-- saving table without null values 
create table if not exists clean_data  as 
        select * from messy_indian_dataset where name  is not null and age is not null  and gender is not null  and email is not null  and phone_number is not null
 and state is not null  and purchase_amount is not null  and purchase_date is not null and city is not null;
select * from clean_data ; 

-- filling missing age all with specific values 
update messy_indian_dataset set age = coalesce(age , 0);
select * from messy_indian_dataset;

-- filling nulls with specific values 
update messy_indian_dataset 
    set 
        name  = coalesce(name, 'Unknown'),
        gender = coalesce(gender ,'unknown'),
        email = coalesce( email,'unknown'),
        phone_number = coalesce(phone_number , 'unknown'),
        state = coalesce(state, 'unknown'),
        city = coalesce(city, 'unknown'),
        purchase_date = coalesce(purchase_date ,'2023-010-01');
select * from messy_indian_dataset;

-- filling null amount with average amount VALUES

update messy_indian_dataset
set purchase_amount =(    
    select avg(purchase_amount) from 
        (
        select avg(purchase_amount)  as avg_amount from messy_indian_dataset
        )
    as subquery
    ) where purchase_amount = '0.0';
select * from messy_indian_dataset;

-- fill null city with most frequent city 
UPDATE messy_indian_dataset 
SET 
    city = (SELECT 
            most_frequent_city
        FROM
            (SELECT 
                city AS most_frequent_city, COUNT(*) AS 'frequency'
            FROM
                messy_indian_dataset
            WHERE
                city IS NOT NULL
            GROUP BY city
            ORDER BY COUNT(*) DESC
            LIMIT 1) AS subquery);