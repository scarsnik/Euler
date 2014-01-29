import timing

from eulerutil import isprime
from itertools import permutations

'''
Pandigital prime
Problem 41

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?

'''
digits = "123456789"
p = []
for n in range(3,10):
	for i in [''.join(list(x)) for x in permutations(digits[:n],n)]:
		if isprime(int(i)):
			p+=[i]

print(max(p))

