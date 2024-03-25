create table city (
    id_city serial primary key,
    name_city varchar(40),
    district varchar(40),
    population_city int,
    country_id_country int references country(id_country) on delete cascade
);
drop table city;
create table country_language (
    id_language serial primary key,
    language char(50),
    is_official boolean,
    percentage decimal(4,1),
    country_id_country int references country(id_country) on delete cascade
);
-- alter table country drop capital;

insert into country (name, continent, region, surface_area, independence_year, population, life_expectancy, gdp, local_name, government_form, political_system, gcr, code_iso)
values
  ('Коста-Ріка', 'Північна Америка', 'Центральна Америка', 51100, 1821, 3703869, 79.3, 22270, 'Коста-Ріка', 'Парламентська республіка', 'Унітарна держава', 288, 'CR'),
  ('Нікарагуа', 'Північна Америка', 'Центральна Америка', 130000, 1838, 5074000, 68.7, 1988, 'Нікарагуа', 'Президентська республіка', 'Унітарна держава', 97, 'NI'),
  ('Гондурас', 'Північна Америка', 'Центральна Америка', 112090, 1838, 6485000, 69.9, 5333, 'Гондурас', 'Президентська республіка', 'Унітарна держава', 39, 'HN'),
  ('Беліз', 'Північна Америка', 'Центральна Америка', 22696, 1981, 241000, 70.9, 630, 'Беліз', 'Парламентська монархія', 'Унітарна держава', NULL, 'BZ'),
  ('Сальвадор', 'Північна Америка', 'Центральна Америка', 21041, 1841, 6276000, 69.7, 11863, 'Сальвадор', 'Президентська республіка', 'Унітарна держава', 35, 'SV'),
  ('Гватемала', 'Північна Америка', 'Центральна Америка', 108889, 1821, 11385000, 66.2, 19008, 'Гватемала', 'Президентська республіка', 'Унітарна держава', 35, 'GT'),
  ('Панама', 'Північна Америка', 'Центральна Америка', 75517, 1903, 2856000, 75.5, 9131, 'Панама', 'Президентська республіка', 'Унітарна держава', 59, 'PA'),
  ('Норвегія', 'Європа', 'Північна Європа', 323877, 1905, 4478500, 78.7, 145895, 'Норвегія', 'Парламентська конституційна монархія', 'Унітарна держава', 3837, 'NO'),
  ('Фінляндія', 'Європа', 'Північна Європа', 338145, 1917, 5171300, 77.4, 121914, 'Фінляндія', 'Парламентська республіка', 'Унітарна держава', 4225, 'FI'),
  ('Самоа', 'Австралія та Океанія', 'Полінезія', 2832, 1962, 187820, 75.2, 4231, 'Самоа', 'Конституційна монархія', 'Унітарна держава', 185, 'WS'),
  ('Фіджі', 'Австралія та Океанія', 'Меланезія', 18274, 1970, 817000, 67.9, 1536, 'Фіджі', 'Парламентська республіка', 'Унітарна держава', 1386, 'FJ'),
  ('Тонга', 'Австралія та Океанія', 'Полінезія', 748, 1970, 99000, 66.3, 146, 'Тонга', 'Парламентське королівство', 'Унітарна держава', NULL, 'TO'),
  ('Кірибаті', 'Австралія та Океанія', 'Мікронезія', 726, 1979, 83000, 59.8, 46, 'Кірибаті', 'Республіка', 'Унітарна держава', NULL, 'KI'),
  ('Вануату', 'Австралія та Океанія', 'Меланезія', 12189, 1980, 190000, 60.6, 261, 'Вануату', 'Республіка', 'Унітарна держава', NULL, 'VU');

insert into city (name_city, district, population_city, country_id_country)
values
  ('Оттава', 'Онтаріо', 934243, (select id_country from country where lower(name) = 'канада')),
  ('Мехіко', 'Федеральний округ', 8918653, (select id_country from country where lower(name) = 'мексика')),
  ('Бразиліа', 'Федеральний округ', 3015268, (select id_country from country where lower(name) = 'бразилія')),
  ('Буенос-Айрес', 'Федеральний округ', 2982146, (select id_country from country where lower(name) = 'аргентина')),
  ('Пекін', 'Пекін', 7472000, (select id_country from country where lower(name) = 'китай')),
  ('Нью-Делі', 'Делі', 7206704, (select id_country from country where lower(name) = 'індія')),
  ('Абуджа', 'Абуджа', 1235880, (select id_country from country where lower(name) = 'нігерія')),
  ('Преторія', 'Гаутенг', 658630, (select id_country from country where lower(name) = 'південна африка')),
  ('Берлін', 'Берлін', 3386667, (select id_country from country where lower(name) = 'німеччина')),
  ('Париж', 'Іль-де-Франс', 2140526, (select id_country from country where lower(name) = 'франція')),
  ('Канберра', 'Територія Австралійської столиці', 367752, (select id_country from country where lower(name) = 'австралія')),
  ('Веллінгтон', 'Веллінгтон', 202100, (select id_country from country where lower(name) = 'нова зеландія'));

insert into country_language (language, is_official, percentage, country_id_country)
values
  ('Голландська', true, 95.6, (select id_country from country where name = 'Аруба')),
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
  ('Арабська', true, 80.0, (select id_country from country where name = 'Алжирська Народна Демократична Республіка')),
  ('Данська', true, 89.0, (select id_country from country where name = 'Гренландія')),
  ('Французька', true, 98.0, (select id_country from country where name = 'Канада')),
  ('Французька', true, 100.0, (select id_country from country where name = 'Франція')),
  ('Португальська', true, 100.0, (select id_country from country where name = 'Бразилія')),
  ('Іспанська', true, 99.0, (select id_country from country where name = 'Мексика')),
  ('Китайська', true, 95.0, (select id_country from country where name = 'Китай')),
  ('Хінді', true, 41.0, (select id_country from country where name = 'Індія')),
  ('Англійська', true, 90.0, (select id_country from country where name = 'Австралія'));