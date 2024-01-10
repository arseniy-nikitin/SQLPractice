-- day02_ex09.sql

WITH order_info AS (
  SELECT person.name AS person_name,
         pizza_name,
         gender
  FROM person_order
         INNER JOIN person ON person.id = person_order.person_id
         INNER JOIN menu ON menu.id = person_order.menu_id
)

SELECT person_name
FROM order_info
WHERE gender = 'female'
  AND (pizza_name = 'pepperoni pizza' OR pizza_name = 'cheese pizza')
GROUP BY person_name
HAVING COUNT(DISTINCT pizza_name) = 2
ORDER BY 1 ASC;