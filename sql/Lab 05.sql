set lc_messages to 'en_US.UTF-8';

create table religion
(
    id_religion   serial primary key,
    name_religion varchar(40),
    description   text
);

create table country_religion
(
    country_id_country   int,
    religion_id_religion int,
    percentage           decimal(5, 2),
    constraint fk_id_religion
        foreign key (religion_id_religion)
            references religion (id_religion)
            on delete restrict,
    constraint fk_country_code
        foreign key (country_id_country)
            references country (id_country)
            on delete restrict,
    primary key (country_id_country, religion_id_religion)
);

insert into religion (id_religion, name_religion, description)
values (1, 'анімістичні культи', 'Священні книги анімістичних культів'),
       (2, 'християнство (загально)', 'Біблія'),
       (3, 'християнство (римо-католицизм)', 'Біблія, Катехізм Католицької Церкви'),
       (4, 'християнство (протестанти)', 'Біблія'),
       (5, 'християнство (інші)', 'Священні книги інших християнських віровчень'),
       (6, 'атеїзм', 'Без священних текстів'),
       (7, 'інші общинні', 'Без священних текстів'),
       (8, 'буддизм', 'Трипітака'),
       (9, 'іслам', 'Коран'),
       (10, 'не визначилися', 'Без священних текстів'),
       (11, 'індуїзм', 'Веди'),
       (12, 'африканські традиційні релігії', 'Священні книги африканських традиційних релігій'),
       (13, 'юдаїзм', 'Тора');

insert into country_religion (country_id_country, religion_id_religion, percentage)
values ((select id_country from country where code_iso = 'AO'), 1, 47),
       ((select id_country from country where code_iso = 'AO'), 3, 38),
       ((select id_country from country where code_iso = 'AO'), 4, 15);

insert into country_religion (country_id_country, religion_id_religion, percentage)
values ((select id_country from country where code_iso = 'ZA'), 2, 79.77),
       ((select id_country from country where code_iso = 'ZA'), 6, 15.1),
       ((select id_country from country where code_iso = 'ZA'), 7, 1.46),
       ((select id_country from country where code_iso = 'ZA'), 9, 1.23),
       ((select id_country from country where code_iso = 'ZA'), 12, 0.28),
       ((select id_country from country where code_iso = 'ZA'), 13, 0.17);

-- Task 5
update country_religion
set percentage = 55
where country_id_country = (select id_country from country where code_iso = 'ZA')
  and religion_id_religion = 2;

update religion
set name_religion = 'традиційні африканські культури'
where id_religion = 1;

update country_religion
set percentage = percentage + 2
where country_id_country = (select id_country from country where code_iso = 'AO')
  and religion_id_religion = 1;

-- Task 6
create index idx_name_religion on religion (name_religion);

-- Task 7
select *
from country c
         left join country_language cl on c.id_country = cl.country_id_country
         left join country_religion cr on c.id_country = cr.country_id_country
         left join religion r on cr.religion_id_religion = r.id_religion
where cr.percentage > 10;


select *
from country c
         left join country_language cl on c.id_country = cl.country_id_country
         left join country_religion cr on c.id_country = cr.country_id_country
         left join religion r on cr.religion_id_religion = r.id_religion
where cr.percentage > 10
  and r.name_religion = 'християнство (римо-католицизм)';


select r.name_religion as religion,
       c.name,
       cr.percentage   as percentage
from country c
         left join country_language cl on c.id_country = cl.country_id_country
         left join country_religion cr on c.id_country = cr.country_id_country
         left join religion r on cr.religion_id_religion = r.id_religion
where c.code_iso = 'AO';


/* Task 8 */
-- 1
delete
from country_religion
where percentage < 10;

-- 2
delete
from religion
where id_religion in (13);

-- 3
alter table country_religion
    drop constraint fk_id_religion;

alter table country_religion
    add constraint f_key_cascade_delete
        foreign key (religion_id_religion)
            references religion (id_religion)
            on delete cascade;

-- 4
delete
from religion
where id_religion = 13;

/* Task 9 */
truncate table country_religion;

/* Task 10 */
drop table religion, country_religion;

