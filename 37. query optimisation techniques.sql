DROP TABLE IF EXISTS messy_indian_dataset;
CREATE TABLE IF NOT EXISTS messy_indian_dataset (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(15),
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
(10, 'Swati Gupta', 27, 'Female', 'swati@example.com', '9876543215', 'Jaipur', 'Rajasthan', 1500.00, NULL),
(11, 'Deepak Sharma', 45, 'Male', 'deepak@example.com', '9876543216', 'Chennai', 'Tamil Nadu', 1100.50, '2023-06-15'),
(12, 'Anjali Gupta', 29, 'Female', 'anjali@example.com', '9876543217', 'Hyderabad', 'Telangana', 850.25, '2023-07-25'),
(13, 'Rohit Singh', 33, 'Male', 'rohit@example.com', '9876543218', 'Pune', 'Maharashtra', 950.75, '2023-08-10'),
(14, 'Pooja Patel', 27, 'Female', 'pooja@example.com', '9876543219', 'Ahmedabad', 'Gujarat', 1300.00, '2023-09-20'),
(15, 'Sandeep Verma', 31, 'Male', 'sandeep@example.com', '9876543220', 'Surat', 'Gujarat', 1150.50, '2023-10-05'),
(16, 'Aarti Sharma', 26, 'Female', 'aarti@example.org', '9876543221', 'Varanasi', 'Uttar Pradesh', 850.00, '2023-11-15'),
(17, 'Vikram Singh', 37, 'Male', 'vikram@example.co.in', '9876543222', 'Indore', 'Madhya Pradesh', 1250.25, '2023-12-25'),
(18, 'Ananya Sen', 28, 'Female', 'ananya@example.net', '9876543223', 'Kochi', 'Kerala', 900.75, '2024-01-10'),
(19, 'Nikhil Sharma', 34, 'Male', 'nikhil@example.co.uk', '9876543224', 'Jaipur', 'Rajasthan', 1400.00, '2024-02-20'),
(20, 'Isha Singh', 30, 'Female', 'isha@example.edu.in', '9876543225', 'Lucknow', 'Uttar Pradesh', 1050.50, '2024-03-05'),
(21, 'Alok Kumar', NULL, 'Male', 'alok@example.com', '9876543226', 'Bhopal', 'Madhya Pradesh', 950.25, '2024-04-15'),
(22, 'Shreya Patel', 25, NULL, 'shreya@example.com', '9876543227', 'Vadodara', 'Gujarat', 1350.00, '2024-05-25'),
(23, 'Rahul Verma', 33, 'Male', NULL, '9876543228', 'Nagpur', 'Maharashtra', 1000.75, '2024-06-10'),
(24, 'Anushka Singh', 28, 'Female', 'anushka@example.com', NULL, 'Gurgaon', 'Haryana', NULL, '2024-07-20'),
(25, 'Ravi Kumar', 32, 'Male', 'ravi@example.com', '9876543229', NULL, 'Uttar Pradesh', 1100.50, '2024-08-05'),
(26, 'Aarav Gupta', 27, 'Male', 'aarav@example.com', '9876543230', 'Patna', NULL, 1250.25, '2024-09-15'),
(27, 'Kritika Sharma', 29, 'Female', 'kritika@example.com', '9876543231', 'Chandigarh', 'Punjab', 1200.75, NULL),
(28, NULL, 35, 'Male', 'test@example.com', '9876543232', 'Jaipur', 'Rajasthan', 1300.00, '2024-11-20'),
(29, 'Surbhi Gupta', 26, NULL, 'surbhi@example.com', '9876543233', 'Nashik', 'Maharashtra', 1150.50, '2024-12-05'),
(30, 'Ajay Sharma', NULL, NULL, 'ajay@example.com', '9876543234', 'Jodhpur', 'Rajasthan', 1400.25, '2025-01-15');
select * from messy_indian_dataset;

-- 1. avoid accessing unnescessary results 
select * from messy_indian_dataset;
select id,name, city, purchase_amount from messy_indian_dataset;
select id,name, city, purchase_amount from messy_indian_dataset where purchase_amount > 1000 limit 5;
select id,name, city, purchase_amount, purchase_amount * 1.18 as 'price with gst' from messy_indian_dataset where purchase_amount > 1000 limit 5;

-- 2. use right kind of join

 
-- 3. use of appropriate data types 
create table customer_correct(id INT, name varchar(50), description varchar(255));
create table customer_correct(id INT, name varchar(50), description text);

-- 4. query execution plan 
explain select id, name, city , purchase_amount from messy_indian_dataset 
where purchase_amount > 1000;

-- 5 . caching 
select SQL_CATCH id, name, city , purchase_amount from messy_indian_dataset 
where purchase_amount > 1000;

-- 6. use of temporary tables 
create temporary table high_purchase as
	(
		select id, name, city , purchase_amount from messy_indian_dataset 
		where purchase_amount > 1000
	);
    
select * from high_purchase where city = 'Mumbai' ;
select id, name, city from high_purchase where city = 'Mumbai' ;


-- partion table ,CTE & Indexing 




