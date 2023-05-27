--ТРИГГЕРЫ

--Удаление призывника их БД после того, как пройдёт n лет с момента снятия с учёта.
create or replace function delete_recruit()
returns trigger as $$
declare
	id_affair integer;
	dereg_date date;
begin
	id_affair = new.id_personal_affair;
	dereg_date = (select deregistration_date from ascribedcertificate where id_personal_affair = id_affair);
	if (dereg_date + INTERVAL '5 years') <= current_date then
		delete from personaldata where id = (select id_personal_data from personalaffair where id = id_affair);
	end if;
	return new;
end;
$$ language plpgsql;

create trigger check_conscript_age
after insert on recruit
for each row execute function delete_recruit();


--Дата постановки на учёт не должна быть равна или больше даты снятия с учёта
create or replace function check_differences_date()
returns trigger as $$
begin
	if (new.registration_date >= new.deregistration_date) then
		raise exception 'Дата постановки на учёт не должна быть равна или больше даты снятия с учёта!';
	end if;
	return new;
end;
$$ language plpgsql;

create trigger check_differences_date
before insert or update on ascribedcertificate
for each row execute function check_differences_date();


--Автоматическое заполнения пункта "Тип семьи"
create or replace function family_type()
returns trigger as $$
declare
	is_mother integer;
	is_father integer;
begin
	select count(*) into is_mother from relatives where relatives.id_recruit = new.id_recruit and relatives.kinship = 'Мать';
	select count(*) into is_father from relatives where relatives.id_recruit = new.id_recruit and relatives.kinship = 'Отец';
	
	if (is_mother = 1 and is_father = 1) then
		update recruit set family_full = 'Полная' where id = new.id_recruit;
	elsif ((is_mother = 1 and is_father = 0) or (is_mother = 0 and is_father = 1)) then
		update recruit set family_full = 'Неполная' where id = new.id_recruit;
	elsif (is_mother = 0 and is_father = 0) then
		update recruit set family_full = 'Одиночка' where id = new.id_recruit;
	end if;
	return new;
end;
$$ language plpgsql;

create trigger family_type
after insert or update on relatives
for each row execute function family_type();


--Проверка что дата призыва не раньше 18 лет и не позже 27 лет
create or replace function check_conscription_date()
returns trigger as $$
declare
	birthday_date date;
begin
	select birthday into birthday_date from personaldata where id = (select id_personal_data from personalaffair where id = new.id_personal_affair);
	if (extract(year from (age(new.conscription_date, birthday_date))) < 18)  then
		raise exception 'Данный человек не может быть призван, так как он младше призывного возраста!';
	elsif (extract(year from (age(new.conscription_date, birthday_date))) > 27)  then
		raise exception 'Данный человек не может быть призван, так как он старше призывного возраста!';
	end if;
	return new;
end;
$$ language plpgsql;

create trigger check_conscription_date
before insert or update on conscription
for each row execute function check_conscription_date();


--Обновление статуса годности из медицинского заключения
create or replace function update_status()
returns trigger as $$
declare
	
begin
	update ascribedcertificate set pass_to_serve = new.medical_report_result where id_personal_affair = new.id_personal_affair;
	return new;
end;
$$ language plpgsql;

create trigger update_status
before insert or update on medicalreport
for each row execute function update_status();
