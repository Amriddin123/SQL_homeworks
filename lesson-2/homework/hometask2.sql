--1 task
create table Employees (EmpID int , Name varchar(50), Salary DECIMAL(10,2))
--2 task
insert into Employees values (1, 'Amriddin', 5600 ),
                             (2, 'Sunnat', 6600 ),
							 (3, 'Bunyod', 7600 )
--3 task
update Employees
set Salary = 7000
where EmpID = 1

--4 task
delete from Employees
where EmpID = 2;


--5-task
--DELETE

      --Nima qiladi? – Jadvaldagi tanlangan satrlarni o‘chiradi.
      
      --Qayta tiklash mumkinmi? – Ha, agar ROLLBACK ishlatilsa (agar TRANSACTION ichida bo‘lsa).
      
      --Qayerda ishlatiladi? – WHERE bilan ma'lum satrlar tanlab o‘chiriladi.
      
      --Jadval tuzilmasi saqlanadimi? – Ha, jadval o‘z holicha qoladi.
      
      --Misol:

      --DELETE FROM employees WHERE department = 'Sales';

--TRUNCATE

      --Nima qiladi? – Jadvaldagi barcha satrlarni tezda o‘chiradi.
      
      --Qayta tiklash mumkinmi? – Yo‘q, ROLLBACK ishlamaydi (ko‘p hollarda).
      
      --Qayerda ishlatiladi? – Barcha ma'lumotlarni o‘chirishda.
      
      --Jadval tuzilmasi saqlanadimi? – Ha, jadval o‘zi qoladi.


--DROP

      --Nima qiladi? – Jadvalni butunlay o‘chiradi (tuzilmasi + ma'lumoti bilan).
      
      --Qayta tiklash mumkinmi? – Yo‘q, ROLLBACK ishlamaydi.
      
      --Qayerda ishlatiladi? – Jadval yoki boshqa obyektlarni butunlay olib tashlashda.
      
      --Jadval tuzilmasi saqlanadimi? – Yo‘q, jadval o‘zi ham yo‘q bo‘ladi.











select * from Employees


--delete from Employees


