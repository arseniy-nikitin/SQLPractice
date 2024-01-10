-- day08_ex05.sql

-- Session #1
BEGIN ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN ISOLATION LEVEL READ COMMITTED;

-- Session #1
SELECT SUM(rating) FROM pizzeria;

-- Session #2
-- Updating rating in second session and committing changes instantly
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

-- Session #1
-- Check changes and see that update from the first sessions was saved in both as expected
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Session #1
SELECT SUM(rating) FROM pizzeria;
-- Session #2
-- This session changes were accepted
SELECT SUM(rating) FROM pizzeria;