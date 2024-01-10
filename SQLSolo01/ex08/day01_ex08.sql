-- day01_ex08.sql

SELECT order_date, CONCAT(update_person.name, ' (age:', update_person.age, ')') AS person_information
FROM person_order
NATURAL JOIN (
    SELECT person.age, person.name, person.id AS person_id
    FROM person
) AS update_person
ORDER BY 1, 2;