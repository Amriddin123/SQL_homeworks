

--2 task
CREATE VIEW vw_ProductSalesSummary AS
SELECT
    p.ProductID,
    p.ProductName,
    p.Category,
    p.Price,
    SUM(s.Quantity) AS TotalQuantity
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category, p.Price;
select * from Products	

--3-task
CREATE FUNCTION fn_GetTotalRevenueForProduct(prod_id INT)
RETURNS DECIMAL(15,2)
BEGIN
    DECLARE totalRevenue DECIMAL(15,2);

    SELECT SUM(s.Quantity * p.Price)
    INTO totalRevenue
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductID
    WHERE s.ProductID = prod_id;

    RETURN IFNULL(totalRevenue, 0);

	--4-task
	drop function fn_GetSalesByCategory
	CREATE FUNCTION fn_GetSalesByCategory(@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT
        p.ProductName,
        COALESCE(SUM(s.Quantity), 0) AS TotalQuantity,
        COALESCE(SUM(s.Quantity * p.Price), 0) AS TotalRevenue
    FROM Products p
    LEFT JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName
);
SELECT * FROM fn_GetSalesByCategory('Electronics')


--5-task
CREATE FUNCTION dbo.fn_IsPrime (@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
    DECLARE @i INT = 2;
    DECLARE @isPrime BIT = 1;  
   
   IF @Number <= 1
        RETURN 'No';

    
    IF @Number = 2
        RETURN 'Yes';

        IF @Number % 2 = 0
        RETURN 'No';

    
    WHILE @i * @i <= @Number
    BEGIN
        IF @Number % @i = 0
        BEGIN
            SET @isPrime = 0;
            BREAK;
        END
        SET @i = @i + 1;
    END

    RETURN CASE WHEN @isPrime = 1 THEN 'Yes' ELSE 'No' END;
END

SELECT dbo.fn_IsPrime(17) AS IsPrime

