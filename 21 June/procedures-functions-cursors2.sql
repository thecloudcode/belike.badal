DELIMITER //

CREATE PROCEDURE simple_procedure()
BEGIN
    SELECT 'Hello, world!' AS Message;
END //

CREATE PROCEDURE add_numbers(IN a INT, IN b INT, OUT sum INT)
BEGIN
    SET sum = a + b;
END //

DELIMITER ;
DELIMITER //

CREATE FUNCTION multiply_numbers(a INT, b INT) RETURNS INT
BEGIN
    DECLARE result INT;
    SET result = a * b;
    RETURN result;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE example_cursor()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id INT;
    DECLARE name VARCHAR(255);
    
    DECLARE cur CURSOR FOR
        SELECT id, name FROM employees;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO id, name;
        IF done THEN
            LEAVE read_loop;
        END IF;
    END LOOP;
    
    CLOSE cur;
    
END //

DELIMITER ;
