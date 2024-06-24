CREATE TABLE account (
    account_id INT PRIMARY KEY,
    balance DECIMAL(10, 2)
);

INSERT INTO account (account_id, balance) VALUES (1, 1000.00), (2, 2000.00);

START TRANSACTION;
UPDATE account SET balance = balance - 100.00 WHERE account_id = 1;
UPDATE account SET balance = balance + 100.00 WHERE account_id = 2;
COMMIT;

START TRANSACTION;
UPDATE account SET balance = balance - 50.00 WHERE account_id = 1;
UPDATE account SET balance = balance + 50.00 WHERE account_id = 2;
ROLLBACK;

SELECT * FROM account;
