import pickle
from bs4 import BeautifulSoup
import re

# from html_text_tokenization
def strip_html_tags(text):
    soup = BeautifulSoup(text, 'html.parser')
    [s.extract() for s in soup(['iframe', 'script'])]
    stripped_text = soup.get_text()
    stripped_text = re.sub(r'[\r|\n|\r\n]+', '\n', stripped_text)
    return stripped_text


sample_text = (
    "US unveils world's most powerful supercomputer, beats China." 
    "The US Has unveiled the world's most powerful supercomputer called " 
    "'Summit', beating the previous record-holder China's Sunway TaihuLight. " 
    "With a peak performance of 200,000 trillion calculations per second, it " 
    "is over twice as fast as Sunway TaihuLight,which is capable of 93,000 " 
    "trillion calculations per second. Summit has 4,608 servers, which "
    "reportedly take up the size of two tennis courts."
    )

# from characters
import unicodedata

def remove_accented_chars(text):
    text = unicodedata.normalize('NFKD', text)\
        .encode('ascii', 'ignore').decode('utf-8', 'ignore')
    return text

from handmade.contractions import CONTRACTION_MAP

def expand_match(contraction):
        match = contraction.group(0)
        first_char = match[0]
        expanded_contraction = contraction_mapping.get(match)\
            if contraction_mapping.get(match)\
            else contraction_mapping.get(match.lower())
        expanded_contraction = first_char + expanded_contraction[1:]
        return expanded_contraction

def expand_contractions(text, contraction_mapping=CONTRACTION_MAP):
    contractions_pattern = re.compile(\
        '({})'.format('|'.join(contraction_mapping.keys())), \
        flags = re.IGNORECASE|re.DOTALL)    
    expanded_text = contractions_pattern.sub(expand_match, text)
    expanded_text = re.sub("'", "", expanded_text)
    return expanded_text

def remove_special_characters(text, remove_digits = False):
    pattern = r'[^a-zA-z0-9\s]' if not remove_digits else r'[^a-zA-z\s]'
    text = re.sub(pattern, '', text)
    return text