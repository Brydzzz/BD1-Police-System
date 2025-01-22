CREATE OR REPLACE TRIGGER new_end_assign_date
    BEFORE INSERT OR UPDATE OF END_ASSIGN_DATE
    ON ASSIGNED_CASE
    FOR EACH ROW
BEGIN
    -- Check if the new END_ASSIGN_DATE is NULL
    IF :NEW.END_ASSIGN_DATE IS NULL THEN
        RETURN;
    END IF;

    -- Check if END_ASSIGN_DATE is in the future
    IF :NEW.END_ASSIGN_DATE > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Data zakończenia sprawy nie może być w przyszłości.');
    END IF;

    -- Check if END_ASSIGN_DATE is before START_ASSIGN_DATE
    IF :NEW.END_ASSIGN_DATE < :NEW.START_ASSIGN_DATE THEN
        RAISE_APPLICATION_ERROR(-20002, 'Data zakończenia sprawy musi być późniejsza niż data rozpoczęcia sprawy.');
    END IF;
END;
/


-- assign date zmieniona na w przeszłości, brak błędu
UPDATE ASSIGNED_CASE
SET END_ASSIGN_DATE = TO_DATE('2025-01-13', 'YYYY-MM-DD')
WHERE ASSIGN_ID = 104;

-- NULL scenario
UPDATE ASSIGNED_CASE
SET END_ASSIGN_DATE = NULL
WHERE ASSIGN_ID = 102;

-- nic się nie zmienia w tabeli
UPDATE ASSIGNED_CASE
SET END_ASSIGN_DATE = END_ASSIGN_DATE
WHERE ASSIGN_ID = 103;

-- assign date nie może być w przyszłości, trigger podnosi błąd
UPDATE ASSIGNED_CASE
SET END_ASSIGN_DATE = TO_DATE('2035-12-31', 'YYYY-MM-DD')
WHERE ASSIGN_ID = 101;

-- assign date wczesniej niż start_date, trigger podnosi błąd
UPDATE ASSIGNED_CASE
SET END_ASSIGN_DATE = TO_DATE('1985-01-13', 'YYYY-MM-DD')
WHERE ASSIGN_ID = 103;
