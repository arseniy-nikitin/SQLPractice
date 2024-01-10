-- day03_ex03.sql

WITH user_info AS (
  SELECT pizzeria.name AS pizzeria_name,
         visit_date,
         gender
  FROM pizzeria
         INNER JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
         INNER JOIN person ON person.id = person_visits.person_id
)

SELECT pizzeria_name
FROM user_info
GROUP BY pizzeria_name
HAVING COUNT(gender) FILTER (WHERE gender = 'male') != COUNT(gender) FILTER (WHERE gender = 'female')
ORDER BY 1;