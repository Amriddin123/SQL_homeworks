 
--2-task
CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

SELECT e.name FROM Employee e
JOIN (
    SELECT managerId FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) m ON e.id = m.managerId;

select * from Employee e
join (
select managerId from Employee
--where managerId is not null
group by managerId
having count(*)>= 5
) m on m.managerId = e.id
	
--3 task
SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
WHERE 
    o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY 
    p.product_name
HAVING 
    SUM(o.unit) >= 100;


--4 task
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');

	WITH VendorTotal AS (
		SELECT 
			CustomerID,
			Vendor,
			SUM([Count]) AS TotalCount
		FROM Orders
		GROUP BY CustomerID, Vendor
	),
	RankedVendors AS (
		SELECT 
			CustomerID,
			Vendor,
			TotalCount,
			RANK() OVER (PARTITION BY CustomerID ORDER BY TotalCount DESC) AS rnk
		FROM VendorTotal
	)
	SELECT	
		CustomerID,
		Vendor
	FROM RankedVendors
	WHERE rnk = 1;

--5-task
		DECLARE @Check_Prime INT = 91;
		DECLARE @i INT = 2;
		DECLARE @IsPrime BIT = 1;

		-- 0, 1 va manfiy sonlar tub emas
		IF @Check_Prime < 2
		BEGIN
			SET @IsPrime = 0;
		END
		ELSE
		BEGIN
			WHILE @i * @i <= @Check_Prime
			BEGIN
				IF @Check_Prime % @i = 0
				BEGIN
					SET @IsPrime = 0;
					BREAK;
				END
				SET @i = @i + 1;
			END
		END

		-- Natijani chiqarish
		IF @IsPrime = 1
			PRINT 'This number is prime';
		ELSE
			PRINT 'This number is not prime';

--7-task
CREATE TABLE Numbers (
    Number INT
);

-- Step 2: Insert values into the table
INSERT INTO Numbers (Number)
VALUES
(25),
(45),
(78);


-- Step 1: Create the Tickets table
CREATE TABLE Tickets (
    TicketID VARCHAR(10),
    Number INT
);

-- Step 2: Insert the data into the table
INSERT INTO Tickets (TicketID, Number)
VALUES
('A23423', 25),
('A23423', 45),
('A23423', 78),
('B35643', 25),
('B35643', 45),
('B35643', 98),
('C98787', 67),
('C98787', 86),
('C98787', 91);


WITH Matched AS (
  SELECT 
    t.TicketID,
    COUNT(*) AS matched_count
  FROM Tickets t
  JOIN Numbers n ON t.Number = n.Number
  GROUP BY t.TicketID
)
SELECT 
  SUM(
    CASE 
      WHEN matched_count = 3 THEN 100
      WHEN matched_count >= 1 THEN 10
      ELSE 0
    END
  ) AS Total_Winnings
FROM (
  SELECT 
    t.TicketID,
    ISNULL(m.matched_count, 0) AS matched_count
  FROM (SELECT DISTINCT TicketID FROM Tickets) t
  LEFT JOIN Matched m ON t.TicketID = m.TicketID
) AS result;
