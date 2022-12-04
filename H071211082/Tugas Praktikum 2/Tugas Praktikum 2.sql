USE classicmodels;
-- Nomor 1
SELECT * FROM offices WHERE city='San Francisco';

-- Nomor 2
SELECT * FROM orderdetails WHERE quantityOrdered >70 ORDER BY orderLineNumber;

-- Nomor 3
SELECT DISTINCT productLine FROM products;

-- Nomor 4
SELECT customerNumber AS 'No.Costumer', customerName AS 'Nama Costumer' FROM customers 
WHERE customerNumber>100 and customerNumber<150;

-- Nomor 5
SELECT * FROM customers 
WHERE country != 'USA' and creditLimit = 0 
ORDER BY customerName 
LIMIT 10, 10