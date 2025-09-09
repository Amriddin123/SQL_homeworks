
select * from Products
--1-task
select min(Price) as min_prise from Products
--2-task
select max(Salary) as max_salary from Employees

--3-task
select count(CustomerID) as mijozlar_soni  from Customers
--4-task
select count(Category) from Products
where Category = 'Electronics'
--5-task
select sum(SaleAmount) as umumiy_savdo from Sales
where ProductID = 7
--6-task
select avg(Age) as ortacha_yosh from Employees
--7-task
select DepartmentName , count(*) from Employees
	group by DepartmentName
--8-task
select Category,count(Category) as kategorya_soni  , min(price)as min_price,Max(Price) max_price
 
from Products

group by Category 

--9-task
select CustomerID , count(*)as nechamarta_savdoqilgani, sum(SaleAmount)as umumiy_savdo_yigindisi  FROM Sales

group by CustomerID




select CustomerID , sum(SaleAmount) as umumiy_summa from Sales
	group by CustomerID


--10-tsak
select DepartmentName,count(EmployeeID) as hello from Employees

group by DepartmentName
having count(EmployeeID)  > 5

select * from Employees
