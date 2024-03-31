create table language
(
    id   serial primary key,
    name varchar(25)
);

create table section
(
    id   serial primary key,
    name varchar(255)
);

create table subsection
(
    id         serial primary key,
    name       varchar(255),
    section_id integer references section (id) on delete cascade
);

create table topic
(
    id             serial primary key,
    english_name   varchar(255),
    ukrainian_name varchar(255),
    spanish_name   varchar(255),
    subsection_id  integer references subsection (id) on delete cascade
);

create table article
(
    id           serial primary key,
    file_address varchar(255),
    publish_date date,
    language_id  integer references language (id) on delete cascade,
    topic_id     integer references topic (id) on delete cascade
);

create table annotation
(
    id         serial primary key,
    english    text,
    ukrainian  text,
    spanish    text,
    article_id integer unique references article (id) on delete cascade
);

create table author
(
    id         serial primary key,
    first_name varchar(25),
    last_name  varchar(25),
    email      varchar(255)
);

create table reviewer
(
    id         serial primary key,
    first_name varchar(25),
    last_name  varchar(25)
);

create table review
(
    id                        serial primary key,
    novelty                   integer,
    relevance                 integer,
    literature_completeness   integer,
    presentation_completeness integer,
    text_quality              integer,
    reviewer_id               integer references reviewer (id) on delete cascade,
    article_id                integer references article (id) on delete cascade
);

create table remark_to_authors
(
    id        serial primary key,
    remark    text,
    review_id integer unique references review (id) on delete cascade
);

create table report_to_editors
(
    id        serial primary key,
    report    text,
    review_id integer unique references review (id) on delete cascade
);

create table editor
(
    id         serial primary key,
    first_name varchar(25),
    last_name  varchar(25),
    phone      varchar(10),
    email      varchar(45),
    address    varchar(100)
);

create table keyword
(
    id   serial primary key,
    word varchar(25)
);

create table article_author
(
    article_id integer references article (id) on delete cascade,
    author_id  integer references author (id) on delete cascade,
    primary key (article_id, author_id)
);

create table article_keyword
(
    article_id integer references article (id) on delete cascade,
    keyword_id integer references keyword (id) on delete cascade,
    primary key (article_id, keyword_id)
);

create table reviewer_topic
(
    reviewer_id integer references reviewer (id) on delete cascade,
    topic_id    integer references topic (id) on delete cascade,
    primary key (reviewer_id, topic_id)
);

/* Data insertion */

-- Insert into language table
insert into language (name)
values ('Ukrainian'),
       ('English'),
       ('Spanish'),
       ('German'),
       ('French');

-- Insert into section table
insert into section (name)
values ('Physics'),
       ('Chemistry'),
       ('Biology'),
       ('Mathematics'),
       ('Computer Science');

-- Insert into subsection table
insert into subsection (name, section_id)
values ('Thermodynamics', 1),
       ('Organic Chemistry', 2),
       ('Genetics', 3),
       ('Calculus', 4),
       ('Machine Learning', 5);

-- Insert into topic table
insert into topic (english_name, ukrainian_name, spanish_name, subsection_id)
values ('Heat Transfer', 'Передача тепла', 'Transferencia de calor', 1),
       ('Hydrocarbons', 'Вуглеводні', 'Hidrocarburos', 2),
       ('DNA Structure', 'Структура ДНК', 'Estructura del ADN', 3),
       ('Integration', 'Інтеграція', 'Integración', 4),
       ('Supervised Learning', 'Навчання з вчителем', 'Aprendizaje supervisado', 5);

alter table article
    add publish_date date;

truncate table article;

-- Insert into article table
insert into article (file_address, publish_date, language_id, topic_id)
values ('path/to/article01.pdf', '2018-03-01', 2, 1),
       ('path/to/article02.pdf', '2017-03-02', 1, 3),
       ('path/to/article03.pdf', '2019-03-03', 3, 5),
       ('path/to/article04.pdf', '2024-03-04', 2, 2),
       ('path/to/article05.pdf', '2024-03-05', 1, 4),
       ('path/to/article06.pdf', '2024-03-06', 2, 1),
       ('path/to/article07.pdf', '2024-03-07', 1, 3),
       ('path/to/article08.pdf', '2024-03-08', 3, 5),
       ('path/to/article09.pdf', '2024-03-09', 2, 2),
       ('path/to/article10.pdf', '2024-03-10', 1, 4);


-- Insert into annotation table
insert into annotation (english, ukrainian, spanish, article_id)
values ('This is the annotation for article 1.', 'Це анотація до статті 1.', 'Esta es la anotación para el artículo 1.',
        1),
       ('Article 2 is about DNA structure.', 'Стаття 2 присвячена структурі ДНК.',
        'El artículo 2 trata sobre la estructura del ADN.', 2),
       ('Machine Learning algorithms are discussed in article 3.',
        'Алгоритми машинного навчання обговорюються в статті 3.',
        'Se discuten los algoritmos de aprendizaje automático en el artículo 3.', 3),
       ('Organic chemistry concepts are explored in article 4.', 'У статті 4 досліджуються концепції органічної хімії.',
        'Se exploran conceptos de química orgánica en el artículo 4.', 4),
       ('Integration techniques are explained in article 5.', 'Техніки інтеграції пояснюються в статті 5.',
        'Se explican las técnicas de integración en el artículo 5.', 5);

-- Insert into author table
insert into author (first_name, last_name, email)
values ('John', 'Doe', 'john.doe@example.com'),
       ('Alice', 'Smith', 'alice.smith@example.com'),
       ('Bob', 'Johnson', 'bob.johnson@example.com'),
       ('Elena', 'Martinez', 'elena.martinez@example.com'),
       ('Peter', 'Wong', 'peter.wong@example.com');

-- Insert into reviewer table
insert into reviewer (first_name, last_name)
values ('David', 'Miller'),
       ('Sandra', 'Clark'),
       ('Michael', 'Lee'),
       ('Karen', 'Taylor'),
       ('Richard', 'Brown');

-- Insert into review table
insert into review (novelty, relevance, literature_completeness, presentation_completeness, text_quality, reviewer_id,
                    article_id)
values (4, 5, 3, 4, 4, 1, 1),
       (5, 4, 4, 5, 5, 2, 2),
       (3, 5, 4, 3, 4, 3, 3),
       (4, 4, 3, 5, 5, 4, 4),
       (5, 3, 5, 4, 4, 5, 5),
       (3, 4, 4, 3, 3, 1, 2),
       (4, 5, 4, 5, 4, 2, 3),
       (5, 4, 3, 5, 5, 3, 4),
       (3, 3, 4, 3, 4, 4, 5),
       (4, 5, 5, 4, 4, 5, 1);

-- Insert into remark_to_authors table
insert into remark_to_authors (remark, review_id)
values ('The paper needs more examples in the discussion section.', 1),
       ('Excellent work on explaining DNA structure.', 2),
       ('Clarify the implementation details of the machine learning algorithms.', 3),
       ('Well-written article on organic chemistry concepts.', 4),
       ('Great explanation of integration techniques.', 5),
       ('Expand the discussion on the application of DNA structure in biotechnology.', 6),
       ('Well-done on explaining machine learning algorithms; provide more examples.', 7),
       ('Incorporate recent research findings in the field of organic chemistry.', 8),
       ('Clarify the mathematical derivations in the integration techniques section.', 9),
       ('Address the limitations of the presented heat transfer model.', 10);

-- Insert into report_to_editors table
insert into report_to_editors (report, review_id)
values ('Recommend minor revisions before acceptance.', 1),
       ('Accept as is; well-written and informative.', 2),
       ('Major revisions required for clarity and completeness.', 3),
       ('Ready for publication with minor edits.', 4),
       ('Suggest revisions for improved clarity.', 5),
       ('Suggest major revisions for a more comprehensive coverage.', 6),
       ('Accept with minor revisions; improve examples in the machine learning section.', 7),
       ('Ready for publication after addressing the suggested revisions.', 8),
       ('Recommend revisions for better clarity in mathematical derivations.', 9),
       ('Accept as is; minor edits required for a few sections.', 10);

insert into editor (first_name, last_name, phone, email, address)
values ('John', 'Doe', '1234567890', 'john.doe@example.com', '123 Main St, City, Country'),
       ('Jane', 'Smith', '9876543210', 'jane.smith@example.com', '456 Elm St, Town, Country'),
       ('Michael', 'Johnson', '5551234567', 'michael.johnson@example.com', '789 Oak St, Village, Country'),
       ('Emily', 'Brown', '9871234560', 'emily.brown@example.com', '101 Pine St, Suburb, Country'),
       ('David', 'Williams', '4445556666', 'david.williams@example.com', '202 Maple St, City, Country'),
       ('Sarah', 'Jones', '3334445555', 'sarah.jones@example.com', '303 Cedar St, Town, Country'),
       ('Matthew', 'Garcia', '2223334444', 'matthew.garcia@example.com', '404 Birch St, Village, Country'),
       ('Jessica', 'Martinez', '1112223333', 'jessica.martinez@example.com', '505 Spruce St, Suburb, Country'),
       ('Daniel', 'Hernandez', '9998887777', 'daniel.hernandez@example.com', '606 Oak St, City, Country'),
       ('Amanda', 'Lopez', '6667778888', 'amanda.lopez@example.com', '707 Pine St, Town, Country'),
       ('Christopher', 'Gonzalez', '4447778888', 'christopher.gonzalez@example.com', '808 Elm St, Village, Country'),
       ('Ashley', 'Perez', '5557778888', 'ashley.perez@example.com', '909 Cedar St, Suburb, Country'),
       ('Justin', 'Rodriguez', '6669998888', 'justin.rodriguez@example.com', '111 Maple St, City, Country'),
       ('Brittany', 'Sanchez', '9991112222', 'brittany.sanchez@example.com', '222 Birch St, Town, Country'),
       ('Andrew', 'Ramirez', '8882223333', 'andrew.ramirez@example.com', '333 Spruce St, Village, Country');


-- Insert into keyword table
insert into keyword (word)
values ('Thermodynamics'),
       ('Hydrocarbons'),
       ('DNA Structure'),
       ('Integration'),
       ('Machine Learning');

-- Insert into article_author table
insert into article_author (article_id, author_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 1),
       (7, 1),
       (8, 2),
       (9, 3),
       (10, 2);

-- Insert into article_keyword table
insert into article_keyword (article_id, keyword_id)
values (1, 1),
       (2, 3),
       (3, 5),
       (4, 2),
       (5, 4);

-- Insert into reviewer_topic table
insert into reviewer_topic (reviewer_id, topic_id)
values (1, 1),
       (2, 3),
       (3, 5),
       (4, 2),
       (5, 4),
       (5, 1),
       (1, 3),
       (2, 5),
       (3, 2),
       (4, 4);