"""
	
Project Euler - Problem 40 - Champernowne's constant
https://projecteuler.net/problem=40

"""
import timing
from math import log10
from functools import reduce


def main():
    limit = 1000000
    answer = []

    count = 0
    n = 1
    d = 1
    while count < limit:
        if count + digits(n) >= d:
            delta = d - count
            answer.append(int(str(n)[delta-1]))
            d *= 10
        count += digits(n)
        n += 1
    print(reduce(lambda x, y: x * y, answer))

def digits(n):
    return int(log10(n)) + 1


if __name__ == '__main__':
	main()
