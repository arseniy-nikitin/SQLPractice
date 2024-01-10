-- day09_ex05.sql

DROP FUNCTION IF EXISTS fnc_persons_female() CASCADE;
DROP FUNCTION IF EXISTS fnc_persons_male() CASCADE;

DROP FUNCTION IF EXISTS fnc_persons() CASCADE;

CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female') RETURNS SETOF person AS
$$
SELECT *
FROM person
WHERE gender = pgender;
$$ LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();