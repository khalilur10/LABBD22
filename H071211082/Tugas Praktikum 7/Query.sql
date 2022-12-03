-- Nomor 1
SELECT c.customerNumber, c.customerName,
 (SELECT MAX(amount) FROM payments WHERE c.customerNumber = payments.customerNumber) AS max_amount,
 (SELECT MIN(amount) FROM payments WHERE c.customerNumber = payments.customerNumber) AS min_amount
FROM customers c
GROUP BY customerNumber
HAVING max_amount AND min_amount IS NOT NULL;

-- Nomor 2
SELECT e.employeeNumber, e.lastName, e.firstName, os.city, os.officeCode
FROM offices os
JOIN employees e
USING (officeCode)
WHERE os.officeCode =
 	(SELECT offices.officeCode
	FROM offices
	JOIN employees
	USING (officeCode)
	GROUP BY employees.officeCode
	ORDER BY COUNT(employees.officeCode) DESC
	LIMIT 1);

-- Nomor 3
SELECT products.productName, products.productScale
FROM products 
WHERE products.productName IN
 (SELECT productName FROM products 
 WHERE productName LIKE '%Ford%');

-- Nomor 4
SELECT c.customerName, e.firstName, e.lastName, o.orderNumber, SUM(od.priceEach*od.quantityOrdered) AS total_order
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
WHERE o.orderNumber = 
	(SELECT orderNumber FROM orderdetails
	GROUP BY orderNumber
	ORDER BY SUM(quantityOrdered * priceEach) DESC
	LIMIT 1);

-- Nomor 5
SELECT DISTINCT LENGTH(country) AS panjang_karakter, country AS negara
FROM customers
WHERE LENGTH(country) IN
	((SELECT MAX(LENGTH(country)) FROM customers),
	(SELECT MIN(LENGTH(country)) FROM customers))
	ORDER BY negara ASC;