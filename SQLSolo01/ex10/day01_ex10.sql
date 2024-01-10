-- day01_ex10.sql

SELECT person.name AS person_name, order_table.pizza_name, order_table.name AS pizzeria_name
FROM person
INNER JOIN (
    SELECT menu.pizza_name, pizzeria.name, person_order.person_id
    FROM menu
    INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    INNER JOIN person_order ON menu.id = person_order.menu_id
) AS order_table ON person.id = order_table.person_id
ORDER BY 1, 2, 3;