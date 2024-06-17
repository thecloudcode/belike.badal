# MySQL Commands and Operators 📊

## DDL (Data Definition Language) Commands
DDL commands in MySQL are used to define the structure of your database.

### Common DDL Commands:
- **CREATE**: Creates a new table, database, index, or view.
  ```sql
  CREATE TABLE table_name (
      column1 datatype constraints,
      column2 datatype constraints,
      ...
  );
  ```

- **ALTER**: Modifies existing database objects such as tables.
  ```sql
  ALTER TABLE table_name
      ADD column_name datatype constraints;
  ```

- **DROP**: Deletes objects like tables, databases, or views.
  ```sql
  DROP TABLE table_name;
  ```

- **TRUNCATE**: Deletes all records from a table, but keeps the table structure intact.
  ```sql
  TRUNCATE TABLE table_name;
  ```

## DML (Data Manipulation Language) Commands
DML commands manipulate data stored in the database.

### Common DML Commands:
- **SELECT**: Retrieves data from a database.
  ```sql
  SELECT column1, column2
  FROM table_name
  WHERE condition;
  ```

- **INSERT**: Adds new records into a table.
  ```sql
  INSERT INTO table_name (column1, column2)
  VALUES (value1, value2);
  ```

- **UPDATE**: Modifies existing records in a table.
  ```sql
  UPDATE table_name
  SET column1 = value1, column2 = value2
  WHERE condition;
  ```

- **DELETE**: Removes records from a table.
  ```sql
  DELETE FROM table_name
  WHERE condition;
  ```

## Operators in MySQL
Operators are used to perform operations on values and expressions.

### Types of Operators:
- **Arithmetic Operators**: Perform arithmetic operations.
  - `+`, `-`, `*`, `/`, `%` (modulus)

- **Comparison Operators**: Compare values.
  - `=`, `<>` or `!=`, `>`, `<`, `>=`, `<=`

- **Logical Operators**: Combine multiple conditions.
  - `AND`, `OR`, `NOT`

- **Bitwise Operators**: Perform bitwise operations.
  - `&`, `|`, `^` (XOR), `<<` (left shift), `>>` (right shift)

- **Assignment Operators**: Assign values.
  - `=`, `:=`

- **Miscellaneous Operators**: Specialized operations.
  - `LIKE`, `IN`, `BETWEEN`, `IS NULL`, `IS NOT NULL`

---

This README provides a quick reference for MySQL DDL and DML commands along with operators commonly used in MySQL queries. For more detailed information, refer to MySQL documentation or tutorials.
