-- day06_ex00.sql

CREATE TABLE person_discounts
(
  id          BIGSERIAL PRIMARY KEY,
  person_id   BIGINT,
  pizzeria_id BIGINT,
  discount    NUMERIC,
  CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
  CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
);