-- day08_ex02.sql

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1
-- Updating rating in first session
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- Session #2
-- Updating rating in second session, now this session waiting for commit from first session
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;
-- Session #2
-- After committing the changes in the first session, an error occurred - could not serialize access due to concurrent update
-- Transaction ends as ROLLBACK
COMMIT;

-- Session #1
-- This session changes were accepted
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
-- This session changes were lost
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';