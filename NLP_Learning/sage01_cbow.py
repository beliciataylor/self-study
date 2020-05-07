# for AWS Sagemaker
import os
import argparse

# for training model
from keras.preprocessing import text, sequence
from keras.utils import np_utils
import keras.backend as K
from keras.models import Sequential
from keras.layers import Dense, Embedding, Lambda

# build a CBOW (context, target) generator
def generate_context_word_pairs(corpus, window_size, vocab_size):
    context_length = window_size*2
    for words in corpus:
        sentence_length = len(words)
        for index, word in enumerate(words):
            context_words = []
            label_word = []
            start = index - window_size
            end = index + window_size + 1

            context_words.append(
                [words[i] for i in range(start, end)
                 if 0 <= i < sentence_length and i != index]
            )
            label_word.append(word)

            x = sequence.pad_sequences(context_words, maxlen=context_length)
            y = np_utils.to_categorical(label_word, vocab_size)
            yield(x,y)

def model(df):
    # change df back to list
    name = df.columns[0]
    norm_corpus = df[names].to_list()
    
    # build the corpus vocabulary
    tokenizer = text.Tokenizer()
    tokenizer.fit_on_texts(norm_corpus)
    word2id = tokenizer.word_index

    # build vocabulary of unique words
    word2id['PAD'] = 0
    id2word = {v:k for k, v in word2id.items()}
    wids = [[word2id[w] for w in text.text_to_word_sequence(doc)] for doc in norm_corpus]

    vocab_size = len(word2id)
    embed_size = 100
    window_size = 2 # context window size
    
    # build CBOW architecture
    cbow = Sequential()
    cbow.add(Embedding(input_dim=vocab_size, output_dim=embed_size, input_length=window_size*2))
    cbow.add(Lambda(lambda x: K.mean(x, axis=1), output_shape=(embed_size, )))
    cbow.add(Dense(vocab_size, activation='softmax'))
    cbow.compile(loss='categorical_crossentropy', optimizer='rmsprop')
    
    # Train the model
    for epoch in range(1,6):
        for x, y in generate_context_word_pairs(corpus=wids, window_size=window_size, vocab_size=vocab_size):
            cbow.train_on_batch(x, y)
    
    return(cbow)


if __name__ =='__main__':
    parser = argparse.ArgumentParser()
    args, unknown = _parse_args()

    # input data and model directories
    parser.add_argument('--model_dir', type=str)
    parser.add_argument('--train', type=str, default=os.environ.get('SM_CHANNEL_TRAINING'))
    
    # load data
    df = pd.read_csv(os.path.join(args.train, 'norm_bible.csv'))
    
    # run model
    trained_model = model(df)
    
    # save model output
    trained_model.save(os.path.join(args.sm_model_dir, '01'), 'model.h5')