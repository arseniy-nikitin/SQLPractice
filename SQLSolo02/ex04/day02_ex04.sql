-- day02_ex04.sql

WITH pizza_info AS (
  SELECT pizza_name,
         name AS pizzeria_name,
         price
  FROM menu
         INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)

SELECT pizza_name,
       pizzeria_name,
       price
FROM pizza_info
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY pizza_name ASC, pizzeria_name ASC;