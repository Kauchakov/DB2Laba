select * from PersonalData;
select * from PersonalAffair;
select * from Recruit;
select * from Relatives;
select * from MedicalReport;
select * from DoctorReport;
select * from LivindAddress;
select * from AscribedCertificate;
select * from MilitaryTicket;
select * from MilitaryUnit;
select * from Education; 
select * from Employment;
select * from Conscription;

select count(*) from relatives where relatives.id_recruit = 1 and relatives.kinship = 'Отец';
--Обновление родственников update Relatives set generation = generation;

alter
delete from AscribedCertificate where id = 13;
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Александрdel', 'Каучаковdel', 'Владимировичdel', '2003-07-10', 'мужской', 'русский', false, '3217', '820095', 'OUFMS');
insert into PersonalAffair(personal_affair, id_personal_data) values ('4', 14);
insert into Recruit(id_personal_affair) values (10);
insert into AscribedCertificate (registration_date, deregistration_date, id_personal_affair) values ('2010-09-16', '2015-08-15', 11);

update MilitaryTicket set rank_on_army = 'лейтенант' where id = 1;

update AscribedCertificate set pass_to_serve = 'ограниченно годен' where id = 1;
update AscribedCertificate set pass_to_serve = 'годен' where id = 2;
update AscribedCertificate set pass_to_serve = 'не годен' where id = 3;

update MilitaryUnit set place_of_military_service = 'Мотострелковые' where id = 1;
update MilitaryUnit set place_of_military_service = 'Танковые' where id = 2;
alter table AscribedCertificate alter column pass_to_serve type varchar(20);

insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('Отецs', 1, 21, 1);





--ПРИЗЫВНИК КАУЧАКОВ

--Персональные данные его и его семьи
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Александр', 'Каучаков', 'Владимирович', '2003-07-10', 'мужской', 'русский', false, '3217', '820095', 'OUFMS');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Владимир', 'Каучаков', 'Михайлович', '1955-10-06', 'мужской', 'русский', false, '5327', '876432', 'USSR');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Елена', 'Деревянкина', 'Викторовна', '1960-12-03', 'женский', 'русский', false, '5234', '132435', 'USSR');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Валентина', 'Каучакова', 'Петровна', '1931-05-01', 'женский', 'русский', false, '5432', '234223', 'USSR');

--Родители
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('Мать', 1, 5, 1);
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('Бабушка', 2, 6, 1);
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('Отец', 1, 4, 1);

--Военные действия
insert into MilitaryTicket (date_of_start_military_service,date_of_end_military_service, id_personal_affair) values ('2022-04-01', '2023-04-01', 1);
insert into MilitaryUnit (place_of_military_service, id_military_ticket) values ('Украина', 1);

--Личное дело
insert into PersonalAffair(personal_affair, id_personal_data) values ('1', 1);

--Медицинское заключение
insert into MedicalReport (medical_report_result, id_personal_affair) values ('ограниченно годен', 1);

--Сертификат
insert into AscribedCertificate (registration_date, id_personal_affair) values ('2021-09-16', 1);

--Место жительства
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('Кемеровская область', 'Новокузнецк', 'Кирова', '103', '173', 1);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('Кемеровская область', 'Новокузнецк', 'Кирова', '103', '173', 4);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('Кемеровская область', 'Новокузнецк', 'Кирова', '103', '173', 5);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('Кемеровская область', 'Новокузнецк', 'Кирова', '103', '94', 6);

--Работы
insert into Employment (work_place, field_of_activity, state_accreditation, id_personal_data) values ('Без Аккредитации', 'IT', false, 1);

--Таблица призывника
insert into Recruit(id_personal_affair) values (1);

--alter table Recruit alter column family_full drop not null;

--Образование
insert into Education (degree, institution, id_personal_data) values ('Среднее', 'Гимназия 44', 1);
insert into Education (degree, institution, id_personal_data) values ('Среднее', 'Школа Новокузнецка №1', 4);
insert into Education (degree, institution, id_personal_data) values ('Высшее', 'СибГИУ', 4);
insert into Education (degree, institution, id_personal_data) values ('Среднее', 'Школа Новокузнецка №2', 5);
insert into Education (degree, institution, id_personal_data) values ('Высшее', 'СибГИУ', 5);
insert into Education (degree, institution, id_personal_data) values ('Среднее', 'Школа Новокузнецка №3', 6);
insert into Education (degree, institution, id_personal_data) values ('Высшее', 'Вуз Новокузнецк', 6);

--ПРИЗЫВНИК БОГОДУХОВ

--Персональные данные его и его семьи
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Никита', 'Богодухов', 'Алексеевич', '2003-02-13', 'мужской', 'русский', false, '3217', '524325', 'SEVER');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Раисия', 'Богодухова', 'Святославна', '1973-05-14', 'женский', 'русский', false, '2144', '856352', 'SEVER');

--Родители
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('Мать', 1, 7, 2);

--Военные действия
insert into MilitaryTicket (date_of_start_military_service, id_personal_affair) values ('2023-05-26', 2);
insert into MilitaryUnit (place_of_military_service, id_military_ticket) values ('Донецк', 2);

--Личное дело
insert into PersonalAffair(personal_affair, id_personal_data) values ('2', 2);

--Сертификат
insert into AscribedCertificate (registration_date, id_personal_affair) values ('2021-03-01', 2);

--Медицинское заключение
insert into MedicalReport (medical_report_result, id_personal_affair) values ('годен', 2);

--Место жительства
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('Ханты-Мансийкий АО', 'Нефтеюганск', 'Есенина', '49', '47', 2);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('Ханты-Мансийкий АО', 'Нефтеюганск', 'Есенина', '49', '47', 7);

--Таблица призывника
insert into Recruit(id_personal_affair) values (2);

--Работа
insert into Employment (work_place, field_of_activity, state_accreditation, id_personal_data) values ('Касперский', 'IT', true, 2);

--Образование
insert into Education (degree, institution, id_personal_data) values ('Среднее', 'Школа Нефтеюганска', 2);
insert into Education (degree, institution, id_personal_data) values ('Среднее', 'Школа Нефтеюганска', 7);
insert into Education (degree, institution, id_personal_data) values ('Высшее', 'Вуз Нефтеюганска', 7);




--ПРИЗЫВНИК КАРАВАЕВ

--Персональные данные его и его семьи
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Богдан', 'Караваев', 'Олегович', '2004-01-12', 'мужской', 'русский', false, '3218', '264235', 'OUFMS');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Ирина', 'Караваева', 'Васильевна', '1970-11-14', 'женский', 'русский', false, '2652', '346547', 'USSR');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Пётр', 'Караваев', 'Александрович', '1960-06-08', 'мужской', 'русский', false, '8597', '534522', 'USSR');

--Родители
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('Мать', 1, 8, 3);
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('Отец', 1, 9, 3);

--Военные действия


--Личное дело
insert into PersonalAffair(personal_affair, id_personal_data) values ('3', 3);

--Медицинское заключение
insert into MedicalReport (medical_report_result, id_personal_affair) values ('не годен', 3);

--Сертификат
insert into AscribedCertificate (registration_date, deregistration_date, deregistration_reason, id_personal_affair) values ('2022-02-03', '2022-02-04', 'психически нездоров', 3);

--Место жительства
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('Кемеровская область', 'Новокузнецк', 'Кирова', '103', '192', 3);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('Кемеровская область', 'Новокузнецк', 'Кирова', '103', '192', 8);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('Кемеровская область', 'Новокузнецк', 'Кирова', '103', '192', 9);

--Таблица призывника
insert into Recruit(id_personal_affair) values (3);

--Образование
insert into Education (degree, institution, id_personal_data) values ('Среднее', 'Школа 67', 3);
insert into Education (degree, institution, id_personal_data) values ('Среднее', 'Школа Новокузнецка №4', 8);
insert into Education (degree, institution, id_personal_data) values ('Высшее', 'КемГУ', 8);
insert into Education (degree, institution, id_personal_data) values ('Среднее', 'Школа Новокузнецка №5', 9);
insert into Education (degree, institution, id_personal_data) values ('Высшее', 'КемГУ', 9);




--Нельзя ввести младше призывного возраста
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Проверка', 'Проверка', 'Проверка', '2015-07-10', 'мужской', 'русский', false, '3217', '820095', 'OUFMS');
insert into PersonalAffair(personal_affair, id_personal_data) values ('22', 22);
insert into Conscription (conscription_season, conscription_date, id_personal_affair) values ('весенний', '2031-10-10', 1);




