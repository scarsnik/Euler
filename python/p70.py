import timing
from eulerutil import prime_factors, prime_sieve, sieve_for_primes_to
'''
Totient permutation
Problem 70
Euler's Totient function, φ(n) [sometimes called the phi function], is used to determine the number of positive numbers less than or equal to n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime to nine, φ(9)=6.
The number 1 is considered to be relatively prime to every positive number, so φ(1)=1.

Interestingly, φ(87109)=79180, and it can be seen that 87109 is a permutation of 79180.

Find the value of n, 1 < n < 10^7, for which φ(n) is a permutation of n and the ratio n/φ(n) produces a minimum.
'''


def EulerProduct(n,factors):
	# http://en.wikipedia.org/wiki/Euler's_totient_function
	product = n
	for i in set(factors):
		product *= (1-1/i)
	return product

n_limit = 100
# primes = sieve_for_primes_to(n_limit)
# print(len(primes))
print(list(enumerate(sieve_for_primes_to(n_limit))))
print([i*2+1 for i, v in enumerate(sieve_for_primes_to(n_limit)) if v and i>0])
# print(len([2] + [i*2+1 for i, v in enumerate(sieve_for_primes_to(10000000)) if v and i>0]))
# print(primes)
print("done")

# primes = set()
# min_ratio = float("Inf")
# min_n = 0
# min_phi = 0
# for n in range(2,n_limit+1):
# 	factors = prime_factors(n)
# 	if len(factors)==2:
# 		phi = int(EulerProduct(n,prime_factors(n)))
# 		if sorted(str(n)) == sorted(str(phi)):
# 			ratio = n/phi
# 			print(n,phi,ratio,prime_factors(n))
# 			if ratio < min_ratio:
# 				min_ratio = ratio
# 				min_n = n
# 				min_phi = phi
# 	if n%10000==0: print(n)
# print(min_ratio)
# print(min_n, min_phi)

'''
========================================
0:00:00.000 - Start Program
========================================

1.0007090511248113
8319823 8313928
========================================
2:02:55.156 - End Program
Elapsed time: 2:02:55.156
========================================
'''