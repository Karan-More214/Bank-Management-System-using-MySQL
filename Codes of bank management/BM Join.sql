-- join
SELECT 
    Customer.Customer_ID, 
    Customer.First_Name, 
    Customer.Last_Name, 
    Account.Account_ID, 
    Account.Account_Type, 
    Account.Balance
FROM 
    Customer
JOIN 
    Account ON Customer.Customer_ID = Account.Customer_ID;
    
    
-- inner join
SELECT 
    Customer.Customer_ID, 
    Customer.First_Name, 
    Customer.Last_Name, 
    Account.Account_ID, 
    Account.Account_Type, 
    Account.Balance
FROM Customer
INNER JOIN Account ON Customer.Customer_ID = Account.Customer_ID;
