CREATE DATABASE hw6;
USE hw6;

/*
Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней и часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/
DELIMITER //
CREATE FUNCTION seconds_format(seconds INT)  
RETURNS VARCHAR(55)
DETERMINISTIC 
READS SQL DATA
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE formatted VARCHAR(55);

-- Вычисление 
    SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds % (24 * 3600);
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;

    SET formatted = CONCAT(days, " days ", hours, " hours ", minutes, " minutes ", seconds, " seconds");

    RETURN formatted;
END //

DELIMITER ;

SELECT seconds_format(123456);


/*
Выведите только четные числа от 1 до 10.
*/

DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER //
CREATE PROCEDURE even_numbers()
BEGIN
    DECLARE x INT DEFAULT 1;
    DECLARE result VARCHAR(45) DEFAULT '';
    WHILE x <= 10 DO
        IF x % 2 = 0 THEN
            IF result = '' THEN
                SET result = x;
            ELSE
                SET result = CONCAT(result, ',', x);
            END IF;
        END IF;
        SET x = x + 1;
    END WHILE;
    SELECT result;
END //
DELIMITER ;

CALL even_numbers();