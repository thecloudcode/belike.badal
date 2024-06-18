SELECT 
    CONCAT('Hello', ' ', 'World') AS concatenated_text,
    UPPER('hello') AS uppercase_text,
    LOWER('HELLO') AS lowercase_text,
    LENGTH('Hello') AS length_of_text,
    SUBSTRING('Hello World', 7) AS substring_from_position,
    REPLACE('Hello World', 'World', 'MySQL') AS replaced_text;

SELECT 
    ABS(-10) AS absolute_value,
    ROUND(15.67) AS rounded_value,
    CEILING(15.67) AS ceiling_value,
    FLOOR(15.67) AS floor_value,
    SQRT(25) AS square_root_value,
    RAND() AS random_number;

SELECT 
    NOW() AS current_datetime,
    CURDATE() AS current_date,
    CURTIME() AS current_time,
    DATE_FORMAT(NOW(), '%Y-%m-%d') AS formatted_date;

SELECT 
    COUNT(*) AS total_rows,
    AVG(salary) AS average_salary,
    SUM(sales) AS total_sales,
    MAX(age) AS maximum_age,
    MIN(age) AS minimum_age
FROM 
    employees;

SELECT 
    CASE
        WHEN age < 18 THEN 'Minor'
        WHEN age >= 18 AND age < 65 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group
FROM 
    employees;

SELECT 
    JSON_OBJECT('name', 'John', 'age', 30) AS json_object,
    JSON_ARRAY('Apple', 'Banana', 'Orange') AS json_array;

SELECT 
    UUID() AS generated_uuid,
    INET_ATON('192.168.1.1') AS ip_address_integer,
    INET_NTOA(3232235777) AS integer_ip_address;


