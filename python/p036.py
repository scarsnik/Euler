"""
	
Project Euler - Problem 36 - Double-base palindromes
https://projecteuler.net/problem=36

"""
import timing
from eulerutil import is_palindrome

def main():
    limit = 1000000
    
    answer_count = 0
    answer_sum = 0    
    for i in range(1, limit):
        dec = str(i)
        bin = f'{i:b}'
        if is_palindrome(dec) and is_palindrome(bin):
            answer_count += 1
            answer_sum += i
    
    print(answer_sum)


if __name__ == '__main__':
	main()
