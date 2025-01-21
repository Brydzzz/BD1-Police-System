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