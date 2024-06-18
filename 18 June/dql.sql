SELECT COUNT(*) AS total_records
FROM your_table;

SELECT SUM(column_name) AS total_sum
FROM your_table;

SELECT AVG(column_name) AS average_value
FROM your_table;

SELECT MIN(column_name) AS min_value
FROM your_table;

SELECT MAX(column_name) AS max_value
FROM your_table;

SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

SELECT DISTINCT column_name
FROM your_table;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

SELECT YEAR(date_column) AS year
FROM your_table;

SELECT column_name, IFNULL(column_name, 'default_value') AS modified_column
FROM your_table;

SELECT SUBSTRING(column_name, start_position, length) AS extracted_string
FROM your_table;

SELECT NOW() AS current_datetime;

SELECT column_name,
       CASE
           WHEN condition1 THEN 'result1'
           WHEN condition2 THEN 'result2'
           ELSE 'default_result'
       END AS result_column
FROM your_table;

SELECT column_name, CAST(column_name AS new_data_type) AS modified_column
FROM your_table;

SELECT column_name, RAND() AS random_number
FROM your_table
ORDER BY RAND(); 

SELECT department_id, GROUP_CONCAT(employee_name SEPARATOR ', ') AS employees_list
FROM employees
GROUP BY department_id;

SELECT COALESCE(column1, column2, 'default_value') AS result_column
FROM your_table;

SELECT DATE_FORMAT(date_column, '%Y-%m-%d') AS formatted_date
FROM your_table;

SELECT UPPER(column_name) AS upper_case_column,
       LOWER(column_name) AS lower_case_column
FROM your_table;

SELECT TRIM(column_name) AS trimmed_column
FROM your_table;