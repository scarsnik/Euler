"""
	
Project Euler - Problem 46 - Goldbach's other conjecture
https://projecteuler.net/problem=46

"""
import timing
from math import sqrt
from eulerutil import sieve_primeness

def main():
    answer = 0
    limit = 1000000
    sieve = sieve_primeness(limit)

    primes = [1]
    for n, prime in enumerate(sieve):
        if not prime and not even(n):
            found = False
            for p in primes:
                m = (n - p) / 2
                if sqrt(m) % 1 == 0: 
                    found = True
                    break

            if not found:
                answer = n
                break
        
        if prime:
            primes.append(n)

    print(answer)


def even(n):
    return n % 2 == 0

if __name__ == '__main__':
	main()
