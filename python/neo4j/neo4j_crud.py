from datetime import datetime

from neo4j_graphs import *

# Set up Neo4j connection
config.DATABASE_URL = 'bolt://neo4j:w66mGpqaZmc4rdK@localhost:7687'

# Create Section nodes
physics_section = Section(name="Physics").save()
chemistry_section = Section(name="Chemistry").save()
biology_section = Section(name="Biology").save()
mathematics_section = Section(name="Mathematics").save()
computer_science_section = Section(name="Computer Science").save()

# Create Subsection nodes
thermodynamics_subsection = Subsection(name="Thermodynamics").save()
organic_chemistry_subsection = Subsection(name="Organic Chemistry").save()
genetics_subsection = Subsection(name="Genetics").save()
calculus_subsection = Subsection(name="Calculus").save()
machine_learning_subsection = Subsection(name="Machine Learning").save()

# Connect Subsection to section
thermodynamics_subsection.section.connect(physics_section)
organic_chemistry_subsection.section.connect(chemistry_section)
genetics_subsection.section.connect(biology_section)
calculus_subsection.section.connect(mathematics_section)
machine_learning_subsection.section.connect(computer_science_section)

# Create Topic nodes
heat_transfer_topic = Topic(
    english_name="Heat Transfer",
    ukrainian_name="Передача тепла",
    spanish_name="Transferencia de calor"
).save()

hydrocarbons_topic = Topic(
    english_name="Hydrocarbons",
    ukrainian_name="Вуглеводні",
    spanish_name="Hidrocarburos"
).save()

dna_structure_topic = Topic(
    english_name="DNA Structure",
    ukrainian_name="Структура ДНК",
    spanish_name="Estructura del ADN"
).save()

integration_topic = Topic(
    english_name="Integration",
    ukrainian_name="Інтеграція",
    spanish_name="Integración"
).save()

supervised_learning_topic = Topic(
    english_name="Supervised Learning",
    ukrainian_name="Навчання з вчителем",
    spanish_name="Aprendizaje supervisado"
).save()

# Create Language nodes
ukrainian_language = Language(name="Ukrainian").save()
english_language = Language(name="English").save()
spanish_language = Language(name="Spanish").save()
german_language = Language(name="German").save()
french_language = Language(name="French").save()

# Create Annotation nodes
annotation_1 = Annotation(
    english="This is the annotation for article 1.",
    ukrainian="Це анотація до статті 1.",
    spanish="Esta es la anotación para el artículo 1."
).save()

annotation_2 = Annotation(
    english="Article 2 is about DNA structure.",
    ukrainian="Стаття 2 присвячена структурі ДНК.",
    spanish="El artículo 2 trata sobre la estructura del ADN."
).save()

annotation_3 = Annotation(
    english="Machine Learning algorithms are discussed in article 3.",
    ukrainian="Алгоритми машинного навчання обговорюються в статті 3.",
    spanish="Se discuten los algoritmos de aprendizaje automático en el artículo 3."
).save()

annotation_4 = Annotation(
    english="Organic chemistry concepts are explored in article 4.",
    ukrainian="У статті 4 досліджуються концепції органічної хімії.",
    spanish="Se exploran conceptos de química orgánica en el artículo 4.",
).save()

annotation_5 = Annotation(
    english="Integration techniques are explained in article 5.",
    ukrainian="Техніки інтеграції пояснюються в статті 5.",
    spanish="Se explican las técnicas de integración en el artículo 5.",
).save()

# Create Review nodes
review_1 = Review(novelty=4, relevance=5, literature_completeness=3, presentation_completeness=4,
                  text_quality=4, remark='The paper needs more examples in the discussion section.',
                  report='Recommend minor revisions before acceptance.').save()
review_2 = Review(novelty=5, relevance=4, literature_completeness=4, presentation_completeness=5,
                  text_quality=5, remark='Excellent work on explaining DNA structure.',
                  report='Accept as is; well-written and informative.').save()
review_3 = Review(novelty=3, relevance=5, literature_completeness=4, presentation_completeness=3,
                  text_quality=4, remark='Clarify the implementation details of the machine learning algorithms.',
                  report='Major revisions required for clarity and completeness.').save()
review_4 = Review(novelty=4, relevance=4, literature_completeness=3, presentation_completeness=5,
                  text_quality=5, remark='Well-written article on hydrocarbons.',
                  report='Ready for publication with minor edits.').save()
review_5 = Review(novelty=5, relevance=3, literature_completeness=5, presentation_completeness=4,
                  text_quality=4, remark='Great explanation of integration techniques.',
                  report='Suggest revisions for improved clarity.').save()

# Create Keyword nodes
keyword_1 = Keyword(word="Thermodynamics").save()
keyword_2 = Keyword(word="Hydrocarbons").save()
keyword_3 = Keyword(word="DNA Structure").save()
keyword_4 = Keyword(word="Integration").save()
keyword_5 = Keyword(word="Machine Learning").save()

# Create Author nodes
author_1 = Author(first_name="John", last_name="Doe", email="john.doe@example.com").save()
author_2 = Author(first_name="Alice", last_name="Smith", email="alice.smith@example.com").save()
author_3 = Author(first_name="Bob", last_name="Johnson", email="bob.johnson@example.com").save()
author_4 = Author(first_name="Elena", last_name="Martinez", email="elena.martinez@example.com").save()
author_5 = Author(first_name="Peter", last_name="Wong", email="peter.wong@example.com").save()

# Create Article nodes
article_1 = Article(file_address="path/to/article01.pdf", publish_date=datetime(2018, 3, 1)).save()
article_2 = Article(file_address="path/to/article02.pdf", publish_date=datetime(2017, 3, 2)).save()
article_3 = Article(file_address="path/to/article03.pdf", publish_date=datetime(2019, 3, 3)).save()
article_4 = Article(file_address="path/to/article04.pdf", publish_date=datetime(2024, 3, 4)).save()
article_5 = Article(file_address="path/to/article05.pdf", publish_date=datetime(2024, 3, 5)).save()
article_6 = Article(file_address="path/to/article06.pdf", publish_date=datetime(2024, 3, 6)).save()
article_7 = Article(file_address="path/to/article07.pdf", publish_date=datetime(2024, 3, 7)).save()
article_8 = Article(file_address="path/to/article08.pdf", publish_date=datetime(2024, 3, 8)).save()
article_9 = Article(file_address="path/to/article09.pdf", publish_date=datetime(2024, 3, 9)).save()
article_10 = Article(file_address="path/to/article10.pdf", publish_date=datetime(2024, 3, 10)).save()

# Create Reviewer nodes
reviewer_1 = Reviewer(first_name="David", last_name="Miller").save()
reviewer_2 = Reviewer(first_name="Sandra", last_name="Clark").save()
reviewer_3 = Reviewer(first_name="Michael", last_name="Lee").save()
reviewer_4 = Reviewer(first_name="Karen", last_name="Taylor").save()
reviewer_5 = Reviewer(first_name="Richard", last_name="Brown").save()

# Connect Topic to Subsection
heat_transfer_topic.subsection.connect(thermodynamics_subsection)
hydrocarbons_topic.subsection.connect(organic_chemistry_subsection)
dna_structure_topic.subsection.connect(genetics_subsection)
integration_topic.subsection.connect(calculus_subsection)
supervised_learning_topic.subsection.connect(machine_learning_subsection)

article_1.topic.connect(heat_transfer_topic)
article_2.topic.connect(dna_structure_topic)
article_3.topic.connect(supervised_learning_topic)
article_4.topic.connect(hydrocarbons_topic)
article_5.topic.connect(integration_topic)
article_6.topic.connect(heat_transfer_topic)
article_7.topic.connect(dna_structure_topic)
article_8.topic.connect(supervised_learning_topic)
article_9.topic.connect(hydrocarbons_topic)
article_10.topic.connect(integration_topic)

# Connect articles to languages
article_1.language.connect(english_language)
article_2.language.connect(ukrainian_language)
article_3.language.connect(spanish_language)
article_4.language.connect(english_language)
article_5.language.connect(ukrainian_language)
article_6.language.connect(english_language)
article_7.language.connect(ukrainian_language)
article_8.language.connect(spanish_language)
article_9.language.connect(english_language)
article_10.language.connect(ukrainian_language)

article_1.annotation.connect(annotation_1)
article_2.annotation.connect(annotation_2)
article_3.annotation.connect(annotation_3)
article_4.annotation.connect(annotation_4)
article_5.annotation.connect(annotation_5)

article_1.reviews.connect(review_1)
article_2.reviews.connect(review_2)
article_3.reviews.connect(review_3)
article_4.reviews.connect(review_4)
article_5.reviews.connect(review_5)

article_1.keywords.connect(keyword_1)
article_2.keywords.connect(keyword_3)
article_3.keywords.connect(keyword_5)
article_4.keywords.connect(keyword_2)
article_5.keywords.connect(keyword_4)
article_6.keywords.connect(keyword_1)
article_7.keywords.connect(keyword_3)
article_8.keywords.connect(keyword_5)
article_9.keywords.connect(keyword_2)
article_10.keywords.connect(keyword_4)

article_1.authors.connect(author_1)
article_2.authors.connect(author_2)
article_3.authors.connect(author_3)
article_4.authors.connect(author_4)
article_5.authors.connect(author_5)
article_6.authors.connect(author_1)
article_7.authors.connect(author_2)
article_8.authors.connect(author_3)
article_9.authors.connect(author_4)
article_10.authors.connect(author_5)


reviewer_1.reviews.connect(review_1)
reviewer_2.reviews.connect(review_2)
reviewer_3.reviews.connect(review_3)
reviewer_4.reviews.connect(review_4)
reviewer_5.reviews.connect(review_5)

