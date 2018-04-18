import timing
import math
import eulerutil
import itertools
'''
Pandigital products
Problem 32
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
'''

def is_pandigital(num_list,digits):
	s = sorted(''.join([str(x) for x in num_list]))
	return ''.join(s) == digits

def join(list):
	return int(''.join(list))

digits = "123456789"
size = len(digits)
identity = []
for p in [''.join(x) for x in list(itertools.permutations(digits,size))]:
	for i in range(1,size-1):
		for j in range(i+1,size):
			m1, m2, n = int(p[:i]), int(p[i:j]), int(p[j:])
			if m1*m2==n: identity.append([m1,m2,n])

print(sum(set([i[2] for i in identity])))