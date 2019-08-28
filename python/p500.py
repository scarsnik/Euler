"""

Project Euler - Problem 500 - Problem 500!!!
https://projecteuler.net/problem=500

"""
import timing
import argparse
import eulerutil
import functools
import math

def main(n):
    answer = 0

    primes = eulerutil.primes(100000)

    i = 1
    D = n

    candidates = [0] * 10

    while D > 1:
        f = eulerutil.factors(D)
        fset = Set(map(lambda x: x[0], f))
        k = len(f)
        pmax = f[k-1][0]
        p = primes[k + i - 1]
        pi = primes[i]
        m = math.floor(log(p) / log(pi))
        n = [pmax]
        for b in primes:
            if b > m and b in fset:
                continue
            for a in range(b, m+1):
                # Check if any primes factors of a are less than b
                if any(map(lambda x: x[0] < b, eulerutil.factors(a))):
                    continue
                if a*b % D != 0:
                    continue
                if a*b < pmax:
                    continue
                if i > 1 and a*b > candidates[i-1]:
                    continue
                n.append((a,b))

        D /= ni
        i += 1


def N(d):
    # Smallest number with d number of divisors
    # https://www.primepuzzles.net/problems/prob_019.htm
    answer = 0

    while True:
        f = eulerutil.factors(i)
        m = map(lambda x: x[1]+1, f)
        r = functools.reduce(lambda x, y: x*y, m)
        
        if r == n and not answer:
            answer = i
            break
        i += 1

    print(f'The smallest number with {n} divisors is : {answer}')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Project Euler - Problem 500')
    parser.add_argument('n', type=int, help='Finds the smallest number that has n divisors.')
    args = parser.parse_args()
    main(args.n)