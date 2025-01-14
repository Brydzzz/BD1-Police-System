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
        dbms_output.put_line('Nowe zarobki policjanta spoza widełek stanowiska: ' ||
                             v_min_salary || ' ' || v_max_salary);
        raise_application_error(-20001, 'Nowe zarobki poza widełkami');
    end if;
end;

-- Test trigger
update POLICEMAN
set SALARY=30000
where POLICEMAN_ID = 16;

update POLICEMAN
set SALARY=2000
where POLICEMAN_ID = 16;