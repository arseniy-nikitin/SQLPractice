-- day02_ex06.sql

WITH order_info AS (
  SELECT pizza_name,
         pizzeria.name AS pizzeria_name,
         person.name   AS person_name
  FROM person_order
         INNER JOIN person ON person.id = person_order.person_id
         INNER JOIN menu ON menu.id = person_order.menu_id
         INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
)

SELECT pizza_name,
       pizzeria_name
FROM order_info
WHERE person_name IN ('Denis', 'Anna')
ORDER BY 1, 2;