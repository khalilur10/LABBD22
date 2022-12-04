-- use classicmodels;

-- 1. Menggunakan database classicmodels tampilkan nama pelanggan yang total
-- belanjanya melebihi kredit limit, serta tampilkan selisih total belanja dengan kredit
-- limit, kemudian urutkan berdasarkan selisih tersebut secara menurun
-- SELECT customers.customerName as 'Nama Pelanggan', 
-- SUM(amount) as 'Total Belanja', customers.creditLimit as 'Batas Kredit', (SUM(amount)-creditLimit) as 'Selisih'
-- FROM customers
-- inner join payments
-- on customers.customerNumber = payments.customerNumber
-- group by customerName
-- having sum(amount) > customers.creditLimit order by (SUM(amount)-creditLimit)  desc limit 5;

-- 2. Siapa customer yang total pembelian barangnya terbanyak (dihitung dari quantity
-- bukan price)
-- Select concat(customerName, " ",':'," ", contactFirstName, " ",contactLastName, " ", addressLine1) as pelanggan, MAX(quantityordered) as jumlah_orderan
-- from customers as c
-- join orders as o
-- on c.customerNumber = o.customerNumber
-- join orderdetails as od
-- on o.orderNumber = od.orderNumber
-- WHERE od.quantityOrdered = 97

-- select concat(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) as Pelanggan, sum(od.quantityOrdered) as 'Jumlah Orderan'
-- from customers as c
-- inner join orders as o
-- on c.customerNumber = o.customerNumber
-- inner join orderdetails as od
-- on o.orderNumber = od.orderNumber
-- group by c.customerName
-- having sum(od.quantityOrdered) order by sum(od.quantityOrdered) desc limit 1;

-- 3.Tampilkan jumlah dan list pelanggan, serta jumlah pembayaran untuk pembayaran
-- yang dilakukan pada bulan februari setiap tahunnya.
SELECT CONCAT((MONTHNAME(paymentDate)), " ",YEAR(paymentDate)) as 'hari pembayaran', COUNT(customers.customerName) as 'jumlah pelanggan', 
GROUP_CONCAT(customerName ORDER BY customerName ASC) as 'list pelanggan', SUM(payments.amount) as 'jumlah pembayaran'
FROM customers
INNER JOIN payments 
ON customers.customerNumber = payments.customerNumber
WHERE MONTH(paymentdate) = 2
GROUP BY YEAR(paymentDate) ORDER BY SUM(payments.amount)DESC;

-- 4. Tampilkan informasi jumlah orderan serta keuntungan untuk penjualan 2001 Ferrari
-- Enzo yang keuntungannya lebih besar dari 5000.
-- Berikut ketentuan outputnya:
-- a. Nama Produk dalam huruf kapital
-- b. Jumlah di Order
-- c. Waktu Orderan dipisah dengan Comma
-- d. Harga Beli
-- e. Harga Jual
-- f. Total Kuantitas Orderan
-- g. Serta Keuntungan bersih yang diperoleh
select upper(p.productName) as 'nama produk' , count(o.customerNumber) as 'jumlah diorder', 
group_concat(orderDate) as 'waktu orderan', p.buyPrice as 'harga beli', od.priceEach as 'harga jual', 
concat((sum(od.quantityOrdered *od.priceEach)), "-", sum(od.quantityOrdered * p.buyprice), "=", (sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice))
AS "pendapatan - modal = keuntungan"
from products as p
inner join orderdetails as od
on p.productCode = od.productCode
inner join orders as o
on od.orderNumber = o.orderNumber
where p.productName =  '2001 Ferrari Enzo'
group by priceEach
having (sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice) > 5000 
order by (sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice)desc;

-- 5. Tampilkan alamat pertama dari tiap kantor, no telp yang 5 angka terakhirnya
-- disamarkan, jumlah karyawan, jumlah pelanggan yang pernah dilayani, serta
-- rata-rata penghasilan.
SELECT o.addressLine1 AS 'Alamat', concat(LEFT(o.phone, LENGTH(o.phone)-6), '* **'),
COUNT(DISTINCT e.employeeNumber) AS 'jumlah karyawan' , COUNT(DISTINCT c.customerName), round(AVG(amount), 2)
from offices AS o
INNER JOIN employees AS e
ON e.officeCode = o.officeCode
INNER JOIN customers AS c
ON c.salesRepEmployeeNumber = e.employeeNumber
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY o.officeCode

