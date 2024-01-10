-- day03_ex06.sql

WITH pizza_info AS (
  SELECT  p1.pizza_name,
                  p1.pizzeria_id AS pizzeria_id_1,
                  p2.pizzeria_id AS pizzeria_id_2,
                  p1.price
  FROM menu p1
         INNER JOIN menu p2
                    ON p1.id != p2.id
                      AND p1.price = p2.price
                      AND p1.pizza_name = p2.pizza_name
                      AND p1.pizzeria_id > p2.pizzeria_id
)

SELECT pizza_name,
       m1.name AS pizzeria_name_1,
       m2.name AS pizzeria_name_2,
       price
FROM pizza_info
       INNER JOIN pizzeria m1 ON pizza_info.pizzeria_id_1 = m1.id
       INNER JOIN pizzeria m2 ON pizza_info.pizzeria_id_2 = m2.id
ORDER BY 1;