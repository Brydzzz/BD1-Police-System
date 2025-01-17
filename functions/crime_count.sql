create or replace function crime_count(p_id number)
    return number
    is
    v_crime_count number;
begin
    select count(*) into v_crime_count from CRIMINAL_RECORD where CRIMINAL_ID = p_id;
    return v_crime_count;
end;

-- przygotowanie danych
INSERT INTO CRIMINAL_RECORD (CR_ID, CRIME_DATE, EXTRA_INFO, CRIME_PLACE, CRIME_ID, CRIMINAL_ID)
VALUES (SEQ_CR_ID.nextval, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'Theft', 128, 117, 201);

INSERT INTO CRIMINAL_RECORD (CR_ID, CRIME_DATE, EXTRA_INFO, CRIME_PLACE, CRIME_ID, CRIMINAL_ID)
VALUES (SEQ_CR_ID.nextval, TO_DATE('2025-01-05', 'YYYY-MM-DD'), 'Burglary', 128, 117, 201);

INSERT INTO CRIMINAL_RECORD (CR_ID, CRIME_DATE, EXTRA_INFO, CRIME_PLACE, CRIME_ID, CRIMINAL_ID)
VALUES (SEQ_CR_ID.nextval, TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'Fraud', 128, 117, 201);

COMMIT;

-- 1
select crime_count(216)
from dual;

-- 2: powinien mieć 1
SELECT crime_count(217) AS crime_count
FROM dual;
