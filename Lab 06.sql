/* Delete */

-- 1
truncate table annotation;
truncate table article;
truncate table author;
truncate table keyword;
truncate table language;
truncate table review;
truncate table reviewer;
truncate table section;
truncate table subsection;
truncate table topic;

-- 2
delete
from annotation
where spanish is null
   or english is null
   or ukrainian is null;

delete
from article
where file_address is null;

delete
from author
where email is null;

-- delete duplicate rows
delete
from keyword a
    using keyword b
where a.id < b.id
  and a.word = b.word;

delete
from language
where name in ('Russian', 'Arabic');

delete
from review
where (novelty + relevance + literature_completeness + presentation_completeness + text_quality) / 5 < 3;

-- delete moskals
delete
from reviewer
where last_name like '%ov';


/* Search */

/* 1 */
-- 1
select *
from editor
where email like '%@example.com';

-- 2
select distinct on (first_name, last_name) *
from author
where last_name not like '%ov'
order by first_name;

/* 2 */
select *
from review
where article_id in (select id from article where language_id in (select id from language where name = 'Ukrainian'));

select *
from report_to_editors
where review_id in (select id
                    from review
                    where (novelty + relevance + literature_completeness + presentation_completeness + text_quality) >
                          (select avg(novelty + relevance + literature_completeness + presentation_completeness +
                                      text_quality)
                           from review));

select *
from article
where topic_id in (select id from topic where ukrainian_name = 'Передача тепла');

/* 3 */
-- 3
select count(section.id), section.name
from article
         join topic on article.topic_id = topic.id
         join subsection on topic.subsection_id = subsection.id
         join section on subsection.section_id = section.id
group by section.id
order by count(section.id) desc
limit 1;

-- 4
select author.id, author.first_name, author.last_name, count(article.id) as article_count
from author
         join article_author on author.id = article_author.author_id
         join article on article_author.article_id = article.id
where article.publish_date >= current_date - interval '5 years'
group by author.id
order by count(author.id) desc
limit 1;

-- 5
select author.id, author.first_name, author.last_name, count(distinct topic_id) as topic_count
from author
         join article_author on author.id = article_author.author_id
         join article on article_author.article_id = article.id
group by author.id
order by count(distinct topic_id) desc
limit 1;




