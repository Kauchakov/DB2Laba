--ФУНКЦИИ

--1. Процент здоровых по регионам
create or replace function calculate_healthy_percentage()
returns table(region varchar, healthy_percentage decimal) as $$
begin
  return query
  select LivingAddress.region,
        (100 * count(case when AscribedCertificate.pass_to_serve = 'годен' then 1 end)::decimal 
		/
        count(*)::decimal) as healthy_percentage
  from AscribedCertificate
  join PersonalAffair on PersonalAffair.id = AscribedCertificate.id_personal_affair
  join PersonalData on PersonalData.id = PersonalAffair.id_personal_data
  join LivingAddress on LivingAddress.id_personal_data = PersonalData.id
  group by LivingAddress.region;
end;
$$ language plpgsql;

select * from calculate_healthy_percentage();



--2.
create or replace function calculate_sma()
returns table (year double precision, total_number bigint) AS $$
begin
  return query
  with data as (
      select MilitaryTicket.date_of_start_military_service AS conscription_start_date,
            MilitaryTicket.date_of_end_military_service AS conscription_end_date,
          count(case when  MilitaryUnit.place_of_military_service = 'Мотострелковые' then 1 
end)::integer
    from MilitaryTicket
    join MilitaryUnit on MilitaryUnit.id_military_ticket = MilitaryTicket.id
    group by conscription_start_date, conscription_end_date
  )
  select date_part('year', conscription_end_date) as year, sum(count) as total_number
  from data
  group by year
  order by year desc;
end;
$$ language plpgsql;
select * from calculate_sma();


--3. 
create or replace function order_recruit()
returns table(first_name varchar, surname varchar, age integer,
              pass_to_serve varchar, criminal_records boolean) as $$
begin
  return query
  select distinct PersonalData.first_name,
  		PersonalData.surname,
        extract(year from AGE(current_date, PersonalData.birthday))::integer as age,
        AscribedCertificate.pass_to_serve,
        PersonalData.criminal_records
  from PersonalData
  join PersonalAffair on PersonalAffair.id_personal_data = PersonalData.id
  join AscribedCertificate on AscribedCertificate.id_personal_affair = PersonalAffair.id
  join Recruit on Recruit.id_personal_affair = PersonalAffair.id
  left join Relatives on Relatives.id_recruit = Recruit.id
    where AscribedCertificate.pass_to_serve !=  'не годен'
  order by AscribedCertificate.pass_to_serve, PersonalData.criminal_records;

end;
$$ language plpgsql;

select * from order_recruit();


--4. 
create or replace function milUnit()
returns table(military_unit varchar, count integer) as $$
begin
  return query
  select distinct MilitaryUnit.place_of_military_service,
  				count(*)::integer
  from MilitaryUnit
  group by MilitaryUnit.place_of_military_service;

end;
$$ language plpgsql;

select * from milUnit();


--5. 
create or replace function medical_result_doctors()
returns trigger as $$
declare
	is_fit integer;
	is_half_fit integer;
	is_not_fit integer;
begin
	select count(case when DoctorReport.doctor_report = 'годен' then 1 end)::integer into is_fit 
	from DoctorReport
	join MedicalReport on MedicalReport.id = new.id_medical_report;
	
	select count(case when DoctorReport.doctor_report = 'ограниченно годен' then 1 end)::integer into is_half_fit 
	from DoctorReport
	join MedicalReport on MedicalReport.id = new.id_medical_report;
	
	select count(case when DoctorReport.doctor_report = 'не годен' then 1 end)::integer into is_not_fit 
	from DoctorReport
	join MedicalReport on MedicalReport.id = new.id_medical_report;
	
	
	if (is_not_fit > 0) then
		update MedicalReport set medical_report_result = 'не годен' where id = new.id_medical_report;
	elsif (is_fit >= is_half_fit) then
		update MedicalReport set medical_report_result = 'годен' where id = new.id_medical_report;
	else
		update MedicalReport set medical_report_result = 'ограниченно годен' where id = new.id_medical_report;
	end if;
	return new;
end;
$$ language plpgsql;

create trigger medical_result_doctors
after insert or update on DoctorReport
for each row execute function medical_result_doctors();

---------------------------------------------------------------------------------------------------------------

create or replace function medical_result_doctors2()
returns trigger as $$
declare
	is_fit integer;
	is_half_fit integer;
	is_not_fit integer;
begin
	select count(case when DoctorReport.doctor_report = 'годен' then 1 end)::integer into is_fit 
	from DoctorReport
	join MedicalReport on MedicalReport.id = old.id_medical_report;
	
	select count(case when DoctorReport.doctor_report = 'ограниченно годен' then 1 end)::integer into is_half_fit 
	from DoctorReport
	join MedicalReport on MedicalReport.id = old.id_medical_report;
	
	select count(case when DoctorReport.doctor_report = 'не годен' then 1 end)::integer into is_not_fit 
	from DoctorReport
	join MedicalReport on MedicalReport.id = old.id_medical_report;
	
	
	if (is_not_fit > 0) then
		update MedicalReport set medical_report_result = 'не годен' where id = old.id_medical_report;
	elsif (is_fit >= is_half_fit) then
		update MedicalReport set medical_report_result = 'годен' where id = old.id_medical_report;
	else
		update MedicalReport set medical_report_result = 'ограниченно годен' where id = old.id_medical_report;
	end if;
	return new;
end;
$$ language plpgsql;

create trigger medical_result_doctors2
after delete on DoctorReport
for each row execute function medical_result_doctors2();