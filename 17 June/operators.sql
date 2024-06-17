
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    emp_salary DECIMAL(10, 2),
    emp_dept_id INT
);


INSERT INTO employees (emp_id, emp_name, emp_salary, emp_dept_id) 
VALUES 
(1, 'John Doe', 50000.00, 1),
(2, 'Jane Smith', 60000.00, 2),
(3, 'Michael Johnson', 55000.00, 1),
(4, 'Emily Davis', 52000.00, 3),
(5, 'Chris Wilson', 58000.00, 2);


SELECT * FROM employees;


UPDATE employees
SET emp_salary = emp_salary * 1.1
WHERE emp_dept_id = 2;


DELETE FROM employees
WHERE emp_id = 5;


SELECT emp.emp_name, dept.dept_name
FROM employees emp
INNER JOIN departments dept ON emp.emp_dept_id = dept.dept_id;


CREATE INDEX idx_emp_dept_id ON employees (emp_dept_id);


DROP TABLE employees;
