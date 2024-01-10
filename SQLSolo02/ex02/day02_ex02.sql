-- day02_ex02.sql

SELECT coalesce(person.name, '-'), visit_table.visit_date, coalesce(pizzeria.name, '-')
FROM (
       SELECT *
       FROM person_visits
       WHERE person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
     ) AS visit_table
       FULL JOIN pizzeria ON visit_table.pizzeria_id = pizzeria.id
       FULL JOIN person ON visit_table.person_id = person.id
ORDER BY 1, 2, 3;