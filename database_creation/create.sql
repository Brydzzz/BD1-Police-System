-- Jak będziesz dodawać INSERT TO musisz seq_position_id.NEXTVAL..

/* W przypadku potrzeby restartu sekwencji
DROP SEQUENCE seq_position_id;
DROP SEQUENCE seq_department_id;
DROP SEQUENCE seq_assign_id;
DROP SEQUENCE seq_policeman_id;
DROP SEQUENCE seq_station_id;
DROP SEQUENCE seq_address_id;
DROP SEQUENCE seq_cr_id;
DROP SEQUENCE seq_crime_id;
DROP SEQUENCE seq_criminal_id;
*/

-- Sekwencje
CREATE SEQUENCE seq_position_id START WITH 10;
CREATE SEQUENCE seq_department_id START WITH 210;
CREATE SEQUENCE seq_assign_id START WITH 101;
CREATE SEQUENCE seq_policeman_id START WITH 11;
CREATE SEQUENCE seq_station_id START WITH 1;
CREATE SEQUENCE seq_address_id START WITH 101;
CREATE SEQUENCE seq_cr_id START WITH 201;
CREATE SEQUENCE seq_crime_id START WITH 101;
CREATE SEQUENCE seq_criminal_id START WITH 201;

-- Tabela ADDRESS
CREATE TABLE address
(
    address_id  NUMBER PRIMARY KEY,
    street      VARCHAR2(40) NOT NULL,
    postal_code VARCHAR2(40) NOT NULL,
    city        VARCHAR2(40) NOT NULL
);

-- Tabela STATION
CREATE TABLE station
(
    station_id   NUMBER PRIMARY KEY,
    station_name VARCHAR2(64),
    address_id   NUMBER NOT NULL
        REFERENCES address (address_id)
);

-- Tabela POSITION
CREATE TABLE position
(
    position_id   NUMBER PRIMARY KEY,
    position_name VARCHAR2(40) NOT NULL,
    min_salary    NUMBER(7, 2),
    max_salary    NUMBER(7, 2)
);

-- Tabela DEPARTMENT
CREATE TABLE department
(
    department_id   NUMBER PRIMARY KEY,
    department_name VARCHAR2(40) NOT NULL,
    station_id      NUMBER       NOT NULL
        REFERENCES station (station_id)
);

-- Tabela POLICEMAN
CREATE TABLE policeman
(
    policeman_id      NUMBER PRIMARY KEY,
    policeman_name    VARCHAR2(40) NOT NULL,
    policeman_surname VARCHAR2(40) NOT NULL,
    birth_date        DATE         NOT NULL,
    date_employed     DATE         NOT NULL,
    salary            NUMBER(7, 2),
    department_id     NUMBER       NOT NULL
        REFERENCES department (department_id),
    position_id       NUMBER       NOT NULL
        REFERENCES position (position_id)
);

-- Tabela CRIME
CREATE TABLE crime
(
    crime_id   NUMBER PRIMARY KEY,
    crime_name VARCHAR2(40) NOT NULL,
    article    NUMBER       NOT NULL,
    severity   VARCHAR2(40)
        CONSTRAINT severity_check CHECK ( severity IN ('Bardzo Niskie',
                                                       'Niskie',
                                                       'Średnie',
                                                       'Wysokie',
                                                       'Bardzo Wysokie') )
);

-- Tabela CRIMINAL
CREATE TABLE criminal
(
    criminal_id      NUMBER PRIMARY KEY,
    criminal_name    VARCHAR2(40) NOT NULL,
    criminal_surname VARCHAR2(40) NOT NULL,
    pesel            VARCHAR2(11) NOT NULL
        CONSTRAINT uq_criminal_pesel UNIQUE,
    birth_date       DATE,
    gender           CHAR(1)      NOT NULL
        CONSTRAINT gender_check CHECK ( gender IN ('K',
                                                   'M') ),
    address_id       NUMBER       NOT NULL
        REFERENCES address (address_id)
);

-- Tabela CRIMINAL_RECORD
CREATE TABLE criminal_record
(
    cr_id       NUMBER PRIMARY KEY,
    crime_date  DATE   NOT NULL,
    extra_info  VARCHAR2(512),
    crime_place NUMBER NOT NULL
        REFERENCES address (address_id),
    crime_id    NUMBER NOT NULL
        REFERENCES crime (crime_id),
    criminal_id NUMBER NOT NULL
        REFERENCES criminal (criminal_id)
);

-- Tabela ASSIGNED_CASE
CREATE TABLE assigned_case
(
    assign_id         NUMBER PRIMARY KEY,
    start_assign_date DATE   NOT NULL,
    end_assign_date   DATE,
    role              VARCHAR2(40)
        CONSTRAINT role_check CHECK ( role IN ('Główny Śledczy',
                                               'Śledczy',
                                               'Ekspert IT',
                                               'Przygotowanie dokumentacji',
                                               'Asystent śledczego',
                                               'Analiza psychologiczna') ),
    policeman_id      NUMBER NOT NULL
        REFERENCES policeman (policeman_id),
    cr_id             NUMBER
        REFERENCES criminal_record (cr_id)
);