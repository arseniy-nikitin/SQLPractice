-- day07_ex06.sql

SELECT name,
       COUNT(order_date)    AS count_of_orders,
       ROUND(AVG(price), 2) AS average_price,
       MAX(price)           AS max_price,
       MIN(price)           AS min_price
FROM person_order
       INNER JOIN menu ON menu.id = person_order.menu_id
       INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
GROUP BY name
ORDER BY name;