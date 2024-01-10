-- day03_ex05.sql

WITH user_info AS (
  SELECT pizzeria.name AS pizzeria_name,
         person.name   AS person_name,
         visit_date,
         order_date
  FROM person_visits
         FULL JOIN person_order ON person_order.order_date = person_visits.visit_date
         INNER JOIN person ON person.id = person_visits.person_id
         INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
)

SELECT pizzeria_name
FROM user_info
WHERE person_name = 'Andrey'
  AND order_date IS NULL
ORDER BY 1;