
BULK INSERT — bu SQL Serverda katta hajmdagi tashqi ma'lumotlarni (odatda fayldan) jadvalga tez va samarali yuklash uchun ishlatiladigan T-SQL buyruqdir.
Maqsadi:

Katta hajmdagi ma’lumotlarni tezkor import qilish — masalan, CSV, TXT yoki boshqa formatdagi matn fayllardan.

Ma’lumotlarni SQL Server jadvaliga avtomatik va ko‘p miqdorda yuklash jarayonini soddalashtirish.

Qo‘lda kiritish yoki birma-bir INSERT qilish o‘rniga, bir martada minglab yoki millionlab yozuvlarni kiritish imkonini berish.

Ma’lumotlar bazasiga katta hajmdagi tashqi ma’lumotlarni integratsiya qilish va tahlil qilish jarayonlarini tezlashtirish.
'

--2-task
Albatta! SQL Serverga import qilinadigan mashhur to‘rtta fayl formati quyidagilar:

CSV (Comma-Separated Values)
— ustunlar vergul bilan ajratilgan oddiy matn fayli.

TXT (Text File)
— matn formatidagi fayl, ustunlar va satrlar turli ajratuvchilar bilan (masalan, tab, vergul).

Excel (XLS, XLSX)
— Microsoft Excel formatidagi jadval fayllari.

XML (eXtensible Markup Language)
— tuzilgan va belgilangan ma’lumotlarni saqlovchi format.
	
 ----3-task		
 create table masulotlar (
   productid int  primary key,
   productName varchar(50),
   narx decimal (10,2))
 --4-task
 insert into masulotlar values (1, 'Laptop', 11),
(2, 'Smartphone', 20),
(3, 'Tablet', 12),
(4, 'Monitor', 10)

select * from masulotlar

--5-task
NULL nima?

NULL — bu ma’lumot yo‘qligini, ya’ni nomalum yoki mavjud emas degan holatni bildiradi.

Agar ustun NULL qabul qilsa, demak bu ustunga qiymat kiritilmasligi mumkin.

NULL qiymat — bu nol (0) emas, ham bo‘sh matn (‘’) emas. U — yo‘qlikni bildiradi.

 NOT NULL nima?

NOT NULL — ustunda majburiy qiymat bo‘lishi kerakligini bildiradi.

Ustunga NULL qiymat kiritib bo‘lmaydi.

Har bir satr uchun bu ustunda qiymat aniq berilishi shart.

--6-task
ALTER TABLE Mahsulotlar
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

--7-task
-- Bu yerda so‘rovning maqsadi yoziladi
SELECT * FROM Mahsulotlar;

/*
Bu so‘rov Mahsulotlar jadvalidan barcha yozuvlarni olib keladi.
Asosiy maqsad - jadvaldagi barcha mahsulotlar va ularning narxlarini ko‘rish.
*/
SELECT * FROM Mahsulotlar;
--8-task
ALTER TABLE Mahsulotlar
ADD CategoryID INT;
	
--9-task
CREATE TABLE Toifalar (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE
);

--10-task
IDENTITY ustuni — bu avtomatik raqam beruvchi ustun bo‘lib, jadvalga yangi satr qo‘shilganda uning qiymati avtomatik tarzda ketma-ket oshib boradi.
Maqsadi:

Har bir yangi yozuvga noyob identifikator (ID) avtomatik berish.

Qo‘l bilan ID qiymatini kiritishga hojat qoldirmaslik.

Asosiy kalit (PRIMARY KEY) uchun qulay va oson avtomatik raqam ta’minlash.

Takrorlanmas va ketma-ket raqamlar berish orqali ma’lumotlarni tartibda saqlash.

