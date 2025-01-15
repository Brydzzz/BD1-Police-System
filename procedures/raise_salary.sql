create or replace procedure raise_salary
    is
    cursor policeman_cr is
        select p.POLICEMAN_ID,
               p.POLICEMAN_NAME,
               p.POLICEMAN_SURNAME,
               p.salary,
               p.date_employed,
               pos.MAX_SALARY,
               count(c.ASSIGN_ID) as case_count
        from POLICEMAN p
                 left join ASSIGNED_CASE c on p.POLICEMAN_ID = c.POLICEMAN_ID
                 join POSITION pos on p.POSITION_ID = pos.POSITION_ID
        group by p.POLICEMAN_ID, p.POLICEMAN_NAME, p.POLICEMAN_SURNAME, p.SALARY, p.DATE_EMPLOYED, pos.MAX_SALARY;
    c_year_rate      number := 0.01;
    c_case_rate      number := 0.02;
    c_max_case_bonus number := 0.1;
    c_max_year_bonus number := 0.15;
    v_id             policeman.policeman_id%TYPE;
    v_name           policeman.policeman_name%type;
    v_surname        policeman.policeman_surname%type;
    v_salary         policeman.SALARY%type;
    v_date_employed  policeman.DATE_EMPLOYED%type;
    v_case_count     number;
    v_year_count     number;
    v_max_salary     number;
    v_year_bonus     number;
    v_case_bonus     number;
    v_new_salary     number;
begin
    open policeman_cr;
    loop
        fetch policeman_cr into v_id, v_name, v_surname, v_salary, v_date_employed, v_max_salary, v_case_count;
        exit when policeman_cr%notfound;

        v_year_count := extract(year from sysdate) - extract(year from v_date_employed);
        if v_year_count * c_year_rate > c_max_year_bonus then
            v_year_bonus := c_max_year_bonus * v_salary;
        else
            v_year_bonus := v_year_count * c_year_rate;
        end if;
        if v_case_count * c_case_rate > c_max_case_bonus then
            v_case_bonus := v_salary * c_max_case_bonus;
        else
            v_case_bonus := v_salary * (c_case_rate * v_case_count);
        end if;

        v_new_salary := v_salary + v_case_bonus + v_year_bonus;

        if v_new_salary > v_max_salary then
            DBMS_OUTPUT.PUT_LINE('Pensja dla ' || v_name || ' ' || v_surname || ' nie może zostać podniesiona, ' ||
                                 'pensja po podwyżce przekracza maksymalną pensję na stanowisku');
        else
            update POLICEMAN set SALARY=v_new_salary where POLICEMAN_ID = v_id;
            DBMS_OUTPUT.PUT_LINE('Podniesiono pensję ' || v_name || ' ' || v_surname || ' z ' || v_salary ||
                                 ' na ' || v_new_salary);
        end if;

    end loop;
    close policeman_cr;
end;

begin
    raise_salary;
end;

select *
from POLICEMAN;