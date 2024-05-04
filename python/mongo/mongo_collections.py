from datetime import datetime
from mongoengine import *


class Languages(Document):
    name = StringField(required=True)


class Sections(Document):
    name = StringField(required=True)


class Subsections(Document):
    name = StringField(required=True)
    section_id = ReferenceField('Sections', required=True, dbref=True)


class Topics(Document):
    english_name = StringField()
    ukrainian_name = StringField()
    spanish_name = StringField()
    subsection_id = ReferenceField('Subsections', required=True, dbref=True)


class Articles(Document):
    file_address = StringField()
    publish_date = DateTimeField(default=datetime.now)
    language_id = ReferenceField('Languages', required=True, dbref=True)
    topic_id = ReferenceField('Topics', required=True, dbref=True)


class Annotations(Document):
    english = StringField()
    ukrainian = StringField()
    spanish = StringField()
    article_id = ReferenceField('Articles', required=True, dbref=True)


class Authors(Document):
    first_name = StringField(required=True)
    last_name = StringField(required=True)
    email = StringField(required=True)


class Reviewers(Document):
    first_name = StringField(required=True)
    last_name = StringField(required=True)


class Reviews(Document):
    novelty = IntField(required=True)
    relevance = IntField(required=True)
    literature_completeness = IntField(required=True)
    presentation_completeness = IntField(required=True)
    text_quality = IntField(required=True)
    reviewer_id = ReferenceField('Reviewers', required=True, dbref=True)
    article_id = ReferenceField('Articles', required=True, dbref=True)


class RemarkToAuthors(Document):
    remark = StringField(required=True)
    review_id = ReferenceField('Reviews', required=True, dbref=True)


class ReportsToEditors(Document):
    report = StringField()
    review_id = ReferenceField('Reviews', required=True, dbref=True)


class Editors(Document):
    first_name = StringField(required=True)
    last_name = StringField(required=True)
    phone = StringField(required=True)
    email = StringField(required=True)
    address = StringField(required=True)


class Keywords(Document):
    word = StringField(required=True)


class ArticleAuthors(Document):
    article_id = ReferenceField('Articles', required=True, dbref=True)
    author_id = ReferenceField('Authors', required=True, dbref=True)


class ArticleKeywords(Document):
    article_id = ReferenceField('Articles', required=True, dbref=True)
    keyword_id = ReferenceField('Keywords', required=True, dbref=True)


class ReviewerTopics(Document):
    reviewer_id = ReferenceField('Reviewers', required=True, dbref=True)
    topic_id = ReferenceField('Topics', required=True, dbref=True)
