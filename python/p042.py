"""
	
Project Euler - Problem 42 - Coded triangle numbers
https://projecteuler.net/problem=42

"""
import timing
from eulerutil import letter_value

def main():
    limit = 9999999
    answer = 0
    
    file = open('./data/p042_words.txt', 'r')
    words = ''.join(file.readlines()).replace('\"', '').split(',')
    values = [word_value(word) for word in words]
    tri = set(triangle(20))
    print(len(list(filter(lambda x: x in tri, values))))


def word_value(word):
    return sum(letter_value(letter) for letter in word)

    
def triangle(limit):
    
    def t(n):
        return n * (n + 1) // 2

    return [t(n) for n in range(1, limit+1)]
    
if __name__ == '__main__':
	main()
