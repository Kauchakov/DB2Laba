select * from PersonalData;
select * from PersonalAffair;
select * from Recruit;
select * from Relatives;
select * from MedicalReport;
select * from DoctorReport;
select * from LivindAddress;
select * from AscribedCertificate;

delete from Relatives where id =1;

--� ���������� ��������
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Alex', 'Kauch', 'Vladim', '2003-07-10', 'male', 'russian', 0, '3217', '820095', 'OUFMS');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Vladim', 'Kauch', 'Michail', '1955-10-06', 'male', 'russian', 0, '5327', '876432', 'USSR');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Elena', 'Kauch', 'Viktor', '1960-12-03', 'female', 'russian', 0, '1111', '132435', 'USSR');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Valent', 'Kauch', '-', '1935-05-01', 'female', 'russian', 0, '5432', '234223', 'USSR');

--� ���������� ���������
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('Nikita', 'Bogoduch', 'XZ', '2003-02-13', 'male', 'russian', 0, '3217', '524325', 'SEVER');
insert into PersonalData (first_name, surname, father_name, birthday, gender, nationality, criminal_records, series, number, issued_by) values ('MamaNikit', 'Bogoduch', 'XZ', '1973-05-14', 'female', 'russian', 0, '2144', '856352', 'SEVER');

--������ ����
insert into PersonalAffair(personal_affair, id_personal_data) values ('123', 1);
insert into PersonalAffair(personal_affair, id_personal_data) values ('555', 8);

alter table AscribedCertificate add pass_to_serve varchar(10);

insert into Recruit(id_personal_affair) values (1);
insert into Recruit(id_personal_affair) values (5);

--�������� ���������� ��������
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('mother', 1, 6, 1);
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('grand', 2, 7, 1);
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('father', 1, 9, 1);


--�������� ���������� ���������
insert into Relatives(kinship, generation, id_personal_data, id_recruit) values ('mother', 1, 10, 6);

insert into AscribedCertificate (registration_date, id_personal_affair) values ('2021-09-16', 1);
insert into AscribedCertificate (registration_date, id_personal_affair) values ('2021-03-01', 5);

update AscribedCertificate set pass_to_serve = '�������' where id = 6;


insert into MedicalReport (id_personal_affair) values (1);

insert into DoctorReport (specialization, doctor_report, id_medical_report) values ('psychoterapevt', 'fit', 1);
insert into DoctorReport (specialization, doctor_report, id_medical_report) values ('LOR', 'fit', 1);

insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('KemObl', 'Nvkz', 'Kirova', '103', '173', 1);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('KemObl', 'Nvkz', 'Kirova', '103', '173', 6);
insert into LivindAddress (region, city, street, house, apartment, id_personal_data) values ('XZ', 'Neft`Ugansk', 'Esenina', '49', '47', 8);




--�������


--1. ����� ���� ����������� � ���, �� � ������ ����������
select PersonalData.first_name,
		PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-25') as age,
		PersonalData.gender,
		LivindAddress.region,
		LivindAddress.city,
		LivindAddress.street,
		LivindAddress.house,
		LivindAddress.apartment
from PersonalData 
join LivindAddress on LivindAddress.id_personal_data = PersonalData.id
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id;

--2. ���� ����������� �� �������� �����
select PersonalData.first_name,
		PersonalData.surname,
		PersonalData.father_name,
		PersonalData.gender
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join AscribedCertificate on AscribedCertificate.id_personal_affair = PersonalAffair.id
where AscribedCertificate.pass_to_serve = '�����';

--3. ��� ������������ ������������ ����������
select Relatives.kinship,
		PersonalData.first_name,
		PersonalData.surname,
		PersonalData.father_name,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
AND Relatives.id_recruit = 1;

--4. ����� ����������� �� ������������ ������
select PersonalData.first_name,
		PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-25') as age,
		PersonalData.gender
from PersonalData
join LivindAddress on LivindAddress.id_personal_data = PersonalData.id
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
where LivindAddress.city = 'Nvkz';

--5. ������ ����������� � ��������� ����� �������� � �����
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-25') as age,
		PersonalData.gender

