SHOW DATABASES;

USE ecommerce_db;

DESCRIBE orders;

SELECT * FROM orders;

SELECT *
FROM orders
WHERE City = 'Delhi';

SELECT *
FROM orders
ORDER BY CustomerName ASC;

SELECT *
FROM orders
ORDER BY Order_Date DESC;

SELECT City, COUNT(*) AS TotalOrders
FROM orders
GROUP BY City;

SELECT State, COUNT(*) AS TotalCustomers
FROM orders
GROUP BY State;

SELECT o.Order_ID, o.CustomerName, c.CustomerType
FROM orders o
INNER JOIN customers c
ON o.CustomerName = c.CustomerName;

SELECT o.Order_ID, o.CustomerName, c.CustomerType
FROM orders o
LEFT JOIN customers c
ON o.CustomerName = c.CustomerName;

SELECT o.Order_ID, o.CustomerName, c.CustomerType
FROM orders o
RIGHT JOIN customers c
ON o.CustomerName = c.CustomerName;

SELECT CustomerName
FROM orders
GROUP BY CustomerName
HAVING COUNT(*) > 1;

SELECT *
FROM orders
WHERE City IN (
    SELECT City
    FROM orders
    GROUP BY City
    HAVING COUNT(*) > 5
);

ALTER TABLE orders ADD Amount INT DEFAULT 1;

SELECT SUM(Amount) AS TotalOrders
FROM orders;

SELECT City, AVG(Amount) AS AvgOrders
FROM orders
GROUP BY City;

CREATE VIEW city_order_summary AS
SELECT City, COUNT(*) AS TotalOrders
FROM orders
GROUP BY City;

SELECT * FROM city_order_summary;

CREATE INDEX idx_customername ON orders (CustomerName);

ALTER TABLE orders 
MODIFY CustomerName VARCHAR(255);

CREATE INDEX idx_customername ON orders (CustomerName);

ALTER TABLE orders 
MODIFY City VARCHAR(255);

CREATE INDEX idx_city ON orders (City);

ALTER TABLE orders 
MODIFY State VARCHAR(255);

CREATE INDEX idx_state ON orders (State);
