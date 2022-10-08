USE classicmodels;

-- Soal 1
-- SELECT * FROM employees
-- INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
-- VALUE (2710, 'Khalilur', 'Muhammad', 'x3227', 'kiflan@enhanceronly.com', 1, 1102,'Broker');

-- INSERT INTO employeesclassicmodels
-- VALUE (2706, 'Belele', 'Indro', 'x3322', 'waskita.bambang@yahoo.com', 1, 2705, 'Gangster');

-- INSERT INTO employees (employeeNumber, firstName, extension, officeCode, reportsTo, jobTitle)
-- VALUE (2707, 'Cristhoper', 'x3219', 7, '1002', 'Mafia');

-- Soal 2
-- SELECT * FROM offices;
-- INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
-- VALUE (8, 'West Edgardofort', '+(874) 824-4874', '7316 Keefe Ford', NULL, 'Maryland', 'USA', 80166, 'NA');
-- 
-- SELECT * FROM employees
-- UPDATE employees
-- SET officeCode = 8
-- WHERE  jobTitle = 'Sales Rep'AND officeCode = 4;

-- Soal 3
-- SELECT * FROM payments;
-- DELETE FROM payments WHERE amount<10000;