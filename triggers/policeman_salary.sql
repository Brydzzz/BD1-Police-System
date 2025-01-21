create or replace TRIGGER fair_salary
    before insert or update of SALARY
    on POLICEMAN
    for each row
DECLARE
    v_min_salary POSITION.min_salary%TYPE;
    v_max_salary POSITION.max_salary%TYPE;
begin
    select MIN_SALARY, MAX_SALARY
    into v_min_salary, v_max_salary
    from POSITION
    WHERE POSITION.POSITION_ID = :new.POSITION_ID;

    if :new.salary not between v_min_salary and v_max_salary then
        DBMS_OUTPUT.PUT_LINE('Nowe zarobki policjanta (' || :new.salary || ') są spoza widełek stanowiska: ' ||
                             v_min_salary || ' - ' || v_max_salary);
    end if;
end;

-- Test trigger
-- poza widełkami
update POLICEMAN
set SALARY=30000
where POLICEMAN_ID = 16;

-- poza widełkami
update POLICEMAN
set SALARY=2000
where POLICEMAN_ID = 16;

-- w widełkach
update POLICEMAN
set SALARY=17000
where POLICEMAN_ID = 16;

-- insert poza widełkami
INSERT INTO POLICEMAN (POLICEMAN_ID, POLICEMAN_NAME, POLICEMAN_SURNAME,
                       BIRTH_DATE, DATE_EMPLOYED, POSITION_ID, DEPARTMENT_ID,
                       SALARY)
VALUES (SEQ_POLICEMAN_ID.nextval, 'Samuel', 'Judasz', '1964-05-13',
        '2002-11-21', 20, 210, 90000);

-- insert w widełkach
INSERT INTO POLICEMAN (POLICEMAN_ID, POLICEMAN_NAME, POLICEMAN_SURNAME,
                       BIRTH_DATE, DATE_EMPLOYED, POSITION_ID, DEPARTMENT_ID,
                       SALARY)
VALUES (SEQ_POLICEMAN_ID.nextval, 'Samuel', 'Baran', '1964-05-13',
        '2002-11-21', 20, 210, 7000);
