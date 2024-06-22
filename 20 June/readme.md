# MySQL Procedures, Functions, Cursors, and TCL Commands 🚀

Welcome to this guide on MySQL stored procedures, functions, cursors, and TCL (Transaction Control Language) commands!

## Procedures

Stored procedures in MySQL are reusable SQL code blocks that can be called from within SQL statements or applications.

### Syntax
```sql
DELIMITER //

CREATE PROCEDURE procedure_name(param1 datatype, param2 datatype)
BEGIN
    -- Procedure body
END //

DELIMITER ;
```

## Functions

Functions in MySQL are similar to procedures but return a single value and are primarily used in expressions.

### Syntax
```sql
DELIMITER //

CREATE FUNCTION function_name(param1 datatype, param2 datatype) RETURNS return_datatype
BEGIN
    DECLARE variable_name datatype;
    -- Function body
    RETURN variable_name;
END //

DELIMITER ;
```

## Cursors

Cursors in MySQL allow processing rows returned by a query one by one.

### Syntax
```sql
DECLARE cursor_name CURSOR FOR SELECT_statement;
OPEN cursor_name;
FETCH cursor_name INTO variables;
CLOSE cursor_name;
```

## TCL Commands

TCL (Transaction Control Language) commands manage transactions within MySQL.

### Commands
- **COMMIT:** Save the transaction.
- **ROLLBACK:** Rollback the transaction.
- **SAVEPOINT:** Set a savepoint within the transaction.

Example usage:
```sql
START TRANSACTION;
-- SQL statements;
COMMIT;
```

## Conclusion

Understanding procedures, functions, cursors, and TCL commands in MySQL can significantly enhance your database management skills. Feel free to explore further and experiment with these powerful features!
