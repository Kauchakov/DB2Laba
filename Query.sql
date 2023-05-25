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
		PersonalData.gender,
		PersonalData.birthday
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
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender,
		MilitaryTicket.date_of_start_military_service
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id
where MilitaryTicket.date_of_end_military_service is null;

--6. ������ ����������� � ������� � ���. ����. ����� "����������� �����"
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MedicalReport on MedicalReport.id_personal_affair = PersonalAffair.id
where MedicalReport.medical_report_result = '����������� �����';

--7. ������ ����������� ����������� ���������� ������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender
from PersonalData
where datediff(YEAR,PersonalData.birthday, '2023-05-26') = 20;

--8. ����� ��������� ����������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
AND Relatives.id_recruit = 1
where Relatives.generation = 1;

--9. ������ ����������� � ���������� ����� ��������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
where PersonalData.birthday = '2003-07-10';

--10. ����� ����������� �� ��������� ������� �����
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id
join MilitaryUnit on MilitaryUnit.id_military_ticket = MilitaryTicket.id
where MilitaryUnit.place_of_military_service = 'Ukraine';

--11. ������������ � ���������� ��������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
where PersonalData.surname = 'Kauch';

--12. ���������� �� ������������ ���������� ������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join LivindAddress on LivindAddress.id_personal_data = PersonalData.id
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
where LivindAddress.region = 'KemObl';

--13. ������ ������������� ���������� � ���������� ����� ��������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
where PersonalData.birthday = '1960-12-03';

--14. ����� ����������� � ���������� ����� �������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id
where DATEPART(year, MilitaryTicket.date_of_start_military_service) = '2023';

--15. ������ ������������� � ���������� ������ ����������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
join LivindAddress on LivindAddress.id_personal_data = PersonalData.id
where LivindAddress.region = 'KemObl' and
	  LivindAddress.city = 'Nvkz' and
	  LivindAddress.street = 'Kirova' and
	  LivindAddress.house = '103' and
	  LivindAddress.apartment = '173';

--16. ���������� � ������� �������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id;

--17. ������������ � ���������� ���������������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender,
		PersonalData.nationality		
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
where PersonalData.nationality = 'russian';

--18. ���������� ������� ��������� //�� �������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join Relatives ON Relatives.id_personal_data = PersonalData.id
                and Relatives.kinship = 'mother'
                 and Relatives.kinship = 'father';

--19. ������������ � ������ ������������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		PersonalData.birthday,
		PersonalData.gender		
from PersonalData
join Relatives on Relatives.id_personal_data = PersonalData.id
join Education on Education.id_personal_data = PersonalData.id
where Education.degree = 'high';

--20. ���������� �� ������� � �����
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender,
		PersonalData.birthday,
		MilitaryTicket.rank_on_army
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join MilitaryTicket on MilitaryTicket.id_personal_affair = PersonalAffair.id
where MilitaryTicket.rank_on_army is not null;

--21. 3 ������  //�� �������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join LivindAddress on LivindAddress.id_personal_data = PersonalData.id
				and LivindAddress.region = 'KemObl'
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join Recruit on Recruit.id_personal_affair = PersonalAffair.id
join Relatives on Relatives.id_recruit = Recruit.id
where Relatives.id_recruit = Recruit.id
				and PersonalData.criminal_records = 0
				and Relatives.generation <= 3;

--22. ���������� ��� ���������� � it ��� ������������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name
from PersonalData
join Employment on Employment.id_personal_data = PersonalData.id
where Employment.field_of_activity = 'IT' and Employment.state_accreditation = 0;

--23. ���������� ������ � ����� �� ������� ������������ ��������
select PersonalData.first_name,
	    PersonalData.surname,
		PersonalData.father_name,
		datediff(YEAR,PersonalData.birthday, '2023-05-26') as age,
		PersonalData.gender,
		PersonalData.birthday
from PersonalData
join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
join AscribedCertificate on AscribedCertificate.id_personal_affair = PersonalAffair.id
where AscribedCertificate.deregistration_reason = '���������� ��������';