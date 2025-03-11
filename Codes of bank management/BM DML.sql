-- DML Commands
-- 1) Insert into customer 
Insert into customer(Customer_id,First_name,Last_name,DOB,Address,phone_Number,email)
values(211,'Karan','More','2004-05-023','Kurla,Mumbai,Maharashtra','9321862757','karan@gmail.com');
-- 2) Insert into Bank_details
INSERT INTO Bank_details (bank_id, bank_name, bank_code, bank_address, bank_contactno, bank_email)
VALUES (11, 'State Bank of India', 'SBI005', 'Mumbai, Maharashtra', '9876543210', 'contact@sbi.com');

-- Update customer email
UPDATE Customer
SET Email = 'amit.sharma_new@example.com'
WHERE Customer_ID = 201;
select * from customer;

-- Delete a transaction
DELETE FROM Transaction
WHERE Transaction_ID = 401;
select * from transaction;

-- select commands
-- Select all customers
SELECT * FROM Customer;

-- Select accounts with balance > 20000
SELECT * FROM Account
WHERE Balance > 20000;

-- Select approved loans
SELECT * FROM Loan
WHERE Loan_Status = 'Approved';