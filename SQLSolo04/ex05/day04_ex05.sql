--  day04_ex05.sql

CREATE VIEW v_price_with_discount AS

WITH order_list AS (
  SELECT name,
         pizza_name,
         price
  FROM person_order
         INNER JOIN menu ON menu.id = person_order.menu_id
         INNER JOIN person ON person.id = person_order.person_id
)

SELECT name,
       pizza_name,
       price,
       (price - price * 0.1) :: INTEGER AS discount_price
FROM order_list
ORDER BY 1, 2;