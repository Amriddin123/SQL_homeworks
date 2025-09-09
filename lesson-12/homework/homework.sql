Create table Students (student_id int, student_name varchar(20))
Create table Subjects (subject_name varchar(20))
Create table Examinations (student_id int, subject_name varchar(20))
Truncate table Students
insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')
Truncate table Subjects
insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')
Truncate table Examinations
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')

CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

select * from Students
select * from Subjects
select * from Examinations

Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
Truncate table Person
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
Truncate table Address
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

Create table Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

select * from Person
select * from Address

select * from Employee
--1-task
select firstName, lastName , city ,state from Person as pn
left  join Address as ad on pn.personId = ad.personId 
--2-task 
SELECT emp1.id , emp1.name,emp1.salary ,emp1.managerId,emp2.id 
FROM Employee as emp1
left join Employee as emp2 on emp1.managerId = emp2.Id
where emp1.salary > emp2.salary
--3-task
-- Jadvalni yaratish
CREATE TABLE  Person_ (
    id INT,
    email VARCHAR(255)
);


TRUNCATE TABLE Person_;


INSERT INTO Person_ (id, email) VALUES (1, 'a@b.com');
INSERT INTO Person_	 (id, email) VALUES (2, 'c@d.com');
INSERT INTO Person_ (id, email) VALUES (3, 'a@b.com');

select * from Person_
select email 
from Person_
group by email
having count(email) > 1

--4-task
CREATE TABLE  Person__ (
    id INT,
    email VARCHAR(255)
);

-- Jadvalni tozalash (agar oldin ma'lumot bo'lsa)
TRUNCATE TABLE Person__;

-- Ma'lumotlarni kiritish
INSERT INTO Person__ (id, email) VALUES (1, 'john@example.com');
INSERT INTO Person__ (id, email) VALUES (2, 'bob@example.com');
INSERT INTO Person__ (id, email) VALUES (3, 'john@example.com');

delete from Person__

select min(id) from Person__
group by email
having count(id) < 1
select * from Person__

delete from Person__
where id not in(
select 
min(id)
from Person__
group by email
)

--5-task
select * from boys
select * from girls

select * from girls as gr
left join boys as boy on gr.ParentName = boy.ParentName 
where boy.Id is null
 
 --7-task
 DROP TABLE IF EXISTS Cart1;
DROP TABLE IF EXISTS Cart2;
GO

CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

select * from Cart1
select * from Cart2
select ISNULL(C1.Item,'') as cart1,isnull(C2.Item,'') as cart2 from Cart1 as c1
full join Cart2 as c2 on c1.Item = c2.Item


--8-task
Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

select * from Customers
select * from Orders

select * from Customers as cr
left join Orders as os on cr.id = os.customerId
where os.id is  null
