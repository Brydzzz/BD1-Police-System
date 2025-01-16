create or replace function crime_count(p_id number)
    return number
    is
    v_crime_count number;
begin
    select count(*) into v_crime_count from CRIMINAL_RECORD where CRIMINAL_ID = p_id;
    return v_crime_count;
end;

select crime_count(216)
from dual;