-- day09_ex04.sql

DROP FUNCTION IF EXISTS fnc_persons_female() CASCADE;
DROP FUNCTION IF EXISTS fnc_persons_male() CASCADE;

CREATE FUNCTION fnc_persons_female() RETURNS SETOF person AS
$$
SELECT *
FROM person
WHERE gender = 'female';
$$ LANGUAGE sql;

CREATE FUNCTION fnc_persons_male() RETURNS SETOF person AS
$$
SELECT *
FROM person
WHERE gender = 'male';
$$ LANGUAGE sql;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
