"""
	
Project Euler - Problem 44 - Pentagon numbers
https://projecteuler.net/problem=44

"""
import timing
from math import sqrt

def main():
    answer = 0
    found = False

    b = 2
    while not found:
        a = 1
        while a < b:
            m, n = pent(a), pent(b)
            pd = n - m
            ps = n + m
            # print(a, b, m, n)
            if is_pent(pd) and is_pent(ps):
                answer = pd
                found = True
                break
            a += 1
        b += 1

    print(answer)


def pent(n):
    return n * (3 * n - 1) // 2 

def is_pent(n):
    return (1 + (sqrt(1 - 4*3*(-2*n)))) / 6 % 1 == 0

if __name__ == '__main__':
	main()
