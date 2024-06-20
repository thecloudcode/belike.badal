DELIMITER //

CREATE PROCEDURE example_procedure ()
BEGIN
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION example_function (param INT) RETURNS INT
BEGIN
    DECLARE result INT;
    RETURN result;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE example_cursor ()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE var1 INT;
    DECLARE example_cursor CURSOR FOR SELECT column1 FROM table1;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN example_cursor;

    read_loop: LOOP
        FETCH example_cursor INTO var1;
        IF done THEN
            LEAVE read_loop;
        END IF;
    END LOOP;

    CLOSE example_cursor;
END //

DELIMITER ;
