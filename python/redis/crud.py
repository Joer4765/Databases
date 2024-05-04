from redis_schemes import *
from datetime import datetime

# Create Language records

ukrainian_language = Language(name="Ukrainian").save()
english_language = Language(name="English").save()
spanish_language = Language(name="Spanish").save()
german_language = Language(name="German").save()
french_language = Language(name="French").save()

# Create Section records
physics_section = Section(name="Physics").save()
chemistry_section = Section(name="Chemistry").save()
biology_section = Section(name="Biology").save()
mathematics_section = Section(name="Mathematics").save()
computer_science_section = Section(name="Computer Science").save()

# Create Subsection records
thermodynamics_subsection = Subsection(name="Thermodynamics", section=physics_section).save()
organic_chemistry_subsection = Subsection(name="Organic Chemistry", section=chemistry_section).save()
genetics_subsection = Subsection(name="Genetics", section=biology_section).save()
calculus_subsection = Subsection(name="Calculus", section=mathematics_section).save()
machine_learning_subsection = Subsection(name="Machine Learning", section=computer_science_section).save()

# Create Topic records
heat_transfer_topic = Topic(english_name="Heat Transfer", ukrainian_name="Передача тепла",
                            spanish_name="Transferencia de calor", subsection=thermodynamics_subsection).save()
hydrocarbons_topic = Topic(english_name="Hydrocarbons", ukrainian_name="Вуглеводні", spanish_name="Hidrocarburos",
                           subsection=organic_chemistry_subsection).save()
dna_structure_topic = Topic(english_name="DNA Structure", ukrainian_name="Структура ДНК",
                            spanish_name="Estructura del ADN", subsection=genetics_subsection).save()
integration_topic = Topic(english_name="Integration", ukrainian_name="Інтеграція", spanish_name="Integración",
                          subsection=calculus_subsection).save()
supervised_learning_topic = Topic(english_name="Supervised Learning", ukrainian_name="Навчання з вчителем",
                                  spanish_name="Aprendizaje supervisado", subsection=machine_learning_subsection).save()

# Create Article records
article_1 = Article(file_address="path/to/article01.pdf", publish_date=datetime(2018, 3, 1), language=english_language,
                    topic=heat_transfer_topic).save()
article_2 = Article(file_address="path/to/article02.pdf", publish_date=datetime(2017, 3, 2),
                    language=ukrainian_language, topic=dna_structure_topic).save()
article_3 = Article(file_address="path/to/article03.pdf", publish_date=datetime(2019, 3, 3), language=spanish_language,
                    topic=supervised_learning_topic).save()
article_4 = Article(file_address="path/to/article04.pdf", publish_date=datetime(2024, 3, 4), language=english_language,
                    topic=hydrocarbons_topic).save()
article_5 = Article(file_address="path/to/article05.pdf", publish_date=datetime(2024, 3, 5),
                    language=ukrainian_language, topic=integration_topic).save()
article_6 = Article(file_address="path/to/article06.pdf", publish_date=datetime(2024, 3, 6), language=english_language,
                    topic=heat_transfer_topic).save()
article_7 = Article(file_address="path/to/article07.pdf", publish_date=datetime(2024, 3, 7),
                    language=ukrainian_language, topic=dna_structure_topic).save()
article_8 = Article(file_address="path/to/article08.pdf", publish_date=datetime(2024, 3, 8), language=spanish_language,
                    topic=supervised_learning_topic).save()
article_9 = Article(file_address="path/to/article09.pdf", publish_date=datetime(2024, 3, 9), language=english_language,
                    topic=hydrocarbons_topic).save()
article_10 = Article(file_address="path/to/article10.pdf", publish_date=datetime(2024, 3, 10),
                     language=ukrainian_language, topic=integration_topic).save()

# Create Annotation records
annotation_1 = Annotation(english="This is the annotation for article 1.", ukrainian="Це анотація до статті 1.",
                          spanish="Esta es la anotación para el artículo 1.", article=article_1).save()
annotation_2 = Annotation(english="Article 2 is about DNA structure.", ukrainian="Стаття 2 присвячена структурі ДНК.",
                          spanish="El artículo 2 trata sobre la estructura del ADN.", article=article_2).save()
annotation_3 = Annotation(english="Machine Learning algorithms are discussed in article 3.",
                          ukrainian="Алгоритми машинного навчання обговорюються в статті 3.",
                          spanish="Se discuten los algoritmos de aprendizaje automático en el artículo 3.",
                          article=article_3).save()
annotation_4 = Annotation(english="Organic chemistry concepts are explored in article 4.",
                          ukrainian="У статті 4 досліджуються концепції органічної хімії.",
                          spanish="Se exploran conceptos de química orgánica en el artículo 4.",
                          article=article_4).save()
annotation_5 = Annotation(english="Integration techniques are explained in article 5.",
                          ukrainian="Техніки інтеграції пояснюються в статті 5.",
                          spanish="Se explican las técnicas de integración en el artículo 5.",
                          article=article_5).save()

# Create Author records
author_1 = Author(first_name="John", last_name="Doe", email="john.doe@example.com").save()
author_2 = Author(first_name="Alice", last_name="Smith", email="alice.smith@example.com").save()
author_3 = Author(first_name="Bob", last_name="Johnson", email="bob.johnson@example.com").save()
author_4 = Author(first_name="Elena", last_name="Martinez", email="elena.martinez@example.com").save()
author_5 = Author(first_name="Peter", last_name="Wong", email="peter.wong@example.com").save()

# Create Reviewer records
reviewer_1 = Reviewer(first_name="David", last_name="Miller").save()
reviewer_2 = Reviewer(first_name="Sandra", last_name="Clark").save()
reviewer_3 = Reviewer(first_name="Michael", last_name="Lee").save()
reviewer_4 = Reviewer(first_name="Karen", last_name="Taylor").save()
reviewer_5 = Reviewer(first_name="Richard", last_name="Brown").save()

# Create Review records
review_1 = Review(
    novelty=4,
    relevance=5,
    literature_completeness=3,
    presentation_completeness=4,
    text_quality=4,
    remark='The paper needs more examples in the discussion section.',
    report='Recommend minor revisions before acceptance.',
    reviewer=reviewer_1,
    article=article_1,
).save()

review_2 = Review(
    novelty=5,
    relevance=4,
    literature_completeness=4,
    presentation_completeness=5,
    text_quality=5,
    remark='Excellent work on explaining DNA structure.',
    report='Accept as is; well-written and informative.',
    reviewer=reviewer_2,
    article=article_2,
).save()

review_3 = Review(
    novelty=3,
    relevance=5,
    literature_completeness=4,
    presentation_completeness=3,
    text_quality=4,
    remark='Clarify the implementation details of the machine learning algorithms.',
    report='Major revisions required for clarity and completeness.',
    reviewer=reviewer_3,
    article=article_3,
).save()

review_4 = Review(
    novelty=4,
    relevance=4,
    literature_completeness=3,
    presentation_completeness=5,
    text_quality=5,
    remark='Well-written article on organic chemistry concepts.',
    report='Ready for publication with minor edits.',
    reviewer=reviewer_4,
    article=article_4,
).save()

review_5 = Review(
    novelty=5,
    relevance=3,
    literature_completeness=5,
    presentation_completeness=4,
    text_quality=4,
    remark='Great explanation of integration techniques.',
    report='Suggest revisions for improved clarity.',
    reviewer=reviewer_5,
    article=article_5
).save()

# Create Editor records
editor_1 = Editor(first_name="John", last_name="Doe", phone="1234567890", email="john.doe@example.com",
                  address="123 Main St, City, Country").save()
editor_2 = Editor(first_name="Jane", last_name="Smith", phone="9876543210", email="jane.smith@example.com",
                  address="456 Elm St, Town, Country").save()
editor_3 = Editor(first_name="Michael", last_name="Johnson", phone="5551234567", email="michael.johnson@example.com",
                  address="789 Oak St, Village, Country").save()
editor_4 = Editor(first_name="Emily", last_name="Brown", phone="9871234560", email="emily.brown@example.com",
                  address="101 Pine St, Suburb, Country").save()
editor_5 = Editor(first_name="David", last_name="Williams", phone="4445556666", email="david.williams@example.com",
                  address="202 Maple St, City, Country").save()

# Create Keyword records
keyword_1 = Keyword(word="Thermodynamics").save()
keyword_2 = Keyword(word="Hydrocarbons").save()
keyword_3 = Keyword(word="DNA Structure").save()
keyword_4 = Keyword(word="Integration").save()
keyword_5 = Keyword(word="Machine Learning").save()

# Create ArticleAuthor records
article_author_1 = ArticleAuthor(article=article_1, author=author_1).save()
article_author_2 = ArticleAuthor(article=article_2, author=author_2).save()
article_author_3 = ArticleAuthor(article=article_3, author=author_3).save()
article_author_4 = ArticleAuthor(article=article_4, author=author_4).save()
article_author_5 = ArticleAuthor(article=article_5, author=author_5).save()

# Create ArticleKeyword records
article_keyword_1 = ArticleKeyword(article=article_1, keyword=keyword_1).save()
article_keyword_2 = ArticleKeyword(article=article_2, keyword=keyword_3).save()
article_keyword_3 = ArticleKeyword(article=article_3, keyword=keyword_5).save()
article_keyword_4 = ArticleKeyword(article=article_4, keyword=keyword_2).save()
article_keyword_5 = ArticleKeyword(article=article_5, keyword=keyword_4).save()

# Create ReviewerTopic records
reviewer_topic_1 = ReviewerTopic(reviewer=reviewer_1, topic=heat_transfer_topic).save()
reviewer_topic_2 = ReviewerTopic(reviewer=reviewer_2, topic=dna_structure_topic).save()
reviewer_topic_3 = ReviewerTopic(reviewer=reviewer_3, topic=supervised_learning_topic).save()
reviewer_topic_4 = ReviewerTopic(reviewer=reviewer_4, topic=hydrocarbons_topic).save()
reviewer_topic_5 = ReviewerTopic(reviewer=reviewer_5, topic=integration_topic).save()

reviewer_topic_3.reviewer = reviewer_1
print(ReviewerTopic.get(reviewer_topic_5.pk))

ReviewerTopic.delete(reviewer_topic_4.pk)
print(ReviewerTopic.get(reviewer_topic_4.pk))

