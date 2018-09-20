import timing
from eulerutil import gcd, is_prime, sieve_for_primes_to
import time

'''
Counting fractions
Problem 72
Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.

If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we get:

1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8

It can be seen that there are 21 elements in this set.

How many elements would be contained in the set of reduced proper fractions for d ≤ 1,000,000?
'''


def EulerProduct(n,factors):
	# http://en.wikipedia.org/wiki/Euler's_totient_function
	product = n
	for i in set(factors):
		product *= (1-1/i)
	return product

def prime_factors(n):
    """Returns all the prime factors of a positive integer"""
    factors = []
    d = 2
    while n > 1:
        while n % d == 0:
            factors.append(d)
            n /= d
        d = d + 1
        if d*d > n:
            if n > 1: factors.append(n)
            break
    return factors

total = 0
limit = 100000

primes = {2} | {i*2+1 for i, v in enumerate(sieve_for_primes_to(limit)) if v and i>0}

start = time.time()
for n in range(2,limit+1):
	if n in primes: 
		total += n-1
	else:
		factors = {i for i in primes if n%i==0 and i<=n*0.5}
		
		phi = int(EulerProduct(n,factors))
		total += phi
	if n%10000==0:
		print(n,time.time()-start)
		start = time.time()


print(total)