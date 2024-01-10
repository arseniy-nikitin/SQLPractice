-- day01_ex02.sql

SELECT pizza_name
FROM menu
UNION
SELECT pizza_name
FROM menu
ORDER BY pizza_name DESC;