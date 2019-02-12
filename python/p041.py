"""
	
Project Euler - Problem 41 - Pandigital prime
https://projecteuler.net/problem=41

"""
import timing
from math import log10
from eulerutil import primes

def main():
    limit = 9999999
    answer = 0
    for p in primes(limit):
        if ''.join(sorted(str(p))) == pandigits(digits(p)):
            answer = p

    print(answer)


def digits(n):
    return int(log10(n)) + 1

def pandigits(n):
    return ''.join(str(i) for i in range(1, n+1))

if __name__ == '__main__':
	main()
