-- day06_ex05.sql

COMMENT ON COLUMN person_discounts.id IS 'Primary key id';
COMMENT ON COLUMN person_discounts.person_id IS 'Foreign key depends on person id primary key';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Foreign key depends on pizzeria id primary key';
COMMENT ON COLUMN person_discounts.discount IS 'Discount size which depends on orders number';
COMMENT ON TABLE person_discounts IS 'Table with individual discounts for persons';