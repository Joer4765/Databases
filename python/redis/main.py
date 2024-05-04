from redis_om import JsonModel, EmbeddedJsonModel, Field
from datetime import datetime


class Languages(JsonModel):
    name: str = Field(index=True)


class Subsections(EmbeddedJsonModel):
    name: str = Field(index=True)


class Sections(JsonModel):
    name: str = Field(index=True)
    subsections: Subsections


class Topics(JsonModel):
    english_name: str = Field(index=True)
    ukrainian_name: str = Field(index=True)
    spanish_name: str = Field(index=True)
    subsection_id: str = Field(index=True)


class Articles(JsonModel):
    file_address: str = Field(index=True)
    publish_date: datetime = Field(default=datetime.now, index=True)
    language_id: str = Field(index=True)
    topic_id: str = Field(index=True)


class Annotations(JsonModel):
    english: str = Field(index=True)
    ukrainian: str = Field(index=True)
    spanish: str = Field(index=True)
    article_id: str = Field(index=True)


class Authors(JsonModel):
    first_name: str = Field(index=True)
    last_name: str = Field(index=True)
    email: str = Field(index=True)


class Reviewers(JsonModel):
    first_name: str = Field(index=True)
    last_name: str = Field(index=True)


class Reviews(JsonModel):
    novelty: int = Field(index=True)
    relevance: int = Field(index=True)
    literature_completeness: int = Field(index=True)
    presentation_completeness: int = Field(index=True)
    text_quality: int = Field(index=True)
    reviewer_id: str = Field(index=True)
    article_id: str = Field(index=True)


class RemarkToAuthors(JsonModel):
    remark: str = Field(index=True)
    review_id: str = Field(index=True)


class ReportsToEditors(JsonModel):
    report: str = Field(index=True)
    review_id: str = Field(index=True)


class Editors(JsonModel):
    first_name: str = Field(index=True)
    last_name: str = Field(index=True)
    phone: str = Field(index=True)
    email: str = Field(index=True)
    address: str = Field(index=True)


class Keywords(JsonModel):
    word: str = Field(index=True)


class ArticleAuthors(JsonModel):
    article_id: str = Field(index=True)
    author_id: str = Field(index=True)


class ArticleKeywords(JsonModel):
    article_id: str = Field(index=True)
    keyword_id: str = Field(index=True)


class ReviewerTopics(JsonModel):
    reviewer_id: str = Field(index=True)
    topic_id: str = Field(index=True)
