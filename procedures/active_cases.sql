CREATE OR REPLACE PROCEDURE active_cases
IS
    CURSOR active_cases_cursor IS
        SELECT
            ac.ASSIGN_ID,
            ac.START_ASSIGN_DATE,
            ac.END_ASSIGN_DATE,
            ac.ROLE,
            p.POLICEMAN_NAME AS policeman_name,
            p.POLICEMAN_SURNAME AS policeman_surname,
            cr.CRIME_DATE AS case_date,
            cr.EXTRA_INFO AS case_info
        FROM
            ASSIGNED_CASE ac
        JOIN POLICEMAN p ON ac.POLICEMAN_ID = p.POLICEMAN_ID
        JOIN CRIMINAL_RECORD cr ON ac.CR_ID = cr.CR_ID
        WHERE
            ac.END_ASSIGN_DATE IS NULL
            OR ac.END_ASSIGN_DATE > SYSDATE; -- Sprawy w toku
BEGIN
    -- Iteracja przez sprawy aktywne
    FOR case_record IN active_cases_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Assign ID: ' || case_record.ASSIGN_ID);
        DBMS_OUTPUT.PUT_LINE('Role: ' || case_record.ROLE);
        DBMS_OUTPUT.PUT_LINE('Start Date: ' || TO_CHAR(case_record.START_ASSIGN_DATE, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('End Date: ' || NVL(TO_CHAR(case_record.END_ASSIGN_DATE, 'YYYY-MM-DD'), 'In Progress'));
        DBMS_OUTPUT.PUT_LINE('Policeman: ' || case_record.policeman_name || ' ' || case_record.policeman_surname);
        DBMS_OUTPUT.PUT_LINE('Case Date: ' || TO_CHAR(case_record.case_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Case Info: ' || case_record.case_info);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
END;

-- test
BEGIN
    active_cases;
END;
/