--  day04_ex07.sql

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT pizzeria.id
         FROM pizzeria
                INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
         WHERE name != 'Dominos'
           AND price < 800
         LIMIT 1),
        '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;