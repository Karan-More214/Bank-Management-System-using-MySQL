-- Aggregate function
SELECT COUNT(*) AS Total_Customers
FROM Customer;

-- sum
SELECT SUM(Balance) AS Total_Balance
FROM Account;

-- Avg
SELECT AVG(Balance) AS Average_Balance
FROM Account;

-- Min
SELECT MAX(Balance) AS Maximum_Balance
FROM Account;

-- Min 
SELECT MIN(Balance) AS Minimum_Balance
FROM Account;