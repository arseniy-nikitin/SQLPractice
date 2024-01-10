-- day09_ex06.sql

DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date() CASCADE;

CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy',
                                                   pprice NUMERIC DEFAULT '500',
                                                   pdate DATE DEFAULT '2022-01-08')
  RETURNS TABLE (pizzeria_name VARCHAR)
AS
$$
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
WHERE person_name = pperson
  AND visit_date = pdate
  AND price < pprice
ORDER BY 1;
$$ LANGUAGE sql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');