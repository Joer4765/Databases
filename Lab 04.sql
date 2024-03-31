create table city
(
    id_city            serial primary key,
    name_city          varchar(40),
    district           varchar(40),
    population_city    int,
    country_id_country int references country (id_country) on delete cascade
);
drop table city;
create table country_language
(
    id_language        serial primary key,
    language           char(50),
    is_official        boolean,
    percentage         decimal(4, 1),
    country_id_country int references country (id_country) on delete cascade
);

insert into country (name, capital, continent, region, surface_area, independence_year, population, life_expectancy,
                     gdp, local_name, government_form, political_system, gcr, code_iso)
values ('Коста-Ріка', 'Сан-Хосе', 'Північна Америка', 'Центральна Америка', 51100, 1821, 3703869, 79.3, 22270,
        'Коста-Ріка', 'Парламентська республіка', 'Унітарна держава', 288, 'CR'),
       ('Нікарагуа', 'Манагуа', 'Північна Америка', 'Центральна Америка', 130000, 1838, 5074000, 68.7, 1988,
        'Нікарагуа', 'Президентська республіка', 'Унітарна держава', 97, 'NI'),
       ('Гондурас', 'Тегусігальпа', 'Північна Америка', 'Центральна Америка', 112090, 1838, 6485000, 69.9, 5333,
        'Гондурас', 'Президентська республіка', 'Унітарна держава', 39, 'HN'),
       ('Беліз', 'Бельмопан', 'Північна Америка', 'Центральна Америка', 22696, 1981, 241000, 70.9, 630, 'Беліз',
        'Парламентська монархія', 'Унітарна держава', null, 'BZ'),
       ('Сальвадор', 'Сан-Сальвадор', 'Північна Америка', 'Центральна Америка', 21041, 1841, 6276000, 69.7, 11863,
        'Сальвадор', 'Президентська республіка', 'Унітарна держава', 35, 'SV'),
       ('Гватемала', 'Гватемала', 'Північна Америка', 'Центральна Америка', 108889, 1821, 11385000, 66.2, 19008,
        'Гватемала', 'Президентська республіка', 'Унітарна держава', 35, 'GT'),
       ('Панама', 'Панама', 'Північна Америка', 'Центральна Америка', 75517, 1903, 2856000, 75.5, 9131, 'Панама',
        'Президентська республіка', 'Унітарна держава', 59, 'PA'),
       ('Норвегія', 'Осло', 'Європа', 'Північна Європа', 323877, 1905, 4478500, 78.7, 145895, 'Норвегія',
        'Парламентська конституційна монархія', 'Унітарна держава', 3837, 'NO'),
       ('Фінляндія', 'Гельсінкі', 'Європа', 'Північна Європа', 338145, 1917, 5171300, 77.4, 121914, 'Фінляндія',
        'Парламентська республіка', 'Унітарна держава', 4225, 'FI'),
       ('Самоа', 'Апіа', 'Австралія та Океанія', 'Полінезія', 2832, 1962, 187820, 75.2, 4231, 'Самоа',
        'Конституційна монархія', 'Унітарна держава', 185, 'WS'),
       ('Фіджі', 'Сува', 'Австралія та Океанія', 'Меланезія', 18274, 1970, 817000, 67.9, 1536, 'Фіджі',
        'Парламентська республіка', 'Унітарна держава', 1386, 'FJ'),
       ('Тонга', 'Наукі', 'Австралія та Океанія', 'Полінезія', 748, 1970, 99000, 66.3, 146, 'Тонга',
        'Парламентське королівство', 'Унітарна держава', null, 'TO'),
       ('Кірибаті', 'Тарава', 'Австралія та Океанія', 'Мікронезія', 726, 1979, 83000, 59.8, 46, 'Кірибаті',
        'Республіка', 'Унітарна держава', null, 'KI'),
       ('Вануату', 'Порт-Віла', 'Австралія та Океанія', 'Меланезія', 12189, 1980, 190000, 60.6, 261, 'Вануату',
        'Республіка', 'Унітарна держава', null, 'VU');


insert into city (name_city, district, population_city, country_id_country)
values ('Оттава', 'Онтаріо', 934243, (select id_country from country where lower(name) = 'канада')),
       ('Мехіко', 'Федеральний округ', 8918653, (select id_country from country where lower(name) = 'мексика')),
       ('Бразиліа', 'Федеральний округ', 3015268, (select id_country from country where lower(name) = 'бразилія')),
       ('Буенос-Айрес', 'Федеральний округ', 2982146, (select id_country from country where lower(name) = 'аргентина')),
       ('Пекін', 'Пекін', 7472000, (select id_country from country where lower(name) = 'китай')),
       ('Нью-Делі', 'Делі', 7206704, (select id_country from country where lower(name) = 'індія')),
       ('Абуджа', 'Абуджа', 1235880, (select id_country from country where lower(name) = 'нігерія')),
       ('Преторія', 'Гаутенг', 658630, (select id_country from country where lower(name) = 'південна африка')),
       ('Берлін', 'Берлін', 3386667, (select id_country from country where lower(name) = 'німеччина')),
       ('Париж', 'Іль-де-Франс', 2140526, (select id_country from country where lower(name) = 'франція')),
       ('Канберра', 'Територія Австралійської столиці', 367752,
        (select id_country from country where lower(name) = 'австралія')),
       ('Веллінгтон', 'Веллінгтон', 202100, (select id_country from country where lower(name) = 'нова зеландія'));

insert into city (name_city, district, population_city, country_id_country)
values ('Торонто', 'Онтаріо', 2731571, (select id_country from country where lower(name) = 'канада')),
       ('Монреаль', 'Квебек', 1704694, (select id_country from country where lower(name) = 'канада')),
       ('Гвадалахара', 'Халіско', 1517895, (select id_country from country where lower(name) = 'мексика')),
       ('Ріо-де-Жанейро', 'Ріо-де-Жанейро', 6320156, (select id_country from country where lower(name) = 'бразилія')),
       ('Сан-Паулу', 'Сан-Паулу', 12103377, (select id_country from country where lower(name) = 'бразилія')),
       ('Кордова', 'Кордова', 1534982, (select id_country from country where lower(name) = 'аргентина')),
       ('Шанхай', 'Шанхай', 24237814, (select id_country from country where lower(name) = 'китай')),
       ('Гуанчжоу', 'Гуандун', 15313372, (select id_country from country where lower(name) = 'китай')),
       ('Мумбаї', 'Махараштра', 12442373, (select id_country from country where lower(name) = 'індія')),
       ('Калькутта', 'Західний Бенгал', 4496694, (select id_country from country where lower(name) = 'індія')),
       ('Лагос', 'Лагос', 2260000, (select id_country from country where lower(name) = 'нігерія'));



insert into country_language (language, is_official, percentage, country_id_country)
values ('Голландська', true, 95.6, (select id_country from country where name = 'Аруба')),
       ('Підперська', true, 50.0, (select id_country from country where name = 'Ісламський Емірат')),
       ('Португальська', true, 100.0, (select id_country from country where name = 'Республіка Ангола')),
       ('Англійська', true, 100.0, (select id_country from country where name = 'Ангілья')),
       ('Албанська', true, 98.8, (select id_country from country where name = 'Республіка Албанія')),
       ('Каталонська', true, 100.0, (select id_country from country where name = 'Князівство Андорра')),
       ('Голландська', true, 100.0, (select id_country from country where name = 'Королівство Нідерландів')),
       ('Арабська', true, 76.0, (select id_country from country where name = 'Об’єднанні Арабські емірати')),
       ('Іспанська', true, 98.0, (select id_country from country where name = 'Аргентинська республіка')),
       ('Вірменська', true, 100.0, (select id_country from country where name = 'Республіка Вірменія')),
       ('Самоанська', true, 100.0, (select id_country from country where name = 'Незалежна держава Самоа')),
       ('Англійська', true, 79.0, (select id_country from country where name = 'Австралійський союз')),
       ('Японська', true, 99.0, (select id_country from country where name = 'Японська держава')),
       ('Арабська', true, 80.0,
        (select id_country from country where name = 'Алжирська Народна Демократична Республіка')),
       ('Данська', true, 89.0, (select id_country from country where name = 'Гренландія')),
       ('Французька', true, 98.0, (select id_country from country where name = 'Канада')),
       ('Французька', true, 100.0, (select id_country from country where name = 'Франція')),
       ('Португальська', true, 100.0, (select id_country from country where name = 'Бразилія')),
       ('Іспанська', true, 99.0, (select id_country from country where name = 'Мексика')),
       ('Китайська', true, 95.0, (select id_country from country where name = 'Китай')),
       ('Хінді', true, 41.0, (select id_country from country where name = 'Індія')),
       ('Англійська', true, 90.0, (select id_country from country where name = 'Австралія'));

insert into country_language (language, is_official, percentage, country_id_country)
values ('Англійська', true, 52.0, (select id_country from country where name = 'Індія')),
       ('Англійська', true, 6.0, (select id_country from country where name = 'Китай')),
       ('Англійська', true, 82.0, (select id_country from country where name = 'Південна Африка')),
       ('Англійська', true, 45.0, (select id_country from country where name = 'Канада')),
       ('Мандаринська', false, 22.0, (select id_country from country where name = 'Канада'));


-- Task 1
select name, capital
from country
where region = 'Південна Америка';

-- Task 2
select name, country_language.language
from country
         join country_language on country.id_country = country_language.country_id_country
where lower(language) in ('арабська', 'японська');

-- Task 3
select name, city.name_city
from country
         left join city on country.id_country = city.country_id_country
where continent = 'Австралія та Океанія'
  and city.id_city is null;

-- Task 4
select continent, language
from country
         join country_language cl on country.id_country = cl.country_id_country
where lower(cl.language) = 'французька';

select continent
from country
where id_country in (select country_id_country
                     from country_language
                     where lower(language) = 'французька');

-- Task 5
select name, count(language) as official_language_count
from country
         join country_language on country.id_country = country_language.country_id_country
where is_official = true
group by name
having count(language) = (select max(official_language_count)
                          from (select count(language) as official_language_count
                                from country_language
                                where is_official = true
                                group by country_id_country) as max_languages);

select max(official_language_count)
from (select count(language) as official_language_count
      from country_language
      where is_official = true
      group by country_id_country) as max_languages;

-- Task 6
select sum(population) as total_population
from country
         join country_language cl on country.id_country = cl.country_id_country
where lower(language) = 'французька';

-- Task 7
select c.name, cl.language, c.capital, c.population
from country_language cl
         join country c on cl.country_id_country = c.id_country
where c.name = 'Аруба';

-- Task 8
select name
from country
where id_country in
      (select country_id_country from city group by country_id_country having count(distinct name_city) = 3);

-- Task 9
(select name, 'Три офіційні мови' as description
 from country
 where id_country in
       (select country_id_country from country_language group by country_id_country having count(language) = 3))
union
(select name, 'Три адміністративні одиниці' as description
 from country
 where id_country in
       (select country_id_country from city group by country_id_country having count(distinct district) = 3));

-- Task 10
select language
from country_language
         join country c on country_language.country_id_country = c.id_country
group by language
having sum(population) > (select sum(population)
                          from country
                                   join country_language cl on country.id_country = cl.country_id_country
                          where lower(language) in ('французька', 'німецька'));

-- Task 11
select name
from country
where id_country not in (select distinct country_id_country from country_language);

-- Task 12
select name, language, is_official
from country
         join country_language cl on country.id_country = cl.country_id_country
where is_official = true
  and language in (select language
                   from country_language
                            join public.country c on country_language.country_id_country = c.id_country
                   where c.name = 'Канада'
                     and is_official = true);


