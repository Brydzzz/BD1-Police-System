-- Insert ADDRESS
INSERT INTO address (
  address_id,street,postal_code,city
) VALUES ( 101,'Policyjna 15','01-777','Warszawa' );
INSERT INTO address (
  address_id,street,postal_code,city
) VALUES ( 102,'Samych Dobrych Ludzi 27','03-457','Łomianki' );
INSERT INTO address (
  address_id,street,postal_code,city
) VALUES ( 103,'Badawcza 1/45','16-000','Warszawa' );
commit;

-- Insert STATION
INSERT INTO station (
  station_id,station_name,address_id
) VALUES ( 1,'Komenda Rejonowa Kubuś II',101 );
commit;

-- Insert POSITION
INSERT INTO position (
  position_id,position_name,min_salary,max_salary
) VALUES ( 10,'Detektyw Gadżet',5000,14500 );
commit;

-- Insert DEPARTMENT
INSERT INTO department (
  department_id,department_name,station_id
) VALUES ( 210,'Wydział Spraw Niecodziennych',1 );
commit;

--- SET DATE FORMAT
ALTER SESSION SET nls_date_format = "DD/MM/YYYY";
---

-- Insert POLICEMAN
INSERT INTO policeman (
  policeman_id,policeman_name,policeman_surname,birth_date,date_employed,department_id,position_id
) VALUES ( 11,'Andrzej','Wielkagłowa','13/05/1974','21/11/2001',210,10 );
commit;

-- Insert CRIME
INSERT INTO crime (
  crime_id,crime_name,article,severity
) VALUES ( 101,'Kradzież broni biologicznej',235,'Niebezpieczeństwo' );
commit;

-- Insert CRIMINAL
INSERT INTO criminal (
  criminal_id,criminal_name,criminal_surname,pesel,birth_date,gender,address_id
) VALUES ( 222,'Bob','Bobowicz','01012345678','29/02/2004','M',102 );
commit;

-- Insert CRIMINAL_RECORD
INSERT INTO criminal_record (
  cr_id,crime_date,extra_info,crime_place,crime_id,criminal_id
) VALUES ( 123,'25/12/2024','Przestępca uciekł w maszynie przypominającej wielki kawałek sera',103,101,222 );
commit;

-- Insert ASSIGNED_CASE
INSERT INTO assigned_case (
  assign_id,start_assign_date,end_assign_date,role,policeman_id,cr_id
) VALUES ( 101,'26/12/2024',NULL,'Główny Śledczy',11,123 );
commit;

