  --1-topshiriq
select TOP 5 name
,StandardCost,ListPrice
from[Production].[Product] 

order by StandardCost DESC

--3-topshiriq
select*from [Production].[Product]
where ListPrice > 100

--4topshiriq
select*from [Production].[Product]
where Name like 'A%'

--5-topshhiriq

select*from [Production].[Product]
order by ListPrice

--8topshiriq

select *
from [Production].[Product]
where ListPrice BETWEEN 50 AND 100;

--9topshiriq
select *from[Production].[Product] 
