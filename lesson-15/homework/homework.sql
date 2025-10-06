create database homework_15
use homework_15
--table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);
drop table products
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);

CREATE TABLE departments (
    id INT ,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INt,
    name VARCHAR(100),
    department_id INT,
      
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);
-------------------

--masalalar
--1 task
select id ,name ,salary from employees
where salary = (select min(salary) from employees)

--2 task
select id, product_name , price from products
where price >(select AVG(price)from products)
select * from departments
--3 task
 select * from employees
	where department_id = (select id from departments where department_name = 'sales')
	  
--4 task
select * from customers as c1
where customer_id not in (select order_id from orders as c2 
where  c1.customer_id = c2.customer_id)
--2-usul
select * from customers
where customer_id not in (select customer_id from orders)

--5 task

CREATE TABLE products (
    id INT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);
select product_name, price, category_id from products as c1
where price = (select MAX(price) from products as c2 where c1.category_id = c2.category_id)

--6 task
CREATE TABLE departments_ (
    id INT ,
    department_name VARCHAR(100)
);

CREATE TABLE employees_ (
    id INT ,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    
);

INSERT INTO departments_ (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees_ (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);


select * from departments_
select * from employees_ as 
where salary = (select avg(salary)from departments_)

SELECT name, salary, department_id
FROM employees_
WHERE department_id = (
    SELECT TOP 1 department_id
    FROM employees_
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);

--7 task 
CREATE TABLE employees__ (
    id INT ,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees__ (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);

select * from employees__ as c1
where salary >(select AVG(salary) from employees__ as c2 where c1.department_id =c2.department_id )

--8 task 
CREATE TABLE students__ (
    student_id INT ,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
   
);

INSERT INTO students__ (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);

select  course_id,(select max(grade)from grades as c2 
where c1.course_id = c2.course_id ) as hello from grades as c1
group by course_id


--9 task
CREATE TABLE products_ (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products_(id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);


;with cte as (
select *,
DENSE_RANK() over (partition by category_id order by price desc)top_3
from products_
)select * from cte
where top_3 = 3


--10 task
CREATE TABLE employe (
    id INT ,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employe (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);
select * from employe

select *from employe as c1
where salary > (select AVG(salary) from employe as c2 
)and salary <(select MAX(salary) from employe as c3 where c1.department_id =c3.department_id)



SELECT name, salary, department_id
FROM employe e
WHERE 
    salary > (SELECT AVG(salary) FROM employe)
    AND salary < (
        SELECT MAX(salary)
        FROM employe e2
        WHERE e2.department_id = e.department_id
    );
