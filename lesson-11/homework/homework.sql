--Oson darajadagi topshiriqlar (7)
--1-task
select OrderID, FirstName, OrderDate from Customers as cs
join Orders as os on cs.CustomerID = os.CustomerID 
where  year(os.OrderDate) >=2022
 
 --2-task
select name, ds.DepartmentName from Employees as es 
join Departments as ds on es.DepartmentID = ds.DepartmentID
where ds.DepartmentName ='sales'or ds.DepartmentName = 'marketing' 

--3-task
select ds.DepartmentName , max(es.Salary) as max_salary from Employees as es
join Departments as ds on es.DepartmentID = ds.DepartmentID
group by ds.DepartmentName 

--4-task
select FirstName, OrderID , OrderDate ,Country from Customers as cs 
join Orders as os on cs.CustomerID = os.CustomerID
where year(os.OrderDate) = 2023 and cs.Country = 'usa'

--5-task
select cs.FirstName , count(os.OrderID) as total_orders 
from Customers as cs
join Orders as os on cs.CustomerID = os. CustomerID 
group by cs.FirstName

--6-task
select pt.ProductName , sr.SupplierName from Products as pt
join Suppliers as sr on pt.SupplierID = sr.SupplierID
	where sr.SupplierName = 'Gadget Supplies' or sr.SupplierName = 'Clothing Mart' 


-7--task 
select ct.FirstName , max(os.OrderDate) as MostRecentOrderDate from Customers as ct 
left  join Orders as os on ct.CustomerID = os.CustomerID 
group by ct.FirstName

--O'rta darajadagi vazifalar (6)

--8-task
select ct.FirstName , os.TotalAmount from Customers as ct 
join Orders as os on ct.CustomerID = os.CustomerID
where os.TotalAmount >=500

--9-task
select pt.ProductName , ss.SaleDate ,ss.SaleAmount from Products as pt
join Sales as ss on pt.ProductID = ss.ProductID
where year(ss.SaleDate) = 2022 or ss.SaleAmount >=400

--10-task
select pt.ProductName , sum(ss.SaleAmount) as TotalSalesAmount from Products as pt
left join Sales as ss on pt.ProductID = ss.ProductID
group by pt.ProductName

--11-task
select Name , dt.DepartmentName, ee.Salary   from Employees as ee
join Departments as dt on ee.DepartmentID = dt.DepartmentID
where dt.DepartmentName = 'Human Resources' and ee.Salary >=60000  

--12-task
select pt.ProductName, pt.StockQuantity , ss.SaleDate from Products as pt 
join Sales as ss on pt.ProductID = ss.ProductID
where year(ss.SaleDate) = 2023 and pt.StockQuantity >= 100                 

--13--task 
select * from Employees as es
join Departments as dt on es.DepartmentID = dt.DepartmentID
where dt.DepartmentName = 'sales' or  year(es.HireDate) >= 2020	 

--Qiyin darajadagi vazifalar (7)
--14-task
select cr.FirstName , os.OrderID,os from Customers as cr
join Orders as os on cr.CustomerID = os.CustomerID
where cr.Address like '[0-9][0-9][0-9][0-9]%'

--15-task 
select ProductName, Category, SaleAmount from Products as pt
join Sales as ss on pt.ProductID = ss.ProductID
where Category = 'Electronics' or ss.SaleAmount >= 350  

--16-task
select CategoryName , count(pt.ProductID) as ProductCount 
from Products as pt
join Categories as ct on pt.Category = ct.CategoryName
group by CategoryName

select * from Products
select * from Categories

select * from Customers
select * from Orders





select * from Customers as ct 
join Orders as os on ct.CustomerID = os.CustomerID






