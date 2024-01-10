-- day00_ex08.sql

SELECT *
FROM person_order
WHERE id % 2 = 0
ORDER BY id;