-- day01_ex01.sql

SELECT object_name
FROM (
    SELECT name AS object_name, 1 AS objects_order
    FROM person
    UNION ALL
    SELECT pizza_name AS object_name, 2 AS objects_order
    FROM menu
) AS combined_data
ORDER BY objects_order, object_name;