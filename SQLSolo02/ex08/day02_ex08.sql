-- day02_ex08.sql

WITH order_info AS (
  SELECT person.name   AS person_name,
         pizza_name,
         gender,
         address
  FROM person_order
         INNER JOIN person ON person.id = person_order.person_id
         INNER JOIN menu ON menu.id = person_order.menu_id
)

SELECT person_name
FROM order_info
WHERE gender = 'male'
  AND (address LIKE '%Moscow%' OR address LIKE '%Samara%')
  AND (pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza')
ORDER BY 1 DESC;