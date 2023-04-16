CREATE DATABASE hw2;
SHOW DATABASES;
USE hw2;

# 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.
CREATE TABLE sales
(
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
    count INT DEFAULT '0'
);

INSERT sales (order_date, count)
VALUES
('2023-01-01', 111),
('2023-01-02', 112),
('2023-01-03', 113),
('2023-01-04', 114),
('2023-01-05', 115),
('2023-01-06', 211),
('2023-01-07', 312),
('2023-01-08', 413),
('2023-01-09', 614),
('2023-01-10', 715);

# 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT 
	id AS 'id_order',
	IF (count < 100, 'small', 
		IF (count BETWEEN 100 AND 300, 'middle', 'big')
	) AS 'type_order'	
FROM sales;

/*
 3. Создайте таблицу “orders”, заполните ее значениями. 
    Покажите “полный” статус заказа, используя оператор CASE
*/
CREATE TABLE orders (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	employee_id VARCHAR(5) NOT NULL UNIQUE DEFAULT 'e00',
	amount FLOAT(7,2) NOT NULL DEFAULT '0.00',
    order_status VARCHAR(15) NOT NULL DEFAULT 'OPEN'
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
('e02', 79.53, 'CANCELLED'),
('e04', 11.00, 'OPEN'),
('e01', 8.40, 'CANCELLED'),
('e05', 58.30, 'OPEN'),
('e03', 14.36, 'CLOSED');

SELECT 
	employee_id AS 'order',
	amount AS 'amount',
       CASE order_status 
		WHEN 'OPEN' THEN 'Order is in open state'
		WHEN 'CLOSED' THEN 'Order is closed'
		WHEN 'CANCELLED' THEN 'Order is cancelled'
	END AS 'full status'	
FROM orders;

/*
4. Чем NULL отличается от 0? 
	NULL - пустота, отсутствие каких-либо данных
    0 - цифра, или значение, можно использовать в мат.операциях
*/

