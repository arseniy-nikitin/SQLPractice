-- day03_ex04.sql

WITH user_info AS (
  SELECT pizzeria.name AS pizzeria_name,
         order_date,
         gender
  FROM pizzeria
         INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
         INNER JOIN person_order ON person_order.menu_id = menu.id
         INNER JOIN person ON person.id = person_order.person_id
)

SELECT pizzeria_name
FROM user_info
GROUP BY pizzeria_name
HAVING COUNT(DISTINCT gender) = 1
ORDER BY 1;