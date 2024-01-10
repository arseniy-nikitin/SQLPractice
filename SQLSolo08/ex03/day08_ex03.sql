-- day08_ex03.sql

-- Session #1
BEGIN ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN ISOLATION LEVEL READ COMMITTED;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
-- Updating rating in second session and committing changes instantly
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- Session #1
-- Check changes and see that update from the first sessions was saved in both as expected
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
-- This session changes were accepted
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';