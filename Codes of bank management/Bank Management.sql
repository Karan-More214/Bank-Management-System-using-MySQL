create database Bank_Management;
use Bank_Management;
desc bank_details;
desc branch;
desc customer;
desc account;
desc transaction;
desc loan;


-- DDL Command
drop table bank_details;
drop table customer;
drop table Bank_details;

-- Table for bankdetails
create table Bank_details(
bank_id int auto_increment primary key,
bank_name varchar(50) not null,
bank_code varchar(50) not null unique,     -- unique bank code 
bank_address varchar(100),
bank_contactno varchar(20),
bank_email varchar(50)
);

-- table for branch
CREATE TABLE Branch (
    Branch_ID INT AUTO_INCREMENT PRIMARY KEY,
    Branch_Name VARCHAR(100),
    Branch_Address VARCHAR(100),
    Branch_Phone VARCHAR(20)
);

-- table for customer
CREATE TABLE Customer (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Address VARCHAR(100),
    Phone_Number VARCHAR(20),
    Email VARCHAR(100) UNIQUE
);

-- table for account
CREATE TABLE Account (
    Account_ID INT AUTO_INCREMENT PRIMARY KEY,
    Account_Type VARCHAR(50), -- e.g., Checking, Savings
    Balance DECIMAL(15, 2) DEFAULT 0.00,
    Customer_ID INT,
    Branch_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
select * from bank_info;

-- table for transaction
CREATE TABLE Transaction (
    Transaction_ID INT AUTO_INCREMENT PRIMARY KEY,
    Account_ID INT,
    Transaction_Date DATE,
    Amount DECIMAL(15, 2),
    Type VARCHAR(50), -- 'Deposit' or 'Withdrawal'
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);

-- table for loan
CREATE TABLE Loan (
    Loan_ID INT AUTO_INCREMENT PRIMARY KEY,
    Loan_Type VARCHAR(50), -- e.g., Home, Personal, Car
    Amount DECIMAL(15, 2),
    start_Date DATE,
    End_Date Date,
    intrest_rate decimal (5,2),
    Loan_Status enum('Approved','Pending','Rejected') default'Approved', -- 'Approved', 'Pending', 'Rejected'
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- DML Command Insert

desc Bank_details;
INSERT INTO Bank_details (bank_id,bank_name, bank_code, bank_address, bank_contactno, bank_email)
VALUES 
(1,'State Bank of India', 'SBI001', 'Mumbai, Maharashtra', 9876543210, 'contact@sbi.com'),
(2,'HDFC Bank', 'HDFC002', 'Delhi, India', 9123456789, 'support@hdfc.com'),
(3,'ICICI Bank', 'ICICI003', 'Bangalore, Karnataka', 9765432109, 'helpdesk@icici.com'),
(4,'Axis Bank', 'AXIS004', 'Hyderabad, Telangana', 9812345678, 'care@axisbank.com'),
(5,'Punjab National Bank', 'PNB005', 'Chandigarh, Punjab', 9901234567, 'info@pnb.com'),
(6,'Bank of Baroda', 'BOB006', 'Ahmedabad, Gujarat', 9876123456, 'contact@bob.com'),
(7,'Canara Bank', 'CAN007', 'Kolkata, West Bengal', 9798543210, 'helpdesk@canarabank.com'),
(8,'Union Bank of India', 'UBI008', 'Pune, Maharashtra', 9823456789, 'support@unionbank.com'),
(9,'Kotak Mahindra Bank', 'KOT009', 'Jaipur, Rajasthan', 9654783210, 'care@kotak.com'),
(10,'IndusInd Bank', 'IND010', 'Chennai, Tamil Nadu', 9745632109, 'info@indusind.com');


INSERT INTO Branch (Branch_Id,Branch_Name, Branch_Address, Branch_Phone)
VALUES 
(101,'SBI Andheri Branch', 'Andheri, Mumbai, Maharashtra', '022-26543210'),
(102,'HDFC Connaught Place Branch', 'Connaught Place, Delhi', '011-29876543'),
(103,'ICICI MG Road Branch', 'MG Road, Bangalore, Karnataka', '080-23659874'),
(104,'Axis Begumpet Branch', 'Begumpet, Hyderabad, Telangana', '040-27896512'),
(105,'PNB Sector 17 Branch', 'Sector 17, Chandigarh', '0172-2547896'),
(106,'BOB Navrangpura Branch', 'Navrangpura, Ahmedabad, Gujarat', '079-26587412'),
(107,'Canara Salt Lake Branch', 'Salt Lake, Kolkata, West Bengal', '033-23567894'),
(108,'Union Camp Branch', 'Camp, Pune, Maharashtra', '020-26478953'),
(109,'Kotak Malviya Nagar Branch', 'Malviya Nagar, Jaipur, Rajasthan', '0141-27896541'),
(110,'IndusInd T. Nagar Branch', 'T. Nagar, Chennai, Tamil Nadu', '044-28123456');


INSERT INTO Customer (customer_id,First_Name, Last_Name, DOB, Address, Phone_Number, Email)
VALUES 
(201,'Amit', 'Sharma', '1990-05-14', 'Andheri, Mumbai, Maharashtra', '9876543210', 'amit.sharma@example.com'),
(202,'Priya', 'Verma', '1995-08-22', 'Connaught Place, Delhi', '8765432109', 'priya.verma@example.com'),
(203,'Rahul', 'Singh', '1988-12-10', 'MG Road, Bangalore, Karnataka', '7654321098', 'rahul.singh@example.com'),
(204,'Sneha', 'Patil', '1992-07-03', 'Begumpet, Hyderabad, Telangana', '6543210987', 'sneha.patil@example.com'),
(205,'Vikram', 'Das', '1993-04-25', 'Sector 17, Chandigarh', '5432109876', 'vikram.das@example.com'),
(206,'Ananya', 'Mishra', '1996-11-18', 'Navrangpura, Ahmedabad, Gujarat', '4321098765', 'ananya.mishra@example.com'),
(207,'Rohan', 'Ghosh', '1987-06-30', 'Salt Lake, Kolkata, West Bengal', '3210987654', 'rohan.ghosh@example.com'),
(208,'Meera', 'Kulkarni', '1994-09-15', 'Camp, Pune, Maharashtra', '2109876543', 'meera.kulkarni@example.com'),
(209,'Arjun', 'Yadav', '1991-03-05', 'Malviya Nagar, Jaipur, Rajasthan', '1098765432', 'arjun.yadav@example.com'),
(210,'Neha', 'Reddy', '1998-02-28', 'T. Nagar, Chennai, Tamil Nadu', '9988776655', 'neha.reddy@example.com');

INSERT INTO Account (Account_ID, Account_Type, Balance, Customer_ID, Branch_ID) VALUES 
(301, 'Savings', 25000.50,201, 101),
(302, 'Checking', 12000.75,202, 102),
(303, 'Savings', 50000.00,203, 103),
(304, 'Checking', 18000.25,204, 104),
(305, 'Savings', 35000.60, 205, 105),
(306, 'Checking', 15000.90, 206, 106),
(307, 'Savings', 47000.20, 207, 107),
(308, 'Checking', 22000.35, 208, 108),
(309, 'Savings', 29000.00, 209, 109),
(310, 'Checking', 31000.75, 210, 110);

INSERT INTO Transaction (Transaction_ID, Account_ID, Transaction_Date, Amount, Type) VALUES 
(401, 301, '2025-02-01', 5000.00, 'Deposit'),
(402, 302, '2025-02-02', 2000.50, 'Withdrawal'),
(403, 303, '2025-02-03', 10000.75, 'Deposit'),
(404, 304, '2025-02-04', 1500.00, 'Withdrawal'),
(405, 305, '2025-02-05', 2500.25, 'Deposit'),
(406, 306, '2025-02-06', 3000.00, 'Withdrawal'),
(407, 307, '2025-02-07', 7000.40, 'Deposit'),   
(408, 308, '2025-02-08', 1200.00, 'Withdrawal'),
(409, 309, '2025-02-09', 9500.75, 'Deposit'),
(410, 310, '2025-02-10', 500.00, 'Withdrawal');

INSERT INTO loan (Loan_ID, Loan_Type, Amount, Start_Date, End_Date, Intrest_Rate, Loan_Status, Customer_ID) VALUES 
(501, 'Home', 500000.00, '2024-01-15', '2034-01-15', 7.25, 'Approved', 1), 
(502, 'Personal', 20000.00, '2024-02-10', '2026-02-10', 10.50, 'Pending', 2),
(503, 'Car', 800000.00, '2023-12-05', '2029-12-05', 8.00, 'Approved', 3),
(504, 'Education', 500000.00, '2024-03-20', '2030-03-20', 6.75, 'Rejected', 4),
(505, 'Home', 750000.00, '2023-11-01', '2033-11-01', 7.10, 'Approved', 5),
(506, 'Personal', 15000.00, '2024-04-15', '2026-04-15', 11.00, 'Pending', 6),
(507, 'Car', 600000.00, '2024-05-30', '2029-05-30', 7.85, 'Approved', 7),
(508, 'Education', 300000.00, '2023-08-10', '2028-08-10', 5.90, 'Rejected', 8),
(509, 'Home', 900000.00, '2024-06-25', '2034-06-25', 7.50, 'Approved', 9),
(510, 'Personal', 50000.00, '2023-07-12', '2025-07-12', 9.25, 'Pending', 10);

select * from customer;
select * from branch;
DROP DATABASE Bank_Management;



