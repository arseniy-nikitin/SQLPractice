-- day03_ex02.sql

WITH user_activity AS (
  SELECT person_order.id AS order_id,
         pizzeria.name   AS pizzeria_name,
         pizza_name,
         price
  FROM person_order
         FULL JOIN menu ON menu.id = person_order.menu_id
         INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
)

SELECT pizza_name,
       price,
       pizzeria_name
FROM user_activity
WHERE order_id IS NULL
ORDER BY 1, 2;