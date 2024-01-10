-- day03_ex12.sql

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT MAX(po.id) + p.id,
       p.id,
       m.id,
       '2022-02-25'
FROM person p
       CROSS JOIN menu m
       CROSS JOIN person_order po
WHERE m.pizza_name = 'greek pizza'
GROUP BY p.id, m.id;