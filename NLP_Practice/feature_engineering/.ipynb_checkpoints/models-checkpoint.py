# models

# traditional feature engineering models
from sklearn.feature_extraction.text import CountVectorizer

def bag_of_words(norm_corpus, min_df=0., max_df=1.):
    cv = CountVectorizer(min_df=0., max_df=1.)
    cv_matrix = cv.fit_transform(norm_corpus)
    return cv_matrix