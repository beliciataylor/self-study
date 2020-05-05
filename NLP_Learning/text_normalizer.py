import nltk
import spacy
import unicodedata
import contractions
import re
from nltk.corpus import wordnet
import collections
#from textblob import Word
from nltk.tokenize.toktok import ToktokTokenizer
from bs4 import BeautifulSoup
import en_core_web_sm

tokenizer = ToktokTokenizer()
stopword_list = nltk.corpus.stopwords.words('english')
nlp = en_core_web_sm.load(parse=True, tag=True, entity=True) 
# nlp = spacy.load('en', parse=True, tag=True, entity=True)
# nlp_vec = spacy.load('en_vectors_web_lg', parse=True, tag=True, entity=True)

