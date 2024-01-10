-- day09_ex08.sql

DROP FUNCTION IF EXISTS fnc_fibonacci() CASCADE;

CREATE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10) RETURNS TABLE (fibonacci BIGINT) AS
$$
WITH RECURSIVE f (fibonacci, b) AS
                 (SELECT 0 AS fibonacci, 1 AS b
                  UNION ALL
                  SELECT b, fibonacci + b
                  FROM f
                  WHERE b < pstop)
SELECT fibonacci
FROM f
$$ LANGUAGE sql;

select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();