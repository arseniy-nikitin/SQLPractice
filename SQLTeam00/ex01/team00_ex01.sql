-- team00_ex01.sql

WITH RECURSIVE tsp AS (
  SELECT point1       AS             actual_point,
         point2       AS             next_point,
         cost         AS             raw_cost,
         0 :: NUMERIC AS             last_cost,
         array [point1] :: VARCHAR[] path
  FROM nodes
  WHERE point1 = 'a'
  UNION ALL
  SELECT nodes.point1,
         nodes.point2,
         tsp.raw_cost + nodes.cost,
         nodes.cost AS last_cost,
         path || nodes.point1
  FROM tsp
         INNER JOIN nodes ON tsp.next_point = nodes.point1
  WHERE array_length(path, 1) < 5
)
SELECT DISTINCT raw_cost - last_cost AS total_cost,
                path                 AS tour
FROM tsp
WHERE array_length(path, 1) = 5
  AND 'a' = ANY (path)
  AND 'b' = ANY (path)
  AND 'c' = ANY (path)
  AND 'd' = ANY (path)
  AND actual_point = 'a';