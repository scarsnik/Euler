"""
THIS IS SLOW - try to do it faster

Project Euler - Problem 549 - Divisibility of factorials
https://projecteuler.net/problem=549

https://en.wikipedia.org/wiki/Kempner_function
http://math.utoledo.edu/~codenth/Spring_13/3200/NT-books/An_Introduction_to_the_Smarandache_Function-Ashbacher.pdf
"""

import timing
import math
import eulerutil

def main():
    answer = 0
    limit = 100000000

    for i in range(2, limit + 1):
        a = smarandache(i)
        if i % 100000 == 0:
            print(f'{i} = {a} = {answer}')
        answer += a

    print(f'{limit} = {answer}')


def smarandache(n):
    if n == 1:
        return 0

    m = 0
    for p, k in eulerutil.factorGen(n, as_list=False):
        a = smarandache_pk(p, k)
        if a > m:
            m = a

    return m

    
def smarandache_pk(p, k):
    # p is a prime, k is the exponent
    if k < p:
        return p*k

    start = 1
    while True:
        a = largestPower(start, p)
        if a >= k:
            return start*p
        start += 1


def largestPower(n, p):
    # p is prime
    # Initialize result 
    x = n
  
    # Calculate x = n/p + n/(p^2) + n/(p^3) + .... 
    while n: 
        # print(n)
        n = n // p 
        x += n 
    return x 

if __name__ == '__main__':
    main()
