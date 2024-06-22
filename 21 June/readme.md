# MySQL Procedures, Functions, Cursors, and TCL Commands

Welcome to the whimsical world of MySQL stored routines and transaction control commands! 🌟

## Procedures

Procedures in MySQL are similar to functions in programming languages. They are stored SQL code that you can call by name to execute a series of SQL statements. Here's how you can create and use a procedure:

```sql
DELIMITER //
CREATE PROCEDURE myProcedure()
BEGIN
    -- SQL statements here
    SELECT * FROM myTable;
END //
DELIMITER ;

-- Calling the procedure
CALL myProcedure();
```

## Functions

Functions are similar to procedures but return a single value and can be used in SQL queries or other functions. Let's create a simple function:

```sql
DELIMITER //
CREATE FUNCTION calculateTax(price DECIMAL(10,2), taxRate DECIMAL(5,2))
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE tax DECIMAL(10,2);
    SET tax = price * (taxRate / 100);
    RETURN tax;
END //
DELIMITER ;

-- Using the function in a query
SELECT product_name, price, calculateTax(price, 18) AS tax_amount FROM products;
```

## Cursors

Cursors in MySQL allow you to iterate through a result set row by row. They are handy when you need to perform operations on each row individually. Here's a simple example of using a cursor:

```sql
DELIMITER //
CREATE PROCEDURE processRecords()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id INT;
    DECLARE name VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT id, name FROM myTable;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO id, name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Process each row here
        SELECT CONCAT('Processing ', name);
    END LOOP;

    CLOSE cur;
END //
DELIMITER ;

CALL processRecords();
```

## TCL Commands (Transaction Control Language)

TCL commands help manage transactions in MySQL, ensuring data integrity and consistency. Key commands include:

- **START TRANSACTION**: Begins a transaction block.
- **COMMIT**: Saves changes permanently.
- **ROLLBACK**: Reverts changes since the last `COMMIT`.

Example of using TCL commands:

```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE account_id = 123;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 456;

COMMIT;
```

Explore more about MySQL's powerful features to unleash the full potential of your database operations! ✨