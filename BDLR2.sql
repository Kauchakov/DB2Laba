--Персональные данные
create table PersonalData(
	id serial primary key,

	first_name varchar(25) NOT NULL,
	surname varchar(25) NOT NULL,
	father_name varchar(25) NOT NULL,

	birthday date NOT NULL,
	gender varchar(7) NOT NULL,
	nationality varchar(25) NOT NULL,
	criminal_records boolean NOT NULL,

	series int NOT NULL,
	number int NOT NULL,
	issued_by varchar(50) NOT NULL
);

--Личное дело
create table PersonalAffair(
	id serial primary key,
	personal_affair int UNIQUE NOT NULL,
	id_personal_data integer references PersonalData(id) ON DELETE CASCADE UNIQUE NOT NULL
);

--Медицинское заключение
create table MedicalReport(
	id serial primary key,
	medical_report_result varchar(20) NOT NULL,
	id_personal_affair integer references PersonalAffair(id) ON DELETE CASCADE UNIQUE NOT NULL
);

--Врач
create table DoctorReport(
	id serial primary key,
	specialization varchar(30) NOT NULL,
	doctor_report varchar(15) NOT NULL,
	id_medical_report integer references MedicalReport(id) ON DELETE CASCADE NOT NULL
);

--Военный билет
create table MilitaryTicket(
	id serial primary key,
	date_of_start_military_service date NOT NULL,
	date_of_end_military_service date,
	rank_on_army varchar(20),
	id_personal_affair integer references PersonalAffair(id) ON DELETE CASCADE UNIQUE NOT NULL
);

--Военная часть
create table MilitaryUnit(
	id serial primary key, 
	place_of_military_service varchar(50) NOT NULL,
	id_military_ticket integer references MilitaryTicket(id) ON DELETE CASCADE NOT NULL
);

--Приписное удостоверение
create table AscribedCertificate(
	id serial primary key,
	registration_date date NOT NULL,
	deregistration_date date,
	deregistration_reason varchar(30),
	pass_to_serve varchar(20),
	id_personal_affair integer references PersonalAffair(id) ON DELETE CASCADE UNIQUE NOT NULL
);

create table Conscription(
	id serial primary key,
	conscription_season varchar(8) NOT NULL,
	conscription_date date NOT NULL,
	id_personal_affair integer references PersonalAffair(id) ON DELETE CASCADE NOT NULL
);

--Адрес проживания
create table LivindAddress(
	id serial primary key,
	region varchar(30) NOT NULL,
	city varchar(30) NOT NULL,
	street varchar(30) NOT NULL,
	house int NOT NULL,
	building int,
	apartment int,
	id_personal_data integer references PersonalData(id) ON DELETE CASCADE NOT NULL
);
--Образование
create table Education(
	id serial primary key,
	degree varchar(50),
	institution varchar(50),
	id_personal_data integer references PersonalData(id) ON DELETE CASCADE NOT NULL
);

--Занятость
create table Employment(
	id serial primary key,
	work_place varchar(50),
	field_of_activity varchar(50),
	state_accreditation boolean,
	id_personal_data integer references PersonalData(id) ON DELETE CASCADE NOT NULL
);


--Призывник
create table Recruit (
	id serial primary key,
	family_full varchar(13),
	id_personal_affair integer references PersonalAffair(id) ON DELETE CASCADE UNIQUE NOT NULL
);

--Родственник
create table Relatives(
	id serial primary key,
	kinship varchar(20) NOT NULL,
	generation int NOT NULL,
	id_personal_data integer references PersonalData(id) ON DELETE CASCADE UNIQUE NOT NULL, 
	id_recruit integer references Recruit(id) ON DELETE CASCADE NOT NULL
);