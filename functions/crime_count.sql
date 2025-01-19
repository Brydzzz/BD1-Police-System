create or replace function crime_count(p_id number)
    return number
    is
    v_crime_count number;
begin
    select count(*) into v_crime_count from CRIMINAL_RECORD where CRIMINAL_ID = p_id;
    return v_crime_count;
end;

-- TESTY
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

-- 2: powinien mieć 4
SELECT crime_count(201) AS crime_count
FROM dual;

INSERT INTO CRIMINAL (CRIMINAL_ID, CRIMINAL_NAME, CRIMINAL_SURNAME, PESEL, BIRTH_DATE, GENDER, ADDRESS_ID)
VALUES (SEQ_CRIMINAL_ID.nextval, 'Stanisław', 'Wokulski', 78012345678, '1978-01-12', 'M', 112);

COMMIT;

-- 3: przestępca bez cr: powinien mieć 0 (stworzony do testów)
SELECT crime_count(217) AS crime_count
FROM dual;

-- 4: liczba przestępstw dla NULL: powinien mieć 0
SELECT crime_count(NULL) AS crime_count
FROM dual;
