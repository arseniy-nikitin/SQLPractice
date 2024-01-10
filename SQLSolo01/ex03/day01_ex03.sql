-- day01_ex03.sql

SELECT order_date AS action_date, person_id
FROM person_order
INTERSECT ALL
SELECT visit_date AS action_date, person_id
FROM person_visits
ORDER BY action_date ASC, person_id DESC;