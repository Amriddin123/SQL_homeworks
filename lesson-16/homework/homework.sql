
--task 1
DECLARE @i INT = 1;
WHILE @i <= 1000
BEGIN
    PRINT @i
    SET @i = @i + 1
END

--task 2
select  * from Employees
select * from Sales
	SELECT e.EmployeeID,e.FirstName,e.LastName,s.TotalSales
	FROM Employees e
	JOIN (
		SELECT 
			EmployeeID,
			SUM(SalesAmount) AS TotalSales
		FROM Sales	
		GROUP BY EmployeeID
	) s ON e.EmployeeID = s.EmployeeID;


--task 3 
;with cte as (
select EmployeeID,
avg(Salary) as ct
from Employees
group by EmployeeID
)select * from cte


--task 4
select p.ProductID,
    MAX(s.SalesAmount) AS MaxSale
from Products p
JOIN Sales s ON p.ProductID = s.ProductID
group by p.ProductID

-- task 6
;with cte as (
select EmployeeID,
count(*) as salesCount
from Sales s
group by EmployeeID
)select * , salesCount from cte c
join Employees e on e.EmployeeID = c.EmployeeID 
where c.salesCount > 5

--task 7 
select * from Products
select * from Sales

;WITH cte AS (
    SELECT 
        ProductID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT 
    p.ProductID,
    p.ProductName,
    ps.TotalSales
FROM cte ps
JOIN Products p ON ps.ProductID = p.ProductID
WHERE ps.TotalSales > 500;

--task 8 
;with cte as (
select*, 
avg(Salary)over () as avg_salary
from Employees 
) select * from cte 
where avg_salary < Salary
