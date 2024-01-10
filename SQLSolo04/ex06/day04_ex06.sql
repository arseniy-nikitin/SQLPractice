--  day04_ex06.sql

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS

WITH visit_info AS (
  SELECT pizzeria.name AS pizzeria_name,
         person.name   AS person_name,
         visit_date,
         price
  FROM person_visits
         INNER JOIN person ON person.id = person_visits.person_id
         INNER JOIN menu ON menu.pizzeria_id = person_visits.pizzeria_id
         INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
)

SELECT pizzeria_name
FROM visit_info
WHERE person_name IN ('Dmitriy')
  AND visit_date = '2022-01-08'
  AND price < 800
ORDER BY 1;