-- day06_ex02.sql

SELECT person.name,
       menu.pizza_name,
       menu.price,
       menu.price - menu.price * (person_discounts.discount / 100) AS discount_price,
       pizzeria.name                                               AS pizzeria_name
FROM pizzeria
       INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
       INNER JOIN person_order ON person_order.menu_id = menu.id
       INNER JOIN person ON person.id = person_order.person_id
       INNER JOIN person_discounts
                  ON person_discounts.pizzeria_id = pizzeria.id AND person_discounts.person_id = person.id
ORDER BY 1, 2;