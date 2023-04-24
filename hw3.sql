CREATE DATABASE hw3;
USE hw3;

# 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
SELECT SUM(amt)
FROM orders
WHERE odate = "2016-01-01";

# 2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.
SELECT COUNT(DISTINCT city)
FROM customers;

# 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
SELECT cnum, MIN(amt)
FROM orders
GROUP BY cnum;

# 4*. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г. Используется оператор "LIKE"
SELECT cname
FROM customers
WHERE cname LIKE "Г%";

# 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.
SELECT city, MAX(rating)
FROM customers
GROUP BY city;

# ЗАДАНИЕ 2

CREATE TABLE staff (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (20) NOT NULL, 
    surname VARCHAR (20) NOT NULL,
    speciality VARCHAR (20) NOT NULL,
    seniority INT NOT NULL,
    salary INT NOT NULL,
    age INT NOT NULL
);

INSERT staff( name, surname, speciality, seniority, salary, age)
VALUES
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
    ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
    ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);


# 1. Отсортируйте поле “сумма” в порядке убывания и возрастания
SELECT * FROM staff
ORDER BY salary DESC;
 
SELECT * FROM staff
ORDER BY salary;
 
# 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
SELECT * FROM staff
ORDER BY salary
LIMIT 5;

# 3. Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000
SELECT name,speciality,salary
FROM staff
WHERE speciality = "рабочий" and salary > 20000;
	