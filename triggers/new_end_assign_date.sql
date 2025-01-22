create or replace TRIGGER new_end_assign_date
    before insert or update of END_ASSIGN_DATE
    on ASSIGNED_CASE
    for each row
BEGIN
    IF :NEW.end_assign_date IS NULL THEN
        RETURN;
    END IF;

    IF :NEW.end_assign_date > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Data zakończenia sprawy nie może być w przyszłości.');
    END IF;

    IF :NEW.end_assign_date < :new.start_assign_date then
        RAISE_APPLICATION_ERROR(-20002, 'Data zakończenia sprawy musi być późniejsza niż data zakończenia sprawy');
    END IF;

end;


-- assign date zmieniona na w przeszłości, brak błędu
UPDATE ASSIGNED_CASE
SET END_ASSIGN_DATE = TO_DATE('2025-01-13', 'YYYY-MM-DD')
WHERE ASSIGN_ID = 103;

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
