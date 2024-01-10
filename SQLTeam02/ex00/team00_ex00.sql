-- team00_ex01.sql

CREATE TABLE nodes
(
  point1 varchar,
  point2 varchar,
  cost   numeric
);

INSERT INTO nodes
VALUES ('a', 'b', 10);
INSERT INTO nodes
VALUES ('b', 'a', 10);

INSERT INTO nodes
VALUES ('a', 'c', 15);
INSERT INTO nodes
VALUES ('c', 'a', 15);

INSERT INTO nodes
VALUES ('a', 'd', 20);
INSERT INTO nodes
VALUES ('d', 'a', 20);

INSERT INTO nodes
VALUES ('b', 'c', 35);
INSERT INTO nodes
VALUES ('c', 'b', 35);

INSERT INTO nodes
VALUES ('b', 'd', 25);
INSERT INTO nodes
VALUES ('d', 'b', 25);

INSERT INTO nodes
VALUES ('c', 'd', 30);
INSERT INTO nodes
VALUES ('d', 'c', 30);


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
), min_tsp AS (
  SELECT DISTINCT raw_cost - last_cost AS total_cost,
                  path                 AS tour
  FROM tsp
  WHERE array_length(path, 1) = 5
    AND 'a' = ANY (path)
    AND 'b' = ANY (path)
    AND 'c' = ANY (path)
    AND 'd' = ANY (path)
    AND actual_point = 'a'
)
SELECT *
FROM min_tsp
WHERE total_cost = (SELECT MIN(total_cost) FROM min_tsp);