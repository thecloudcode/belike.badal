DROP PROCEDURE IF EXISTS exampleProcedure;
DROP FUNCTION IF EXISTS exampleFunction;

DELIMITER //

CREATE PROCEDURE exampleProcedure()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id INT;
    DECLARE name VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT id, name FROM users;
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

CREATE FUNCTION exampleFunction(userId INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE result VARCHAR(255);
    
    SELECT name INTO result FROM users WHERE id = userId;
    
    RETURN result;
END //

DELIMITER ;
