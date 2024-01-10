-- day08_ex06.sql

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1
SELECT SUM(rating) FROM pizzeria;

-- Session #2
-- Updating rating in second session and committing changes instantly
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;

-- Session #1
-- Check changes and see that update from the first sessions don't affect second
SELECT SUM(rating) FROM pizzeria;
-- But after committing in first changes finally refreshes in both sessions
COMMIT;

-- Session #1
SELECT SUM(rating) FROM pizzeria;
-- Session #2
-- This session changes were accepted but only after committing it in both sessions
SELECT SUM(rating) FROM pizzeria;