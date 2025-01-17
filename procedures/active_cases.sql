CREATE OR REPLACE PROCEDURE active_cases
IS
    CURSOR active_cases_cursor IS
        SELECT
            ac.assign_id,
            ac.start_assign_date,
            ac.end_assign_date,
            ac.role,
            p.POLICEMAN_NAME AS policeman_name,
            p.POLICEMAN_SURNAME AS policeman_surname,
            cr.crime_date AS case_date,
            cr.extra_info AS case_info
        FROM
            ASSIGNED_CASE ac
        JOIN POLICEMAN p ON ac.policeman_id = p.policeman_id
        JOIN CRIMINAL_RECORD cr ON ac.cr_id = cr.cr_id
        WHERE
            ac.end_assign_date IS NULL
            OR ac.end_assign_date > SYSDATE; -- Sprawy w toku
BEGIN
    -- Iteracja przez sprawy aktywne
    FOR case_record IN active_cases_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Assign ID: ' || case_record.assign_id);
        DBMS_OUTPUT.PUT_LINE('Role: ' || case_record.role);
        DBMS_OUTPUT.PUT_LINE('Start Date: ' || TO_CHAR(case_record.start_assign_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('End Date: ' || NVL(TO_CHAR(case_record.end_assign_date, 'YYYY-MM-DD'), 'In Progress'));
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