-- day05_ex01.sql

SET enable_seqscan =OFF;
EXPLAIN ANALYZE
SELECT pizza_name,
       pizzeria.name AS pizzeria_name
FROM pizzeria
       INNER JOIN menu ON pizzeria.id = menu.pizzeria_id;