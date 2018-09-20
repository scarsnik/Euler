import timing
from eulerutil import *
from itertools import permutations, combinations
import string

'''
Prime digit replacements
Problem 51

By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.
'''

def match(number, wildcards, prime_set):
	n, primes = str(number), set()
	for i in range(10):
		m = ''.join([str(i) if j in wildcards else n[j] for j in range(len(n))])
		if int(m) in prime_set: primes |= {int(m)}
	return primes

family = 8
minp = 1000000
maxp = 10000000
primes = {x for x in range(minp,maxp) if is_prime(x)}
print(len(primes))

digits = string.digits[:len(str(minp))]
done = False
for p in sorted(primes):
	for i in range(1,len(digits)):
		for c in combinations(digits,i):
			pattern = [int(x) for x in c]
			matches = match(p,pattern,primes)
			if len(matches) == family:
				print(p,pattern,matches)
				done = True
			if done: break
		if done: break
	if done: break



# ========================================
# ('0:00:00.000', '-', 'Start Program')
# ========================================

# 586081
# (2090021, [1, 3, 4], set([2191121, 2494421, 2595521, 2898821, 2696621, 2999921, 2292221, 2090021]))
# ========================================
# ('0:10:25.728', '-', 'End Program')
# ('Elapsed time:', '0:10:25.728')
# ========================================

# [Finished in 626.1s]