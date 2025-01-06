-- Insert ADDRESS
INSERT INTO address (address_id, street, postal_code, city) VALUES (101, 'Policyjna 15', '01-777', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city) VALUES (102, 'Samych Dobrych Ludzi 27', '03-457', 'Łomianki');
INSERT INTO address (address_id, street, postal_code, city) VALUES (103, 'Badawcza 1/45', '16-000', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city) VALUES (104, 'Niecodzienna 4', '00-999', 'Gdańsk');
INSERT INTO address (address_id, street, postal_code, city) VALUES (105, 'Cicha 2', '02-345', 'Kraków');
INSERT INTO address (address_id, street, postal_code, city) VALUES (106, 'Bezpieczna 12', '03-456', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city) VALUES (107, 'Główna 5', '10-111', 'Poznań');
INSERT INTO address (address_id, street, postal_code, city) VALUES (108, 'Pobocza 8', '20-222', 'Lublin');
INSERT INTO address (address_id, street, postal_code, city) VALUES (109, 'Złota 6', '30-333', 'Katowice');
INSERT INTO address (address_id, street, postal_code, city) VALUES (110, 'Wiejska 9', '40-444', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city) VALUES (111, 'Kwiatowa 11', '50-555', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city) VALUES (112, 'Słoneczna 14', '60-666', 'Gdynia');
INSERT INTO address (address_id, street, postal_code, city) VALUES (113, 'Kreta Bereta 17', '70-777', 'Kraków');
INSERT INTO address (address_id, street, postal_code, city) VALUES (114, 'Jesienna 20', '80-888', 'Bydgoszcz');
INSERT INTO address (address_id, street, postal_code, city) VALUES (115, 'Wiosenna 25', '90-999', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city) VALUES (116, 'Leśna 30', '11-111', 'Szczecin');
INSERT INTO address (address_id, street, postal_code, city) VALUES (117, 'Rzeczna 35', '22-222', 'Kielce');
INSERT INTO address (address_id, street, postal_code, city) VALUES (118, 'Kręta 40', '33-333', 'Szczecin');
INSERT INTO address (address_id, street, postal_code, city) VALUES (119, 'Podgórna 45', '44-444', 'Kielce');
INSERT INTO address (address_id, street, postal_code, city) VALUES (120, 'Wielkiego Słonia Afrykańskiego 50', '50-555', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city) VALUES (121, 'Zebra Niebieskopasiasta 50', '56-555', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city) VALUES (122, 'Klockowa 50', '05-534', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city) VALUES (123, 'Odkrywców Betonu 9', '05-534', 'Poznań');
INSERT INTO address (address_id, street, postal_code, city) VALUES (124, 'Trzech Oficerów 3', '33-333', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city) VALUES (125, 'Długo Idziemy 111', '05-534', 'Gdańsk');
COMMIT;
-- Insert STATION
INSERT INTO station (station_id, station_name, address_id) VALUES (1, 'Komenda Kubuś II', 101);
INSERT INTO station (station_id, station_name, address_id) VALUES (2, 'Komenda Południowa', 102);
INSERT INTO station (station_id, station_name, address_id) VALUES (3, 'Komenda Zachodnia', 103);
INSERT INTO station (station_id, station_name, address_id) VALUES (4, 'Komenda Centralna', 104);
INSERT INTO station (station_id, station_name, address_id) VALUES (5, 'Komenda Północna', 105);
INSERT INTO station (station_id, station_name, address_id) VALUES (6, 'Komenda Wschodnia', 106);
INSERT INTO station (station_id, station_name, address_id) VALUES (7, 'Komenda Śródmieście V', 107);
INSERT INTO station (station_id, station_name, address_id) VALUES (8, 'Komenda Osiedlowa', 108);
INSERT INTO station (station_id, station_name, address_id) VALUES (9, 'Komenda Lotniskowa', 109);
INSERT INTO station (station_id, station_name, address_id) VALUES (10, 'Komenda Portowa', 110);
INSERT INTO station (station_id, station_name, address_id) VALUES (11, 'Komenda Portkowa', 111);
COMMIT;

-- Insert POSITION
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (10, 'Detektyw Gadżet', 5000, 14500);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (11, 'Młodszy Detektyw', 4000, 12000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (12, 'Inspektor', 6000, 15000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (13, 'Technik Kryminalistyczny', 4500, 13000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (14, 'Komisarz', 7000, 16000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (15, 'Starszy Komisarz', 7500, 17000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (16, 'Podinspektor', 8000, 18000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (17, 'Nadkomisarz', 8500, 19000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (18, 'Rzecznik Prasowy', 5000, 14000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (19, 'Psycholog', 5500, 13000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (20, 'Specjalista ds. Bezpieczeństwa', 6000, 15000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (21, 'Młodszy Technik', 4000, 11000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (22, 'Asystent Detektywa', 3500, 9000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (23, 'Doradca ds. Kryminalistyki', 5000, 14000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (24, 'Kierownik Zespołu', 7000, 16000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (25, 'Analityk', 5000, 13000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (26, 'Ekspert IT', 6000, 14000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (27, 'Koordynator Operacji', 6500, 15500);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (28, 'Strateg Operacyjny', 7000, 16000);
INSERT INTO position (position_id, position_name, min_salary, max_salary) VALUES (29, 'Dyrektor Operacyjny', 9000, 20000);
COMMIT;

-- Insert DEPARTMENT
INSERT INTO department (department_id, department_name, station_id) VALUES (210, 'Wydział Spraw Niecodziennych', 1);
INSERT INTO department (department_id, department_name, station_id) VALUES (211, 'Wydział Kryminalny', 2);
INSERT INTO department (department_id, department_name, station_id) VALUES (212, 'Wydział Śledczy', 3);
INSERT INTO department (department_id, department_name, station_id) VALUES (213, 'Wydział Techniczny', 4);
INSERT INTO department (department_id, department_name, station_id) VALUES (214, 'Wydział ds. Ekonomicznych', 5);
INSERT INTO department (department_id, department_name, station_id) VALUES (215, 'Wydział Cyberprzestępczości', 6);
INSERT INTO department (department_id, department_name, station_id) VALUES (216, 'Wydział Narkotykowy', 7);
INSERT INTO department (department_id, department_name, station_id) VALUES (217, 'Wydział Przemocy Domowej', 8);
INSERT INTO department (department_id, department_name, station_id) VALUES (218, 'Wydział Operacyjny', 9);
INSERT INTO department (department_id, department_name, station_id) VALUES (219, 'Wydział Administracyjny', 10);
INSERT INTO department (department_id, department_name, station_id) VALUES (220, 'Wydział Badań DNA', 1);
INSERT INTO department (department_id, department_name, station_id) VALUES (221, 'Wydział Informatyczny', 2);
INSERT INTO department (department_id, department_name, station_id) VALUES (222, 'Wydział Archiwizacji', 3);
INSERT INTO department (department_id, department_name, station_id) VALUES (223, 'Wydział Analityki Danych', 4);
INSERT INTO department (department_id, department_name, station_id) VALUES (224, 'Wydział ds. Transportu', 5);
INSERT INTO department (department_id, department_name, station_id) VALUES (225, 'Wydział Szalonych Zaginięć', 6);
INSERT INTO department (department_id, department_name, station_id) VALUES (226, 'Wydział Zaopatrzenia', 7);
INSERT INTO department (department_id, department_name, station_id) VALUES (227, 'Wydział Szkoleń', 8);
INSERT INTO department (department_id, department_name, station_id) VALUES (228, 'Wydział X', 9);
INSERT INTO department (department_id, department_name, station_id) VALUES (229, 'Wydział UFO', 10);
COMMIT;


--- SET DATE FORMAT
ALTER SESSION SET nls_date_format = "DD/MM/YYYY";
---

-- Insert POLICEMAN
INSERT INTO policeman (
  policeman_id,policeman_name,policeman_surname,birth_date,date_employed,department_id,position_id
) VALUES ( 11,'Andrzej','Wielkagłowa','13/05/1974','21/11/2001',210,10 );
COMMIT;

-- Insert CRIME
INSERT INTO crime (
  crime_id,crime_name,article,severity
) VALUES ( 101,'Kradzież broni biologicznej',235,'Bardzo Wysokie' );
COMMIT;

-- Insert CRIMINAL
INSERT INTO criminal (
  criminal_id,criminal_name,criminal_surname,pesel,birth_date,gender,address_id
) VALUES ( 222,'Bob','Bobowicz','01012345678','29/02/2004','M',102 );
COMMIT;

-- Insert CRIMINAL_RECORD
INSERT INTO criminal_record (
  cr_id,crime_date,extra_info,crime_place,crime_id,criminal_id
) VALUES ( 123,'25/12/2024','Przestępca uciekł w maszynie przypominającej wielki kawałek sera',103,101,222 );
COMMIT;

-- Insert ASSIGNED_CASE
INSERT INTO assigned_case (
  assign_id,start_assign_date,end_assign_date,role,policeman_id,cr_id
) VALUES ( 101,'26/12/2024',NULL,'Główny Śledczy',11,123 );
COMMIT;