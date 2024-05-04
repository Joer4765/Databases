from redis_om import JsonModel, EmbeddedJsonModel, Field
from datetime import datetime


class Language(EmbeddedJsonModel):
    name: str = Field(index=True)


class Section(EmbeddedJsonModel):
    name: str = Field(index=True)


class Subsection(EmbeddedJsonModel):
    name: str = Field(index=True)
    section: Section = Field(index=True)


class Topic(EmbeddedJsonModel):
    english_name: str = Field(index=True)
    ukrainian_name: str = Field(index=True)
    spanish_name: str = Field(index=True)
    subsection: Subsection = Field(index=True)


class Article(EmbeddedJsonModel):
    file_address: str = Field(index=True)
    publish_date: datetime = Field(default=datetime.now, index=True)
    language: Language = Field(index=True)
    topic: Topic = Field(index=True)


class Annotation(JsonModel):
    english: str = Field(index=True)
    ukrainian: str = Field(index=True)
    spanish: str = Field(index=True)
    article: Article = Field(index=True)


class Author(EmbeddedJsonModel):
    first_name: str = Field(index=True)
    last_name: str = Field(index=True)
    email: str = Field(index=True)


class Reviewer(EmbeddedJsonModel):
    first_name: str = Field(index=True)
    last_name: str = Field(index=True)


class Review(JsonModel):
    novelty: int = Field(index=True)
    relevance: int = Field(index=True)
    literature_completeness: int = Field(index=True)
    presentation_completeness: int = Field(index=True)
    text_quality: int = Field(index=True)
    remark: str = Field(index=True)
    report: str = Field(index=True)
    reviewer: Reviewer = Field(index=True)
    article: Article = Field(index=True)


class Editor(JsonModel):
    first_name: str = Field(index=True)
    last_name: str = Field(index=True)
    phone: str = Field(index=True)
    email: str = Field(index=True)
    address: str = Field(index=True)


class Keyword(JsonModel):
    word: str = Field(index=True)


class ArticleAuthor(JsonModel):
    article: Article = Field(index=True)
    author: Author = Field(index=True)


class ArticleKeyword(JsonModel):
    article: Article = Field(index=True)
    keyword: Keyword = Field(index=True)


class ReviewerTopic(JsonModel):
    reviewer: Reviewer = Field(index=True)
    topic: Topic = Field(index=True)