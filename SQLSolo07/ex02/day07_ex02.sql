-- day07_ex02.sql

(SELECT name,
        COUNT(visit_date)  AS count,
        'visit' :: VARCHAR AS action_type
 FROM person_visits
        INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3)
UNION ALL
(SELECT name,
        COUNT(order_date)  AS count,
        'order' :: VARCHAR AS action_type
 FROM person_order
        INNER JOIN menu ON menu.id = person_order.menu_id
        INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3)
ORDER BY action_type, count DESC;