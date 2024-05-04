from statistics import mean
from tools import *
from mongo_collections import *


def truncate_tables(*clss: type[Document]):
    for cls in clss:
        cls.objects().delete()


def delete_articles_without_file_address():
    Articles.objects(file_address=None).delete()


def delete_authors_without_an_email():
    Authors.objects(email=None).delete()


def delete_reviews_with_score_less_than(score: int):
    for review in Reviews.objects():
        total_score = sum([review.novelty, review.relevance, review.literature_completeness,
                           review.presentation_completeness, review.text_quality])
        average_score = total_score / 5.0

        if average_score < score:
            review.delete()


def select_document_avg_greater_then_collection_avg():
    collection = join_collections(ReportsToEditors, Reviews)
    avg_scores = []
    result = []

    for doc in collection:
        scores = [
            doc['novelty'],
            doc['relevance'],
            doc['literature_completeness'],
            doc['presentation_completeness'],
            doc['text_quality']
        ]
        doc['avg_score'] = mean(scores)
        avg_scores.append(doc['avg_score'])

    avg_of_avg_scores = mean(avg_scores)

    for doc in collection:
        if doc['avg_score'] > avg_of_avg_scores:
            result.append(doc)

    print(pd.DataFrame(result))


def select_document_avg_greater_then_collection_avg_oop():
    def get_fields_avg(report):
        review = report.review_id
        return mean([
            review.novelty,
            review.relevance,
            review.literature_completeness,
            review.presentation_completeness,
            review.text_quality
        ])

    def update_field_with_fields_avg():
        for report in ReportsToEditors.objects:
            avg_score = get_fields_avg(report)
            Reports(avg_score=avg_score, report=report.report).save()

    def delete_reports_with_avg_less_than(number):
        for report in Reports.objects:
            if report.avg_score <= number:
                report.delete()

    class Reports(Document):
        avg_score = FloatField()
        report = StringField()

    try:
        update_field_with_fields_avg()
        delete_reports_with_avg_less_than(Reports.objects.average("avg_score"))
        output_collection(Reports)
    finally:
        Reports.drop_collection()


def select_section_with_greatest_number_of_articles():
    def update_section_article_counts():
        for article in Articles.objects:
            topic = article.topic_id
            subsection = topic.subsection_id
            section = subsection.section_id
            (SectionArticleCounts
             .objects(section_id=section.id)
             .update(inc__article_count=1,
                     section_name=section.name,
                     upsert=True))

    def get_max_in_field(field):
        return max(SectionArticleCounts.objects.scalar(field))

    def delete_sections_with_count_less_than(number):
        for section in SectionArticleCounts.objects:
            if section.article_count < number:
                section.delete()

    class SectionArticleCounts(Document):
        section_id = IntField(required=True)
        section_name = StringField(required=True)
        article_count = IntField(default=0)

    try:
        update_section_article_counts()
        max_in_field = get_max_in_field('article_count')
        delete_sections_with_count_less_than(max_in_field)
        output_collection(SectionArticleCounts)
    finally:
        SectionArticleCounts.drop_collection()


if __name__ == '__main__':
    connect('scientific_journal')
    setup_pd(pd)

    # truncate_tables(Languages, Subsections)

    # delete_articles_without_file_address()

    # delete_articles_without_file_address()

    # delete_reviews_with_score_less_than(3)

    select_document_avg_greater_then_collection_avg()
    print()
    select_document_avg_greater_then_collection_avg_oop()
    print()
    select_section_with_greatest_number_of_articles()
    print()
