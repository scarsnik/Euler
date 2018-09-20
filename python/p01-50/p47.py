import timing

from eulerutil import *

'''
Distinct primes factors
Problem 47

The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?
'''
count = 0
d = 4
n = 1
while True:
	count+=1
	if count%100000==0: print(n)
	n+=1
	n1, n2, n3, n4 = n, n+1, n+2, n+3
	s1 = set(prime_factors(n1))
	s2 = set(prime_factors(n2))
	s3 = set(prime_factors(n3))
	s4 = set(prime_factors(n4))
	if len(s1)==d and len(s2)==d and len(s3)==d and len(s4)==d:
	# if len(s1)==d and len(s2)==d and len(s3)==d:
		print(n1,n2,n3,n4)
		print(s1,s2,s3,s4)
		break
