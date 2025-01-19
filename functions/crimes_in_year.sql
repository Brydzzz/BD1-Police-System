create or replace function crimes_in_year(year number)
    return number
    is
    cases_count number;
begin
    select count(*) into cases_count from CRIMINAL_RECORD where extract(year from CRIME_DATE) = year;
    return cases_count;
end;

-- TESTY
-- 1: normalny rok, powinien: 3
select crimes_in_year(2023)
from dual;

-- 2: rok, który jeszcze nie miał miejsca, powinien: 0
select crimes_in_year(2028)
from dual;

-- 3: rok NULL, powinien 0
select crimes_in_year(NULL)
from dual;

-- 4: rok bardzo dawny, powinien 0
select crimes_in_year(976)
from dual;

