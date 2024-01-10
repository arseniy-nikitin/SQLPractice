-- day02_ex05.sql

SELECT name
FROM person
WHERE age > 25 AND gender = 'female'
ORDER BY name ASC;