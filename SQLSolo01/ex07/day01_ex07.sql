-- day01_ex07.sql

SELECT order_date, CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
ORDER BY 1, 2;