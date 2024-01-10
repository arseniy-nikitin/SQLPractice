-- day08_ex00.sql

-- Session #1
-- Start transaction, update data and check result
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria;

-- Session #2
-- Check that we can't see updated data
SELECT * FROM pizzeria;

-- Session #1
-- Commit changes
COMMIT;

-- Session #2
-- Now we can see updated data
SELECT * FROM pizzeria;