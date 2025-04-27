SELECT * from messy_indian_dataset;

-- start the transaction
start TRANSACTION;
update messy_indian_dataset set purchase_amount = 1500 where id =1;
SELECT * from messy_indian_dataset;

--  Transaction with rollback
start TRANSACTION;
update messy_indian_dataset set purchase_amount = 1400 where id =1;
SELECT * from messy_indian_dataset;
rollback;
SELECT * from messy_indian_dataset;

-- transaction with commit
start TRANSACTION;
update messy_indian_dataset set purchase_amount = 1300 where id =1;
SELECT * from messy_indian_dataset;
commit;
SELECT * from messy_indian_dataset;

-- comit and rollback

start TRANSACTIOn;
    INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
    (11, 'Rajeshvary Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    SELECT * from messy_indian_dataset where id = 11;
    commit;
    rollback;
    SELECT * from messy_indian_dataset;
    
-- commit and rollbak with multiple commands 

start TRANSACTIOn;
    INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
    (11, 'Rajeshvary Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    
     INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
    (12, 'prakesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    
     INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
    (13, 'Aarti Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    SELECT * from messy_indian_dataset;
    commit;
    rollback;
    SELECT * from messy_indian_dataset;
 
 
-- rollback with multiple commands 
start TRANSACTIOn;
    INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
    (14, 'Rajeshvary Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    
     INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
    (15, 'prakesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    
     INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
    (16, 'Aarti Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
    SELECT * from messy_indian_dataset;
    rollback;
    SELECT * from messy_indian_dataset;
