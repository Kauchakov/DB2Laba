--ЗАПРОСЫ


--1. Вывод всех призывников с ФИО, ДР и Местом жительства
select PersonalData.first_name,
		PersonalData.surname,
		PersonalData.father_name,
		AscribedCertificate.pass_to_serve,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		LivingAddress.region,
		LivingAddress.city,
		LivingAddress.street,
		LivingAddress.house,
		LivingAddress.apartment
from PersonalData 
join LivingAddress on LivingAddress.id_personal_data = PersonalData.id
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join AscribedCertificate on AscribedCertificate.id_personal_affair = PersonalAffair.id;

--2. Всех призывников со статусом годен
select PersonalData.first_name,
		PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		AscribedCertificate.pass_to_serve
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join AscribedCertificate on AscribedCertificate.id_personal_affair = PersonalAffair.id
where AscribedCertificate.pass_to_serve = 'не годен';

--3. Все родственники определённого призывника
select Relatives.kinship,
		PersonalData.first_name,
		PersonalData.surname,
		PersonalData.father_name,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
AND Relatives.id_recruit = 1;

--4. Найти призывников из определённого города
select PersonalData.first_name,
		PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender
from PersonalData
join LivingAddress on LivingAddress.id_personal_data = PersonalData.id
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
where LivingAddress.city = 'Новокузнецк';

--5. Список призывников в настоящее время служащих в армии
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		MilitaryTicket.date_of_start_military_service
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id
where MilitaryTicket.date_of_end_military_service is null;

--6. Список призывников у которых в мед. закл. стоит "ограниченно годен"
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MedicalReport on MedicalReport.id_personal_affair = PersonalAffair.id
where MedicalReport.medical_report_result = 'ограниченно годен';

--7. Список призывников определённой возрастной группы
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender
from PersonalData
where extract(year from (AGE(current_date, PersonalData.birthday))) = 19;

--8. Найти родителей призывника
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
AND Relatives.id_recruit = 1
where Relatives.generation = 1;

--9. Список призывников с одинаковой датой рождения
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
where PersonalData.birthday = '2003-01-31';

--10. Найти призывников из указанной военной части
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id
join MilitaryUnit on MilitaryUnit.id_military_ticket = MilitaryTicket.id
where MilitaryUnit.place_of_military_service = 'Мотострелковые';

--11. Родственники с одинаковой фамилией
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
where PersonalData.surname = 'Каучаков';

--12. Призывники из определённого областного центра
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join LivingAddress on LivingAddress.id_personal_data = PersonalData.id
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
where LivingAddress.region = 'Кемеровская область';

--13. Список родственников призывника с одинаковой датой рождения
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
where PersonalData.birthday = '1960-12-03';

--14. Найти призывников с одинаковым годом призыва
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id
where extract(year from (MilitaryTicket.date_of_start_military_service)) = '2023';

--15. Список родственников с одинаковым местом проживания
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
join LivingAddress on LivingAddress.id_personal_data = PersonalData.id
where LivingAddress.region = 'Кемеровская область' and
	  LivingAddress.city = 'Новокузнецк' and
	  LivingAddress.street = 'Кирова' and
	  LivingAddress.house = '103' and
	  LivingAddress.apartment = '173';

--16. Призывники с военным билетом
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id;

--17. Родственники с одинаковой национальностью
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender,
		PersonalData.nationality		
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
where PersonalData.nationality = 'русский';

--18. Призывники которых усыновили 
select distinct PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join Recruit on Recruit.id_personal_affair = PersonalAffair.id	
join Relatives on Relatives.id_recruit = Recruit.id
                and Relatives.kinship = 'Мачеха'
                 and Relatives.kinship = 'Отчим';

--19. Родственники с высшем образованием
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender		
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
join Education on Education.id_personal_data = PersonalData.id
where Education.degree = 'Высшее';

--20. Призывники со званием в армии
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		PersonalData.birthday,
		MilitaryTicket.rank_on_army
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id
where MilitaryTicket.rank_on_army is not null;

--21. 3 колено 
select distinct PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join LivingAddress on LivingAddress.id_personal_data = PersonalData.id
				and LivingAddress.region = 'Кемеровская область'
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join Recruit on Recruit.id_personal_affair = PersonalAffair.id	
left join Relatives on Relatives.id_recruit = Recruit.id
					and Relatives.generation <= 3;


--22. Призывники ФИО работающие в it без аккредетации
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name
from PersonalData
join Employment on Employment.id_personal_data = PersonalData.id
where Employment.field_of_activity = 'IT' and Employment.state_accreditation = false;

--23. Призывники снятые с учёта по причине психического здоровья
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		AGE(current_date, PersonalData.birthday) as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join AscribedCertificate on AscribedCertificate.id_personal_affair = PersonalAffair.id
where AscribedCertificate.deregistration_reason = 'психически нездоров';


