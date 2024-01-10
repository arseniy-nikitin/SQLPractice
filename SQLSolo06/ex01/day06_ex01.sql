-- day06_ex01.sql

INSERT INTO person_discounts (person_id, pizzeria_id, discount)
SELECT person.id,
       pizzeria.id,
       CASE
         WHEN COUNT(order_date) = 1
           THEN 10.5
         WHEN COUNT(order_date) = 2
           THEN 22
         ELSE 30
         END AS discount
FROM pizzeria
       INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
       INNER JOIN person_order ON person_order.menu_id = menu.id
       INNER JOIN person ON person_order.person_id = person.id
GROUP BY person.id, pizzeria.id;