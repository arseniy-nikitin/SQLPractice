-- day03_ex00.sql

WITH user_activity AS (
  SELECT pizza_name,
         price,
         pizzeria.name AS pizzeria_name,
         visit_date,
         person.name   AS person_name
  FROM person_visits
         INNER JOIN person ON person.id = person_visits.person_id
         INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
         INNER JOIN menu ON menu.pizzeria_id = person_visits.pizzeria_id
)

SELECT pizza_name,
       price,
       pizzeria_name,
       visit_date
FROM user_activity
WHERE person_name = 'Kate'
  AND price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;