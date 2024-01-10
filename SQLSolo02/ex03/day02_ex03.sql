-- day02_ex03.sql

WITH target_visitors AS (
  SELECT person_id,
         visit_date
  FROM person_visits
  WHERE person_id = 1
     OR person_id = 2
)
SELECT target_dates :: date AS missing_date
FROM target_visitors
       RIGHT JOIN generate_series('2022-01-01', '2022-01-10', interval '1 day') AS target_dates
                  ON target_visitors.visit_date = target_dates
WHERE target_visitors.person_id IS NULL
ORDER BY 1;