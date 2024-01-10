-- day05_ex04.sql

CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan =OFF;
EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE pizzeria_id = 4 AND pizza_name = 'mushroom pizza';