-- day02_ex10.sql

SELECT person_name1.name AS person_name1,
       person_name2.name AS person_name2,
       person_name1.address AS common_address
FROM person person_name1
       INNER JOIN person person_name2
                  ON (person_name1.address = person_name2.address AND person_name1.id > person_name2.id)
ORDER BY 1, 2, 3;