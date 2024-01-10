-- day05_ex05.sql

CREATE UNIQUE INDEX idx_person_order_order_date ON person_order(person_id, menu_id);

SET enable_seqscan =OFF;
EXPLAIN ANALYZE
SELECT *
FROM person_order
WHERE person_id = 8 AND menu_id = 19;