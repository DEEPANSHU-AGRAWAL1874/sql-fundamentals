select * from messy_indian_dataset;

-- finding only unique rows
select distinct * from messy_indian_dataset ;

-- finding unique vallues based on id 
SELECT 
    id
FROM
    messy_indian_dataset
GROUP BY id
ORDER BY id;

-- finding unique values based on name 
SELECT 
    name
FROM
    messy_indian_dataset
GROUP BY name
ORDER BY name;

-- finding unique values based on id using rank 
select* from (
                select * , ROW_NUMBER() over(partition by id order by id ) as 'rank'from messy_indian_dataset
                ) as subtable
                where subtable.rank = 1;
                
                
-- finding unique values based on multiple columns | Rajesh patel and patil 
select* from (
                select * , ROW_NUMBER() over(partition by id,name order by id ) as 'rank'from messy_indian_dataset
                ) as subtable
                where subtable.rank = 1;
