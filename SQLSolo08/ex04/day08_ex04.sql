-- day08_ex04.sql

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
-- Updating rating in second session and committing changes instantly
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- Session #1
-- Check changes and see that update from the first sessions don't affect second
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- But after committing in first changes finally refreshes in both sessions
COMMIT;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
-- This session changes were accepted but only after committing it in both sessions
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';