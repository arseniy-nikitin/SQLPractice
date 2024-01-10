-- day07_ex08.sql

SELECT address,
       pizzeria.name     AS pizzeria_name,
       COUNT(order_date) AS count_of_orders
FROM person
       INNER JOIN person_order ON person_order.person_id = person.id
       INNER JOIN menu ON menu.id = person_order.menu_id
       INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY address, pizzeria_name
ORDER BY address, pizzeria_name;