CREATE DATABASE IF NOT EXISTS trigger_demo;
USE trigger_demo;

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action VARCHAR(50),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS before_employee_insert;
DROP TRIGGER IF EXISTS after_employee_update;

DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (employee_id, action) VALUES (NEW.employee_id, 'update');
END //

DELIMITER ;

INSERT INTO employees (name, position, salary) VALUES ('Badal', 'Developer', -5000.00);

UPDATE employees SET salary = 6000.00 WHERE employee_id = 1;

SELECT * FROM employees;
SELECT * FROM audit_log;
