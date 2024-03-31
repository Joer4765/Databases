create or replace procedure insert_new_author(fn varchar(25), ln varchar(25), em varchar(255))
    language sql
begin
    atomic
    insert into author (first_name, last_name, email)
    values (fn, ln, em);
end;

call insert_new_author('Ihor', 'Boichuk', 'bb@gmail.com');


create or replace procedure delete_reviewers_by_pattern(fist_name_pattern varchar(25), last_name_pattern varchar(25))
    language sql
begin
    atomic
    delete
    from reviewer
    where reviewer.first_name like fist_name_pattern
      and last_name like last_name_pattern;
end;

call delete_reviewers_by_pattern('%%', '%own');


create or replace procedure update_remark(remark_id int, new_remark text)
    language sql
begin
    atomic
    update remark_to_authors
    set remark = new_remark
    where id = remark_id;
end;

call update_remark(1, 'Updated remark');


create or replace procedure get_articles_by_language(lang_name varchar(25))
    language plpgsql
as
$$
declare
    article_record record;
begin
    for article_record in
        select a.id, a.file_address, a.publish_date, l.name as language, t.english_name as topic
        from article a
                 inner join language l on a.language_id = l.id
                 inner join topic t on a.topic_id = t.id
        where l.name = lang_name
        loop
            raise notice '%', article_record;
        end loop;
end
$$;

call get_articles_by_language('Ukrainian');


create or replace function get_reviews_for_editors(a_id int)
    returns table
            (
                novelty int,
                report  text
            )
    language sql
begin
    atomic
    select novelty, report
    from review
             join report_to_editors on review.id = report_to_editors.review_id
    where review.article_id = a_id;
end;

select *
from get_reviews_for_editors(3);

create or replace function count_articles_by_language(lang_name varchar(25))
    returns integer
    language plpgsql
as
$$
declare
    total_articles integer;
begin
    select count(*)
    into total_articles
    from article a
             inner join language l on a.language_id = l.id
    where l.name = lang_name;

    return total_articles;
end
$$;

select count_articles_by_language('Ukrainian');

create or replace function get_review_count_by_reviewer(r_id integer)
    returns integer
    language plpgsql
as
$$
declare
    review_count integer;
begin
    select count(*)
    into review_count
    from review
    where reviewer_id = r_id;

    return review_count;
end
$$;

select get_review_count_by_reviewer(1);


/* Triggers */

-- Trigger for the author table: Check for email address uniqueness before inserting a new record
create or replace function check_unique_email_before_insert()
    returns trigger as
$$
begin
    if exists (select 1 from author where email = new.email) then
        raise exception 'Email address already exists in the author table';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger before_insert_author_trigger
    before insert
    on author
    for each row
execute function check_unique_email_before_insert();


-- Trigger for the review table: Check the maximum score value before updating
create or replace function check_review_score_before_update()
    returns trigger as
$$
begin
    if new.novelty > 5 or new.relevance > 5 or new.literature_completeness > 5 or new.presentation_completeness > 5 or
       new.text_quality > 5 then
        raise exception 'Review score cannot exceed 5';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger before_update_review_trigger
    before update
    on review
    for each row
execute function check_review_score_before_update();


-- Trigger for the article table: Updating the last_modified field after successfully updating article data
alter table article
add last_modified timestamp;

create or replace function update_last_modified_after_update()
    returns trigger as
$$
begin
    update article
    set last_modified = now()
    where id = new.id;
    return new;
end;
$$ language plpgsql;

create trigger after_update_article_trigger
    after update
    on article
    for each row
execute function update_last_modified_after_update();


-- Trigger for the review table: Calculating the overall rating after updating individual scores
create or replace function calculate_overall_rating_after_update()
    returns trigger as
$$
begin
    new.overall_rating := (new.novelty + new.relevance + new.literature_completeness + new.presentation_completeness +
                           new.text_quality) / 5;
    return new;
end;
$$ language plpgsql;

create trigger after_update_review_calculate_overall_rating_trigger
    after update of novelty, relevance, literature_completeness, presentation_completeness, text_quality
    on review
    for each row
execute function calculate_overall_rating_after_update();


-- Trigger for the article table: Check for related records in the review table before deleting an article
create or replace function check_related_reviews_before_delete()
    returns trigger as
$$
begin
    if exists (select 1 from review where article_id = old.id) then
        raise exception 'Cannot delete article with associated reviews';
    end if;
    return old;
end;
$$ language plpgsql;

create trigger before_delete_article_trigger
    before delete
    on article
    for each row
execute function check_related_reviews_before_delete();


-- Logging
create table log
(
    id         serial primary key,
    table_name varchar(25),
    operation  varchar(6),
    time       timestamp
);

create or replace procedure add_record_to_log(t_name varchar(25), op varchar(8))
    language plpgsql
as
$$
begin
    insert into log (table_name, operation, time)
    values (t_name, op, now());
end
$$;

create or replace function log()
    returns trigger
    language plpgsql
as
$$
begin
    call add_record_to_log(tg_table_name::regclass::varchar(25), tg_op::varchar(8));
end
$$;

create trigger update_review_trigger
    after update
    on review
    for each row
execute procedure log();

create trigger delete_review_trigger
    after delete
    on review
    for each row
execute procedure log();

