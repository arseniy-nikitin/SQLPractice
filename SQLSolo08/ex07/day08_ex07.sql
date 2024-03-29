-- day08_ex07.sql

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1
UPDATE pizzeria SET rating = 3.6 WHERE id = 1;
-- Session #2
UPDATE pizzeria SET rating = 4 WHERE id = 2;

-- Session #1
UPDATE pizzeria SET rating = 3.6 WHERE id = 2;
-- Session #2
-- Deadlock detected
UPDATE pizzeria SET rating = 4 WHERE id = 1;

-- Session #1
COMMIT;
-- Session #2
-- Transaction ends as ROLLBACK
COMMIT;