import timing
from eulerutil import *

'''
Resilience
Problem 243

A positive fraction whose numerator is less than its denominator is called a proper fraction.
For any denominator, d, there will be d−1 proper fractions; for example, with d = 12:
1/12 , 2/12 , 3/12 , 4/12 , 5/12 , 6/12 , 7/12 , 8/12 , 9/12 , 10/12 , 11/12 .

We shall call a fraction that cannot be cancelled down a resilient fraction.
Furthermore we shall define the resilience of a denominator, R(d), to be the ratio of its proper fractions that are resilient; for example, R(12) = 4/11 .
In fact, d = 12 is the smallest denominator having a resilience R(d) < 4/10 .

Find the smallest denominator d, having a resilience R(d) < 15499/94744 .
'''

primes = sieve_for_primes_to(31)
print(primes)
prod = 1
for p in primes:
	prod *= p
	r = EulerProduct(prod,prime_factors(prod))
	print(prod, int(r), r/(prod-1))

print("15,499/94,744 =",15499/94744)
upper = 15499/94744
limit = 223092870*2*2
d = 223092870*2*2
min_d = [1,1,1]
				0.1635881955585578
# 892371480		0.16358819553891196
# 1338557220	0.16358819547780576
while d <= limit:
	r = 0
	done = False
	if not is_prime(d):
		r = EulerProduct(d,prime_factors(d))
		rd = r/(d-1)
		print(d,rd)
		if rd < min_d[2]:
			min_d[:] = [d,int(r),rd]
		if rd < upper:
			done = True
			break
	if done: break
	if d%100000==0: print(d, r, rd)
	d+=1

print("results =",d,int(r),r/(d-1))
print("min = ",min_d)

