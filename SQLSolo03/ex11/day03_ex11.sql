-- day03_ex11.sql

UPDATE menu
SET price = price - price * 0.1
WHERE pizza_name = 'greek pizza';