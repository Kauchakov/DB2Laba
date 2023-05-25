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

--delete from PersonalData where id = 17;
--О призывнике Караваев
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Bogdan', 'Karavaev', '-', '2004-01-12', 'male', 'russian', 0, '3218', '264235', 'OUFMS');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('MamaBog', 'Karavaev', '-', '1970-11-14', 'female', 'russian', 0, '2652', '346547', 'USSR');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('FatherBog', 'Karavaev', '-', '1960-06-08', 'male', 'russian', 0, '8597', '534522', 'USSR');

--О призывнике Каучаков
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Alex', 'Kauch', 'Vladim', '2003-07-10', 'male', 'russian', 0, '3217', '820095', 'OUFMS');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Vladim', 'Kauch', 'Michail', '1955-10-06', 'male', 'russian', 0, '5327', '876432', 'USSR');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Elena', 'Kauch', 'Viktor', '1960-12-03', 'female', 'russian', 0, '1111', '132435', 'USSR');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Valent', 'Kauch', '-', '1935-05-01', 'female', 'russian', 0, '5432', '234223', 'USSR');

insert into Education (degree, institution, id_personal_data) values ('middle', 'SchoolNeft', 20);

insert into MilitaryTicket (date_of_start_military_service,date_of_end_military_service, id_personal_affair) values ('2022-04-01', '2023-04-01', 1);
insert into MilitaryUnit (place_of_military_service, id_military_ticket) values ('Ukraine', 3);
--О призывнике Богодухов
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Nikita', 'Bogoduch', 'XZ', '2003-02-13', 'male', 'russian', 0, '3217', '524325', 'SEVER');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('MamaNikit', 'Bogoduch', 'XZ', '1973-05-14', 'female', 'russian', 0, '2144', '856352', 'SEVER');

insert into MilitaryTicket (date_of_start_military_service, id_personal_affair) values ('2023-05-26', 8);
insert into MilitaryUnit (place_of_military_service, id_military_ticket) values ('Donetsk', 6);
--Личные дела
insert into PersonalAffair(personal_affair, id_personal_data) values ('123', 1);
insert into PersonalAffair(personal_affair, id_personal_data) values ('555', 20);
insert into PersonalAffair(personal_affair, id_personal_data) values ('666', 22);

alter table AscribedCertificate add pass_to_serve varchar(10);
alter table MilitaryTicket add rank_on_army varchar(20);
alter table AscribedCertificate add deregistration_reason varchar(30);

insert into Recruit(id_personal_affair) values (1);
insert into Recruit(id_personal_affair) values (8);
insert into Recruit(id_personal_affair) values (9);
--Родители призывника Караваев
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('mother', 1, 23, 8);
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('father', 1, 24, 8);

--Родители призывника Каучаков
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('mother', 1, 6, 1);
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('grand', 2, 18, 1);
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('father', 1, 19, 1);


--Родители призывника Богодухов
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('mother', 1, 21, 7);

insert into AscribedCertificate (registration_date, id_personal_affair) values ('2021-09-16', 1);
insert into AscribedCertificate (registration_date, id_personal_affair) values ('2021-03-01', 8);
insert into AscribedCertificate (registration_date, deregistration_date, deregistration_reason, id_personal_affair) values ('2022-02-03', '2022-02-04', 'психически нездоров', 9);


update AscribedCertificate set pass_to_serve = 'негоден' where id = 8;
update MedicalReport set medical_report_result = 'ограниченно годен' where id = 1;
update MilitaryTicket set rank_on_army  = null where id = 6;

insert into MedicalReport (id_personal_affair) values (1);

insert into DoctorReport (specialization, doctor_report, id_medical_report) values ('psychoterapevt', 'fit', 1);
insert into DoctorReport (specialization, doctor_report, id_medical_report) values ('LOR', 'fit', 1);

insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('KemObl', 'Nvkz', 'Kirova', '103', '173', 1);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('KemObl', 'Nvkz', 'Kirova', '103', '173', 6);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('XZ', 'Neft`Ugansk', 'Esenina', '49', '47', 20);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('KemObl', 'Nvkz', 'Kirova', '103', '173', 19);

alter table MedicalReport alter column medical_report_result varchar(20);
insert into MedicalReport (medical_report_result, id_personal_affair) values ('ограниченно годен', 1);
insert into MedicalReport (medical_report_result, id_personal_affair) values ('негоден', 8);

insert into Employment (work_place, field_of_activity, state_accreditation, id_personal_data) values ('KompaniyaNaPrikole', 'IT', 0, 1);
insert into Employment (work_place, field_of_activity, state_accreditation, id_personal_data) values ('Kaspersky', 'IT', 1, 20);

