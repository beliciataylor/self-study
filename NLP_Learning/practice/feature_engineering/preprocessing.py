# preprocessing data
# build simple text preprocessor that focuses on removing special characters, extra whitespace, 
# digits, stopwords, and then lowercasing text corpus

# simple text processor
import nltk
import re
import numpy as np
import pandas as pd

## 
def corpus_df(corpus, labels):
    corpus = np.array(corpus)
    corpus_df = pd.DataFrame({'Document': corpus, 'Category': labels})
    corpus_df = corpus_df[['Document', 'Category']]
    return corpus_df

## 
wpt = nltk.WordPunctTokenizer()
stop_words = nltk.corpus.stopwords.words('english')
 
def normalize_document(doc):
    # lowercase and remove special characters\whitespace
    doc = re.sub(r'[^a-zA-Z\s]', '', doc, re.I|re.A)
    doc = doc.lower()
    doc = doc.strip()
    # tokenize document
    tokens = wpt.tokenize(doc)
    # filter stopwords out of document
    filtered_tokens = [token for token in tokens if token not in stop_words]
    # re-create document from filtered tokens
    doc = ' '.join(filtered_tokens)
    return doc
## 
def normalize_corpus(norm_doc):
    norm_corpus = np.vectorize(normalize_document)
    norm_corpus = norm_corpus(norm_doc)
    return norm_corpus