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

FUNCTIONS
from sklearn.feature_extractions.text
* CountVectorizer(): convert a collection of text documents to a matrix of token counts
    1. parameters:
        - min_df: when building a vocabulary, ignore terms w/ document frequency strictly lower than freq threshold
        - max_df: when building a vocabulary, ignore terms w/ document frequency strictly higher than freq threshold
        - ngram_range: the lower and upper boundary of the range of n-values for different word n-grams or char n-grams to be extracted
    2. attributes
        - fit_transform(): learn the vocabulary dictionary and return document-term matrix
        - get_feature_names(): array mapping from feature integer indices to feature name
* np.vectorize(): transform functions which are not numpy-aware (e.g. take floats as input and return floats as output) into functions that can operate on (and return) numpy arrays (from stack overflow)
    1. parameters:
        - pyfunc: a python function or method (required)

### Bag of N-Grams Model
* helps to take into account phrases or collection of words that occur in sequence
* def: a collection of word tokens from a text doc such that these tokens are contiguous and occur in sequence
* extension of the BOW model that leverages N-gram based features
* each feature is a n-gram representing a sequence of n words and values represent how many times the n-gram was present in the document

### TF-IDF Model
(will note later)

### Extracting Features for New Documents
* Suppose you built a machine learning model to classify and categorize news articles
* Q: How can you generate features for completely new document so that you can feed it into the ML models for prediction?
* sklearn has transform() function for vectorizers previously discussed
* can leverage to get features for completely new document that was not present in our corpus (when we trained model) 

PROCESS
    1. use fit_transform() to build a feature matrix on all documents in corpus
        * becomes training feature set on which to build and train predictive or other ML models
    2. use transform() to generate feature vectors of new documents
    3. can be fed into trained models to generate needed insights

### Document Similarity
* process of using a distance or similarity based metric that can identify how similar a text document is to any other document(s) based on features extracted from the documents like Bag of Words or TF-IDF
* pairwise document similarity: computing document similarity for each pair of documents in a corpus
* good EX of grouping or clustering that's solved by unsupervised learning

### Document Clusterning with Similarity Features
* clustering leverages unsupervised learning to group data points (documents in this case) into groups or cluster
* leverage unsupervised hierarchical clustering algorithm to try and group similar documents from corpus by using document similarity features generated
* two types of hierarchical clustering algorithm
    1. agglomerative
        - hierarchical clustering using a bottom-up approach i.e each observation or document starts in its own cluser and clusters are successively merged using a distance metric that measures distances between data points and a linkage merge criterion
        - EX of linkage critera: Ward, Complete linkage, Average linkage; useful for choosing a pair of clusters (individual documents at lowest step and clusters at higher steps) to merge at each step based on optimal value of an objective function
        - can choose Ward's minimum variance method as linkage criteion to minimize total within-cluster variance; at each step, find the pair of clusters that leads to the minimum increase in total within-cluster variance after merging
    2. divisive
* with n data points, the linkage matrix z will have shape (n-1) x 4 where z[i] tells us which clusters were merged at step i
* each row has four elements
    - first two elements are either data point identifiers or cluster labels (in later parts of matrix once multiple data points are merged)
    - third element: cluster distance between first two elements (either data points or clusters)
    - last element: total number of elements/data points in cluster once merge is complete

### Topic Models
* use some summarization techniques to extract topic or concept based features from text doc
* extract key themes or concepts from a corpus of docs represented as topics
* each topic represented as a collection of words or terms from doc corpus
* together terms signify a specific topic, theme, or concept and each topic can be easily distinguished from other topics by virtue of semantic meaning conveyed by these terms
* do end up with overlapping topics based on data
* topic models useful in summarizing large corpus of text docs to extract and depict key concepts
* also useful in extracting features from text data that capture latent patterns in the data
* various techniques for topic modeling, but most involve a form of matrix decomposition
    - EXs
        1. Latent Semantic Indexing (LSI): uses Singular Valued Decomposition
        2. Latent Dirichlet Allocation (LDA): uses generative probabilistic model where each document consists of a combination of several topics and each term or word can be assigned to a specific topic;
* after running algorithm for several iterations, should have topic mixtures for each document
* then generate constituents of each topic from terms that point to that topic
* remember when LDA is applied to a document-term matrix (TF-IDF or BOW feature matrix), it's broken down into two main components:
    1. document topic matrix: feature matrix we're looking for
    2. topic-term matrix: helps us look at potential topics in the corpus

## Advanced Feature Engineering Models
* traditional models:
    - pros: effective for extracting features
    - cons: model is bag of unstructures words; lose semantics, structure, sequence and context around nearby words in each text doc
* explore models that give us features that are vector representation of words, popularly known as embeddings
* raw text data: dealing with individual words that may have their own identifiers and don't capture the semantic relationship among words
    - leads to huge sparse word vectors for textual data
    - not enough data -> may get poor models or overfit
* to overcome shortcoming of BOW models, use vector space models (VSMs) in a way that we can embed work vectors in this continuous vector space based on semantic and contextual similarity
* _distributional hypothesis_ in field of distributional semantics: words that occur and are used in the same context are semantically similar to one another and have similar meanings; i.e "a word is characterized by the company it keeps"
* two main types of methods for contextual word vectors
    1. count-based methods, i.e Latent Semantic Analysis (LSA): used to calculate statistical measures of how often words occur with their neighboring words in a corpus  and then build dense word vectors for each word from these measures
    2. predictive methods, i.e neural network based language models: try to predict words from their neighboring words by looking at word sequences in a corpus; in process, it learns distributed representations giving us dense word embeddings

### Word2Vec Model
* predictive deep learning based model
* computes and generates distributed and continuous dene vector representations of words that capture contextual and semantic similarity
* unsupervised models that take in massive textual corpora, create a vocabulary of possible words, and generate dense word embeddings for each word in the vector space representing that vocabulary
* can usually specify the size of the word embedding vectors
* total number of vectors are essentially the size of the vocabulary
* makes dimensionality of dense vector space lower than the high-dimensional sparse vector space built using traditional BOW models
* two different model architectures that can be leveraged by Word2Vec to create word embedding representations
    1. The Continuous Bag of Word (CBOW) models
    2. The Skip-Gram Model

#### The Continuous Bag of Words (CBOW) Model
* tries to predict the current target word (center word) based on the source context words (surrounding words)
* EX. "the quick brown fox jumps over the lazy dog"
    - can be pairs of (context_window, target_word)
    - consider context window of size 2
    - ([quick, fox], brown), ([the, brown], quick), ([the, dog], lazy), etc
    - the model tries to predict the target_word based on the context_window
* can give corpus w/o additional labels or info and Word2Vec models can construct dense word embeddings
* still need to leverage a supervised, classification methodology once you have corpus to get embeddings; do from within the corpus itself
* model CBOW architecture as a deep learning classification model such that we take in context words as our input X and try to predict the target word Y

#### The Skip-Gram Model
* tries to achieve the reverse of the CBOW model
* tries predicting the source context words (surrounding words) given a target word (the center word)
* EX. "the quick brown fox jumps over the lazy dog"
    - predict context [quick, fox] given the target word "brown", etc
* tries to predict context_window based on the target_word
* to simplify, break down (target, context_words) pairs into (target, context) pairs
* use [(target, context), 1] pairs as positive inputs where the 1 indicates that they are contextually relevant, and use [(target, random), 0] as negative input samples

### Robust Word2Vec Models with Gensim
* gensim framework is robust, efficient, and scalable implementation of Word2Vec model
* workflow: tokenize our normalized corpus and then focus on the following four parameters: (1) size, (2) window, (3) min_count, (4) sample
* basic idea: provide a corpus of documents as inputs and get feature vectors as outputs
* internally: constructs a vocabulary based on the input text documents and learns vector representations for words based on various techniques; once completed, it builds a model that can be used to extract word vectors for each word in a document
* using techniques like average weighting or TF-IDF weighting, we can compute the averaged vector representation of a document using its word vectors