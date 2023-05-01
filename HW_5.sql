CREATE DATABASE hw5;
USE hw5;

CREATE TABLE Cars
(
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NULL,
    cost  INT NULL
);

INSERT INTO Cars (name, cost) 
VALUES ('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

/*
Создайте представление, в которое попадут автомобили 
стоимостью до 25 000 долларов 
*/
CREATE VIEW CheapCars AS 
SELECT Name FROM Cars 
WHERE Cost<25000;
SELECT * FROM CheapCars;

/*
Изменить в существующем представлении порог для стоимости: 
пусть цена будет до 30 000 долларов
*/
ALTER VIEW CheapCars AS
SELECT Name FROM Cars
WHERE Cost<30000;

/*
Создайте представление, 
в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
*/
CREATE VIEW A_S AS
SELECT * FROM Cars
WHERE name = "Audi" OR name = "Skoda";
SELECT * FROM A_S;

/*
Вывести название и цену для всех анализов, 
которые продавались 5 февраля 2020 и всю следующую неделю.
*/ 
SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_id
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';
