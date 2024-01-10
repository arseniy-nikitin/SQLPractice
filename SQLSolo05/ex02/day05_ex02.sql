-- day05_ex02.sql

CREATE INDEX idx_person_name ON person(upper(name));

SET enable_seqscan =OFF;
EXPLAIN ANALYZE
SELECT *
FROM person
WHERE name = 'Kate'