select cr.cr_id,
       c3.CRIMINAL_NAME,
       c3.CRIMINAL_SURNAME,
       cr.CRIME_DATE,
       c2.ARTICLE    as article,
       c2.CRIME_NAME as crime_name,
       c2.SEVERITY   as crime_severity,
       cr.EXTRA_INFO,
       a2.STREET     as crime_address,
       a2.CITY       as crime_city
from criminal_record cr
         join ADDRESS A2 on cr.CRIME_PLACE = A2.ADDRESS_ID
         join CRIME C2 on C2.CRIME_ID = cr.CRIME_ID
         join CRIMINAL C3 on cr.CRIMINAL_ID = C3.CRIMINAL_ID
where cr.CRIME_DATE between to_date('2019-05-06', 'YYYY-MM-DD') and to_date('2023-11-05', 'YYYY-MM-DD')
order by cr.CRIME_DATE desc;

select cr.cr_id,
       c2.CRIME_NAME,
       c2.SEVERITY,
       cr.CRIME_DATE,
       count(p.POLICEMAN_ID) as assigned_policemans,
       c3.CRIMINAL_NAME,
       c3.CRIMINAL_SURNAME
from CRIMINAL_RECORD cr
         join CRIME C2 on cr.CRIME_ID = C2.CRIME_ID
         join CRIMINAL C3 on C3.CRIMINAL_ID = cr.CRIMINAL_ID
         left join ASSIGNED_CASE AC on cr.CR_ID = AC.CR_ID
         left join POLICEMAN P on P.POLICEMAN_ID = AC.POLICEMAN_ID
where SEVERITY in ('Wysokie', 'Bardzo Wysokie')
group by cr.cr_id, c2.CRIME_NAME, cr.CRIMINAL_ID, c2.SEVERITY, cr.CRIME_DATE, c3.CRIMINAL_NAME,
         c3.CRIMINAL_SURNAME
having count(P.POLICEMAN_ID) <= 2
order by cr.CRIME_DATE desc;


-- Nowe wpisy, żeby pokazać dobrze warunek having count(P.POLICEMAN_ID) <= 2
insert into ASSIGNED_CASE (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
values (seq_ASSIGN_ID.nextval, '2025-01-01', null, 'Śledczy', 35, 218);

insert into ASSIGNED_CASE (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
values (seq_ASSIGN_ID.nextval, '2025-01-01', null, 'Śledczy', 35, 217);

insert into ASSIGNED_CASE (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
values (seq_ASSIGN_ID.nextval, '2025-01-01', null, 'Śledczy', 12, 217);

commit;

--- Wyświetl policjantów pracujących w jednym z 3 miast, gdzie było najwięcej przestępstw w ciągu ostatnich 4 lat
select p.POLICEMAN_NAME, p.POLICEMAN_SURNAME, p2.POSITION_NAME, d.DEPARTMENT_NAME, s.STATION_NAME, a2.city
from POLICEMAN p
         join POSITION P2 on P2.POSITION_ID = p.POSITION_ID
         join DEPARTMENT D on D.DEPARTMENT_ID = p.DEPARTMENT_ID
         join STATION S on D.STATION_ID = S.STATION_ID
         join ADDRESS A2 on A2.ADDRESS_ID = S.ADDRESS_ID
where a2.CITY in (select a3.city
                  from CRIMINAL_RECORD cr
                           join ADDRESS A3 on cr.CRIME_PLACE = A3.ADDRESS_ID
                  where cr.CRIME_DATE > add_months(sysdate, -48)
                  group by a3.city
                  order by count(cr.CR_ID) desc
                      fetch first 3 rows only)
order by a2.CITY desc;

-- Liczba przestępstw w danym mieście
select a2.city, count(cr.CR_ID) as num_of_crimes
from CRIMINAL_RECORD cr
         join ADDRESS A2 on A2.ADDRESS_ID = cr.CRIME_PLACE
group by a2.city
order by count(cr.CR_ID) desc, a2.CITY desc;