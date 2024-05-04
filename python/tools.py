import pandas as pd
from mongoengine import Document


class ImpossibleType(type):
    pass


def join_documents(doc, collection=None):
    if not collection:
        collection = ImpossibleType
    joined_document = {}
    field_names = doc._fields.keys()
    for field_name in field_names:
        field_value = getattr(doc, field_name)
        if isinstance(field_value, collection):
            joining_fields = join_documents(field_value)
            joined_document.update(joining_fields)
        else:
            joined_document[field_name] = field_value
    return joined_document


def join_collections(upper_collection, lower_collection):
    upper_collection = upper_collection.objects().select_related()
    joined_collection = []
    for doc in upper_collection:
        joined_document = join_documents(doc, lower_collection)
        joined_collection.append(joined_document)
    return joined_collection


def output_collection(cls: type[Document]):
    ndarray = cls.objects.as_pymongo()
    print(pd.DataFrame(ndarray))


def setup_pd(pd):
    pd.set_option('display.max_columns', None)  # Ensures that all columns are shown
    pd.set_option('display.max_rows', None)  # Ensures that all rows are shown
    pd.set_option('display.expand_frame_repr',
                  False)  # Prevents DataFrame from being split across the console window
    pd.set_option('display.max_colwidth', None)  # Makes sure the entire content of each cell is shown
    pd.set_option('display.width', None)  # Automatically detects the console size

