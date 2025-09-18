--1-task
	select CONCAT(EMPLOYEE_ID, '-', FIRST_NAME, ' ', LAST_NAME) from Employees		
	where EMPLOYEE_ID = 100	 
	
	
--2-task
select PHONE_NUMBER from Employees
update Employees
set PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124','999')

-------------------

select PHONE_NUMBER from Employees 
update Employees
set PHONE_NUMBER = REPLACE(PHONE_NUMBER, '590', '111')
-----------------------
select PHONE_NUMBER from Employees
update Employees
set PHONE_NUMBER = REPLACE(PHONE_NUMBER , '515','777')


--3-task 
select FIRST_NAME,
len(FIRST_NAME) as name_lenght
from Employees 
where FIRST_NAME like 'a%' or FIRST_NAME like 'j%' or FIRST_NAME like 'm%'
order by FIRST_NAME asc
------------------------
select len(FIRST_NAME) as name_lenght , FIRST_NAME from Employees
where FIRST_NAME like '[a,j,m]%' 	
order by FIRST_NAME asc


--4-task

select emp1.MANAGER_ID ,sum(emp1.SALARY)  as total_salary from Employees as emp1
join Employees as emp2 on emp1.MANAGER_ID = emp2.EMPLOYEE_ID
group by emp1.MANAGER_ID

-------------------------------------------
select MANAGER_ID, sum(SALARY) as sum_salary  
from Employees
group by MANAGER_ID

--5-task 

select Year1,
    case when Max1 >= Max2 and Max1>= Max3 then Max1
	 when max2 >= Max1 and Max2 >= Max3 then Max2
    	 else Max3 end as max_num
from TestMax
-------------------------
CREATE TABLE cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(50),
    description VARCHAR(255),
    rating DECIMAL(3, 1)
);

INSERT INTO cinema (id, movie, description, rating) VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'Irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);

--6-task
select * from cinema
where id % 2 = 1 and description  !=  'boring' 



--7-task 

CREATE TABLE SingleOrder
(
	 Id INT
	,Vals VARCHAR(10)
)
GO

INSERT INTO SingleOrder VALUES
(0,'All'),
(1,'Pawan'),
(2,'Avtaar'),
(3,'Kishan'),
(4,'Vaibhav'),
(5,'Ashutosh')

select * 

from SingleOrder
order by 
 case when id =0 then 1 else 0 end 

 
CREATE TABLE person (
    id INT,
    ssn VARCHAR(13),
    passportid VARCHAR(10),
    itin VARCHAR(10)
);

INSERT INTO person VALUES 
(1, '111-11-1111', 'aa155', '123itin'),
(2, NULL, 'aa156', '124itin'),
(3, NULL, NULL, '125itin'),
(4, NULL, NULL, NULL),
(5, '222-22-2222', NULL, '126itin'),
(6, '333-33-3333', 'aa157', NULL);

select *,
case 
 when ssn is not null then ssn
 when passportid is not null then passportid
 when itin is not null then itin end as natija
from person

--orta daraja 
--1-task

create table Students(
  StudentID int,
  FullName varchar(100),
  Grade decimal(5,2)
)

insert into Students values 
(1,'James Alexander Hamilton',98.5),
(2,'Arthur George Mason',78.2),
(3,'Lily B Peters',81),
(4,'Kayne Thomas Derek',87.3),
(5,'April Dukane Paris',79.1),
(6,'Payton Carl Johnson',97.1)
select * from Students
select left( FullName,CHARINDEX(' ', FullName )-1)  ,
SUBSTRING(
    FullName,
    CHARINDEX(' ', FullName) + 1,
    CHARINDEX(' ', FullName, CHARINDEX(' ', FullName) + 1) - CHARINDEX(' ', FullName) - 1
  ) AS Familiya,
right(Students.FullName ,len(Students.fullname) -  CHARINDEX(' ',Students.FullName, CHARINDEX(' ',Students.fullname )+1)) as otasining_ismi

from Students



