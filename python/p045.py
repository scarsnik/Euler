"""
	
Project Euler - Problem 45 - Triangular, pentagonal, and hexagonal
https://projecteuler.net/problem=45

"""
import timing
from math import sqrt

def main():
    answer = 0

    found = False
    i = 286
    while not found:
        t = tri(i)
        if is_pent(t) and is_hex(t):
            found = True
            answer = t
        i += 1

    print(answer)

def tri(n):
    return n * (n + 1) // 2

def is_pent(n):
    return (1 + (sqrt(1 - 4*3*(-2*n)))) / 6 % 1 == 0

def is_hex(n):
    return (1 + (sqrt(1 - 4*2*(-n)))) / 4 % 1 == 0


if __name__ == '__main__':
	main()
