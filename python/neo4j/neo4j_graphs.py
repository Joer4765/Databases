from neomodel import StructuredNode, StringProperty, IntegerProperty, DateTimeProperty, Relationship, config

config.DATABASE_URL = 'bolt://neo4j:w66mGpqaZmc4rdK@localhost:7687'


class Language(StructuredNode):
    name = StringProperty(unique_index=True)
    articles = Relationship('Article', 'ARTICLE_LANGUAGE')


class Section(StructuredNode):
    name = StringProperty(unique_index=True)
    subsections = Relationship('Subsection', 'SUBSECTION_SECTION')


class Subsection(StructuredNode):
    name = StringProperty(unique_index=True)
    section = Relationship('Section', 'SUBSECTION_SECTION')
    topics = Relationship('Topic', 'TOPIC_SUBSECTION')


class Topic(StructuredNode):
    english_name = StringProperty(unique_index=True)
    ukrainian_name = StringProperty(unique_index=True)
    spanish_name = StringProperty(unique_index=True)
    subsection = Relationship('Subsection', 'TOPIC_SUBSECTION')
    articles = Relationship('Article', 'ARTICLE_TOPIC')
    experts = Relationship('Reviewer', 'EXPERT_IN')


class Article(StructuredNode):
    file_address = StringProperty(unique_index=True)
    publish_date = DateTimeProperty(default_now=True)
    language = Relationship('Language', 'ARTICLE_LANGUAGE')
    topic = Relationship('Topic', 'ARTICLE_TOPIC')
    annotation = Relationship('Annotation', 'ARTICLE_ANNOTATION')
    reviews = Relationship('Review', 'ARTICLE_REVIEW')
    keywords = Relationship('Keyword', 'TAGGED')
    authors = Relationship('Author', 'ARTICLE_AUTHOR')


class Annotation(StructuredNode):
    english = StringProperty()
    ukrainian = StringProperty()
    spanish = StringProperty()
    articles = Relationship('Article', 'ARTICLE_ANNOTATION')


class Author(StructuredNode):
    first_name = StringProperty(unique_index=True)
    last_name = StringProperty(unique_index=True)
    email = StringProperty(unique_index=True)
    articles = Relationship('Article', 'ARTICLE_AUTHOR')


class Reviewer(StructuredNode):
    first_name = StringProperty(unique_index=True)
    last_name = StringProperty(unique_index=True)
    reviews = Relationship('Review', 'REVIEW_REVIEWER')
    topics = Relationship('Topic', 'EXPERT_IN')


class Review(StructuredNode):
    novelty = IntegerProperty()
    relevance = IntegerProperty()
    literature_completeness = IntegerProperty()
    presentation_completeness = IntegerProperty()
    text_quality = IntegerProperty()
    remark = StringProperty()
    report = StringProperty()
    articles = Relationship('Article', 'ARTICLE_REVIEW')
    reviewer = Relationship('Reviewer', 'REVIEW_REVIEWER')


class Keyword(StructuredNode):
    word = StringProperty(unique_index=True)
    articles = Relationship('Article', 'TAGGED')
