SELECT column1, column2
FROM table_name
WHERE condition;

SELECT * FROM employees WHERE department = 'IT';

SELECT DISTINCT column_name
FROM table_name;

SELECT DISTINCT city FROM customers;

SELECT COUNT(*)
FROM table_name;

SELECT COUNT(*) FROM orders;

SELECT SUM(column_name)
FROM table_name;

SELECT SUM(quantity * unit_price) AS total_sales FROM order_details;

SELECT AVG(column_name)
FROM table_name;

SELECT AVG(salary) FROM employees;

SELECT MIN(column_name)
FROM table_name;

SELECT MIN(order_date) FROM orders;

SELECT MAX(column_name)
FROM table_name;

SELECT MAX(salary) FROM employees;

SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name;

SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department;

SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;

SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department HAVING AVG(salary) > 50000;

SELECT column1, column2
FROM table_name
ORDER BY column1 ASC, column2 DESC;

SELECT product_name, unit_price FROM products ORDER BY unit_price DESC;

SELECT column1, column2
FROM table_name
LIMIT number_of_rows;

SELECT * FROM customers LIMIT 10;

SELECT column1, column2
FROM table_name
WHERE column1 LIKE 'pattern';

SELECT * FROM products WHERE product_name LIKE 'Chai%';

SELECT column1, column2
FROM table_name
WHERE column1 IN (value1, value2, ...);

SELECT * FROM orders WHERE customer_id IN (1, 3, 5);

SELECT column1, column2
FROM table_name
WHERE column1 BETWEEN value1 AND value2;

SELECT * FROM employees WHERE salary BETWEEN 30000 AND 50000;

SELECT column1, column2
FROM table_name
WHERE column1 IS NULL;

SELECT * FROM customers WHERE phone_number IS NULL;

SELECT column1, column2
FROM table_name t1
WHERE EXISTS (SELECT * FROM another_table t2 WHERE t1.column_name = t2.column_name);

SELECT * FROM employees e WHERE EXISTS (SELECT * FROM orders o WHERE e.employee_id = o.employee_id);

SELECT CONCAT(column1, ' - ', column2) AS concatenated_column
FROM table_name;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

SELECT DATE_FORMAT(date_column, 'format_string')
FROM table_name;

SELECT DATE_FORMAT(order_date, '%Y-%m-%d') AS formatted_date FROM orders;

SELECT column1, IF(condition, value_if_true, value_if_false) AS result_column
FROM table_name;

SELECT product_name, IF(unit_price > 50, 'Expensive', 'Affordable') AS price_category FROM products;

SELECT column1,
       CASE
           WHEN condition1 THEN result1
           WHEN condition2 THEN result2
           ELSE default_result
       END AS result_column
FROM table_name;

SELECT product_name,
       CASE
           WHEN unit_price < 20 THEN 'Low'
           WHEN unit_price >= 20 AND unit_price < 50 THEN 'Medium'
           ELSE 'High'
       END AS price_category
FROM products;
