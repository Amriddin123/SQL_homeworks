create database class_6_homework

use class_6_homework

--6-homework

--1-task
CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');
--1 usul
SELECT
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS val1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS val2
FROM InputTbl
GROUP BY

    CASE WHEN col1 < col2 THEN col1 ELSE col2 END,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END;


--2 usul
SELECT DISTINCT
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS val1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS val2
FROM InputTbl;

--2 task 


CREATE TABLE [dbo].[TestMultipleZero]
(
    [A] [int] NULL,
    [B] [int] NULL,
    [C] [int] NULL,
    [D] [int] NULL
);
GO

INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

	
   select * from TestMultipleZero
   where not (A = 0 AND B = 0 AND C = 0 AND D = 0);


   --6-task 
   create table section1(id int, name varchar(20))
insert into section1 values (1, 'Been'),
       (2, 'Roma'),
       (3, 'Steven'),
       (4, 'Paulo'),
       (5, 'Genryh'),
       (6, 'Bruno'),
       (7, 'Fred'),
       (8, 'Andro')
   select * from section1
   where name like 'b%' 

   --7-task
   CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');

select * from ProductCodes
where Code like '%/_%' escape '/'
