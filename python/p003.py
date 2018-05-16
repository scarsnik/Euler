"""
    
Project Euler - Problem 3 - Largest prime factor
https://projecteuler.net/problem=3

"""
import timing
import eulerutil


def main():
    n = 600851475143
    factors = eulerutil.prime_decomposition(n)
    print('%s' %factors[-1])
    

if __name__ == '__main__':
    main()