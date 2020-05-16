# models

# traditional feature engineering models
import pandas as pd
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer, TfidfTransformer, TfidfVectorizer

# Bag of Words
def bag_of_words(norm_corpus, show_doc_feat=False, needobj = False, min_df=0., max_df=1.):
    cv = CountVectorizer(min_df=0., max_df=1.)
    cv_matrix = cv.fit_transform(norm_corpus)
    if show_doc_feat:
        # create dense representation
        cv_matrix = cv_matrix.toarray()
        # get unique words in corpus
        vocab = cv.get_feature_names()
        # show document feature vectors
        doc_feat = pd.DataFrame(cv_matrix, columns=vocab)
        return doc_feat
    if needobj:
        return cv

    return cv_matrix

# Bag of N-Grams
def bag_of_ngrams(norm_corpus, ngram_range=(2,2), show_doc_feat=False, needobj=False):
    nv = CountVectorizer(ngram_range=ngram_range)
    nv_matrix = nv.fit_transform(norm_corpus)
    if show_doc_feat:
        nv_matrix = nv_matrix.toarray()
        vocab = nv.get_feature_names()
        doc_feat = pd.DataFrame(nv_matrix, columns=vocab)
        return doc_feat
    if needobj:
        return nv
    return nv_matrix

# TF-IDF
def tfidf(norm_corpus, show_doc_feat=False, needobj=False, type = 'vectorizer', min_df=0., max_df=1., norm='l2',
            use_idf=True, smooth_idf=True):
    if type == 'transformer':
        # do bag of words
        cv = CountVectorizer(min_df=0., max_df=1.)
        cv_matrix = cv.fit_transform(norm_corpus)
        # do transformer
        tt = TfidfTransformer(norm='l2', use_idf=True)
        tt_matrix = tt.fit_transform(cv_matrix)
        # show document features vector
        if show_doc_feat:
            tt_matrix = tt_matrix.toarray()
            vocab = cv.get_feature_names()
            doc_feat = pd.DataFrame(np.round(tt_matrix,2), columns=vocab)
            return doc_feat
        if needobj:
            return tt
        return tt_matrix
    
    if type == 'vectorizer':
        tv = TfidfVectorizer(min_df=min_df, max_df=max_df, norm=norm, 
                                use_idf=use_idf, smooth_idf=smooth_idf)
        tv_matrix = tv.fit_transform(norm_corpus)
        if show_doc_feat:
            tv_matrix = tv_matrix.toarray()
            vocab = tv.get_feature_names()
            doc_feat = pd.DataFrame(np.round(tv_matrix, 2), columns=vocab)
            return doc_feat
        if needobj:
            return tv
        return tv_matrix

# Document similarity
from sklearn.metrics.pairwise import cosine_similarity

def pairwise_doc_similar(norm_corpus, distance=cosine_similarity):
    # calculate tv matrix
    tv_matrix = tfidf(norm_corpus, type='vectorizer')
    similarity_matrix = distance(tv_matrix)
    similarity_matrix = pd.DataFrame(similarity_matrix)
    return similarity_matrix

# Document clustering with similarity features
from scipy.cluster.hierarchy import linkage

def linkage_matrix(norm_corpus, show_matrix=False, criterion='ward', max_dist=1.0):
    # build similarity matrix
    similarity_matrix = pairwise_doc_similar(norm_corpus)
    # build linkage matrix
    if criterion == 'ward':
        z = linkage(similarity_matrix, criterion)
        if show_matrix:
            df = pd.DataFrame(z, columns=['Document\Cluster 1', 'Document\Cluster 2', 
            'Distance', 'Cluster Size'], dtype='object')
            return df
        return z

# Topic models
from sklearn.decomposition import LatentDirichletAllocation

def lda(norm_corpus, n_components=3, max_iter=10000, random_state=0, 
        features=False, feat_columns=None, getobj=False, constituents=False):
    # get bow matrix
    cv_matrix = bag_of_words(norm_corpus)
    # instantiate lda object
    lda = LatentDirichletAllocation(n_components=n_components, max_iter=max_iter, random_state=random_state)
    # create document topic matrix
    dt_matrix = lda.fit_transform(cv_matrix)
    # get matrix with features
    if features:
        features = pd.DataFrame(dt_matrix, columns=feat_columns)
        return features
    if getobj:
        return lda
    if constituents:
        constituents = []
        cv = bag_of_words(norm_corpus, needobj=True)
        vocab = cv.get_feature_names()
        tt_matrix = lda.components_
        for topic_weight in tt_matrix:
            topic = [(token, weight) for token, weight in zip(vocab, topic_weight)]
            topic = sorted(topic, key=lambda x: -x[1])
            topic = [item for item in topic if item[1] > 0.6]
            constituents.append(topic)
        return constituents
    return dt_matrix

# Robust Word2Vec models with Gensim
from gensim.models import word2vec

def trainword2vec(norm_corpus, feature_size=100, window_context=30, min_word_count=1, sample=1e-3, iterations=50):
    # tokenize sentences in corpus
    wpt = nltk.WordPunctTokenizer()
    tokenized_corpus = [wpt.tokenize(document) for document in norm_bible]
    # train model
    w2v_model = word2vec.Word2Vec(tokenized_corpus, size=feature_size, window=window_context, 
                                    min_count=min_word_count, sample=sample, iter=iterations)
    return w2v_model

def viewsimilarwords(model, search_term_list):
    similar_words = {search_term: [item[0]
                        for item in w2v_model.wv.most_similar([search_term], topn=5)],
                        for search_term in search_term_list}
    return similar_words