import pickle

# Unsupervised Lexicon-Based Models
def norm_train_reviews(pickleload=False, pickledump=False, filename='data/norm_train_reviews.pkl'):
    if pickledump:
        pickle.dump(norm_train_reviews, open(filename, 'wb'))
        return('Saved to {}'.format(filename))
    
    elif pickleload:
        norm_train_reviews = pickle.load(open(filename, 'rb'))
        return norm_train_reviews

def norm_test_reviews(pickleload=False, pickledump=False, filename='data/norm_test_reviews.pkl'):
    if pickledump:
        pickle.dump(norm_test_reviews, open(filename, 'wb'))
        return('Saved to {}'.format(filename))
    
    elif pickleload:
        norm_test_reviews = pickle.load(open(filename, 'rb'))
        return norm_test_reviews

# Newer Supervised Deep Learning Models
def w2v_dnn(pickleload=False, pickledump=False, filename='data/w2v_dnn.pkl'):
    if pickledump:
        pickle.dump(w2v_dnn, open(filename, 'wb'))
        return('Saved to {}'.format(filename))
    
    elif pickleload:
        w2v_dnn = pickle.load(open(filename, 'rb'))
        return w2v_dnn

def glove_dnn(pickleload=False, pickledump=False, filename='data/w2v_dnn.pkl'):
    if pickledump:
        pickle.dump(glove_dnn, open(filename, 'wb'))
        return('Saved to {}'.format(filename))
    
    elif pickleload:
        glove_dnn = pickle.load(open(filename, 'rb'))
        return glove_dnn