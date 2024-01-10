-- day06_ex03.sql

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE person_id = 6
  AND pizzeria_id = 4;