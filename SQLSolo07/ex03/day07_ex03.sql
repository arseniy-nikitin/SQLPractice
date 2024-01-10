-- day07_ex03.sql

WITH actions_table AS (
  (SELECT name,
          COUNT(visit_date) AS count
   FROM person_visits
          INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
   GROUP BY name)
  UNION ALL
  (SELECT name,
          COUNT(order_date) AS count
   FROM person_order
          INNER JOIN menu ON menu.id = person_order.menu_id
          INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
   GROUP BY name)
)
SELECT name,
       SUM(count) AS total_count
FROM actions_table
GROUP BY name
ORDER BY total_count DESC, name ASC;