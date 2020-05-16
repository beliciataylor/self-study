# Feature Engineering for Text Representation

* all machine learning and deep learning models are limited because they cannot understand raw text data directly; they only understand numeric representations of features as inputs
* have to understand how to work with text data - most abundant sources of unstructured data
* text data: documents that represent words, sentences or paragraphs of free flowing text
* inherent lack of structure and noisy nature of textual data makes it harder for ML methods to directly work with raw text data
* need methods and strategies to extract meaningful features from text data
* feature engineering is important for unstructured, textual data cause need to convert free-flowing text into some numeric representation that can be understood by ML algorithms
* covered following techniques:
    1. Bag of Words model
    2. Bag of N-Grams model
    3. TF-IDF model
    4. Similarity features
    5. Topic models
    6. Word2Vec
    7. GloVe
    8. FastText

## Understanding Text Data

* text data can be structured, categorical attributes
* this scenario, we're talking about free-flowing text in form of words, phrases, sentences and entire document
* no inherent structure to text documents because there's a wide variety of words that can vary across documents and each sentence will be of variable length as compared to a fixed umber of data dimension in structured dataset
* how can we represent text data for machines to understand? use a _vector space model_: (i.e term vector model) mathematical and algebraic model for transforming and representing text documents as numeric vectors of specific terms that form the vector dimensions
* mathematically: let $D$ represent a document in vector space $VS$; the number of dimensions or columns for each document will be the total number of distinct terms or words for all documents in the vector space $VS = \{W_1, W_2, \dots, W_n\}$ where there are $n$ distinct words across all documents. Now represent document $D$ in this vector space as follows: $D = \{w_{D1}, w_{D2}, \dots, w_{Dn}\}$ where $W_{Dn}$ denotes weight for word $n$ in document $D$
* weight is a numeric value and can be anything ranging from frequency of word in document, the average frequency of occurence, embedding weights, or even TF-IDF weight
* important point: once we build feature engineering model, need to use the same process when extracting features from new documents to be predicted and not rebuild whole algorithm based on new documents

## Preprocessing Our Text Corpus
* highlighting most important cleaning and preprocessing techniques that are used heavily in NLP
    1. Removing tags: HTML tags not necessary, use BeautifulSoup library to remove them
    2. Removing accented characters: convert characcters and standardize into ASCII characters
    3. Expanding contradictions
    4. Removing special characters: non alphanumeric characters
    5. Stemming and lemmatization: two processes to get to the base of the word
    6. Removing stopwords
* others from ch3 include tokenization, removing extra whitespace, text lowercasing, spelling corrections, grammatical error corrections, removing repeated characters, etc.

## Traditional Feature Engineering Models
* traditional (count-based) feature engineering strategies for textual data belong to a family of models popularly known as the Bag of Words model, includes
    1. term frequencies
    2. TF-IDF (term frequency-inverse document frequency)
    3. N-grams
    4. topic models, etc.
* while they're effective methods for extracting features from text, due to inherent nature of the mode being a bag of unstructured words, also lose additional information such as semantics, structure, sequence, and context around words in each text document

### Bag of Words Model
* simplest vector space rep model for unstructured text
* vector space model: a math model to represent unstructured text (or any other data) as numeric vectors such that each dimension of the vector is a specific feature/attribute
* bag of words: represents each text doc as a numeric vector where each dimension is a specific word from the corpus and the value could be its frequency in the doc, occurence (denoted by 1 or 0), or even weighted values
* model's name comes from each document being represented as a literal bag of its own words; disregards word order, sequences, and grammar