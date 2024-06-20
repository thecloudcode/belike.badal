START TRANSACTION;

COMMIT;

ROLLBACK;

SET autocommit = 0;

SET autocommit = 1;

SAVEPOINT savepoint_name;
ROLLBACK TO SAVEPOINT savepoint_name;
RELEASE SAVEPOINT savepoint_name;
