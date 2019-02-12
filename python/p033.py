"""
	
Project Euler - Problem 33 - Digit cancelling fractions
https://projecteuler.net/problem=33

"""
import timing
from functools import reduce
from fractions import Fraction
from math import gcd

def main():
    limit = 100
    top = []
    bot = []

    for n in range(1, limit-1):
        for d in range(n+1, limit):
            if has_common_digit(n, d):
                top += [n]
                bot += [d]

    n = reduce(product, top)
    d = reduce(product, bot)
    a = Fraction(n, d)
    print(a._denominator)


def product(x, y):
    return x * y


def has_common_digit(n, d):
    a = n % 10
    b = (n - a) // 10
    i = d % 10
    j = (d - i) // 10

    if i == 0: return False
    if a == j and n/d == b/i: return True
    return False

if __name__ == '__main__':
	main()
