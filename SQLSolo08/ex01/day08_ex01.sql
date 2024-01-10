-- day08_ex01.sql

-- Check transaction isolation in both sessions
SHOW TRANSACTION ISOLATION LEVEL;

-- Session #1
BEGIN;
-- Session #2
BEGIN;

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
COMMIT;

-- Session #1
-- This session changes were lost
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
-- This session changes were accepted
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';