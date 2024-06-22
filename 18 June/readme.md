# MySQL Data Query Language (DQL) and Built-In Functions

## Data Query Language (DQL)
Data Query Language (DQL) is a subset of SQL (Structured Query Language) used for retrieving data from databases. In MySQL, DQL primarily consists of SELECT statements that fetch data based on specified criteria.

### Basic SELECT Statement
The basic syntax of a SELECT statement in MySQL:
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

#### Example:
```sql
SELECT * FROM users WHERE age > 25;
```

## Built-In Functions in MySQL

MySQL provides a rich set of built-in functions to manipulate data during queries. Here are some commonly used categories of functions:

### 1. String Functions
Functions to manipulate and operate on strings.

#### Example:
```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
```

### 2. Numeric Functions
Functions for numeric operations.

#### Example:
```sql
SELECT AVG(salary) AS average_salary FROM employees;

### 3. Date and Time Functions
Functions to work with date and time values.

#### Example:
```sql
SELECT DATE_FORMAT(date_column, '%Y-%m-%d') AS formatted_date FROM events;

### 4. Aggregate Functions
Functions to perform calculations on multiple rows of a query result.

#### Example:
```sql
SELECT COUNT(*) AS total_users FROM users;

### 5. Control Flow Functions
Functions that control the flow of execution in queries.

#### Example:
```sql
SELECT CASE WHEN age < 18 THEN 'Minor' ELSE 'Adult' END AS age_category FROM persons;
```

### 6. Mathematical Functions
Functions for mathematical calculations.

#### Example:
```sql
SELECT SQRT(number_column) AS square_root FROM numbers;

### 7. Conditional Functions
Functions to perform conditional logic within queries.

#### Example:
```sql
SELECT IFNULL(salary, 0) AS adjusted_salary FROM employees;

---

This README provides a brief overview of Data Query Language (DQL) and common built-in functions available in MySQL. For more detailed information, refer to the [MySQL documentation](https://dev.mysql.com/doc/).
```