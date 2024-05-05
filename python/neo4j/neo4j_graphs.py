from neomodel import (
    StructuredNode, StringProperty, IntegerProperty, DateTimeProperty,
    config, Relationship, One, OneOrMore, ZeroOrMore
)

config.DATABASE_URL = 'bolt://neo4j:w66mGpqaZmc4rdK@localhost:7687'


class Language(StructuredNode):
    name = StringProperty(unique_index=True)


class Section(StructuredNode):
    name = StringProperty(unique_index=True)


class Subsection(StructuredNode):
    name = StringProperty(unique_index=True)
    section = Relationship('Section', 'PART_OF')


class Topic(StructuredNode):
    english_name = StringProperty(unique_index=True)
    ukrainian_name = StringProperty(unique_index=True)
    spanish_name = StringProperty(unique_index=True)
    subsection = Relationship('Subsection', 'PART_OF')


class Article(StructuredNode):
    file_address = StringProperty(unique_index=True)
    publish_date = DateTimeProperty(default_now=True)
    language = Relationship('Language', 'WRITTEN_IN')
    topic = Relationship('Topic', 'PART_OF')
    annotation = Relationship('Annotation', 'DESCRIBED_BY')
    reviews = Relationship('Review', 'REVIEWED')
    keywords = Relationship('Keyword', 'TAGGED')
    authors = Relationship('Author', 'WRITTEN_BY')


class Annotation(StructuredNode):
    english = StringProperty()
    ukrainian = StringProperty()
    spanish = StringProperty()


class Author(StructuredNode):
    first_name = StringProperty(unique_index=True)
    last_name = StringProperty(unique_index=True)
    email = StringProperty(unique_index=True)


class Reviewer(StructuredNode):
    first_name = StringProperty(unique_index=True)
    last_name = StringProperty(unique_index=True)
    topics = Relationship('Topic', 'EXPERT_IN')
    reviews = Relationship('Review', 'MADE_BY')


class Review(StructuredNode):
    novelty = IntegerProperty()
    relevance = IntegerProperty()
    literature_completeness = IntegerProperty()
    presentation_completeness = IntegerProperty()
    text_quality = IntegerProperty()
    remark = StringProperty()
    report = StringProperty()


class Keyword(StructuredNode):
    word = StringProperty(unique_index=True)
