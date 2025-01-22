create or replace TRIGGER case_propositions
       after update of END_ASSIGN_DATE on ASSIGNED_CASE for each row
DECLARE
    v_new_cr_id ASSIGNED_CASE.assign_id%TYPE;

    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF :NEW.end_assign_date = :OLD.end_assign_date THEN
        RETURN;
    END IF;

    IF :NEW.end_assign_date > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Data zakończenia sprawy nie może być w przyszłości.');
    END IF;

    IF :NEW.end_assign_date IS NULL THEN
        -- nie trzeba nic robić
        RETURN;
    END IF;

    SELECT cr.CR_ID INTO v_new_cr_id
    from CRIMINAL_RECORD cr
    left join ASSIGNED_CASE ac on cr.CR_ID = ac.CR_ID
    where ac.CR_ID is null
    and ROWNUM = 1;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Proponowane przestępstwo: ' || v_new_cr_id);
end;

-- Zmiana daty na inną przed właściwym UPDATE
UPDATE ASSIGNED_CASE
SET END_ASSIGN_DATE = TO_DATE('2025-01-01', 'YYYY-MM-DD')
WHERE ASSIGN_ID = 103;

-- assign date zmieniona na w przeszłości, rezultat: trigger zadziała
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

-- assign date nie może być w przyszłości, rezultat: błąd
UPDATE ASSIGNED_CASE
SET END_ASSIGN_DATE = TO_DATE('2025-12-31', 'YYYY-MM-DD')
WHERE ASSIGN_ID = 101;
