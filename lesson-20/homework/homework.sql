
-- task 1
SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s2.CustomerName = s1.CustomerName
      AND s2.SaleDate >= '2024-03-01'
      AND s2.SaleDate < '2024-04-01'
);

-- task 2 
SELECT Product, SUM(Quantity * Price) AS TotalRevenue
FROM #Sales
GROUP BY Product
HAVING SUM(Quantity * Price) = (
    SELECT MAX(TotalRevenue)
    FROM (
        SELECT Product, SUM(Quantity * Price) AS TotalRevenue
        FROM #Sales
        GROUP BY Product
    ) AS RevenueByProduct
);

--3 task
SELECT MAX(SaleAmount)
FROM (
    SELECT Quantity * Price AS SaleAmount
    FROM #Sales
) AS SalesAmounts
WHERE SaleAmount < (
    SELECT MAX(Quantity * Price) FROM #Sales
);

--4-task
SELECT SaleMonth, SUM(Quantity) AS TotalQuantity
FROM (
    SELECT 
        FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
        Quantity
    FROM #Sales
) AS MonthlySales
GROUP BY SaleMonth
ORDER BY SaleMonth;
--5 task
SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s2.Product = s1.Product
      AND s2.CustomerName <> s1.CustomerName
);


--7 task
create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')


--8-task
CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);


