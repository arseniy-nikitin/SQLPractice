-- day03_ex01.sql

WITH user_activity AS (
  SELECT menu.id AS menu_id,
         person_order.id AS order_id
  FROM person_order
        FULL JOIN menu ON menu.id = person_order.menu_id
)

SELECT menu_id
FROM user_activity
WHERE order_id IS NULL
ORDER BY 1;

-- What is EXCEPT, lol