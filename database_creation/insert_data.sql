-- Insert ADDRESS
INSERT INTO address (address_id, street, postal_code, city)
VALUES (101, 'Policyjna 15', '01-777', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (102, 'Samych Dobrych Ludzi 27', '03-457', 'Łomianki');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (103, 'Badawcza 1/45', '16-000', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (104, 'Niecodzienna 4', '00-999', 'Gdańsk');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (105, 'Cicha 2', '02-345', 'Kraków');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (106, 'Bezpieczna 12', '03-456', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (107, 'Główna 5', '10-111', 'Poznań');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (108, 'Pobocza 8', '20-222', 'Lublin');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (109, 'Złota 6', '30-333', 'Katowice');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (110, 'Wiejska 9', '40-444', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (111, 'Kwiatowa 11', '50-555', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (112, 'Słoneczna 14', '60-666', 'Gdynia');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (113, 'Kreta Bereta 17', '70-777', 'Kraków');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (114, 'Jesienna 20', '80-888', 'Bydgoszcz');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (115, 'Wiosenna 25', '90-999', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (116, 'Leśna 30', '11-111', 'Szczecin');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (117, 'Rzeczna 35', '22-222', 'Kielce');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (118, 'Kręta 40', '33-333', 'Szczecin');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (119, 'Podgórna 45', '44-444', 'Kielce');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (120, 'Wielkiego Słonia Afrykańskiego 50', '50-555', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (121, 'Zebra Niebieskopasiasta 50', '56-555', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (122, 'Klockowa 50', '05-534', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (123, 'Odkrywców Betonu 9', '05-534', 'Poznań');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (124, 'Trzech Oficerów 3', '33-333', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (125, 'Długo Idziemy 111', '05-534', 'Gdańsk');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (126, 'Zdrówko 2', '05-134', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (127, 'Kamienna 89', '09-534', 'Warszawa');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (128, 'Płomykowa 999', '03-534', 'Łódź');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (129, 'Bez Zakrętow 103', '04-534', 'Łódź');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (130, 'Tablicowa 888', '05-574', 'Kraków');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (131, 'Biała 1', '05-664', 'Kraków');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (133, 'Batalionów Kuku 45', '05-534', 'Gdynia');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (132, 'Armii Złotego Słońca 47', '15-534', 'Gdynia');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (134, 'Promieniowania X 30', '25-534', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (135, 'Ben 10', '35-534', 'Gdańsk');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (136, 'Geralta z Rivii 25', '45-534', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (137, 'Zgrupowania Tancerzy Synchronicznych 210', '55-534', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (138, 'Aleja Kwiatów Polnych', '65-534', 'Gdynia');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (139, 'Walcowa 555', '65-004', 'Gdańsk');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (140, 'Benka z Bloku 70', '12-534', 'Wrocław');
INSERT INTO address (address_id, street, postal_code, city)
VALUES (141, 'Tworóców Koła 7', '00-504', 'Gdańsk');
COMMIT;

-- Insert STATION
INSERT INTO station (station_id, station_name, address_id)
VALUES (1, 'Komenda Kubuś II', 101);
INSERT INTO station (station_id, station_name, address_id)
VALUES (2, 'Komenda Południowa', 102);
INSERT INTO station (station_id, station_name, address_id)
VALUES (3, 'Komenda Zachodnia', 103);
INSERT INTO station (station_id, station_name, address_id)
VALUES (4, 'Komenda Centralna', 104);
INSERT INTO station (station_id, station_name, address_id)
VALUES (5, 'Komenda Północna', 105);
INSERT INTO station (station_id, station_name, address_id)
VALUES (6, 'Komenda Wschodnia', 106);
INSERT INTO station (station_id, station_name, address_id)
VALUES (7, 'Komenda Śródmieście V', 107);
INSERT INTO station (station_id, station_name, address_id)
VALUES (8, 'Komenda Osiedlowa', 108);
INSERT INTO station (station_id, station_name, address_id)
VALUES (9, 'Komenda Lotniskowa', 109);
INSERT INTO station (station_id, station_name, address_id)
VALUES (10, 'Komenda Portowa', 110);
INSERT INTO station (station_id, station_name, address_id)
VALUES (11, 'Komenda Portkowa', 111);
COMMIT;

-- Insert POSITION
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (10, 'Detektyw Gadżet', 5000, 14500);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (11, 'Młodszy Detektyw', 4000, 12000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (12, 'Inspektor', 6000, 15000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (13, 'Technik Kryminalistyczny', 4500, 13000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (14, 'Komisarz', 7000, 16000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (15, 'Starszy Komisarz', 7500, 17000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (16, 'Podinspektor', 8000, 18000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (17, 'Nadkomisarz', 8500, 19000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (18, 'Rzecznik Prasowy', 5000, 14000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (19, 'Psycholog', 5500, 13000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (20, 'Specjalista ds. Bezpieczeństwa', 6000, 15000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (21, 'Młodszy Technik', 4000, 11000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (22, 'Asystent Detektywa', 3500, 9000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (23, 'Doradca ds. Kryminalistyki', 5000, 14000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (24, 'Kierownik Zespołu', 7000, 16000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (25, 'Analityk', 5000, 13000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (26, 'Ekspert IT', 6000, 14000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (27, 'Koordynator Operacji', 6500, 15500);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (28, 'Strateg Operacyjny', 7000, 16000);
INSERT INTO position (position_id, position_name, min_salary, max_salary)
VALUES (29, 'Dyrektor Operacyjny', 9000, 20000);
COMMIT;

-- Insert DEPARTMENT
INSERT INTO department (department_id, department_name, station_id)
VALUES (210, 'Wydział Spraw Niecodziennych', 1);
INSERT INTO department (department_id, department_name, station_id)
VALUES (211, 'Wydział Kryminalny', 2);
INSERT INTO department (department_id, department_name, station_id)
VALUES (212, 'Wydział Śledczy', 3);
INSERT INTO department (department_id, department_name, station_id)
VALUES (213, 'Wydział Techniczny', 4);
INSERT INTO department (department_id, department_name, station_id)
VALUES (214, 'Wydział ds. Ekonomicznych', 5);
INSERT INTO department (department_id, department_name, station_id)
VALUES (215, 'Wydział Cyberprzestępczości', 6);
INSERT INTO department (department_id, department_name, station_id)
VALUES (216, 'Wydział Narkotykowy', 7);
INSERT INTO department (department_id, department_name, station_id)
VALUES (217, 'Wydział Przemocy Domowej', 8);
INSERT INTO department (department_id, department_name, station_id)
VALUES (218, 'Wydział Operacyjny', 9);
INSERT INTO department (department_id, department_name, station_id)
VALUES (219, 'Wydział Administracyjny', 10);
INSERT INTO department (department_id, department_name, station_id)
VALUES (220, 'Wydział Badań DNA', 1);
INSERT INTO department (department_id, department_name, station_id)
VALUES (221, 'Wydział Informatyczny', 2);
INSERT INTO department (department_id, department_name, station_id)
VALUES (222, 'Wydział Archiwizacji', 3);
INSERT INTO department (department_id, department_name, station_id)
VALUES (223, 'Wydział Analityki Danych', 4);
INSERT INTO department (department_id, department_name, station_id)
VALUES (224, 'Wydział ds. Transportu', 5);
INSERT INTO department (department_id, department_name, station_id)
VALUES (225, 'Wydział Szalonych Zaginięć', 6);
INSERT INTO department (department_id, department_name, station_id)
VALUES (226, 'Wydział Zaopatrzenia', 7);
INSERT INTO department (department_id, department_name, station_id)
VALUES (227, 'Wydział Szkoleń', 8);
INSERT INTO department (department_id, department_name, station_id)
VALUES (228, 'Wydział X', 9);
INSERT INTO department (department_id, department_name, station_id)
VALUES (229, 'Wydział UFO', 10);
COMMIT;


--- SET DATE FORMAT
ALTER SESSION SET nls_date_format = 'DD/MM/YYYY';
---

-- Insert POLICEMAN
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (11, 'Andrzej', 'Wielkagłowa', '13/05/1974', '21/11/2001', 210, 10, 10000);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (12, 'Karolina', 'Nowak', '05/07/1980', '12/03/2005', 211, 12, 7000);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (13, 'Jan', 'Kowalski', '19/01/1985', '15/09/2010', 212, 13, 11000);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (14, 'Anna', 'Wiśniewska', '22/03/1990', '01/06/2013', 213, 14, 12000);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (15, 'Piotr', 'Zieliński', '07/11/1976', '10/02/2000', 214, 15, 7600);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (16, 'Ewa', 'Jankowska', '18/08/1982', '25/12/2008', 215, 16, 14500);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (17, 'Marek', 'Kozłowski', '30/06/1989', '30/09/2012', 216, 17, 9000);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (18, 'Magdalena', 'Mazur', '10/02/1993', '15/08/2016', 217, 18, 6000);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (19, 'Tomasz', 'Krawczyk', '25/12/1984', '11/11/2011', 218, 19, 12500);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (20, 'Katarzyna', 'Dąbrowska', '17/09/1988', '20/03/2015', 219, 20, 12000);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (21, 'Paweł', 'Król', '12/04/1991', '01/01/2017', 220, 21, 4300);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (22, 'Joanna', 'Szymańska', '05/02/1995', '14/07/2018', 221, 22, 5400);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (23, 'Łukasz', 'Czarnecki', '09/06/1978', '18/08/2002', 222, 23, 7800);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (24, 'Agnieszka', 'Sikora', '03/10/1986', '20/05/2011', 223, 24, 1235);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (25, 'Michał', 'Wojciechowski', '01/01/1980', '12/02/2005', 224, 25, 5690);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (26, 'Beata', 'Kamińska', '15/05/1992', '28/09/2016', 225, 26, 8000);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (27, 'Grzegorz', 'Lewandowski', '20/03/1987', '06/12/2013', 226, 27, 12450);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (28, 'Sylwia', 'Baran', '27/11/1984', '21/04/2011', 227, 28, 13045);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (29, 'Adam', 'Włodarczyk', '06/08/1981', '15/09/2006', 228, 29, 7210);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (30, 'Julia', 'Chmielewska', '30/12/1990', '30/10/2014', 229, 10, 7460);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (31, 'Kacper', 'Markot', '30/12/1990', '30/10/2014', 229, 10, 7460);
INSERT INTO policeman (policeman_id, policeman_name, policeman_surname, birth_date, date_employed, department_id,
                       position_id, salary)
VALUES (32, 'Błażej', 'Ryba', '30/12/1990', '30/10/2010', 229, 10, 7460);
COMMIT;


-- Insert CRIME
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (101, 'Kradzież broni biologicznej', 235, 'Bardzo Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (102, 'Napad na bank', 310, 'Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (103, 'Morderstwo z premedytacją', 140, 'Bardzo Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (104, 'Oszustwo podatkowe', 210, 'Średnie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (105, 'Handel narkotykami', 250, 'Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (106, 'Przemoc domowa', 120, 'Średnie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (107, 'Nielegalna imigracja', 270, 'Niskie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (108, 'Włamanie do systemu IT', 330, 'Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (109, 'Porwanie', 160, 'Bardzo Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (110, 'Fałszowanie dokumentów', 220, 'Średnie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (111, 'Napad na jubilera', 230, 'Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (112, 'Sabotaż', 280, 'Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (113, 'Korupcja urzędników', 300, 'Średnie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (114, 'Zniszczenie mienia publicznego', 180, 'Niskie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (115, 'Nielegalne wyścigi', 290, 'Niskie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (116, 'Nieumyślne spowodowanie śmierci', 150, 'Średnie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (117, 'Kradzież dzieł sztuki', 240, 'Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (118, 'Oszustwo bankowe', 320, 'Wysokie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (119, 'Nielegalne posiadanie broni', 260, 'Średnie');
INSERT INTO crime (crime_id, crime_name, article, severity)
VALUES (120, 'Przemyt ludzi', 170, 'Bardzo Wysokie');
COMMIT;


-- Insert CRIMINAL
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (201, 'Robert', 'Kowal', '89012345678', '12/01/1989', 'M', 112);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (202, 'Anna', 'Zielińska', '85040512345', '05/04/1985', 'K', 113);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (203, 'Piotr', 'Wiśniewski', '77090998765', '09/09/1977', 'M', 114);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (204, 'Katarzyna', 'Mazur', '91020234567', '02/02/1991', 'K', 115);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (205, 'Marek', 'Baran', '84071556789', '15/07/1984', 'M', 116);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (206, 'Ewa', 'Dąbrowska', '88031245678', '12/03/1988', 'K', 117);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (207, 'Tomasz', 'Król', '93061812345', '18/06/1993', 'M', 118);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (208, 'Agnieszka', 'Kamińska', '95090198765', '01/09/1995', 'K', 119);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (209, 'Michał', 'Lewandowski', '81041634567', '16/04/1981', 'M', 120);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (210, 'Beata', 'Sikorska', '92070845678', '08/07/1992', 'K', 121);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (211, 'Grzegorz', 'Chmielewski', '79040598765', '05/04/1979', 'M', 122);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (212, 'Sylwia', 'Krawczyk', '86030212345', '02/03/1986', 'K', 123);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (213, 'Adam', 'Nowak', '94061556789', '15/06/1994', 'M', 124);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (214, 'Julia', 'Zawadzka', '98090734567', '07/09/1998', 'K', 125);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (215, 'Jakub', 'Szymański', '90010345678', '03/01/1990', 'M', 126);
INSERT INTO criminal (criminal_id, criminal_name, criminal_surname, pesel, birth_date, gender, address_id)
VALUES (216, 'Magdalena', 'Wojciechowska', '87052098765', '20/05/1987', 'K', 127);
COMMIT;


-- Insert CRIMINAL_RECORD
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (201, '12/01/2023', 'Ukradł diamenty z muzeum', 128, 117, 201);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (202, '15/03/2022', 'Podszywał się pod policjanta', 129, 110, 202);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (203, '30/08/2021', 'Nielegalny wyścig uliczny', 130, 115, 203);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (204, '05/11/2020', 'Fałszywe dokumenty', 131, 110, 204);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (205, '22/06/2024', 'Porwanie dziecka', 132, 109, 205);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (206, '18/04/2022', 'Nielegalne posiadanie broni o zasiegu 500m', 133, 119, 206);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (207, '25/09/2023', 'Włamał się do banku', 134, 102, 207);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (208, '10/02/2021', 'Sabotaż na budowie centrum kultury. Podejrzany wymienił metalowe śrubki na plastikowe', 135,
        112, 208);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (209, '14/07/2023', 'Przemyt ludzi do Rumunii', 136, 120, 209);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (210, '21/12/2024', 'Napad na jubilera. Wartość ukradzionej biżuterii: 280tys. zł', 137, 111, 210);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (211, '25/02/2014', '5 urzędnikom zostało wręczone po 18tys zł', 138, 113, 211);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (212, '14/12/2015', 'Przedmiot zbrodni: ostry nóż', 139, 103, 212);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (213, '04/07/2018', 'Wykradzione zostały dane 300 użytkowników serwsiu polizarcie.pl', 140, 108, 213);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (214, '05/02/2019', 'Łączna ilość sprzedanego towaru: 100kg', 141, 105, 214);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (215, '23/03/2020', 'Przestępca zbiegł z pieniędzmi do Maroka', 134, 104, 215);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (216, '17/04/2021', 'Zniszczone zostały 3 ławki, 8 latarni, 10 przystanków, 5 śmietników', 135, 114, 216);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (217, '08/01/2025', 'Wyłudzone zostało 30tys z Banku Zielona Lampa', 136, 118,
        216);
INSERT INTO criminal_record (cr_id, crime_date, extra_info, crime_place, crime_id, criminal_id)
VALUES (218, '08/01/2025', 'Wyłudzone zostało 70tys z Banku Żółta Lampa', 135, 118,
        216);
COMMIT;


-- Insert ASSIGNED_CASE
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (101, '26/02/2023', NULL, 'Główny Śledczy', 11, 201);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (102, '26/12/2022', '13/06/2024', 'Śledczy', 12, 202);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (103, '04/12/2021', NULL, 'Ekspert IT', 13, 203);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (104, '11/12/2020', NULL, 'Przygotowanie dokumentacji', 14, 204);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (105, '26/10/2024', NULL, 'Asystent śledczego', 15, 205);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (106, '26/05/2023', NULL, 'Analiza psychologiczna', 16, 206);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (107, '17/12/2023', '05/07/2024', 'Śledczy', 17, 201);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (108, '26/08/2023', NULL, 'Główny Śledczy', 18, 202);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (109, '31/08/2021', NULL, 'Przygotowanie dokumentacji', 19, 203);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (110, '05/11/2020', '01/01/2023', 'Ekspert IT', 20, 204);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (111, '18/11/2024', NULL, 'Analiza psychologiczna', 21, 205);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (112, '21/06/2024', NULL, 'Asystent śledczego', 22, 206);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (113, '26/12/2020', NULL, 'Ekspert IT', 23, 201);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (114, '20/10/2022', NULL, 'Przygotowanie dokumentacji', 24, 202);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (115, '01/09/2021', NULL, 'Główny Śledczy', 25, 203);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (116, '26/06/2024', NULL, 'Śledczy', 26, 204);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (117, '14/09/2024', '13/11/2024', 'Asystent śledczego', 27, 205);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (118, '08/10/2023', NULL, 'Analiza psychologiczna', 28, 206);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (119, '26/12/2020', NULL, 'Analiza psychologiczna', 29, 201);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (120, '12/03/2023', '30/09/2023', 'Ekspert IT', 30, 202);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (121, '15/10/2021', NULL, 'Asystent śledczego', 11, 203);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (122, '10/11/2020', NULL, 'Przygotowanie dokumentacji', 12, 204);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (123, '08/09/2024', NULL, 'Śledczy', 13, 205);
INSERT INTO assigned_case (assign_id, start_assign_date, end_assign_date, role, policeman_id, cr_id)
VALUES (124, '30/10/2022', '31/05/2024', 'Główny Śledczy', 14, 206);
COMMIT;