create or replace function crimes_in_year(year number)
    return number
    is
    cases_count number;
begin
    select count(*) into cases_count from CRIMINAL_RECORD where extract(year from CRIME_DATE) = year;
    return cases_count;
end;

select crimes_in_year(2023)
from dual;