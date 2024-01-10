-- day09_ex02.sql

DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit() CASCADE;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person CASCADE;

CREATE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS
$$
BEGIN
  INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
  VALUES ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
  AFTER DELETE
  ON person
  FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;