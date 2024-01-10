-- day09_ex07.sql

DROP FUNCTION IF EXISTS func_minimum() CASCADE;

CREATE FUNCTION func_minimum(VARIADIC arr NUMERIC[]) RETURNS NUMERIC AS
$$
SELECT MIN(val)
FROM UNNEST(arr) AS val;
$$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);