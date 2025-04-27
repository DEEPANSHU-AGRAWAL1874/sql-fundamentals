SELECT * FROM messy_indian_dataset;
 
-- update name 
update messy_indian_dataset
    set name  = trim(name),-- trin( ) function removes the extra spaces 
        name =  LOWER(name);-- lowe rcase all string 
SELECT * FROM messy_indian_dataset; 

-- update gender 
update messy_indian_dataset
    set gender = lower(trim(gender));
SELECT * FROM messy_indian_dataset; 

-- update city ,state

update messy_indian_dataset
    set city = lower(trim(city)),
        state = lower(trim(state));
SELECT * FROM messy_indian_dataset; 

-- cleam and update email

update messy_indian_dataset
    set email = trim(lower(REGEXP_REPLACE(email,'[^a-zA-Z0-9@.]+', '')));
SELECT * FROM messy_indian_dataset; 

-- clean phone
update messy_indian_dataset
    set phone_number = regexp_replace(phone_number,'[^0-9]+', '');
SELECT * FROM messy_indian_dataset; 

-- extracting user name 
alter table messy_indian_dataset 
	add column username varchar(30);
update messy_indian_dataset
    set username = SUBSTRING_INDEX(email, '@',1);
SELECT * FROM messy_indian_dataset; 


-- create location 
alter TABLE messy_indian_dataset
    add COLUMN location VARCHAR(50);
    
update messy_indian_dataset
    set location = concat(city,',',state);
SELECT * FROM messy_indian_dataset; 

-- amount_without_gst
alter table messy_indian_dataset
    add column without__gst decimal(10,2);
    
update messy_indian_dataset
    set without__gst = purchase_amount *.82;
    
SELECT * FROM messy_indian_dataset; 

-- adding expiry date 
alter table messy_indian_dataset
    add column expiry_date date;
update messy_indian_dataset
    set expiry_date  = date_add(purchase_date, interval 3 year);
SELECT * FROM messy_indian_dataset; 

-- removing rows with invalid phone numbers 
delete from messy_indian_dataset
    where  length(phone_number) != 10 or phone_number REGEXP '[^0-9]';
    SELECT * FROM messy_indian_dataset; 
    
-- clean gender further 
update messy_indian_dataset
    set gender = case
        when gender in ('M' ,'m' , 'Male', 'MALE','male') then 'M'
        when gender in ('F', 'f' , 'Female','FEMALE','female') then 'F'
        else 'other'
        end;
SELECT * FROM messy_indian_dataset; 

-- cleaning and validating the age 

delete from messy_indian_dataset
    where age <= 0 or age >=100;
    SELECT * FROM messy_indian_dataset; 